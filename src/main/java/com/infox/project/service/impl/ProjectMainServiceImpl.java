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
import com.infox.common.util.RandomUtils;
import com.infox.common.web.page.DataGrid;
import com.infox.common.web.page.Json;
import com.infox.common.web.springmvc.RealPathResolver;
import com.infox.project.asynms.send.MailMessageSenderI;
import com.infox.project.entity.ProjectEmpWorkingEntity;
import com.infox.project.entity.ProjectMailListEntity;
import com.infox.project.entity.ProjectMainEntity;
import com.infox.project.service.ProjectMainServiceI;
import com.infox.project.web.form.ProjectMailListForm;
import com.infox.project.web.form.ProjectMainForm;
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
	private BaseDaoI<ProjectMailListEntity> basedaoMailList;
	
	@Autowired
	private MailMessageSenderI mailMessageSend ;
	
	@Autowired
	private RealPathResolver realPathResolver ;
	
	@Autowired
	private TaskSchedulerServiceI taskScheduler ;

	@Override
	public void add(ProjectMainForm form) throws Exception {
		ProjectMainForm project = this.get(form.getCode());
		if (null == project) {
			ProjectMainEntity entity = new ProjectMainEntity();
			BeanUtils.copyProperties(form, entity, new String[] { "id", "project_target", "project_desc" });

			if (null != form.getDeptid() && !"".equalsIgnoreCase(form.getDeptid())) {
				OrgDeptTreeEntity dept = new OrgDeptTreeEntity();
				dept.setId(form.getDeptid());
				entity.setDept(dept);
			}

			if (null != form.getProject_leader_id() && !"".equalsIgnoreCase(form.getProject_leader_id())) {
				EmployeeEntity emp_leader = new EmployeeEntity();
				emp_leader.setId(form.getProject_leader_id());
				entity.setEmp_leader(emp_leader);
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

		if (null != form.getProject_leader_id() && !"".equals(form.getProject_leader_id())) {
			entity.setEmp_leader(this.basedaoEmployee.get(EmployeeEntity.class, form.getProject_leader_id()));
		}
		this.basedaoProject.update(entity);
		
		if(flag) {
			//定时任务（重新设定项目的触发时间）
			String[] dateCron = DateUtil.getDateCron(DateUtil.formatG(entity.getEndDate()) + " 08:30:00", 2) ;
			if(dateCron.length > 1) {
				for (int i = 0; i < dateCron.length; i++) {
					//先删除原有的触发器,在建立新的触发器
					TaskForm task = new TaskForm() ;
					task.setRelationOperate(entity.getId()+":"+i) ;
					TaskForm taskForm = this.taskScheduler.get(task) ;
					this.taskScheduler.delete(taskForm.getId()) ;
					
					taskForm.setCron_expression(dateCron[i]) ;
					this.taskScheduler.add(taskForm) ;
				}
			}
			
			//延期（发送邮件通知）
			this.delay(entity) ;
		}
		
		//项目为开始状态才进行邮件发送
		if(entity.getStatus() != 1) {
			//发送项目参数变更邮件
			this.contentChange(entity) ;
		}
	}
	
	//延期（发送邮件通知）
	public void delay(ProjectMainEntity entity) {
		try {
			String rootPath = this.realPathResolver.get("/WEB-INF/security_views/project/ftl") ;
			Map<String,Object> model = new HashMap<String,Object>() ;
			
			//项目参与人员-邮件列表
			List<ProjectMailListEntity> projectMailList = new ArrayList<ProjectMailListEntity>() ;
			StringBuffer strBuf = new StringBuffer() ; //群发邮件地址列表
			Set<ProjectMailListEntity> projectmails = entity.getProjectmails() ;
			for (ProjectMailListEntity p : projectmails) {
				strBuf.append(p.getEmail()+",") ;
				projectMailList.add(p) ;
			}
			model.put("projectMailList", projectMailList) ;
			
			//开发人员信息
			List<ProjectEmpWorkingEntity> pworks = new ArrayList<ProjectEmpWorkingEntity>() ;
			Set<ProjectEmpWorkingEntity> pews = entity.getPwe() ;
			StringBuffer devMemberBuf = new StringBuffer() ; //群发邮件地址列表
			for (ProjectEmpWorkingEntity pwork : pews) {
				if(pwork.getStatus() == 1) {
					devMemberBuf.append(pwork.getEmp().getEmail()+",") ;
					ProjectEmpWorkingEntity p = new ProjectEmpWorkingEntity() ;
					BeanUtils.copyProperties(pwork, p) ;
				}
			}
			model.put("pworks", pworks) ;
			
			
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
			String exportPath = this.realPathResolver.getParentDir()+File.separator+Constants.WWWROOT_RELAESE+"/chat_html/" ;
			FreeMarkerToHtmlUtil.exportHtml(rootPath, "project_delay_mail.ftl", model, exportPath, "aa.html") ;
		} catch (Exception e) {
			e.printStackTrace() ;
		}
	}
	
	//项目参数内容发生变化（发送邮件通知）
	public void contentChange(ProjectMainEntity entity) {
		try {
			String rootPath = this.realPathResolver.get("/WEB-INF/security_views/project/ftl") ;
			Map<String,Object> model = new HashMap<String,Object>() ;

			//项目参与人员-邮件列表
			List<ProjectMailListEntity> projectMailList = new ArrayList<ProjectMailListEntity>() ;
			StringBuffer strBuf = new StringBuffer() ; //群发邮件地址列表
			Set<ProjectMailListEntity> projectmails = entity.getProjectmails() ;
			for (ProjectMailListEntity p : projectmails) {
				strBuf.append(p.getEmail()+",") ;
				projectMailList.add(p) ;
			}
			model.put("projectMailList", projectMailList) ;
			
			//开发人员信息
			List<ProjectEmpWorkingEntity> pworks = new ArrayList<ProjectEmpWorkingEntity>() ;
			Set<ProjectEmpWorkingEntity> pews = entity.getPwe() ;
			StringBuffer devMemberBuf = new StringBuffer() ; //群发邮件地址列表
			for (ProjectEmpWorkingEntity pwork : pews) {
				if(pwork.getStatus() == 1) {
					devMemberBuf.append(pwork.getEmp().getEmail()+",") ;
					ProjectEmpWorkingEntity p = new ProjectEmpWorkingEntity() ;
					BeanUtils.copyProperties(pwork, p) ;
				}
			}
			model.put("pworks", pworks) ;
			
			
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
			String exportPath = this.realPathResolver.getParentDir()+File.separator+Constants.WWWROOT_RELAESE+"/chat_html/" ;
			FreeMarkerToHtmlUtil.exportHtml(rootPath, "project_contextChange_mail.ftl", model, exportPath, "aa.html") ;
		} catch (Exception e) {
			System.out.println("无法连接到ActiveMQ异步消息服务器！"+e.getMessage());
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
			EmployeeEntity emp_leader = entity.getEmp_leader();
			if (null != emp_leader) {
				form.setProject_leader_id(emp_leader.getId());
				form.setProject_leader(emp_leader.getTruename());
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
		String date = "2014-03-06 20:58:50" ;
		String[] dateCron = DateUtil.getDateCron(date, 2) ;
		if(dateCron.length > 1) {
			for (int i = 0; i < dateCron.length; i++) {
				TaskForm task = new TaskForm() ;
		 		task.setTask_type("system") ;
				task.setTask_type_name("项目结束定时邮件") ;
				task.setTask_job_class("com.infox.project.job.ProjectSchedulerEmail") ;
				task.setTask_enable("Y") ;
				task.setTask_name("项目结束日期提醒") ;
				task.setRelationOperate("234999:"+i) ;
				task.setCron_expression(dateCron[i]) ; 
				//this.taskScheduler.add(task) ;
			}
		}
		
		DataGrid datagrid = new DataGrid();
		datagrid.setTotal(this.total(form));
		datagrid.setRows(this.changeModel(this.find(form)));
		return datagrid;
	}

	private List<ProjectMainForm> changeModel(List<ProjectMainEntity> ProjectMainEntity) {
		List<ProjectMainForm> forms = new ArrayList<ProjectMainForm>();

		if (null != ProjectMainEntity && ProjectMainEntity.size() > 0) {
			for (ProjectMainEntity i : ProjectMainEntity) {
				ProjectMainForm uf = new ProjectMainForm();
				BeanUtils.copyProperties(i, uf);

				long dateDiff = DateUtil.dateDiff(DateUtil.formatG(i.getStartDate()), DateUtil.formatG(i.getEndDate()));
				uf.setDateDiff(dateDiff);
				if(i.getStatus() != 3) {	//项目为结束状态，无需计算剩余天数
					long lastdateDiff = DateUtil.dateDiff(DateUtil.formatG(new Date()), DateUtil.formatG(i.getEndDate()));
					uf.setLastdateDiff(lastdateDiff);
				}

				if (null != i.getDept()) {
					uf.setDeptname(i.getDept().getFullname());
				}

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
				ProjectMailListEntity pml = this.basedaoMailList.get("select t from ProjectMailListEntity t where t.empid=:empid and t.projectmain.id=:projectid", params);
				if (pml == null) {
					EmployeeEntity employeeEntity = this.basedaoEmployee.get(EmployeeEntity.class, empIdsSplit[i]);

					ProjectMailListEntity entity = new ProjectMailListEntity();
					entity.setEmpid(employeeEntity.getId());
					entity.setEmpname(employeeEntity.getTruename());
					entity.setEmail(employeeEntity.getEmail());

					OrgDeptTreeEntity dept = employeeEntity.getOrg();
					entity.setDeptid(dept.getId());
					entity.setDeptname(dept.getFullname());

					EmpJobEntity job = employeeEntity.getEmpjobs().iterator().next();
					entity.setEmpjobid(job.getId());
					entity.setEmpjobname(job.getJob_name());

					entity.setProjectmain(this.basedaoProject.get(ProjectMainEntity.class, form.getProjectid()));
					entity.setProject_name(form.getProject_name());

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
			com.infox.common.util.BeanUtils.copyProperties(p, f);
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
					
					//项目开发人员期满定时器
					Set<String> dateGroup = new HashSet<String>() ;
					Set<ProjectEmpWorkingEntity> pwes = entity.getPwe() ;
					for (ProjectEmpWorkingEntity member : pwes) {
						String[] dateCron = DateUtil.getDateCron(DateUtil.formatG(member.getEndDate()) + " 08:30:00", 2) ;
						for (int i = 0; i < dateCron.length; i++) {
							//将相同日期的归为一组，进行定时
							dateGroup.add(dateCron[i]) ;
						}
					}
					System.out.println(dateGroup);
					int j=0;
					for (String date : dateGroup) {
						TaskForm task = new TaskForm() ;
				 		task.setTask_type("system") ;
						task.setTask_type_name("开发人员期满邮件提醒") ;
						task.setTask_job_class("com.infox.project.job.ProjectSchedulerEmail") ;
						task.setTask_enable("Y") ;
						task.setTask_name("开发人员期满邮件提醒") ;
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
			List<ProjectMailListEntity> projectMailList = new ArrayList<ProjectMailListEntity>() ;
			StringBuffer strBuf = new StringBuffer() ; //群发邮件地址列表
			Set<ProjectMailListEntity> projectmails = entity.getProjectmails() ;
			for (ProjectMailListEntity p : projectmails) {
				strBuf.append(p.getEmail()+",") ;
				projectMailList.add(p) ;
			}
			model.put("projectMailList", projectMailList) ;
			
			//开发人员信息
			List<ProjectEmpWorkingEntity> pworks = new ArrayList<ProjectEmpWorkingEntity>() ;
			Set<ProjectEmpWorkingEntity> pews = entity.getPwe() ;
			StringBuffer devMemberBuf = new StringBuffer() ; //群发邮件地址列表
			for (ProjectEmpWorkingEntity pwork : pews) {
				if(pwork.getStatus() == 1) {
					devMemberBuf.append(pwork.getEmp().getEmail()+",") ;
					ProjectEmpWorkingEntity p = new ProjectEmpWorkingEntity() ;
					BeanUtils.copyProperties(pwork, p) ;
				}
			}
			model.put("pworks", pworks) ;
			
			
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
			String exportPath = this.realPathResolver.getParentDir()+File.separator+Constants.WWWROOT_RELAESE+"/chat_html/" ;
			FreeMarkerToHtmlUtil.exportHtml(rootPath, "project_status_mail.ftl", model, exportPath, "aa.html") ;
			
		} catch (Exception e) {
			e.printStackTrace() ;
			System.out.println("无法连接到ActiveMQ异步消息服务器！"+e.getMessage());
		}
	}

	/**
	 * 定时器调用
	 */
	@Override
	public void projectNotify(ProjectMainForm form) throws Exception {
		ProjectMainEntity entity = this.basedaoProject.get(ProjectMainEntity.class, form.getId()) ;
		System.out.println(entity);
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
		
		try {
			String rootPath = this.realPathResolver.get("/WEB-INF/security_views/project/ftl") ;
			Map<String,Object> model = new HashMap<String,Object>() ;

			//项目参与人员-邮件列表
			List<ProjectMailListEntity> projectMailList = new ArrayList<ProjectMailListEntity>() ;
			StringBuffer strBuf = new StringBuffer() ; //群发邮件地址列表
			Set<ProjectMailListEntity> projectmails = entity.getProjectmails() ;
			for (ProjectMailListEntity p : projectmails) {
				strBuf.append(p.getEmail()+",") ;
				projectMailList.add(p) ;
			}
			model.put("projectMailList", projectMailList) ;
			
			//开发人员信息
			List<ProjectEmpWorkingEntity> pworks = new ArrayList<ProjectEmpWorkingEntity>() ;
			Set<ProjectEmpWorkingEntity> pews = entity.getPwe() ;
			StringBuffer devMemberBuf = new StringBuffer() ; //群发邮件地址列表
			for (ProjectEmpWorkingEntity pwork : pews) {
				if(pwork.getStatus() == 1) {
					devMemberBuf.append(pwork.getEmp().getEmail()+",") ;
					ProjectEmpWorkingEntity p = new ProjectEmpWorkingEntity() ;
					BeanUtils.copyProperties(pwork, p) ;
				}
			}
			model.put("pworks", pworks) ;
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
			String exportPath = this.realPathResolver.getParentDir()+File.separator+Constants.WWWROOT_RELAESE+"/chat_html/" ;
			FreeMarkerToHtmlUtil.exportHtml(rootPath, "project_notify.ftl", model, exportPath, "aa.html") ;
			
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
