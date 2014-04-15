package com.infox.project.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infox.common.dao.BaseDaoI;
import com.infox.common.freemarker.FreeMarkerToHtmlUtil;
import com.infox.common.freemarker.FreeMarkerToMailTemplateUtil;
import com.infox.common.mail.MailVO;
import com.infox.common.util.BeanUtils;
import com.infox.common.util.Constants;
import com.infox.common.util.DateUtil;
import com.infox.common.web.page.DataGrid;
import com.infox.common.web.springmvc.RealPathResolver;
import com.infox.project.asynms.send.MailMessageSenderI;
import com.infox.project.entity.ProjectEmpWorkingEntity;
import com.infox.project.entity.ProjectMailListEntity;
import com.infox.project.entity.ProjectMainEntity;
import com.infox.project.service.ProjectEmpWorkingServiceI;
import com.infox.project.web.form.ProjectEmpWorkingForm;
import com.infox.project.web.form.ProjectMailListForm;
import com.infox.project.web.form.ProjectMainForm;
import com.infox.sysmgr.entity.EmployeeEntity;
import com.infox.sysmgr.entity.TaskEntity;
import com.infox.sysmgr.service.TaskSchedulerServiceI;
import com.infox.sysmgr.web.form.TaskForm;

@Service
@Transactional
public class ProjectEmpWorkingServiceImpl implements ProjectEmpWorkingServiceI {
	
	@Autowired
	private BaseDaoI<ProjectEmpWorkingEntity> basedaoProjectEW;
	
	@Autowired
	private BaseDaoI<ProjectMainEntity> basedaoProject;
	
	@Autowired
	private BaseDaoI<EmployeeEntity> basedaoEmployee;
	
	@Autowired
	private MailMessageSenderI mailMessageSend ;
	
	@Autowired
	private RealPathResolver realPathResolver ;
	
	@Autowired
	private TaskSchedulerServiceI taskScheduler ;

	@Override
	public void add(ProjectEmpWorkingForm form) throws Exception {
		String empIds = form.getEmpId() ;
		if(null != empIds && !"".equals(empIds)) {
			String[] empIdsSplit = empIds.split(",") ;
			for(int i=0;i<empIdsSplit.length;i++) {
				EmployeeEntity employeeEntity = this.basedaoEmployee.get(EmployeeEntity.class, empIdsSplit[i]) ;
				if(employeeEntity.getWorkStatus() != 1) {
					employeeEntity.setWorkStatus(1) ;
					
					ProjectEmpWorkingEntity entity = new ProjectEmpWorkingEntity();
					BeanUtils.copyProperties(form, entity);
					
					entity.setEmp(employeeEntity) ;
					
					ProjectMainEntity project = new ProjectMainEntity() ;
					project.setId(form.getProject_id()) ;
					entity.setProject(project);
					entity.setStatus(0) ;
					
					this.basedaoProjectEW.save(entity);
				}
			}
		}
	}
	
	//点击取消按钮，将取消之前的全部操作，并删除已添加的开发人员
	@Override
	public void cancelOperate(ProjectEmpWorkingForm form) {
		String[] ids = form.getIds().split(",") ;
		List<String> list = new ArrayList<String>();
		
		for (int i = 0; i < ids.length; i++) {
			if (!list.contains(ids[i])) {// 如果数组 list 不包含当前项，则增加该项到数组中
				list.add(ids[i]);
			}
		}
		
		if(null != ids && ids.length > 0) {
			for (String id : list.toArray(new String[1])) {
				ProjectEmpWorkingEntity p = this.basedaoProjectEW.get(ProjectEmpWorkingEntity.class, id) ;
				p.getEmp().setWorkStatus(0) ;
				this.basedaoProjectEW.delete(p) ;
			}
			ProjectMainEntity pm = this.basedaoProject.get(ProjectMainEntity.class, form.getProject_id()) ;
			Set<ProjectEmpWorkingEntity> pwe = pm.getPwe() ;
			for (ProjectEmpWorkingEntity p : pwe) {
				if(p.getStatus() == 0) {
					this.basedaoProjectEW.delete(p) ;
				}
			}
		}
		
	}
	
	//点击保存，将发送邮件通知
	@Override
	public void saveAndSendMail(ProjectEmpWorkingForm form) {
		ProjectMainEntity p = this.basedaoProject.get(ProjectMainEntity.class, form.getProject_id()) ;
		
		// 定时任务，人员日期延期（重新设定人员期满的触发时间）
		memberSchedulerReset(p);
		
		//获取项目开发人员
		Set<ProjectEmpWorkingEntity> pwe = p.getPwe() ;
		if(null != pwe) {
			int i=pwe.size() ;
			for (ProjectEmpWorkingEntity pp : pwe) {
				//如果项目开发人为设置起止日期，则将开发人员删除，将已设置起止日期的发送邮件通知
				if(pp.getStatus() == 0) {
					//将员工状态设置回空闲状态。
					pp.getEmp().setWorkStatus(0) ;
					this.basedaoProjectEW.delete(pp) ;
					i-- ;
				} 
			}
			if(i>0) {
				//发送邮件通知
				sendMailToMemberDate(p) ;
			}
		}
	}
	
	public void memberSchedulerReset(ProjectMainEntity p) {
		// 定时任务，人员日期延期（重新设定人员期满的触发时间）
		try {
			// 查询该项目下所有人员期满触发时间
			TaskForm taskForm = new TaskForm();
			taskForm.setRelationOperates(p.getId() + ":M");
			List<TaskEntity> find = this.taskScheduler.find(taskForm);
			for (TaskEntity taskEntity : find) {
				// 先删除现有的触发时间，在重新设定触发时间
				this.taskScheduler.delete(taskEntity.getId());
			}

			// 项目开发人员期满定时器
			Set<String> dateGroup = new HashSet<String>();
			Set<ProjectEmpWorkingEntity> pwes = p.getPwe();
			for (ProjectEmpWorkingEntity member : pwes) {
				if (member.getStatus() == 1) {
					String[] dateCron = DateUtil.getDateCron(DateUtil.formatG(
							member.getEndDate()) + " 08:35:30", 2);
					for (int i = 0; i < dateCron.length; i++) {
						// 将相同日期的归为一组，进行定时
						dateGroup.add(dateCron[i]);
					}
				}
			}
			int i = 0;
			for (String date : dateGroup) {
				TaskForm task = new TaskForm();
				task.setTask_type("system");
				task.setTask_type_name("开发人员期满邮件提醒");
				task.setTask_job_class("com.infox.project.job.ProjectMemberWorkSchedulerEmail");
				task.setTask_enable("Y");
				task.setTask_name("开发人员期满邮件提醒");
				task.setRelationOperate(p.getId() + ":M" + i++);
				task.setCron_expression(date);
				this.taskScheduler.add(task);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	private void sendMailToMemberDate(ProjectMainEntity entity) {
		
		//项目信息
		ProjectMainForm project = new ProjectMainForm() ;
		
		BeanUtils.copyProperties(entity, project);
		
		project.setDeptname(entity.getDept().getFullname()) ;
		project.setLeader_name(entity.getEmp().getTruename()) ;
		
		try {
			String rootPath = this.realPathResolver.get("/WEB-INF/security_views/project/ftl") ;
			Map<String,Object> model = new HashMap<String,Object>() ;
			
			//项目参与人员-邮件列表
			StringBuffer strBuf = new StringBuffer() ; //群发邮件地址列表
			List<ProjectMailListForm> projectMailsForm = new ArrayList<ProjectMailListForm>() ;
			Set<ProjectMailListEntity> projectmails = entity.getProjectmails() ;
			for (ProjectMailListEntity p : projectmails) {
				EmployeeEntity e = p.getEmployee() ;
				ProjectMailListForm pmf = new ProjectMailListForm() ;
				pmf.setEmpname(e.getTruename()) ;
				strBuf.append(e.getEmail()+",") ;
				projectMailsForm.add(pmf) ;
			}
			
			//开发人员信息
			List<ProjectEmpWorkingForm> currentMembers = new ArrayList<ProjectEmpWorkingForm>() ;
			Set<ProjectEmpWorkingEntity> pews = entity.getPwe() ;
			StringBuffer devMemberBuf = new StringBuffer() ; //群发邮件地址列表
			for (ProjectEmpWorkingEntity pwork : pews) {
				if(pwork.getStatus() == 1) {
					EmployeeEntity e = pwork.getEmp() ;
					devMemberBuf.append(e.getEmail()+",") ;
					ProjectEmpWorkingForm p = new ProjectEmpWorkingForm() ;
					BeanUtils.copyProperties(pwork, p) ;
					p.setTruename(e.getTruename()) ;
					currentMembers.add(p) ;
				}
			}
			
			
			String htmlId = DateUtil.getCurrentDateTimes() ;
			model.put("project", project) ;//项目信息
			model.put("projectmails", projectMailsForm) ;//项目参与人员
			model.put("currentMembers", currentMembers) ;//目前开发人员
			model.put("reportURL", this.realPathResolver.getServerRoot()+"/"+Constants.WWWROOT_RELAESE+"/report_mail/project_member_date_"+htmlId+".html") ;
			model.put("context_path",this.realPathResolver.getServerRoot()+this.realPathResolver.getContextPath()) ;
			model.put("currentdate", new Date()) ;
			
			
			MailVO mail = new MailVO() ;
			mail.setSubject("项目开发人员日期和人员变更-["+entity.getName()+"]") ;
			if(null != devMemberBuf && !"".equals(devMemberBuf.toString())) {
				mail.setRecipientTO(devMemberBuf.deleteCharAt(devMemberBuf.length()-1).toString()) ;
				mail.setRecipientCC(strBuf.deleteCharAt(strBuf.length()-1).toString()) ;
			} else {
				mail.setRecipientTO(strBuf.deleteCharAt(strBuf.length()-1).toString()) ;
			}
			mail.setContent(FreeMarkerToMailTemplateUtil.MailTemplateToString(rootPath, "project_member_date.ftl", model)) ;
			this.mailMessageSend.sendMail(mail) ;
			
			//生成HTML
			String exportPath = this.realPathResolver.getParentDir()+File.separator+Constants.WWWROOT_RELAESE+"/report_mail/" ;
			FreeMarkerToHtmlUtil.exportHtml(rootPath, "project_member_date.ftl", model, 
					exportPath, "project_member_date_"+htmlId+".html") ;
			
		} catch (Exception e) {
			e.printStackTrace() ;
		}
	}
	
	@Override
	public void revert(ProjectEmpWorkingForm form) throws Exception {
		List<ProjectEmpWorkingForm> exitProjectMember = null ;
		if(null != form.getIds() && !form.getIds().equalsIgnoreCase("")) {
			exitProjectMember = new ArrayList<ProjectEmpWorkingForm>() ;
			String[] ids = form.getIds().split(",") ;
			
			for(int i=0;i<ids.length;i++) {
				ProjectEmpWorkingEntity entity = this.basedaoProjectEW.get(ProjectEmpWorkingEntity.class, ids[i]) ;
				
				//将员工设为空闲人员
				EmployeeEntity emp = entity.getEmp() ;
				emp.setWorkStatus(0) ;
				
				//如果人员未设置起止日期，和项目的状态为（未开始），则删除人员
				if(entity.getStatus() == 0 || entity.getProject().getStatus() == 0) {
					this.basedaoProjectEW.delete(entity) ;
					continue ;
				}
				//标记为结束(退出项目组)
				entity.setStatus(4) ;
				
				//如果结束日期大于当前日期则重置为当前日期
				int cdd1 = DateUtil.compare_date2(DateUtil.formatG(entity.getEndDate()), DateUtil.formatG(new Date())) ;
				if(cdd1 == 1) {
					entity.setEndDate(new Date()) ;
				}
				//最后修改日期
				entity.setCreated(new Date()) ;
				
				ProjectEmpWorkingForm f = new ProjectEmpWorkingForm() ;
				f.setTruename(entity.getEmp().getTruename()) ;
				f.setStartDate(entity.getStartDate()) ;
				f.setEndDate(entity.getEndDate()) ;
				exitProjectMember.add(f) ;
			}
		}
		
		//如果集合中没有退出的人员,则说明全部人员都未设置日期。不需发送邮件
		if(!exitProjectMember.isEmpty()) {
			ProjectMainEntity projectMainEntity = this.basedaoProject.get(ProjectMainEntity.class, form.getProject_id()) ;
			
			//退出发送邮件通知
			exitProjectMember(projectMainEntity, exitProjectMember) ;
			
			// 定时任务，人员退出项目（重新设定人员期满的触发时间）
			this.memberSchedulerReset(projectMainEntity);
		}
	}
	
	//开发人员退出项目组-发送邮件通知
	private void exitProjectMember(ProjectMainEntity entity, List<ProjectEmpWorkingForm> exitProjectMembers) {
		
		//项目信息
		ProjectMainForm project = new ProjectMainForm() ;
		
		BeanUtils.copyProperties(entity, project);
		
		project.setDeptname(entity.getDept().getFullname()) ;
		project.setLeader_name(entity.getEmp().getTruename()) ;
		
		try {
			String rootPath = this.realPathResolver.get("/WEB-INF/security_views/project/ftl") ;
			Map<String,Object> model = new HashMap<String,Object>() ;
			
			//项目参与人员-邮件列表
			StringBuffer strBuf = new StringBuffer() ; //群发邮件地址列表
			List<ProjectMailListForm> projectMailsForm = new ArrayList<ProjectMailListForm>() ;
			Set<ProjectMailListEntity> projectmails = entity.getProjectmails() ;
			for (ProjectMailListEntity p : projectmails) {
				EmployeeEntity e = p.getEmployee() ;
				ProjectMailListForm pmf = new ProjectMailListForm() ;
				pmf.setEmpname(e.getTruename()) ;
				strBuf.append(e.getEmail()+",") ;
				projectMailsForm.add(pmf) ;
			}
			
			//开发人员信息
			List<ProjectEmpWorkingForm> currentMembers = new ArrayList<ProjectEmpWorkingForm>() ;
			Set<ProjectEmpWorkingEntity> pews = entity.getPwe() ;
			StringBuffer devMemberBuf = new StringBuffer() ; //群发邮件地址列表
			for (ProjectEmpWorkingEntity pwork : pews) {
				if(pwork.getStatus() == 1) {
					EmployeeEntity e = pwork.getEmp() ;
					devMemberBuf.append(e.getEmail()+",") ;
					ProjectEmpWorkingForm p = new ProjectEmpWorkingForm() ;
					BeanUtils.copyProperties(pwork, p) ;
					p.setTruename(e.getTruename()) ;
					currentMembers.add(p) ;
				}
			}
			
			String htmlId = DateUtil.getCurrentDateTimes() ;
			model.put("project", project) ;//项目信息
			model.put("projectmails", projectMailsForm) ;//项目参与人员
			model.put("currentMembers", currentMembers) ;//目前开发人员
			model.put("exitProjectMembers", exitProjectMembers) ;//今天为结束日期的人员
			model.put("reportURL", this.realPathResolver.getServerRoot()+"/"+Constants.WWWROOT_RELAESE+"/report_mail/project_member_exit_"+htmlId+".html") ;
			model.put("context_path",this.realPathResolver.getServerRoot()+this.realPathResolver.getContextPath()) ;
			model.put("currentdate", new Date()) ;
			
			MailVO mail = new MailVO() ;
			mail.setSubject("开发人员退出项目组-["+entity.getName()+"]") ;
			if(null != devMemberBuf && !"".equals(devMemberBuf.toString())) {
				mail.setRecipientTO(devMemberBuf.deleteCharAt(devMemberBuf.length()-1).toString()) ;
				mail.setRecipientCC(strBuf.deleteCharAt(strBuf.length()-1).toString()) ;
			} else {
				mail.setRecipientTO(strBuf.deleteCharAt(strBuf.length()-1).toString()) ;
			}
			mail.setContent(FreeMarkerToMailTemplateUtil.MailTemplateToString(rootPath, "project_member_exit.ftl", model)) ;
			this.mailMessageSend.sendMail(mail) ;
			
			//生成HTML
			String exportPath = this.realPathResolver.getParentDir()+File.separator+Constants.WWWROOT_RELAESE+"/report_mail/" ;
			FreeMarkerToHtmlUtil.exportHtml(rootPath, "project_member_exit.ftl", model, 
					exportPath, "project_member_exit_"+htmlId+".html") ;
			
		} catch (Exception e) {
			e.printStackTrace() ;
		}
	}

	@Override
	public void delete(String id) throws Exception {
		ProjectEmpWorkingEntity entity = this.basedaoProjectEW.get(ProjectEmpWorkingEntity.class, id) ;
		del(entity);
	}
	private void del(ProjectEmpWorkingEntity entity) {
		if (entity.getPews() != null && entity.getPews().size() > 0) {
			for (ProjectEmpWorkingEntity r : entity.getPews()) {
				del(r);
			}
		}
		this.basedaoProjectEW.delete(entity);
	}
	
	@Override
	public void edit(ProjectEmpWorkingForm form) throws Exception {
		ProjectEmpWorkingEntity entity = this.basedaoProjectEW.get(ProjectEmpWorkingEntity.class, form.getId());
		BeanUtils.copyProperties(form, entity ,new String[]{"creater"});
		this.basedaoProjectEW.update(entity);
	}

	@Override
	public ProjectEmpWorkingForm get(String id) throws Exception {
		ProjectEmpWorkingEntity entity = this.basedaoProjectEW.get(ProjectEmpWorkingEntity.class, id);
		if(null != entity) {
			ProjectEmpWorkingForm form = new ProjectEmpWorkingForm();
			BeanUtils.copyProperties(entity, form);
			return form;
		} else {
			return null ;
		}
	}
	
	@Override
	public ProjectEmpWorkingForm get(ProjectEmpWorkingForm form) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select t from ProjectEmpWorkingEntity t where 1=1";
		hql = addWhere(hql, form, params) + addOrdeby(form);
		
		ProjectEmpWorkingEntity entity = this.basedaoProjectEW.get(hql, params) ;
		if(null != entity) {
			ProjectEmpWorkingForm pform = new ProjectEmpWorkingForm();
			BeanUtils.copyProperties(entity, pform);
			
			return pform;
		} else {
			return null ;
		}
	}

	@Override
	public DataGrid datagrid(ProjectEmpWorkingForm form) throws Exception {
		DataGrid datagrid = new DataGrid();
		datagrid.setTotal(this.total(form));
		datagrid.setRows(this.changeModel(this.find(form)));
		return datagrid;
	}

	private List<ProjectEmpWorkingForm> changeModel(List<ProjectEmpWorkingEntity> ProjectEmpWorkingEntity) {
		List<ProjectEmpWorkingForm> forms = new ArrayList<ProjectEmpWorkingForm>();

		if (null != ProjectEmpWorkingEntity && ProjectEmpWorkingEntity.size() > 0) {
			for (ProjectEmpWorkingEntity i : ProjectEmpWorkingEntity) {
				ProjectEmpWorkingForm uf = new ProjectEmpWorkingForm();
				BeanUtils.copyProperties(i, uf);
				EmployeeEntity emp = i.getEmp() ;
				if(null != emp) {
					uf.setEmpId(i.getEmp().getId()) ;
					uf.setTruename(i.getEmp().getTruename()) ;
					uf.setOrgname(i.getEmp().getOrg().getSname()) ;
					forms.add(uf);
				}
			}
		}
		return forms;
	}

	private List<ProjectEmpWorkingEntity> find(ProjectEmpWorkingForm form) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select t from ProjectEmpWorkingEntity t where 1=1";
		hql = addWhere(hql, form, params) + addOrdeby(form);
		return this.basedaoProjectEW.find(hql, params, form.getPage(), form.getRows());
	}

	private String addOrdeby(ProjectEmpWorkingForm form) {
		String orderString = "";
		if (form.getSort() != null && form.getOrder() != null) {
			orderString = " order by " + form.getSort() + " " + form.getOrder();
		}
		return orderString;
	}

	public Long total(ProjectEmpWorkingForm form) {
		Map<String, Object> params = new HashMap<String, Object>();

		String hql = "select count(*) from ProjectEmpWorkingEntity t where 1=1";

		hql = addWhere(hql, form, params);

		return this.basedaoProjectEW.count(hql, params);
	}

	private String addWhere(String hql, ProjectEmpWorkingForm form, Map<String, Object> params) {
		if (null != form) {
			if (null != form.getProject_id() && !"".equals(form.getProject_id())) {
				hql += " and t.project.id=:project_id";
				params.put("project_id", form.getProject_id());
			}
			if (null != form.getStatus() && !"".equals(form.getStatus())) {
				hql += " and t.status=:status";
				params.put("status", form.getStatus());
			}
			if (null != form.getInStatus() && !"".equals(form.getInStatus())) {
				hql += " and t.status in (:inStatus)";
				String[] split = form.getInStatus().split(",") ;
				Integer[] states = new Integer[split.length] ;
				for(int i=0;i<states.length;i++) {
					states[i] = Integer.parseInt(split[i]) ;
				}
				params.put("inStatus", states);
			}
		}
		return hql;
	}

	@Override
	public void set_workdate(ProjectEmpWorkingForm form) throws Exception {
		String ids = form.getIds() ;
		if(null != ids && !"".equals(ids)) {
			String[] id = ids.split(",") ;
			for (int i = 0; i < id.length; i++) {
				ProjectEmpWorkingEntity entity = this.basedaoProjectEW.get(ProjectEmpWorkingEntity.class, id[i]) ;
				
				if(entity.getStatus() == 0) {	//未设置日期
					entity.setStatus(1) ;
					entity.setStartDate(form.getStartDate()) ;
					entity.setEndDate(form.getEndDate()) ;
				} else {	//已设置日期，则延期（只修改结束日期）
					
					//如果项目的状态是未开始则不记录历史信息和发送邮件通知，只修改日期
					ProjectMainEntity project = entity.getProject() ;
					if(project.getStatus() == 0) {
						entity.setStatus(1) ;
						entity.setStartDate(form.getStartDate()) ;
						entity.setEndDate(form.getEndDate()) ;
					} else {
						//记录历史信息，树状结构
						ProjectEmpWorkingEntity history = new ProjectEmpWorkingEntity() ;
						history.setStartDate(entity.getStartDate()) ;
						history.setEndDate(entity.getEndDate()) ;
						history.setStatus(3) ;
						history.setPew(entity) ;
						this.basedaoProjectEW.save(history) ;
						
						//延期
						entity.setStartDate(form.getStartDate()) ;
						entity.setEndDate(form.getEndDate()) ;
						
					}
				}
				//已到期，不需设置，系统会使用定时器来设置为已过期
			}
		}
	}
	
	@Override
	public void set_projectRole(ProjectEmpWorkingForm form) throws Exception {
		String ids = form.getIds() ;
		if(null != ids && !"".equals(ids)) {
			String[] id = ids.split(",") ;
			for (int i = 0; i < id.length; i++) {
				ProjectEmpWorkingEntity entity = this.basedaoProjectEW.get(ProjectEmpWorkingEntity.class, id[i]) ;
				entity.setProject_role(form.getProject_role()) ;
				this.basedaoProjectEW.update(entity) ;
			}
		}
	}
	
	/*public static void main(String[] args) throws ParseException {
		
		String endDate = "2014-03-08" ;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d") ;
		String currentDate = sdf.format(new Date()) ;
		//System.out.println("对照：" +currentDate + "==" + endDate);
		
		//通过当前触发触日期加上2天获得开发人员期满的日期，来作为条件检索日期
		Calendar sc = Calendar.getInstance() ;
		sc.setTime(sdf.parse(endDate)) ;
		
		
		//System.out.println(sc.get(Calendar.DAY_OF_WEEK)-1);
		//System.out.println(sc.get(Calendar.YEAR) +"-"+ (sc.get(Calendar.MONTH)+1) +"-"+ sc.get(Calendar.DAY_OF_MONTH));
		
		sc.set(Calendar.DAY_OF_MONTH, sc.get(Calendar.DAY_OF_MONTH)+2);
		if((sc.get(Calendar.DAY_OF_WEEK)-1) == 6){	//加两天如果是星期六，则再加两天，则为星期一
			//System.out.println("加2天");
			sc.set(Calendar.DAY_OF_MONTH, sc.get(Calendar.DAY_OF_MONTH)+2);
		}
		if((sc.get(Calendar.DAY_OF_WEEK)-1) == 0){	//加一天如果是星期日，则再加一天，则为星期一
			//System.out.println("加1天");
			sc.set(Calendar.DAY_OF_MONTH, sc.get(Calendar.DAY_OF_MONTH)+1);
		}
		
		//System.out.println(sc.get(Calendar.DAY_OF_WEEK)-1);
		//System.out.println(sc.get(Calendar.YEAR) +"-"+ (sc.get(Calendar.MONTH)+1) +"-"+ sc.get(Calendar.DAY_OF_MONTH));
	}*/

	@Override
	public void projectMemberExpireNotify(ProjectMainForm form) throws Exception {
		ProjectMainEntity entity = this.basedaoProject.get(ProjectMainEntity.class, form.getId()) ;
		
		ProjectMainForm project = new ProjectMainForm() ;
		
		BeanUtils.copyProperties(entity, project);
		
		project.setDeptname(entity.getDept().getFullname()) ;
		project.setLeader_name(entity.getEmp().getTruename()) ;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d") ;
		String currentDate = sdf.format(new Date()) ;
		
		//通过当前触发触日期加上2天获得开发人员期满的日期，来作为条件检索日期
		Calendar sc = Calendar.getInstance() ;
		sc.setTime(sdf.parse(currentDate)) ;
		sc.set(Calendar.DAY_OF_MONTH, sc.get(Calendar.DAY_OF_MONTH)+2);
		if((sc.get(Calendar.DAY_OF_WEEK)-1) == 6){	//加两天如果是星期六，则再加两天，则为星期一
			sc.set(Calendar.DAY_OF_MONTH, sc.get(Calendar.DAY_OF_MONTH)+2);
		}
		if((sc.get(Calendar.DAY_OF_WEEK)-1) == 0){	//加一天如果是星期日，则再加一天，则为星期一
			sc.set(Calendar.DAY_OF_MONTH, sc.get(Calendar.DAY_OF_MONTH)+1);
		}
		String notifyDate = sc.get(Calendar.YEAR) +"-"+ (sc.get(Calendar.MONTH)+1) +"-"+ sc.get(Calendar.DAY_OF_MONTH);
		
		List<ProjectEmpWorkingForm> allMembers = new ArrayList<ProjectEmpWorkingForm>();
		List<ProjectEmpWorkingForm> exitProjectMembers = new ArrayList<ProjectEmpWorkingForm>();
		List<ProjectEmpWorkingForm> currentMembers = new ArrayList<ProjectEmpWorkingForm>();
		List<ProjectEmpWorkingForm> notifyMembers = new ArrayList<ProjectEmpWorkingForm>();
		
		StringBuffer devMemberBuf = new StringBuffer() ; //群发邮件地址列表
		//获取项目开发人员列表（状态为1）
		Set<ProjectEmpWorkingEntity> pwes = entity.getPwe() ;
		for (ProjectEmpWorkingEntity pwe : pwes) {
			if(pwe.getStatus() == 1) {
				ProjectEmpWorkingForm allMembersForm = new ProjectEmpWorkingForm() ;
				BeanUtils.copyProperties(pwe, allMembersForm) ;
				allMembers.add(allMembersForm) ;
				devMemberBuf.append(pwe.getEmp().getEmail()+",") ;
				
				//判断该人员结束日期是否今天，如果是则装入集合，并将该人员设置为空闲状态和退出项目状态
				if(currentDate.equals(sdf.format(pwe.getEndDate()))) {
					ProjectEmpWorkingForm exitProjectMembersForm = new ProjectEmpWorkingForm() ;
					BeanUtils.copyProperties(pwe, exitProjectMembersForm) ;
					exitProjectMembers.add(exitProjectMembersForm) ;            
					//将员工设为空闲人员
					EmployeeEntity emp = pwe.getEmp() ;
					emp.setWorkStatus(0) ;
					this.basedaoEmployee.update(emp);
					
					pwe.setStatus(4) ;//修改退出的时间
					pwe.setCreated(new Date()) ;//修改退出的时间	
					this.basedaoProjectEW.update(pwe);
					
				} else {
					//如果开发人员的结束日期不是今天，则装入集合，后续判断，进行邮件提醒
					ProjectEmpWorkingForm unExitProjectMembersForm = new ProjectEmpWorkingForm() ;
					BeanUtils.copyProperties(pwe, unExitProjectMembersForm) ;
					currentMembers.add(unExitProjectMembersForm) ;
				}
			}
		}
		
		if(!currentMembers.isEmpty()) {
			//需提醒的开发人员
			for (ProjectEmpWorkingForm unExit : currentMembers) {
				if(notifyDate.equals(sdf.format(unExit.getEndDate()))) {
					notifyMembers.add(unExit);
				}
			}
		}
		
		
		try {
			String rootPath = this.realPathResolver.get("/WEB-INF/security_views/project/ftl") ;
			Map<String,Object> model = new HashMap<String,Object>() ;
			
			//项目参与人员-邮件列表
			StringBuffer strBuf = new StringBuffer() ; //群发邮件地址列表
			List<ProjectMailListForm> projectMailsForm = new ArrayList<ProjectMailListForm>() ;
			Set<ProjectMailListEntity> projectmails = entity.getProjectmails() ;
			for (ProjectMailListEntity p : projectmails) {
				EmployeeEntity e = p.getEmployee() ;
				ProjectMailListForm pmf = new ProjectMailListForm() ;
				pmf.setEmpname(e.getTruename()) ;
				strBuf.append(e.getEmail()+",") ;
				projectMailsForm.add(pmf) ;
			}
			
			
			String htmlId = DateUtil.getCurrentDateTimes() ;
			model.put("project", project) ;//项目信息
			model.put("projectmails", projectMailsForm) ;//项目参与人员
			model.put("currentMembers", currentMembers) ;//目前开发人员
			model.put("exitProjectMembers", exitProjectMembers) ;//今天为结束日期的人员
			model.put("notifyMembers", notifyMembers) ;//需提醒的人员
			model.put("reportURL", this.realPathResolver.getServerRoot()+"/"+Constants.WWWROOT_RELAESE+"/report_mail/project_member_notify_exit_"+htmlId+".html") ;
			model.put("context_path",this.realPathResolver.getServerRoot()+this.realPathResolver.getContextPath()) ;
			model.put("currentdate", new Date()) ;
			
			MailVO mail = new MailVO() ;
			mail.setSubject("项目开发人员起止日期提醒-["+entity.getName()+"]") ;
			if(null != devMemberBuf && !"".equals(devMemberBuf.toString())) {
				mail.setRecipientTO(devMemberBuf.deleteCharAt(devMemberBuf.length()-1).toString()) ;
				mail.setRecipientCC(strBuf.deleteCharAt(strBuf.length()-1).toString()) ;
			} else {
				mail.setRecipientTO(strBuf.deleteCharAt(strBuf.length()-1).toString()) ;
			}
			mail.setContent(FreeMarkerToMailTemplateUtil.MailTemplateToString(rootPath, "project_member_notify_exit.ftl", model)) ;
			this.mailMessageSend.sendMail(mail) ;
			
			//生成HTML
			String exportPath = this.realPathResolver.getParentDir()+File.separator+Constants.WWWROOT_RELAESE+"/report_mail/" ;
			FreeMarkerToHtmlUtil.exportHtml(rootPath, "project_member_notify_exit.ftl", model, 
					exportPath, "project_member_notify_exit_"+htmlId+".html") ;
			
		} catch (Exception e) {
			e.printStackTrace() ;
		}
		
		
	}
}
