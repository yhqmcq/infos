package com.infox.project.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.infox.common.util.ClobUtil;
import com.infox.common.util.Constants;
import com.infox.common.util.DateUtil;
import com.infox.common.util.NumberUtils;
import com.infox.common.util.RandomUtils;
import com.infox.common.util.StringUtil;
import com.infox.common.web.page.DataGrid;
import com.infox.common.web.page.Json;
import com.infox.common.web.springmvc.RealPathResolver;
import com.infox.project.asynms.send.MailMessageSenderI;
import com.infox.project.entity.ProjectEmpWorkingEntity;
import com.infox.project.entity.ProjectMailListEntity;
import com.infox.project.entity.ProjectMainEntity;
import com.infox.project.service.ProjectMainServiceI;
import com.infox.project.web.form.ProjectEmpWorkingForm;
import com.infox.project.web.form.ProjectMailListForm;
import com.infox.project.web.form.ProjectMainForm;
import com.infox.project.web.form.ProjectTaskTimeForm;
import com.infox.sysmgr.entity.EmpJobEntity;
import com.infox.sysmgr.entity.EmployeeEntity;
import com.infox.sysmgr.entity.OrgDeptTreeEntity;
import com.infox.sysmgr.service.TaskSchedulerServiceI;
import com.infox.sysmgr.web.form.TaskForm;

@Service
@Transactional
public class ProjectMainServiceImpl implements ProjectMainServiceI {

	@Autowired
	private BaseDaoI<ProjectMainEntity> basedaoProject;

	@Autowired
	private BaseDaoI<EmpJobEntity> basedaoEmpJob;

	@Autowired
	private BaseDaoI<OrgDeptTreeEntity> basedaoOrg;

	@Autowired
	private BaseDaoI<EmployeeEntity> basedaoEmployee;
	
	@Autowired
	private BaseDaoI<ProjectEmpWorkingEntity> basedaoProjectEW;

	@Autowired
	private BaseDaoI<ProjectMailListEntity> basedaoMailList;
	
	@Autowired
	private MailMessageSenderI mailMessageSend ;
	
	@Autowired
	private RealPathResolver realPathResolver ;
	
	@Autowired
	private TaskSchedulerServiceI taskScheduler ;

	@Override
	public void add(ProjectMainForm form) throws Exception {
		if(form.getProjectNum() == null || form.getProjectNum().equals("")) {
			throw new Exception("项目编号不能为空！ ") ;
		}
		Long count = this.basedaoProject.count("select count(t.projectNum) from ProjectMainEntity t where t.projectNum='"+form.getProjectNum()+"'") ;
		if(count >= 1) {
			throw new Exception("项目编号已存在！ ") ;
		}
		ProjectMainForm project = this.get(form.getCode());
		if (null == project) {
			ProjectMainEntity entity = new ProjectMainEntity();
			BeanUtils.copyProperties(form, entity, new String[] { "id", "project_target", "project_desc" });

			if (null != form.getDeptid() && !"".equalsIgnoreCase(form.getDeptid())) {
				OrgDeptTreeEntity dept = new OrgDeptTreeEntity();
				dept.setId(form.getDeptid());
				entity.setDept(dept);
			}

			if (null != form.getLeader_id() && !"".equalsIgnoreCase(form.getLeader_id())) {
				EmployeeEntity Emp = new EmployeeEntity();
				Emp.setId(form.getLeader_id());
				entity.setEmp(Emp);
			}
			entity.setStatus(0);
			entity.setProject_target(ClobUtil.getClob(form.getProject_target())) ;
			entity.setProject_desc(ClobUtil.getClob(form.getProject_desc())) ;
			this.basedaoProject.save(entity);
		} else {
			throw new Exception("该项目已存在！ ");
		}
	}

	@Override
	public void delete(String id) throws Exception {
		ProjectMainEntity entity = this.basedaoProject.get(ProjectMainEntity.class, id);
		del(entity);
	}

	private void del(ProjectMainEntity entity) {
		if (entity.getProjects() != null && entity.getProjects().size() > 0) {
			for (ProjectMainEntity r : entity.getProjects()) {
				del(r);
			}
		}
		this.basedaoProject.delete(entity);
	}

	@Override
	public void edit(ProjectMainForm form) throws Exception {
		ProjectMainEntity entity = this.basedaoProject.get(ProjectMainEntity.class, form.getId());
		
		boolean flag = false ;
		//项目为开始状态才进行历史记录
		if(entity.getStatus() == 1) {
			// 如果两个结束日期不相等则为项目延期，记录历史信息
			if (!DateUtil.formatF(form.getEndDate()).equals(DateUtil.formatF(entity.getEndDate()))) {
				ProjectMainEntity history = new ProjectMainEntity();
				history.setId(RandomUtils.generateNumber(6));
				history.setProject(entity);
				history.setStartDate(entity.getStartDate());
				history.setEndDate(entity.getEndDate());
				history.setStatus(5); 
				
				BeanUtils.copyProperties(entity, history, new String[] { "id", "status", "project", "projectmails", "projects", "pwe" });
				
				this.basedaoProject.save(history);
				
				flag = true ;
			}
		}
		
		BeanUtils.copyProperties(form, entity, new String[] { "creater", "status", "project_target", "project_desc" });
		entity.setProject_target(ClobUtil.getClob(form.getProject_target())) ;
		entity.setProject_desc(ClobUtil.getClob(form.getProject_desc())) ;

		if (null != form.getLeader_id() && !"".equals(form.getLeader_id())) {
			entity.setEmp(this.basedaoEmployee.get(EmployeeEntity.class, form.getLeader_id()));
		}
		this.basedaoProject.update(entity);
		
		if(flag) {
			//定时任务（重新设定项目的触发时间）
			String[] dateCron = DateUtil.getDateCron(DateUtil.formatG(entity.getEndDate()) + " 08:35:30", 2) ;
			if(dateCron.length > 1) {
				for (int i = 0; i < dateCron.length; i++) {
					//先删除原有的触发器,在建立新的触发器
					TaskForm task = new TaskForm() ;
					task.setRelationOperate(entity.getId()+":"+i) ;
					TaskForm taskForm = this.taskScheduler.get(task) ;
					if(null != taskForm) {
						this.taskScheduler.delete(taskForm.getId()) ;
					}
					
					TaskForm taskadd = new TaskForm() ;
					taskadd.setTask_type("system") ;
					taskadd.setTask_type_name("项目结束定时邮件") ;
					taskadd.setTask_job_class("com.infox.project.job.ProjectSchedulerEmail") ;
					taskadd.setTask_enable("Y") ;
					taskadd.setTask_name("项目结束日期提醒") ;
					taskadd.setRelationOperate(entity.getId() +":" + i) ;
					taskadd.setCron_expression(dateCron[i]) ; 
					this.taskScheduler.add(taskadd) ;
				}
			}
			
			//延期（发送邮件通知）
			this.delay(entity) ;
		}
		
		//项目为开始状态才进行邮件发送
		if(entity.getStatus() == 1) {
			//发送项目参数变更邮件
			this.contentChange(entity) ;
		}
	}
	
	//延期（发送邮件通知）
	public void delay(ProjectMainEntity entity) {
		
		//项目信息
		ProjectMainForm project = new ProjectMainForm() ;
		BeanUtils.copyProperties(entity, project, new String[]{"project_target", "project_desc"}) ;
		project.setDeptname(entity.getDept().getFullname()) ;
		project.setLeader_name(entity.getEmp().getTruename()) ;
		project.setProject_target(ClobUtil.getString(entity.getProject_target())) ;
		project.setProject_desc(ClobUtil.getString(entity.getProject_desc())) ;
		
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
			model.put("reportURL", this.realPathResolver.getServerRoot()+"/"+Constants.WWWROOT_RELAESE+"/report_mail/project_delay_mail_"+htmlId+".html") ;
			model.put("context_path",this.realPathResolver.getServerRoot()+this.realPathResolver.getContextPath()) ;
			model.put("currentdate", new Date()) ;
			
			MailVO mail = new MailVO() ;
			mail.setSubject("项目延期-["+entity.getName()+"]") ;
			if(null != devMemberBuf && !"".equals(devMemberBuf.toString())) {
				mail.setRecipientTO(devMemberBuf.deleteCharAt(devMemberBuf.length()-1).toString()) ;
				mail.setRecipientCC(strBuf.deleteCharAt(strBuf.length()-1).toString()) ;
			} else {
				mail.setRecipientTO(strBuf.deleteCharAt(strBuf.length()-1).toString()) ;
			}
			mail.setContent(FreeMarkerToMailTemplateUtil.MailTemplateToString(rootPath, "project_delay_mail.ftl", model)) ;
			this.mailMessageSend.sendMail(mail) ;
			
			//生成HTML
			String exportPath = this.realPathResolver.getParentDir()+File.separator+Constants.WWWROOT_RELAESE+"/report_mail/" ;
			FreeMarkerToHtmlUtil.exportHtml(rootPath, "project_delay_mail.ftl", model, 
					exportPath, "project_delay_mail_"+htmlId+".html") ;
			
		} catch (Exception e) {
			e.printStackTrace() ;
		}
	}
	
	//项目参数内容发生变化（发送邮件通知）
	public void contentChange(ProjectMainEntity entity) {
		
		//项目信息
		ProjectMainForm project = new ProjectMainForm() ;
		BeanUtils.copyProperties(entity, project, new String[]{"project_target", "project_desc"}) ;
		project.setDeptname(entity.getDept().getFullname()) ;
		project.setLeader_name(entity.getEmp().getTruename()) ;
		project.setProject_target(ClobUtil.getString(entity.getProject_target())) ;
		project.setProject_desc(ClobUtil.getString(entity.getProject_desc())) ;
		
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
			model.put("reportURL", this.realPathResolver.getServerRoot()+"/"+Constants.WWWROOT_RELAESE+"/report_mail/project_contextChange_mail_"+htmlId+".html") ;
			model.put("context_path",this.realPathResolver.getServerRoot()+this.realPathResolver.getContextPath()) ;
			model.put("currentdate", new Date()) ;
			
			MailVO mail = new MailVO() ;
			mail.setSubject("项目参数发生变更-["+entity.getName()+"]") ;
			if(null != devMemberBuf && !"".equals(devMemberBuf.toString())) {
				mail.setRecipientTO(devMemberBuf.deleteCharAt(devMemberBuf.length()-1).toString()) ;
				mail.setRecipientCC(strBuf.deleteCharAt(strBuf.length()-1).toString()) ;
			} else {
				mail.setRecipientTO(strBuf.deleteCharAt(strBuf.length()-1).toString()) ;
			}
			mail.setContent(FreeMarkerToMailTemplateUtil.MailTemplateToString(rootPath, "project_contextChange_mail.ftl", model)) ;
			this.mailMessageSend.sendMail(mail) ;
			
			//生成HTML
			String exportPath = this.realPathResolver.getParentDir()+File.separator+Constants.WWWROOT_RELAESE+"/report_mail/" ;
			FreeMarkerToHtmlUtil.exportHtml(rootPath, "project_contextChange_mail.ftl", model, 
					exportPath, "project_contextChange_mail_"+htmlId+".html") ;
			
		} catch (Exception e) {
			e.printStackTrace() ;
		}
	}

	@Override
	public ProjectMainForm get(String id) throws Exception {
		ProjectMainEntity entity = this.basedaoProject.get(ProjectMainEntity.class, id);
		if (null != entity) {
			ProjectMainForm form = new ProjectMainForm();
			BeanUtils.copyProperties(entity, form, new String[] { "project_target", "project_desc" });
			form.setProject_desc(ClobUtil.getString(entity.getProject_desc())) ;
			form.setProject_target(ClobUtil.getString(entity.getProject_target())) ;
			
			OrgDeptTreeEntity dept = entity.getDept();
			if (null != dept) {
				form.setDeptid(dept.getId());
			}
			EmployeeEntity Emp = entity.getEmp();
			if (null != Emp) {
				form.setLeader_id(Emp.getId());
				form.setLeader_name(Emp.getTruename());
			}
			
			return form;
		} else {
			return null;
		}
	}
	
	@Override
	public DataGrid get_ProjectDevList(String id) throws Exception {
		DataGrid datagrid = new DataGrid();
		
		ProjectMainEntity entity = this.basedaoProject.get(ProjectMainEntity.class, id);
		
		List<ProjectTaskTimeForm> devList = new ArrayList<ProjectTaskTimeForm>() ;
		List<Map<String, Object>> footer = new ArrayList<Map<String, Object>>() ;
		long allTaskTime = 0 ;
		long allExpendDays = 0 ;
		float allExpendmm = 0f ;
		float allmm = 0f ;
		if (null != entity) {
			Set<ProjectEmpWorkingEntity> pwe = entity.getPwe() ;
			for (ProjectEmpWorkingEntity p : pwe) {
				ProjectTaskTimeForm pf = new ProjectTaskTimeForm() ;
				EmployeeEntity e = p.getEmp() ;
				pf.setEmp_id(e.getId()) ;
				pf.setEmp_name(e.getTruename()) ;
				StringBuffer sb = new StringBuffer() ;
				Set<EmpJobEntity> empjobs = p.getEmp().getEmpjobs() ;
				for (EmpJobEntity eje : empjobs) {
					sb.append(eje.getJob_name()) ;
				}
				pf.setPosition_name(sb.toString()) ;
				pf.setProject_role(p.getProject_role()) ;
				pf.setDept_name(e.getOrg().getFullname()) ;
				pf.setSd(DateUtil.formatG(p.getStartDate())) ;
				pf.setEd(DateUtil.formatG(p.getEndDate())) ;
				
				long dateDiff = DateUtil.dateDiff(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(p.getEndDate()));
				long lastdateDiff = 0 ;
				
				//如果结束日期大于今天，已消耗天数的则不以当前的日期来计算
				int compare_date2 = DateUtil.compare_date2(DateUtil.formatF(new Date()), DateUtil.formatF(p.getEndDate())) ;
				if(compare_date2 == 1) {
					lastdateDiff = DateUtil.dateDiff(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(p.getEndDate())) ;
				} else {
					lastdateDiff = DateUtil.dateDiff(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(new Date())) ;
				}
				
				int compare_date3 = DateUtil.compare_date2(DateUtil.formatF(p.getStartDate()), DateUtil.formatF(new Date())) ;
				if(compare_date3 == 1) {
					pf.setTotalTaskTime(0) ;
					pf.setExpendDays(0) ;
					pf.setMm(0) ;
					pf.setExpendMM(0) ;
				} else {
					pf.setTotalTaskTime(dateDiff) ;
					pf.setExpendDays(lastdateDiff) ;
					pf.setMm(dateDiff/21f) ;
					pf.setExpendMM((pf.getExpendDays()/21f)) ;
				}
				
				
				pf.setStatus(p.getStatus()) ;
				
				devList.add(pf) ;
				
				allTaskTime += dateDiff ;
				allExpendDays += pf.getExpendDays();
				allExpendmm += pf.getExpendMM() ;
				allmm += pf.getMm() ;
			}
			
			Map<String, Object> map = new HashMap<String, Object>() ;
			map.put("ed", "统计：") ;
			map.put("totalTaskTime", allTaskTime) ;
			map.put("expendDays", allExpendDays) ;
			map.put("mm", allmm) ;
			map.put("expendMM", allExpendmm) ;
			footer.add(map) ;
			
			datagrid.setTotal((long) pwe.size());
			datagrid.setRows(devList);
			datagrid.setFooter(footer) ;
			
			return datagrid;
		} else {
			return datagrid;
		}
	}
	@Override
	public ProjectMainForm get_ProjectDetail(String id) throws Exception {
		ProjectMainEntity entity = this.basedaoProject.get(ProjectMainEntity.class, id);
		
		if (null != entity) {
			ProjectMainForm form = new ProjectMainForm();
			BeanUtils.copyProperties(entity, form, new String[] { "project_target", "project_desc" });
			form.setProject_desc(ClobUtil.getString(entity.getProject_desc())) ;
			form.setProject_target(ClobUtil.getString(entity.getProject_target())) ;

			OrgDeptTreeEntity dept = entity.getDept();
			if (null != dept) {
				form.setDeptid(dept.getId());
			}
			EmployeeEntity Emp = entity.getEmp();
			if (null != Emp) {
				form.setLeader_id(Emp.getId());
				form.setLeader_name(Emp.getTruename());
			}
			
			List<ProjectTaskTimeForm> devList = new ArrayList<ProjectTaskTimeForm>() ;
			Set<ProjectEmpWorkingEntity> pwe = entity.getPwe() ;
			for (ProjectEmpWorkingEntity p : pwe) {
				ProjectTaskTimeForm pf = new ProjectTaskTimeForm() ;
				EmployeeEntity e = p.getEmp() ;
				pf.setEmp_id(e.getId()) ;
				pf.setEmp_name(e.getTruename()) ;
				pf.setDept_name(e.getOrg().getFullname()) ;
				pf.setStartDate(p.getStartDate()) ;
				pf.setEndDate(p.getEndDate()) ;
				
				long dateDiff = DateUtil.dateDiff(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(p.getEndDate()));
				long lastdateDiff = DateUtil.dateDiff(DateUtil.formatG(new Date()), DateUtil.formatG(p.getEndDate()));
				pf.setTotalTaskTime(dateDiff) ;
				pf.setExpendDays(lastdateDiff) ;
				pf.setExpendMM(((float)dateDiff - (float)lastdateDiff)/21f) ;
				
				
				devList.add(pf) ;
				
				form.setDevMemList(devList) ;
			}
			

			return form;
		} else {
			return null;
		}
	}

	@Override
	public ProjectMainForm get(ProjectMainForm form) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select t from ProjectMainEntity t where 1=1";
		hql = addWhere(hql, form, params) + addOrdeby(form);

		ProjectMainEntity entity = this.basedaoProject.get(hql, params);
		if (null != entity) {
			ProjectMainForm pform = new ProjectMainForm();
			BeanUtils.copyProperties(entity, form, new String[] { "project_target", "project_desc" });
			form.setProject_desc(ClobUtil.getString(entity.getProject_desc())) ;
			form.setProject_target(ClobUtil.getString(entity.getProject_target())) ;
			return pform;
		} else {
			return null;
		}
	}

	@Override
	public DataGrid datagrid(ProjectMainForm form) throws Exception {
		form.setSort("startDate") ;
		form.setOrder("asc") ;
		DataGrid datagrid = new DataGrid();
		datagrid.setTotal(this.total(form));
		datagrid.setRows(this.changeModel(this.find(form)));
		return datagrid;
	}

	private List<ProjectMainForm> changeModel(List<ProjectMainEntity> ProjectMainEntity) {
		List<ProjectMainForm> forms = new ArrayList<ProjectMainForm>();

		if (null != ProjectMainEntity && ProjectMainEntity.size() > 0) {
			for (ProjectMainEntity i : ProjectMainEntity) {
				float allTotalMM = 0f ;
				ProjectMainForm uf = new ProjectMainForm();
				BeanUtils.copyProperties(i, uf, new String[]{"project_target", "project_desc"});
				uf.setProject_target(StringUtil.removeHTMLLable(ClobUtil.getString(i.getProject_target()))) ;
				uf.setLeader_name(i.getEmp().getTruename()) ;

				//计算项目的天数(不包括周六日)
				long dateDiff = DateUtil.dateDiff(DateUtil.formatG(i.getStartDate()), DateUtil.formatG(i.getEndDate()));
				uf.setDateDiff(dateDiff);
				if(i.getStatus() != 3) {	//项目为结束状态，无需计算剩余天数
					long lastdateDiff = DateUtil.dateDiff(DateUtil.formatG(new Date()), DateUtil.formatG(i.getEndDate()));
					uf.setLastdateDiff(lastdateDiff);
				}
				if (null != i.getDept()) {
					uf.setDeptname(i.getDept().getFullname());
				}
				
				Set<ProjectEmpWorkingEntity> pwe = i.getPwe() ;
				for (ProjectEmpWorkingEntity pw : pwe) {
					//判断该项目中是否有人员的开始日期是否未设置,如果为设置,则直接删除,并设置为空闲人员(因为设置开发人员时有遗漏的)
					if(null == pw.getStartDate()) {
						pw.getEmp().setWorkStatus(0) ;
						this.basedaoProjectEW.delete(pw) ;
					} else {
						long totalDays = DateUtil.dateDiff(DateUtil.formatG(pw.getStartDate()), DateUtil.formatG(pw.getEndDate())) ;
						float mm = (1*((float)totalDays/30)) ;
						allTotalMM += mm ;
					}
				}

				uf.setMm(NumberUtils.formatNum(allTotalMM)) ;
				forms.add(uf);
			}
		}
		return forms;
	}

	private List<ProjectMainEntity> find(ProjectMainForm form) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select t from ProjectMainEntity t where 1=1";
		hql = addWhere(hql, form, params) + addOrdeby(form);
		return this.basedaoProject.find(hql, params, form.getPage(), form.getRows());
	}

	private String addOrdeby(ProjectMainForm form) {
		String orderString = "";
		if (form.getSort() != null && form.getOrder() != null) {
			orderString = " order by " + form.getSort() + " " + form.getOrder();
		}
		return orderString;
	}

	public Long total(ProjectMainForm form) {
		Map<String, Object> params = new HashMap<String, Object>();

		String hql = "select count(*) from ProjectMainEntity t where 1=1";

		hql = addWhere(hql, form, params);

		return this.basedaoProject.count(hql, params);
	}

	private String addWhere(String hql, ProjectMainForm form, Map<String, Object> params) {
		if (null != form) {
			if (form.getCode() != null && !"".equals(form.getCode())) {
				hql += " and t.code=:code";
				params.put("code", form.getCode());
			}
			if (form.getPid() != null && !"".equals(form.getPid())) {
				hql += " and t.project.id=:pid";
				params.put("pid", form.getPid());
			}
			if (null != form.getNotInStatus() && !"".equals(form.getNotInStatus())) {
				hql += " and t.status not in (:notInStatus)";
				String[] split = form.getNotInStatus().split(",");
				Integer[] states = new Integer[split.length];
				for (int i = 0; i < states.length; i++) {
					states[i] = Integer.parseInt(split[i]);
				}
				params.put("notInStatus", states);
			}
		}
		return hql;
	}

	@Override
	public void addMailList(ProjectMailListForm form) throws Exception {
		String empIds = form.getIds();
		if (null != empIds && !"".equals(empIds)) {
			String[] empIdsSplit = empIds.split(",");
			for (int i = 0; i < empIdsSplit.length; i++) {

				Map<String, Object> params = new HashMap<String, Object>();
				params.put("empid", empIdsSplit[i]);
				params.put("projectid", form.getProjectid());
				ProjectMailListEntity pml = this.basedaoMailList.get("select t from ProjectMailListEntity t where t.employee.id=:empid and t.projectmain.id=:projectid", params);
				if (pml == null) {
					EmployeeEntity employeeEntity = this.basedaoEmployee.get(EmployeeEntity.class, empIdsSplit[i]);

					ProjectMailListEntity entity = new ProjectMailListEntity();
					entity.setEmployee(employeeEntity) ;

					entity.setProjectmain(this.basedaoProject.get(ProjectMainEntity.class, form.getProjectid()));

					this.basedaoMailList.save(entity);
				}
			}
		}
	}

	@Override
	public void deleteMailList(String id) throws Exception {
		this.basedaoMailList.delete(this.basedaoMailList.get(ProjectMailListEntity.class, id));
	}

	@Override
	public DataGrid maillist_datagrid(ProjectMailListForm form) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select t from ProjectMailListEntity t where t.projectmain.id=:projectid";
		params.put("projectid", form.getProjectid());

		List<ProjectMailListEntity> entitys = this.basedaoMailList.find(hql, params);

		List<ProjectMailListForm> forms = new ArrayList<ProjectMailListForm>();
		for (ProjectMailListEntity p : entitys) {
			ProjectMailListForm f = new ProjectMailListForm();
			
			StringBuffer sb = new StringBuffer() ;
			Set<EmpJobEntity> empjobs = p.getEmployee().getEmpjobs() ;
			for (EmpJobEntity eje : empjobs) {
				sb.append(eje.getJob_name()) ;
			}
			f.setEmpid(p.getEmployee().getId()) ;
			f.setEmpjobname(sb.toString()) ;
			f.setEmpname(p.getEmployee().getTruename()) ;
			f.setEmail(p.getEmployee().getEmail()) ;
			
			f.setDeptname(p.getEmployee().getOrg().getFullname()) ;
			
			f.setProject_name(p.getProjectmain().getName()) ;
			
			forms.add(f);
		}

		DataGrid datagrid = new DataGrid();
		datagrid.setRows(forms);
		return datagrid;
	}

	/**
	 * 变更项目的状态
	 */
	@Override
	public Json statusChange(ProjectMainForm form) throws Exception {
		Json json = new Json();
		json.setStatus(false);

		ProjectMainEntity entity = this.basedaoProject.get(ProjectMainEntity.class, form.getId());
		
		// 开始项目（进行中）
		if (null != form.getStatus() && form.getStatus() == 1) {
			if(1 == entity.getStatus()) {
				json.setMsg("项目的状态已经是开启状态！"); return json ;
			}
			if(2 == entity.getStatus()) {
				json.setMsg("该项目已挂起，请点击激活来开始项目！"); return json ;
			}
			if(3 == entity.getStatus()) {
				json.setMsg("该项目已结束，无法开始，请建立新的项目！"); return json ;
			}
			if(4 == entity.getStatus()) {
				json.setMsg("该项目运行中，无法激活！"); return json ;
			}
			
			if(0 == entity.getStatus()) {
				// 检查该项目是否已设置项目参与人员邮件列表，未设置则不能开始项目
				Set<ProjectMailListEntity> projectmails = entity.getProjectmails();
				if (null != projectmails && !projectmails.isEmpty()) {
					entity.setStatus(1); // 开始状态
					json.setMsg("项目开启成功！");
					json.setStatus(true);
					
					//项目开发人员起止日期提醒（定时器）
					Set<String> dateGroup = new HashSet<String>() ;
					Set<ProjectEmpWorkingEntity> pwes = entity.getPwe() ;
					for (ProjectEmpWorkingEntity member : pwes) {
						String[] dateCron = DateUtil.getDateCron(DateUtil.formatG(member.getEndDate()) + " 08:35:30", 2) ;
						for (int i = 0; i < dateCron.length; i++) {
							//将相同日期的归为一组，进行定时
							dateGroup.add(dateCron[i]) ;
						}
					}
					int j=0;
					for (String date : dateGroup) {
						TaskForm task = new TaskForm() ;
				 		task.setTask_type("system") ;
						task.setTask_type_name("项目开发人员起止日期提醒") ;
						task.setTask_job_class("com.infox.project.job.ProjectMemberWorkSchedulerEmail") ;
						task.setTask_enable("Y") ;
						task.setTask_name("项目开发人员起止日期提醒") ;
						task.setRelationOperate(entity.getId() +":M" + j++) ;
						task.setCron_expression(date) ; 
						this.taskScheduler.add(task) ;
					}
					
					
					//设置定时任务
					String[] dateCron = DateUtil.getDateCron(DateUtil.formatG(entity.getEndDate()) + " 08:30:00", 2) ;
					if(dateCron.length > 1) {
						for (int i = 0; i < dateCron.length; i++) {
							TaskForm task = new TaskForm() ;
					 		task.setTask_type("system") ;
							task.setTask_type_name("项目结束定时邮件") ;
							task.setTask_job_class("com.infox.project.job.ProjectSchedulerEmail") ;
							task.setTask_enable("Y") ;
							task.setTask_name("项目结束日期提醒") ;
							task.setRelationOperate(entity.getId() +":" + i) ;
							task.setCron_expression(dateCron[i]) ; 
							this.taskScheduler.add(task) ;
						}
					}
					
				} else {
					json.setMsg("项目未设置参与人员邮件列表，请设置后再开始项目。");
				}
			}
		} else if (null != form.getStatus() && form.getStatus() == 2) {	// 项目挂起
			if(0 == entity.getStatus()) {
				json.setMsg("该项目未开始，将无法挂起，请先开始项目！"); return json ;
			}
			if(2 == entity.getStatus()) {
				json.setMsg("该项目的状态已是挂起状态！"); return json ;
			}
			if(3 == entity.getStatus()) {
				json.setMsg("该项目已结束，无法挂起，请建立新的项目！"); return json ;
			}
			
			if(form.getStatus() != entity.getStatus()) {
				entity.setStatus(2); // 开始状态
				json.setMsg("项目挂起成功！");
				json.setStatus(true) ;
				
				// 邮件通知
			} else {
				json.setMsg("项目的状态已经是挂起状态！");
			}
		} else if (null != form.getStatus() && form.getStatus() == 4) {	// 激活项目
			if(0 == entity.getStatus()) {
				json.setMsg("该项目未开始，将无法激活，请先开始项目！"); return json ;
			}
			if(1 == entity.getStatus()) {
				json.setMsg("项目运行中，将无法激活！"); return json ;
			}
			if(3 == entity.getStatus()) {
				json.setMsg("该项目已结束，无法激活，请建立新的项目！"); return json ;
			}
			if(form.getStatus() != entity.getStatus()) {
				entity.setStatus(1); // 激活项目，将状态改为进行中（1）
				json.setMsg("项目激活成功！");
				json.setStatus(true) ;
				
				// 邮件通知
			} else {
				json.setMsg("项目的状态已经是激活状态！");
			}
		} else if (null != form.getStatus() && form.getStatus() == 3) {	// 结束项目
			if(0 == entity.getStatus()) {
				json.setMsg("该项目未开始，将无法结束，请先开始项目！"); return json ;
			}
			if(3 == entity.getStatus()) {
				json.setMsg("该项目的状态已是结束状态！"); return json ;
			}
			
			if(form.getStatus() != entity.getStatus()) {
				entity.setStatus(3); // 开始状态
				json.setMsg("项目结束！");
				json.setStatus(true) ;
				
				// 邮件通知
			} else {
				json.setMsg("项目的状态已经是结束状态！");
			}
		} else {
			json.setMsg("未知状态！");
			json.setStatus(false) ;
		}
		
		//发送异步消息（项目信息邮件）
		if(json.isStatus()) {
			this.status(entity) ;
		}

		return json;
	}
	
	//状态发送改变（发送邮件通知）
	public void status(ProjectMainEntity entity) {
		//项目信息
		ProjectMainForm project = new ProjectMainForm() ;
		BeanUtils.copyProperties(entity, project, new String[]{"project_target", "project_desc"}) ;
		project.setDeptname(entity.getDept().getFullname()) ;
		project.setLeader_name(entity.getEmp().getTruename()) ;
		project.setProject_target(ClobUtil.getString(entity.getProject_target())) ;
		project.setProject_desc(ClobUtil.getString(entity.getProject_desc())) ;
		
		try {
			String rootPath = this.realPathResolver.get("/WEB-INF/security_views/project/ftl") ;
			Map<String,Object> model = new HashMap<String,Object>() ;
			
			Integer status = entity.getStatus() ;
			String statusStr = "" ;
			if(1 == status) {
				statusStr = "开始" ;
			} else if(2 == status) {
				statusStr = "挂起" ;
			} else if(4 == status) {
				statusStr = "激活" ;
			} else {
				statusStr = "结束" ;
			}
			
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
			model.put("reportURL", this.realPathResolver.getServerRoot()+"/"+Constants.WWWROOT_RELAESE+"/report_mail/project_status_mail_"+htmlId+".html") ;
			model.put("context_path",this.realPathResolver.getServerRoot()+this.realPathResolver.getContextPath()) ;
			model.put("currentdate", new Date()) ;
			
			
			MailVO mail = new MailVO() ;
			mail.setSubject("项目状态发生变更（"+statusStr+"）-["+entity.getName()+"]") ;
			if(null != devMemberBuf && !"".equals(devMemberBuf.toString())) {
				mail.setRecipientTO(devMemberBuf.deleteCharAt(devMemberBuf.length()-1).toString()) ;
				mail.setRecipientCC(strBuf.deleteCharAt(strBuf.length()-1).toString()) ;
			} else {
				mail.setRecipientTO(strBuf.deleteCharAt(strBuf.length()-1).toString()) ;
			}
			mail.setContent(FreeMarkerToMailTemplateUtil.MailTemplateToString(rootPath, "project_status_mail.ftl", model)) ;
			this.mailMessageSend.sendMail(mail) ;
			
			//生成HTML
			String exportPath = this.realPathResolver.getParentDir()+File.separator+Constants.WWWROOT_RELAESE+"/report_mail/" ;
			FreeMarkerToHtmlUtil.exportHtml(rootPath, "project_status_mail.ftl", model, 
					exportPath, "project_status_mail_"+htmlId+".html") ;
			
		} catch (Exception e) {
			e.printStackTrace() ;
		}
	}

	/**
	 * 定时器调用
	 */
	@Override
	public void projectNotify(ProjectMainForm form) throws Exception {
		ProjectMainEntity entity = this.basedaoProject.get(ProjectMainEntity.class, form.getId()) ;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd") ;
		String currentDate = sdf.format(new Date()) ;
		String endDate = sdf.format(entity.getEndDate()) ;
		
		boolean flag = false ;
		//判断当前日期是否和结束日期相等,相等的话,则是项目结束，否则未结束，将提交两天发送邮件通知该项目还剩余的时间
		if(currentDate.equals(endDate)) {
			flag = true ;
		} else {
			flag = false ;
		}
		
		//项目信息
		ProjectMainForm project = new ProjectMainForm() ;
		BeanUtils.copyProperties(entity, project, new String[]{"project_target", "project_desc"}) ;
		project.setDeptname(entity.getDept().getFullname()) ;
		project.setLeader_name(entity.getEmp().getTruename()) ;
		project.setProject_target(ClobUtil.getString(entity.getProject_target())) ;
		project.setProject_desc(ClobUtil.getString(entity.getProject_desc())) ;
		
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
			model.put("reportURL", this.realPathResolver.getServerRoot()+"/"+Constants.WWWROOT_RELAESE+"/report_mail/project_notify_"+htmlId+".html") ;
			model.put("context_path",this.realPathResolver.getServerRoot()+this.realPathResolver.getContextPath()) ;
			model.put("currentdate", new Date()) ;
			model.put("title", (flag?"项目结束":"项目时间提醒")) ;
			
			MailVO mail = new MailVO() ;
			mail.setSubject((flag?"项目结束-":"项目时间提醒邮件-") + "["+entity.getName()+"]") ;
			if(null != devMemberBuf && !"".equals(devMemberBuf.toString())) {
				mail.setRecipientTO(devMemberBuf.deleteCharAt(devMemberBuf.length()-1).toString()) ;
				mail.setRecipientCC(strBuf.deleteCharAt(strBuf.length()-1).toString()) ;
			} else {
				mail.setRecipientTO(strBuf.deleteCharAt(strBuf.length()-1).toString()) ;
			}
			mail.setContent(FreeMarkerToMailTemplateUtil.MailTemplateToString(rootPath, "project_notify.ftl", model)) ;
			this.mailMessageSend.sendMail(mail) ;
			

			//生成HTML
			String exportPath = this.realPathResolver.getParentDir()+File.separator+Constants.WWWROOT_RELAESE+"/report_mail/" ;
			FreeMarkerToHtmlUtil.exportHtml(rootPath, "project_notify.ftl", model, 
					exportPath, "project_notify_"+htmlId+".html") ;
			
			if(flag) {
				//项目结束
				entity.setStatus(3) ;
				this.basedaoProject.update(entity) ;
			}
		} catch (Exception e) {
			e.printStackTrace() ;
		}
	}
}
