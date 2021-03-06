package com.infox.project.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.Serializable;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infox.common.dao.BaseDaoI;
import com.infox.common.freemarker.FreeMarkerToHtmlUtil;
import com.infox.common.freemarker.FreeMarkerToMailTemplateUtil;
import com.infox.common.mail.MailVO;
import com.infox.common.util.BeanUtils;
import com.infox.common.util.Constants;
import com.infox.common.util.DateCal;
import com.infox.common.util.DateUtil;
import com.infox.common.util.NumberUtils;
import com.infox.common.util.RandomUtils;
import com.infox.common.web.page.DataGrid;
import com.infox.common.web.page.Json;
import com.infox.common.web.page.LoginInfoSession;
import com.infox.common.web.springmvc.RealPathResolver;
import com.infox.project.asynms.send.MailMessageSenderI;
import com.infox.project.entity.OvertimeEntity;
import com.infox.project.entity.ProjectEmpWorkingEntity;
import com.infox.project.entity.ProjectMailListEntity;
import com.infox.project.entity.ProjectMainEntity;
import com.infox.project.service.ProjectEmpWorkingServiceI;
import com.infox.project.service.ProjectMainServiceI;
import com.infox.project.web.form.ProjectEmpWorkingForm;
import com.infox.project.web.form.ProjectMailListForm;
import com.infox.project.web.form.ProjectMainForm;
import com.infox.project.web.form.ProjectTaskTimeForm;
import com.infox.sysmgr.entity.EmpJobEntity;
import com.infox.sysmgr.entity.EmployeeEntity;
import com.infox.sysmgr.entity.OrgDeptTreeEntity;
import com.infox.sysmgr.entity.TaskEntity;
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
	
	@Autowired
	private BaseDaoI<OvertimeEntity> basedaoOvertime ;
	
	@Autowired
	private ProjectEmpWorkingServiceI pewService ;

	@Override
	public Serializable add(ProjectMainForm form) throws Exception {
		if(form.getProjectNum() == null || form.getProjectNum().equals("")) {
			throw new Exception("项目编号不能为空！ ") ;
		}
		Long count = this.basedaoProject.count("select count(t.projectNum) from ProjectMainEntity t where t.projectNum='"+form.getProjectNum()+"'") ;
		if(count >= 1) {
			throw new Exception("项目编号已存在！ ") ;
		}
		ProjectMainForm project = this.get(form.getProjectNum());
		if (null == project) {
			ProjectMainEntity entity = new ProjectMainEntity();

			BeanUtils.copyProperties(form, entity, new String[]{"id"});
			
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
			
			Serializable ser = this.basedaoProject.save(entity);
			
			//将项目创建人设置为参与人员
			LoginInfoSession sessionInfo = Constants.getSessionInfo() ;
			ProjectMailListForm fm = new ProjectMailListForm() ;
			fm.setIds(sessionInfo.getEmp().getId()) ;
			fm.setProjectid(ser.toString()) ;
			this.addMailList(fm) ;
			
			return ser ;
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
		
		//删除定时器
		try {
			TaskForm task = new TaskForm() ;
			task.setRelationOperates(entity.getId()) ;
			List<TaskEntity> taskForms = this.taskScheduler.find(task) ;
			if(null != taskForms) {
				for (TaskEntity t : taskForms) {
					this.taskScheduler.delete(t.getId()) ;
					System.out.println(t.getId() + "==" +t.getRelationOperate());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//删除员工加班信息
		List<OvertimeEntity> ot = this.basedaoOvertime.find("select t from OvertimeEntity t where t.project.id='"+entity.getId()+"'") ;
		for (OvertimeEntity o : ot) {
			this.basedaoOvertime.delete(o) ;
		}
		
		//删除员工在项目的工作时间
		Set<ProjectEmpWorkingEntity> pwe = entity.getPwe() ;
		if(null != pwe && !pwe.isEmpty()) {
			for (ProjectEmpWorkingEntity p : pwe) {
				EmployeeEntity emp = p.getEmp() ;
				emp.setWorkStatus(0) ;
				this.basedaoEmployee.update(emp) ;
				delPwe(p) ;
			} 
		}
		
		//删除员工邮件列表
		Set<ProjectMailListEntity> mailists = entity.getProjectmails() ;
		if(null != mailists && !mailists.isEmpty()) {
			for (ProjectMailListEntity p : mailists) {
				this.basedaoMailList.delete(p) ;
			}
		}
		
		
		this.basedaoProject.delete(entity);
	}
	
	public void delPwe(ProjectEmpWorkingEntity entity) {
		if (entity.getPews() != null && entity.getPews().size() > 0) {
			for (ProjectEmpWorkingEntity r : entity.getPews()) {
				delPwe(r);
			}
		}
		this.basedaoProjectEW.delete(entity);
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
		
		//项目当前状态为挂起状态，如果日期变更的话则进行项目激活
		if(2==entity.getStatus()) {
			//如果两个结束日期不相等则为条件成立
			if (!DateUtil.formatF(form.getEndDate()).equals(DateUtil.formatF(entity.getEndDate()))) {
				//判断结束日期是否大于或等于当前日期，如果小于则不激活
				int dif = DateUtil.compare_date2(DateUtil.formatF(form.getEndDate()), DateUtil.formatF(new Date())) ;
				if (dif>0 || dif==0) {
					System.out.println("日期大于当前日期，可以激活");
					
					//设置定时任务
					String[] dateCron = DateUtil.getDateCron(DateUtil.formatG(entity.getEndDate()) + " 23:58:30", 3) ;
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
							System.out.println(dateCron[i]);
							this.taskScheduler.add(task) ;
						}
					}
					entity.setStatus(1) ;
				} else {
					System.out.println("日期小于当前日期，不可激活");
				}
				
			}
		}
		
		
		BeanUtils.copyProperties(form, entity, new String[]{ "creater", "status"});
		
		
		if (null != form.getDeptid() && !"".equalsIgnoreCase(form.getDeptid())) {
			OrgDeptTreeEntity dept = new OrgDeptTreeEntity();
			dept.setId(form.getDeptid());
			entity.setDept(dept);
		}

		if (null != form.getLeader_id() && !"".equals(form.getLeader_id())) {
			entity.setEmp(this.basedaoEmployee.get(EmployeeEntity.class, form.getLeader_id()));
		}
		
		this.basedaoProject.update(entity);
		
		//定时任务（重新设定项目的触发时间）
		String[] dateCron = DateUtil.getDateCron(DateUtil.formatG(entity.getEndDate()) + " 23:58:30", 3) ;
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
			
			memberSchedulerReset(entity) ;
		}
		
		if(flag) {
			//延期（发送邮件通知）
			this.delay(entity) ;
		}
		
		
		//项目为开始状态才进行邮件发送
		if(entity.getStatus() == 1) {
			//########发送项目参数变更邮件（功能正常，但是取消该功能）
			//this.contentChange(entity) ;
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
							member.getEndDate()) + " 23:58:30", 3);
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
	
	//延期（发送邮件通知）
	public void delay(ProjectMainEntity entity) {
		
		//项目信息
		ProjectMainForm project = new ProjectMainForm() ;
		BeanUtils.copyProperties(entity, project);
		
		
		OrgDeptTreeEntity orgDeptTreeEntity = this.basedaoOrg.get(OrgDeptTreeEntity.class, entity.getDept().getId()) ;
		
		project.setDeptname(orgDeptTreeEntity.getSname()) ;
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
			/*##########*/
			String htmlId = DateUtil.getCurrentDateTimes() ;
			model.put("project", project) ;//项目信息
			model.put("projectmails", projectMailsForm) ;//项目参与人员
			model.put("currentMembers", currentMembers) ;//目前开发人员
			model.put("reportURL", this.realPathResolver.getServerRoot()+"/"+Constants.WWWROOT_RELAESE+"/report_mail/project_delay_mail_"+htmlId+".html") ;
			model.put("context_path",this.realPathResolver.getServerRoot()+this.realPathResolver.getContextPath()) ;
			model.put("currentdate", new Date()) ;
			
			MailVO mail = new MailVO() ;
			mail.setSubject("项目作业时间变更-["+entity.getName()+"]") ;
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
		
		BeanUtils.copyProperties(entity, project);
		
		
		OrgDeptTreeEntity orgDeptTreeEntity = this.basedaoOrg.get(OrgDeptTreeEntity.class, entity.getDept().getId()) ;
		
		project.setDeptname(orgDeptTreeEntity.getSname()) ;
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
			/*#########*/
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
			
			BeanUtils.copyProperties(entity, form);
			
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
		
		// 获取格式化对象
		NumberFormat nt = NumberFormat.getPercentInstance();
		nt.setMinimumFractionDigits(2);
		
		List<ProjectTaskTimeForm> devList = new ArrayList<ProjectTaskTimeForm>() ;
		List<Map<String, Object>> footer = new ArrayList<Map<String, Object>>() ;
		long allTaskTime = 0 ;
		long allExpendDays = 0 ;
		float allExpendmm = 0f ;
		float allmm = 0f ;
		float allTotalHour = 0f ;
		float totalCurrentHourLV = 0f ;
		float allTotalHourLv = 0f ;
		float allNormalHour = 0f ;
		float allWeekendHour = 0f ;
		float allHolidaysHour = 0f ;
		float allNormalHour1 = 0f ;
		float allWeekendHour1 = 0f ;
		float allHolidaysHour1 = 0f ;
		float sum1 = 0f ;
		float sum2 = 0f ;
		float sum3 = 0f ;
		if (null != entity) {
			Set<ProjectEmpWorkingEntity> pwe = entity.getPwe() ;
			for (ProjectEmpWorkingEntity p : pwe) {
				
				//人月
				Float totalMonth = new Float(0) ;
				//消耗人月
				Float extMonth = new Float(0) ;
				
				//员工总有效工作天数
				long dateDiff = DateCal.getWorkingDays(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(p.getEndDate()));
				
				
				ProjectTaskTimeForm pf = new ProjectTaskTimeForm() ;
				EmployeeEntity e = p.getEmp() ;
				pf.setEmp_id(e.getId()) ;
				pf.setEmp_name(e.getTruename()) ;
				StringBuffer sb1 = new StringBuffer() ;
				StringBuffer sb2 = new StringBuffer() ;
				Set<EmpJobEntity> empjobs = p.getEmp().getEmpjobs() ;
				for (EmpJobEntity eje : empjobs) {
					sb1.append(eje.getJob_name()) ;
					sb2.append(eje.getJob_sname()) ;
				}
				pf.setPosition_name(sb1.toString()) ;
				pf.setPosition_sname(sb2.toString()) ;
				pf.setProject_role(p.getProject_role()) ;
				pf.setDept_name(e.getOrg().getSname()) ;
				pf.setSd(DateUtil.formatG(p.getStartDate())) ;
				pf.setEd(DateUtil.formatG(p.getEndDate())) ;
				
				if(null != e.getPositionDate() && !"".equals(e.getPositionDate())) {
					pf.setPositionDate(e.getPositionDate()) ;
				}
				pf.setLbmType(e.getLbmType()) ;
				pf.setDbmType(e.getDbmType()) ;
				pf.setLbmDate(e.getLbmDate()) ;
				pf.setDbmDate(e.getDbmDate()) ;
				
				//消耗天数
				long lastdateDiff = 0 ;
				
				//如果结束日期大于今天，已消耗天数的则不以当前的日期来计算
				int compare_date2 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(p.getEndDate())) ;
				if(compare_date2 == 1) {
					lastdateDiff = DateCal.getWorkingDays(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(p.getEndDate())) ;
				} else {
					lastdateDiff = DateCal.getWorkingDays(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(new Date())) ;
				}
				
				//加班小时
				Map<String, Object> params = new HashMap<String, Object>() ;
				params.put("empid", e.getId()) ; params.put("project_id", entity.getId()) ;
				OvertimeEntity oe = this.basedaoOvertime.get("select t from OvertimeEntity t where t.emp.id=:empid and t.project.id=:project_id", params) ;
				if(null != oe) {
					pf.setNormalHour(oe.getNormalHour()) ;
					pf.setWeekendHour(oe.getWeekendHour()) ;
					pf.setHolidaysHour(oe.getHolidaysHour()) ;
					
					pf.setNormalHour1(oe.getNormalHour1()) ;
					pf.setWeekendHour1(oe.getWeekendHour1()) ;
					pf.setHolidaysHour1(oe.getHolidaysHour1()) ;
					
					pf.setSum1(oe.getNormalHour()-oe.getNormalHour1()) ;
					pf.setSum2(oe.getWeekendHour()-oe.getWeekendHour1()) ;
					pf.setSum3(oe.getHolidaysHour()-oe.getHolidaysHour1()) ;
					
					allNormalHour += pf.getNormalHour() ;
					allWeekendHour += pf.getWeekendHour() ;
					allHolidaysHour += pf.getHolidaysHour() ;
					
					allNormalHour1 += pf.getNormalHour1() ;
					allWeekendHour1 += pf.getWeekendHour1() ;
					allHolidaysHour1 += pf.getHolidaysHour1() ;
					
					sum1 += pf.getSum1() ;
					sum2 += pf.getSum2() ;
					sum2 += pf.getSum3() ;
					
					//总加班小时
					pf.setTotalHour(oe.getNormalHour()+oe.getWeekendHour()+oe.getHolidaysHour()) ;
					pf.setTotalAllHourLV(nt.format((pf.getTotalHour()/(dateDiff*8)))) ;
					pf.setTotalCurrentHourLV(nt.format((pf.getTotalHour()/(lastdateDiff*8)))) ;
					
					
					////System.out.println(nt.format((pf.getTotalHour()/(dateDiff*8))));
					////System.out.println((pf.getTotalHour()/(dateDiff*8)));
					
					allTotalHour += pf.getTotalHour() ;
					allTotalHourLv += (pf.getTotalHour()/(dateDiff*8)) ;
					totalCurrentHourLV += (pf.getTotalHour()/(lastdateDiff*8)) ;
					
					pf.setTotalHour(NumberUtils.formatNum((oe.getNormalHour()+oe.getWeekendHour()+oe.getHolidaysHour()))) ;
					
				}
				
				//if(p.getEmp().getTruename().equals("陈嘉雯")) {
				
				
				String sd = DateUtil.formatG(p.getStartDate()) ;
				String ed = DateUtil.formatG(p.getEndDate()) ;
				Date startDate = DateUtil.formatGG(sd) ;
				Date endDate = DateUtil.formatGG(ed) ;
				
				//开始日期和结束日期相差的月数
				int monthSpace = DateUtil.getDiffer(sd, ed) ;
				
				Calendar c1 = Calendar.getInstance() ;
				c1.setTime(startDate) ;
				int currentMonth1 = c1.get(Calendar.MONTH)+1 ;
				int currentYear1 = c1.get(Calendar.YEAR) ;
				
				Calendar c2 = Calendar.getInstance() ;
				c2.setTime(endDate) ;
				int currentMonth2 = c2.get(Calendar.MONTH)+1 ;
				int currentYear2 = c2.get(Calendar.YEAR) ;
				
				for(int i=0;i<monthSpace;i++) {
					Calendar fristDay = Calendar.getInstance();
					fristDay.setTime(DateUtil.formatGG(sd)) ;
					fristDay.add(Calendar.MONTH, i);
					fristDay.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
					//////System.out.print("当前月第一天:"+DateUtil.formatG(fristDay.getTime()));
					
					Calendar lastDay = Calendar.getInstance();  
					lastDay.setTime(DateUtil.formatGG(sd)) ;
					lastDay.add(Calendar.MONTH,(i));
					lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));  
					//////System.out.println("\t当前月最后一天:"+DateUtil.formatG(lastDay.getTime()));
					
					//每个月的有效天数
					long diffDay = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
					
					String ym1 = currentYear1+""+currentMonth1 ;
					String ym2 = currentYear2+""+currentMonth2 ;
					String frist = fristDay.get(Calendar.YEAR)+""+(fristDay.get(Calendar.MONTH)+1) ;
					
					//时间有效工作天数
					Integer day = new Integer(0) ;
					
					//第一个月
					if(ym1.equals(frist) && !ym1.equals(ym2)) {
						long diff = DateCal.getWorkingDays(sd, DateUtil.formatG(lastDay.getTime()));
						day+=((Long)diff).intValue() ;
						totalMonth+=((Long)diff).floatValue()/((Long)diffDay).floatValue();
						////System.err.println("第一个月有效工作天数===="+sd+"=="+DateUtil.formatG(lastDay.getTime())+"==["+diff+"]"+"==【"+diffDay+"】"+((Long)diff).floatValue()/((Long)diffDay).floatValue());
						
						
						
						
						////System.out.println("*********************begin*************************");
						Calendar ho1 = Calendar.getInstance();
						ho1.setTime(DateUtil.formatGG(DateUtil.formatG(c1.getTime()))) ;
						Calendar ho2 = Calendar.getInstance();
						
						int cdd1 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(lastDay.getTime())) ;
						//////System.out.println(cdd1);
						if(cdd1 == 1) {
							ho2.setTime(DateUtil.formatGG(DateUtil.formatG(lastDay.getTime()))) ;
						} else {
							ho2.setTime(DateUtil.formatGG(DateUtil.formatG(new Date()))) ;
						}
						
						int hocount = DateCal.getHolidays(ho1, ho2) ;
						//////System.out.println("休息:" + hocount);
						
						Calendar cc1 = Calendar.getInstance() ;
						if(cdd1 == 1) {
							cc1.setTime(DateUtil.formatGG(DateUtil.formatG(lastDay.getTime()))) ;
						} else {
							//消耗的天数
							int xhd = DateCal.getWorkingDays(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(new Date())) ;
							
							cc1.setTime(DateUtil.formatGG(DateUtil.formatG(c1.getTime()))) ;
							cc1.add(Calendar.DAY_OF_WEEK, xhd+hocount);
						}
						
						int workingDays = DateCal.getWorkingDays(DateUtil.formatG(c1.getTime()), DateUtil.formatG(cc1.getTime())) ;
						extMonth += NumberUtils.formatNum(((Integer)workingDays).floatValue() / ((Long)diffDay).floatValue()) ;
						
						////System.out.println("开始："+DateUtil.formatG(c1.getTime())+"===结束："+DateUtil.formatG(cc1.getTime())+"===消耗人月："+extMonth+"-=="+((Integer)workingDays).floatValue() / ((Long)diffDay).floatValue());
						
						////System.out.println("***********************begin***********************\r\n");
						
					}
					
					//中间月
					if(!ym1.equals(frist) && !ym2.equals(frist) && !ym1.equals(ym2)) {
						long diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
						day+=((Long)diff).intValue() ;
						totalMonth+=((Long)diff).floatValue()/((Long)diffDay).floatValue();
						////System.err.println("中间月有效工作天数===="+DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+"==["+diff+"]"+"==【"+diffDay+"】"+((Long)diff).floatValue()/((Long)diffDay).floatValue());
						
						
						int t1 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(fristDay.getTime())) ;
						if(t1==0 || t1>0) {
							////System.out.println("*********************center*************************");
							Calendar ho1 = Calendar.getInstance();
							ho1.setTime(DateUtil.formatGG(DateUtil.formatG(fristDay.getTime()))) ;
							
							Calendar ho2 = Calendar.getInstance();
							int cdd1 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(lastDay.getTime())) ;
							if(cdd1 == 1) {
								ho2.setTime(DateUtil.formatGG(DateUtil.formatG(lastDay.getTime()))) ;
							} else {
								ho2.setTime(DateUtil.formatGG(DateUtil.formatG(new Date()))) ;
							}
							
							int hocount = DateCal.getHolidays(ho1, ho2) ;
							//////System.out.println("休息:" + hocount);
							
							Calendar cc1 = Calendar.getInstance() ;
							if(cdd1 == 1) {
								cc1.setTime(DateUtil.formatGG(DateUtil.formatG(lastDay.getTime()))) ;
							} else {
								//消耗的天数
								int xhd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(new Date())) ;
								//////System.out.println(xhd+"消耗");
								cc1.setTime(DateUtil.formatGG(DateUtil.formatG(fristDay.getTime()))) ;
								cc1.add(Calendar.DAY_OF_WEEK, xhd+hocount);
							}
							
							int workingDays = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(cc1.getTime())) ;
							extMonth += NumberUtils.formatNum(((Integer)workingDays).floatValue() / ((Long)diffDay).floatValue()) ;
							
							////System.out.println("开始："+DateUtil.formatG(fristDay.getTime())+"===结束："+DateUtil.formatG(cc1.getTime())+"===消耗人月："+extMonth+"-=="+((Integer)workingDays).floatValue() / ((Long)diffDay).floatValue());
							
							////System.out.println("********************center**************************\r\n");
							
						}
					}
					
					//最后一个月
					if(ym2.equals(frist) && !ym1.equals(ym2)) {
						long diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), ed);
						day+=((Long)diff).intValue() ;
						totalMonth+=((Long)diff).floatValue()/((Long)diffDay).floatValue();
						////System.err.println("最后一个月有效工作天数===="+DateUtil.formatG(fristDay.getTime())+"=="+ed+"==["+diff+"]"+"==【"+diffDay+"】"+((Long)diff).floatValue()/((Long)diffDay).floatValue());
						
						
						int t1 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(fristDay.getTime())) ;
						if(t1==0 || t1>0) {
							////System.out.println("*******************end***************************");
							Calendar ho1 = Calendar.getInstance();
							ho1.setTime(DateUtil.formatGG(DateUtil.formatG(fristDay.getTime()))) ;
							
							Calendar ho2 = Calendar.getInstance();
							int cdd1 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(lastDay.getTime())) ;
							if(cdd1 == 1) {
								ho2.setTime(DateUtil.formatGG(DateUtil.formatG(p.getEndDate()))) ;
							} else {
								ho2.setTime(DateUtil.formatGG(DateUtil.formatG(new Date()))) ;
							}
							
							int hocount = DateCal.getHolidays(ho1, ho2) ;
							//////System.out.println("休息:" + hocount);
							
							Calendar cc1 = Calendar.getInstance() ;
							if(cdd1 == 1) {
								cc1.setTime(DateUtil.formatGG(DateUtil.formatG(p.getEndDate()))) ;
							} else {
								//消耗的天数
								int xhd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(new Date())) ;
								//////System.out.println(xhd+"消耗");
								cc1.setTime(DateUtil.formatGG(DateUtil.formatG(fristDay.getTime()))) ;
								cc1.add(Calendar.DAY_OF_WEEK, xhd+hocount);
							}
							
							int workingDays = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(cc1.getTime())) ;
							extMonth += NumberUtils.formatNum(((Integer)workingDays).floatValue() / ((Long)diffDay).floatValue()) ;
							
							////System.out.println("开始："+DateUtil.formatG(fristDay.getTime())+"===结束："+DateUtil.formatG(cc1.getTime())+"===消耗人月："+extMonth+"-=="+((Integer)workingDays).floatValue() / ((Long)diffDay).floatValue());
							
							////System.out.println("**********************end************************\r\n");
							
						}
					}
					
					//单月（开始日期和结束日期都在单月）
					if(ym1.equals(ym2)) {
						long diff = DateCal.getWorkingDays(sd, ed);
						day+=((Long)diff).intValue() ;
						totalMonth+=((Long)diff).floatValue()/((Long)diffDay).floatValue();
						////System.err.println("开始日期和结束日期都在单月有效工作天数===="+sd+"=="+DateUtil.formatG(lastDay.getTime())+"==["+diff+"]"+"==【"+diffDay+"】"+((Long)diff).floatValue()/((Long)diffDay).floatValue());
						
						////System.out.println("*********************equals*************************");
						Calendar ho1 = Calendar.getInstance();
						ho1.setTime(DateUtil.formatGG(DateUtil.formatG(c1.getTime()))) ;
						Calendar ho2 = Calendar.getInstance();
						
						int cdd1 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(lastDay.getTime())) ;
						if(cdd1 == 1) {
							ho2.setTime(DateUtil.formatGG(DateUtil.formatG(p.getEndDate()))) ;
						} else {
							ho2.setTime(DateUtil.formatGG(DateUtil.formatG(new Date()))) ;
						}
						
						int hocount = DateCal.getHolidays(ho1, ho2) ;
						//////System.out.println("休息:" + hocount);
						
						Calendar cc1 = Calendar.getInstance() ;
						if(cdd1 == 1) {
							cc1.setTime(DateUtil.formatGG(DateUtil.formatG(p.getEndDate()))) ;
						} else {
							//消耗的天数
							int xhd = DateCal.getWorkingDays(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(new Date())) ;
							
							cc1.setTime(DateUtil.formatGG(DateUtil.formatG(c1.getTime()))) ;
							cc1.add(Calendar.DAY_OF_WEEK, xhd+hocount);
						}
						
						int workingDays = DateCal.getWorkingDays(DateUtil.formatG(c1.getTime()), DateUtil.formatG(cc1.getTime())) ;
						extMonth += NumberUtils.formatNum(((Integer)workingDays).floatValue() / ((Long)diffDay).floatValue()) ;
						
						////System.out.println("开始："+DateUtil.formatG(c1.getTime())+"===结束："+DateUtil.formatG(cc1.getTime())+"===消耗人月："+extMonth+"-=="+((Integer)workingDays).floatValue() / ((Long)diffDay).floatValue());
						
						////System.out.println("***********************equals***********************\r\n");
					}
					
					day = 0 ;
					////System.out.println("");
					//}
					
					pf.setTotalTaskTime(dateDiff) ;
					pf.setExpendDays(lastdateDiff) ;
					pf.setMm(totalMonth) ;
					pf.setExpendMM(extMonth) ;
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
			map.put("normalHour", NumberUtils.formatNum(allNormalHour)) ;
			map.put("weekendHour", NumberUtils.formatNum(allWeekendHour)) ;
			map.put("holidaysHour", NumberUtils.formatNum(allHolidaysHour)) ;
			map.put("normalHour1", NumberUtils.formatNum(allNormalHour1)) ;
			map.put("weekendHour1", NumberUtils.formatNum(allWeekendHour1)) ;
			map.put("holidaysHour1", NumberUtils.formatNum(allHolidaysHour1)) ;
			map.put("sum1", NumberUtils.formatNum(sum1)) ;
			map.put("sum2", NumberUtils.formatNum(sum2)) ;
			map.put("sum3", NumberUtils.formatNum(sum3)) ;
			map.put("totalHour", NumberUtils.formatNum(allTotalHour)) ;
			map.put("totalAllHourLV", nt.format(((NumberUtils.formatNum(allNormalHour)+NumberUtils.formatNum(allWeekendHour)+NumberUtils.formatNum(allHolidaysHour))/(allTaskTime*8)))) ;
			map.put("totalCurrentHourLV", nt.format((NumberUtils.formatNum(allTotalHour)/(allExpendDays*8)))) ;
			
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
	public DataGrid get_ProjectAllDevMember(String id) throws Exception {
		DataGrid datagrid = new DataGrid();
		
		ProjectMainEntity entity = this.basedaoProject.get(ProjectMainEntity.class, id);
		
		List<ProjectTaskTimeForm> devList = new ArrayList<ProjectTaskTimeForm>() ;
		if (null != entity) {
			Set<ProjectEmpWorkingEntity> pwe = entity.getPwe() ;
			for (ProjectEmpWorkingEntity p : pwe) {
				ProjectTaskTimeForm pf = new ProjectTaskTimeForm() ;
				EmployeeEntity e = p.getEmp() ;
				pf.setEmp_id(e.getId()) ;
				pf.setEmp_name(e.getTruename()) ;
				StringBuffer sb1 = new StringBuffer() ;
				StringBuffer sb2 = new StringBuffer() ;
				Set<EmpJobEntity> empjobs = p.getEmp().getEmpjobs() ;
				for (EmpJobEntity eje : empjobs) {
					sb1.append(eje.getJob_name()) ;
					sb2.append(eje.getJob_sname()) ;
				}
				pf.setPosition_name(sb1.toString()) ;
				pf.setPosition_sname(sb2.toString()) ;
				pf.setProject_role(p.getProject_role()) ;
				pf.setDept_name(e.getOrg().getSname()) ;
				pf.setSd(DateUtil.formatG(p.getStartDate())) ;
				pf.setEd(DateUtil.formatG(p.getEndDate())) ;
				
				//加班小时
				Map<String, Object> params = new HashMap<String, Object>() ;
				params.put("empid", e.getId()) ; params.put("project_id", entity.getId()) ;
				OvertimeEntity oe = this.basedaoOvertime.get("select t from OvertimeEntity t where t.emp.id=:empid and t.project.id=:project_id", params) ;
				if(null != oe) {
					pf.setNormalHour(oe.getNormalHour()) ;
					pf.setWeekendHour(oe.getWeekendHour()) ;
					pf.setHolidaysHour(oe.getHolidaysHour()) ;
					pf.setNormalHour1(oe.getNormalHour1()) ;
					pf.setWeekendHour1(oe.getWeekendHour1()) ;
					pf.setHolidaysHour1(oe.getHolidaysHour1()) ;
					pf.setSum1(oe.getNormalHour()-oe.getNormalHour1()) ;
					pf.setSum2(oe.getWeekendHour()-oe.getWeekendHour1()) ;
					pf.setSum3(oe.getHolidaysHour()-oe.getHolidaysHour1()) ;
					
					
					pf.setTotalHour(oe.getHour()) ;
					pf.setOtStartDate(oe.getStartDate()) ;
					pf.setOtEndDate(oe.getEndDate()) ;
				}
				
				pf.setStatus(p.getStatus()) ;
				
				devList.add(pf) ;
			}
			
			datagrid.setTotal((long) pwe.size());
			datagrid.setRows(devList);
			
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
			
			BeanUtils.copyProperties(entity, form);
			
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
				pf.setDept_name(e.getOrg().getSname()) ;
				pf.setStartDate(p.getStartDate()) ;
				pf.setEndDate(p.getEndDate()) ;
				
				long dateDiff = DateCal.getWorkingDays(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(p.getEndDate()));
				long lastdateDiff = DateCal.getWorkingDays(DateUtil.formatG(new Date()), DateUtil.formatG(p.getEndDate()));
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
			
			
			BeanUtils.copyProperties(entity, form);
			
			return pform;
		} else {
			return null;
		}
	}

	@Override
	public DataGrid datagrid(ProjectMainForm form) throws Exception {
		form.setSort("startDate") ;
		form.setOrder("desc") ;
		form.setRows(1000) ;
		
		DataGrid datagrid = new DataGrid();
		
		Set<ProjectMainEntity> set = new HashSet<ProjectMainEntity>() ;
		List<ProjectMainEntity> singleList = new ArrayList<ProjectMainEntity>() ;
		
		
		List<ProjectMainEntity> find = this.find(form) ;
		LoginInfoSession sessionInfo = Constants.getSessionInfo() ;
		
		if("Y".equals(form.getViewType())) {
			datagrid.setTotal(this.total(form));
			datagrid.setRows(this.changeModel(this.find(form)));
		} else {
			//是否部长
			if(null != sessionInfo.getEmp().getIsLeader() && "Y".equals(sessionInfo.getEmp().getIsLeader())) {
				
				form.setDeptid(sessionInfo.getEmp().getOrgid()) ;
				datagrid.setTotal(this.total(form));
				datagrid.setRows(this.changeModel(this.find(form)));
				
				System.out.println(datagrid.getRows());
				
				//是部长，但该项目部属于该部门，所以无法查询到项目， 则查询该员工参与的项目
				if(datagrid.getRows() != null || datagrid.getRows().isEmpty()) {
					for (ProjectMainEntity project : find) {
						Set<ProjectMailListEntity> projectmails = project.getProjectmails() ;
						for (ProjectMailListEntity projectMailListEntity : projectmails) {
							if(sessionInfo.getEmp().getId().equals(projectMailListEntity.getEmployee().getId())) {
								set.add(project) ;
			 				}
						}
						Set<ProjectEmpWorkingEntity> pwe2 = project.getPwe() ;
						for (ProjectEmpWorkingEntity projectEmpWorkingEntity : pwe2) {
							if(sessionInfo.getEmp().getId().equals(projectEmpWorkingEntity.getEmp().getId())) {
								set.add(project) ;
			 				}
						}
						if(sessionInfo.getEmp().getId().equals(project.getEmp().getId())) {
							set.add(project) ;
						}
					}
					
					// 倒序  
			        Collections.sort(singleList, new Comparator<ProjectMainEntity>() {  
			            public int compare(ProjectMainEntity arg0, ProjectMainEntity arg1) {  
			                Date created = arg0.getStartDate();  
			                Date created2 = arg1.getStartDate();  
			                
			                if (DateUtil.compare_datetime2(created, created2) > 0) {  
			                    return 1;  
			                } else if (DateUtil.compare_datetime2(created, created2) == 0) {  
			                    return 0;  
			                } else {  
			                    return -1;  
			                }  
			            }  
			        });  
			        
					for (ProjectMainEntity projectMainEntity : set) {
						singleList.add(projectMainEntity) ;
					}
					
					datagrid.setTotal(((Integer)singleList.size()).longValue());
					datagrid.setRows(this.changeModel(singleList));
				}
				
			} else if(null != sessionInfo.getEmp().getIsLeader() && "YY".equals(sessionInfo.getEmp().getIsLeader())) {
				//本部长
				String deptid = sessionInfo.getEmp().getOrgid() ;
				OrgDeptTreeEntity orgDeptTreeEntity = this.basedaoOrg.get(OrgDeptTreeEntity.class, deptid) ;
				Set<OrgDeptTreeEntity> orgs = orgDeptTreeEntity.getOrgs() ;
				StringBuffer sb = new StringBuffer() ;
				if(null != orgs && orgs.size() > 0) {
					for (OrgDeptTreeEntity ds : orgs) {
						sb.append(ds.getId()+",") ;
					}
					if(sb.length() > 0) {
						sb.deleteCharAt(sb.length() -1) ;
					}
					form.setNotInStatus(null) ;
					form.setDeptsView(sb.toString()) ;
					datagrid.setTotal(this.total(form));
					datagrid.setRows(this.changeModel(this.find(form)));
				}
			} else {
				for (ProjectMainEntity project : find) {
					Set<ProjectMailListEntity> projectmails = project.getProjectmails() ;
					for (ProjectMailListEntity projectMailListEntity : projectmails) {
						if(sessionInfo.getEmp().getId().equals(projectMailListEntity.getEmployee().getId())) {
							set.add(project) ;
		 				}
					}
					Set<ProjectEmpWorkingEntity> pwe2 = project.getPwe() ;
					for (ProjectEmpWorkingEntity projectEmpWorkingEntity : pwe2) {
						if(null != projectEmpWorkingEntity.getEmp()) {
							if(sessionInfo.getEmp().getId().equals(projectEmpWorkingEntity.getEmp().getId())) {
								set.add(project) ;
							}
						}
					}
					if(sessionInfo.getEmp().getId().equals(project.getEmp().getId())) {
						set.add(project) ;
					}
				}
				
				// 倒序  
		        Collections.sort(singleList, new Comparator<ProjectMainEntity>() {  
		            public int compare(ProjectMainEntity arg0, ProjectMainEntity arg1) {  
		                Date created = arg0.getStartDate();  
		                Date created2 = arg1.getStartDate();  
		                
		                if (DateUtil.compare_datetime2(created, created2) > 0) {  
		                    return 1;  
		                } else if (DateUtil.compare_datetime2(created, created2) == 0) {  
		                    return 0;  
		                } else {  
		                    return -1;  
		                }  
		            }  
		        });  
		        
				for (ProjectMainEntity projectMainEntity : set) {
					singleList.add(projectMainEntity) ;
				}
				
				datagrid.setTotal(((Integer)singleList.size()).longValue());
				datagrid.setRows(this.changeModel(singleList));
			}
		}
		
		return datagrid;
	}

	private List<ProjectMainForm> changeModel(List<ProjectMainEntity> ProjectMainEntity) throws ParseException {
		List<ProjectMainForm> forms = new ArrayList<ProjectMainForm>();

		if (null != ProjectMainEntity && ProjectMainEntity.size() > 0) {
			for (ProjectMainEntity project : ProjectMainEntity) {
				float totalAllMonth = 0f ;
				ProjectMainForm uf = new ProjectMainForm();
				BeanUtils.copyProperties(project, uf);
				
				uf.setLeader_name(project.getEmp().getTruename()) ;
				
				//部门
				if (null != project.getDept()) {
					uf.setDeptname(project.getDept().getSname());
				}
				
				//获取部长
				StringBuffer sb = new StringBuffer() ;
				Map<String, Object> params = new HashMap<String, Object>() ;
				params.put("isLeader", "Y") ; params.put("deptid", project.getDept().getId()) ;				
				List<EmployeeEntity> leaders = this.basedaoEmployee.find("select t from EmployeeEntity t where t.isLeader=:isLeader and t.org.id=:deptid", params) ;
				for (EmployeeEntity e : leaders) {
					sb.append(e.getTruename()+",") ;
				}
				if(sb.length() > 1) {
					uf.setDeptLeader(sb.deleteCharAt(sb.length()-1).toString()) ;
				}
				

				//计算项目的天数(不包括周六日)
				long dateDiff = DateCal.getWorkingDays(DateUtil.formatG(project.getStartDate()), DateUtil.formatG(project.getEndDate()));
				uf.setDateDiff(dateDiff);
				
				//项目为结束状态，无需计算剩余天数
				if(project.getStatus() != 3) {	
					//结束日期小于当前日期才计算
					if(DateUtil.compare_date2(DateUtil.formatG(project.getEndDate()), DateUtil.formatG(new Date()))==1) {
						long lastdateDiff = DateCal.getWorkingDays(DateUtil.formatG(new Date()), DateUtil.formatG(project.getEndDate()));
						uf.setLastdateDiff(lastdateDiff);
						
					}
				}
				
				Set<ProjectEmpWorkingEntity> pwe = project.getPwe() ;
				for (ProjectEmpWorkingEntity pw : pwe) {
					//判断该项目中是否有人员的开始日期是否未设置,如果为设置,则直接删除,并设置为空闲人员(因为设置开发人员时有遗漏的)
					if(null == pw.getStartDate()) {
						pw.getEmp().setWorkStatus(0) ;
						this.basedaoProjectEW.delete(pw) ;
					}
				}
				
				String sd = DateUtil.formatG(project.getStartDate()) ;
				String ed = DateUtil.formatG(project.getEndDate()) ;
				Date startDate = DateUtil.formatGG(sd) ;
				Date endDate = DateUtil.formatGG(ed) ;
				
				//开始日期和结束日期相差的月数
				int monthSpace = DateUtil.getDiffer(sd, ed) ;
				
				Calendar c1 = Calendar.getInstance() ;
				c1.setTime(startDate) ;
				int currentMonth1 = c1.get(Calendar.MONTH)+1 ;
				int currentYear1 = c1.get(Calendar.YEAR) ;
				
				Calendar c2 = Calendar.getInstance() ;
				c2.setTime(endDate) ;
				int currentMonth2 = c2.get(Calendar.MONTH)+1 ;
				int currentYear2 = c2.get(Calendar.YEAR) ;
				
				for(int i=0;i<monthSpace;i++) {
					Calendar fristDay = Calendar.getInstance();
					fristDay.setTime(DateUtil.formatGG(sd)) ;
					fristDay.add(Calendar.MONTH, i);
					fristDay.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
					////System.out.print("当前月第一天:"+DateUtil.formatG(fristDay.getTime()));
					
					Calendar lastDay = Calendar.getInstance();  
					lastDay.setTime(DateUtil.formatGG(sd)) ;
					lastDay.add(Calendar.MONTH,(i));
					lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));  
					////System.out.println("\t当前月最后一天:"+DateUtil.formatG(lastDay.getTime()));
					
					//每个月的有效天数
					long diffDay = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
					
					String ym1 = currentYear1+""+currentMonth1 ;
					String ym2 = currentYear2+""+currentMonth2 ;
					String frist = fristDay.get(Calendar.YEAR)+""+(fristDay.get(Calendar.MONTH)+1) ;
					
					//时间有效工作天数
					Integer day = new Integer(0) ;
					
					//第一个月
					if(ym1.equals(frist) && !ym1.equals(ym2)) {
						long diff = DateCal.getWorkingDays(sd, DateUtil.formatG(lastDay.getTime()));
						day+=((Long)diff).intValue() ;
						totalAllMonth+=((Long)diff).floatValue()/((Long)diffDay).floatValue();
						////System.err.println("第一个月有效工作天数===="+sd+"=="+DateUtil.formatG(lastDay.getTime())+"==["+diff+"]"+"==【"+diffDay+"】"+((Long)diff).floatValue()/((Long)diffDay).floatValue());
					}
					
					//中间月
					if(!ym1.equals(frist) && !ym2.equals(frist) && !ym1.equals(ym2)) {
						long diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
						day+=((Long)diff).intValue() ;
						totalAllMonth+=((Long)diff).floatValue()/((Long)diffDay).floatValue();
						////System.err.println("中间月有效工作天数===="+DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+"==["+diff+"]"+"==【"+diffDay+"】"+((Long)diff).floatValue()/((Long)diffDay).floatValue());
					}
					
					//最后一个月
					if(ym2.equals(frist) && !ym1.equals(ym2)) {
						long diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), ed);
						day+=((Long)diff).intValue() ;
						totalAllMonth+=((Long)diff).floatValue()/((Long)diffDay).floatValue();
						////System.err.println("最后一个月有效工作天数===="+DateUtil.formatG(fristDay.getTime())+"=="+ed+"==["+diff+"]"+"==【"+diffDay+"】"+((Long)diff).floatValue()/((Long)diffDay).floatValue());
					}
					
					//单月（开始日期和结束日期都在单月）
					if(ym1.equals(ym2)) {
						long diff = DateCal.getWorkingDays(sd, ed);
						day+=((Long)diff).intValue() ;
						totalAllMonth+=((Long)diff).floatValue()/((Long)diffDay).floatValue();
						////System.err.println("开始日期和结束日期都在单月有效工作天数===="+sd+"=="+DateUtil.formatG(lastDay.getTime())+"==["+diff+"]"+"==【"+diffDay+"】"+((Long)diff).floatValue()/((Long)diffDay).floatValue());
					}
					
					day = 0 ;
				}
				uf.setTotalMonth(NumberUtils.formatNum(totalAllMonth)) ;
				
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
			if (form.getId() != null && !"".equals(form.getId())) {
				hql += " and t.id=:id";
				params.put("id", form.getId());
			}
			if (form.getDeptid() != null && !"".equals(form.getDeptid())) {
				hql += " and t.dept.id=:dept_id";
				params.put("dept_id", form.getDeptid());
			}
			if (form.getPid() != null && !"".equals(form.getPid())) {
				hql += " and t.project.id=:pid";
				params.put("pid", form.getPid());
			}
			if (form.getName() != null && !"".equals(form.getName())) {
				hql += " and t.name=:name";
				params.put("name", form.getName());
			}
			if (form.getProjectNum() != null && !"".equals(form.getProjectNum())) {
				hql += " and t.projectNum=:projectNum";
				params.put("projectNum", form.getProjectNum());
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
			if (null != form.getDeptsView() && !"".equals(form.getDeptsView())) {
				hql += " and t.dept.id in (:depts)";
				String[] split = form.getDeptsView().split(",");
				
				params.put("depts", split);
				System.out.println(hql);
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
			
			f.setId(p.getId()) ;
			
			StringBuffer sb = new StringBuffer() ;
			Set<EmpJobEntity> empjobs = p.getEmployee().getEmpjobs() ;
			if(empjobs != null && !empjobs.isEmpty()) {
				for (EmpJobEntity eje : empjobs) {
					sb.append(eje.getJob_name()) ;
				}
			}
			f.setEmpid(p.getEmployee().getId()) ;
			f.setEmpjobname(sb.toString()) ;
			f.setEmpname(p.getEmployee().getTruename()) ;
			f.setEmail(p.getEmployee().getEmail()) ;
			OrgDeptTreeEntity org = p.getEmployee().getOrg() ;
			if(null!= org) {
				f.setDeptname(org.getSname()) ;
			}
			
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
		System.out.println("==状态: "+ entity.getStatus());
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
					/*########*/
					//项目的结束日期大于当前日期,才设置定时器
					int compare_date2 = DateUtil.compare_date2(DateUtil.formatG(entity.getEndDate()), DateUtil.formatG(new Date())) ;
					if(compare_date2 == 1) {
						//项目开发人员起止日期提醒（定时器）
						Set<String> dateGroup = new HashSet<String>() ;
						Set<ProjectEmpWorkingEntity> pwes = entity.getPwe() ;
						for (ProjectEmpWorkingEntity member : pwes) {
							String[] dateCron = DateUtil.getDateCron(DateUtil.formatG(member.getEndDate()) + " 23:58:30", 3) ;
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
						String[] dateCron = DateUtil.getDateCron(DateUtil.formatG(entity.getEndDate()) + " 23:58:30", 3) ;
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
								System.out.println(dateCron[i]);
								this.taskScheduler.add(task) ;
							}
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
				
				//状态为挂起，讲之前已经设定好的定时器进行删除，激活后再重新设定定时器
				TaskForm task = new TaskForm() ;
				task.setRelationOperates(entity.getId()) ;
				List<TaskEntity> taskForms = this.taskScheduler.find(task) ;
				if(null != taskForms) {
					for (TaskEntity t : taskForms) {
						this.taskScheduler.delete(t.getId()) ;
						System.out.println(t.getId() + "==" +t.getRelationOperate());
					}
				}
				
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
				//判断结束日期是否大于或等于当前日期则激活，如果小于则不激活
				int dif = DateUtil.compare_date2(DateUtil.formatF(entity.getEndDate()), DateUtil.formatF(new Date())) ;
				if (dif>0 || dif==0) {
					System.out.println("日期大于当前日期，可以激活");
					
					//设置定时任务
					String[] dateCron = DateUtil.getDateCron(DateUtil.formatG(entity.getEndDate()) + " 23:58:30", 3) ;
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
							System.out.println(dateCron[i]);
							this.taskScheduler.add(task) ;
						}
					}
					
					entity.setStatus(1); 				// 激活项目，将状态改为进行中（1）
					json.setMsg("项目激活成功！");
					json.setStatus(true) ;
				} else {
					System.out.println("无法激活项目，项目结束日期小于当前日期，更改结束日期后自动激活！");
					json.setMsg("无法激活项目，项目结束日期小于当前日期，更改结束日期后自动激活！");
					json.setStatus(true) ;
				}
				
				
				
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
				
				Set<ProjectEmpWorkingEntity> projectEmpWorkingEntity = entity.getPwe() ;
				for (ProjectEmpWorkingEntity pwe : projectEmpWorkingEntity) {
					
					//将员工设为空闲人员
					EmployeeEntity emp = pwe.getEmp() ;
					emp.setWorkStatus(0) ;
					this.basedaoEmployee.update(emp);
					
					pwe.setStatus(4) ;//修改状态为退出
					pwe.setCreated(new Date()) ;//修改退出的时间	
					
					//如果员工的结束日期大于项目结束日期，则按当天日期来结束人员的结束时间
					int compare_date22 = DateUtil.compare_date2(DateUtil.formatG(pwe.getEndDate()), DateUtil.formatG(entity.getEndDate())) ;
					if(compare_date22 == 1 || compare_date22 == 0)  {
						pwe.setEndDate(new Date()) ;
					}
					
					
					this.basedaoProjectEW.update(pwe) ;
				}
			
				//项目结束时间
				entity.setEndDate(new Date()) ; 
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
			//########
			this.status(entity) ;
		}

		return json;
	}
	
	//状态发送改变（发送邮件通知）
	public void status(ProjectMainEntity entity) {
		//项目信息
		ProjectMainForm project = new ProjectMainForm() ;
		
		BeanUtils.copyProperties(entity, project);
		
		project.setDeptname(entity.getDept().getSname()) ;
		project.setLeader_name(entity.getEmp().getTruename()) ;
		
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
			/*###########*/
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
		//判断当前日期是否和结束日期相等,相等的话,则是项目结束，否则未结束，将提前3天发送邮件通知该项目还剩余的时间
		if(currentDate.equals(endDate)) {
			flag = true ;
		} else {
			flag = false ;
		}
		
		//项目信息
		ProjectMainForm project = new ProjectMainForm() ;
		
		BeanUtils.copyProperties(entity, project);
		
		
		project.setDeptname(entity.getDept().getSname()) ;
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
			//##########
			this.mailMessageSend.sendMail(mail) ;
			

			//生成HTML
			String exportPath = this.realPathResolver.getParentDir()+File.separator+Constants.WWWROOT_RELAESE+"/report_mail/" ;
			FreeMarkerToHtmlUtil.exportHtml(rootPath, "project_notify.ftl", model, 
					exportPath, "project_notify_"+htmlId+".html") ;
			
			if(flag) {
				//项目结束
				entity.setStatus(3) ;
				this.basedaoProject.update(entity) ;
				
				Set<ProjectEmpWorkingEntity> projectEmpWorkingEntity = entity.getPwe() ;
				for (ProjectEmpWorkingEntity pwe : projectEmpWorkingEntity) {
					//将员工设为空闲人员
					EmployeeEntity emp = pwe.getEmp() ;
					emp.setWorkStatus(0) ;
					this.basedaoEmployee.update(emp);
					
					pwe.setStatus(4) ;//修改状态为退出
					pwe.setCreated(new Date()) ;//修改退出的时间	
					
					//如果员工的结束日期大于项目结束日期，则按当天日期来结束人员的结束时间
					int compare_date22 = DateUtil.compare_date2(DateUtil.formatG(pwe.getEndDate()), DateUtil.formatG(entity.getEndDate())) ;
					if(compare_date22 == 1 || compare_date22 == 0)  {
						pwe.setEndDate(new Date()) ;
					}
					
					this.basedaoProjectEW.update(pwe) ;
				}
				
				
				
			}
		} catch (Exception e) {
			e.printStackTrace() ;
		}
	}

	@Override
	public Json import_project_info(ProjectMainForm form) throws Exception {
		Json j = new Json() ;
		
		File file = new File(form.getFilepath()) ;
		Workbook book = null;
        try {
            book = new XSSFWorkbook(new FileInputStream(file));
        } catch (Exception ex) {
            book = new HSSFWorkbook(new FileInputStream(file));
        }
        
        if(null != book) {
    		Sheet sheet = book.getSheet("数据导入模板") ;
        	int lastRowNum = sheet.getLastRowNum() ;
        	if(lastRowNum > 0) {
        		Map<String, Object> map = new HashMap<String, Object>() ;
        		
        		
        		String p_id = getCellValue(sheet.getRow(1).getCell(2)) ;
        		String p_sd = getCellValue(sheet.getRow(2).getCell(2)) ;
        		String p_ed = getCellValue(sheet.getRow(2).getCell(4)) ;
        		String p_num = getCellValue(sheet.getRow(3).getCell(2)) ;
        		String p_name = getCellValue(sheet.getRow(4).getCell(2)) ;
        		String p_dept = getCellValue(sheet.getRow(5).getCell(2)) ;
        		String p_pm = getCellValue(sheet.getRow(6).getCell(2)) ;
        		String p_xs = getCellValue(sheet.getRow(7).getCell(2)) ;
        		
        		ProjectMainEntity project_id = this.basedaoProject.get("select t from ProjectMainEntity t where t.projectNum='"+p_id+"'") ;
        		if(project_id != null) {
        			j.setMsg("该项目已存在【"+p_id+"】！") ;
    				return j;
        		}
        		List<EmployeeEntity> pm = this.basedaoEmployee.find("select t from EmployeeEntity t where t.truename='"+p_pm+"'") ;
        		if(pm == null || pm.isEmpty()) {
        			j.setMsg("该PM不存在【"+p_pm+"】，请检查！") ;
    				return j;
        		}
        		OrgDeptTreeEntity dept = this.basedaoOrg.get("select t from OrgDeptTreeEntity t where t.sname='"+p_dept+"'") ;
        		if(dept == null) {
        			j.setMsg("该部门不存在【"+p_dept+"】，请检查！") ;
    				return j;
        		}
        		
        		/*int wdcc = DateUtil.compare_date2(p_sd, DateUtil.formatG(new Date())) ;
        		if(wdcc == -1) {
        			j.setMsg("项目的开始日期不能小于当前日期！") ;
    				return j;
        		}*/
        		
        		ProjectMainForm p = new ProjectMainForm() ;
        		p.setProjectNum(p_id) ;
        		p.setName(p_name) ;
        		p.setStartDate(DateUtil.formatGG(p_sd)) ;
        		p.setEndDate(DateUtil.formatGG(p_ed)) ;
        		p.setQuot(Float.parseFloat(p_xs)) ;
        		p.setDeptid(dept.getId()) ;
        		p.setLeader_id(pm.iterator().next().getId()) ;
        		p.setContractNum(p_num) ;
        		
        		Serializable projectid = this.add(p) ;
        		
        		p.setDeptname(p_dept) ;
        		p.setDeptLeader(p_pm) ;
        		map.put("project", p) ;
        		
        		
        		
        		//项目开发人员
        		List<Object> list = new ArrayList<Object>() ;
        		int count = 0 ;
        		for(int i=10;i<lastRowNum;i++) {
        			
        			Map<String, Object> m = new HashMap<String, Object>() ;
        			
        			count=i ;
        			if(null == sheet.getRow(i) || "".equals(sheet.getRow(i).getCell(0).toString().trim())) {
        				break ;
        			}
        			
        			String e_id = getCellValue(sheet.getRow(i).getCell(0)) ;
        			String e_name = getCellValue(sheet.getRow(i).getCell(1)) ;
        			String pj_role = getCellValue(sheet.getRow(i).getCell(2)) ;
        			String e_sd = getCellValue(sheet.getRow(i).getCell(3)) ;
        			String e_ed = getCellValue(sheet.getRow(i).getCell(4)) ;
        			
        			EmployeeEntity e = this.basedaoEmployee.get(EmployeeEntity.class, e_id) ;
        			
        			if(null != e) {
        				//员工的入职时间不能大于员工在项目作业的开始时间
        				if(1==DateUtil.compare_date2(DateUtil.formatG(e.getRzsj()),e_sd)) {
        					m.put("id", e_id) ;
        					m.put("name", e_name) ;
        					m.put("e_sd", e_sd) ;
        					m.put("e_ed", e_ed) ;
        					m.put("pj_role", pj_role) ;
        					m.put("msg", false) ;
        					m.put("info", "员工的入职时间不能大于员工在项目作业的开始时间") ;
        					
        					list.add(m) ;
        					continue ;
        				}
        				
        				//员工的入职时间不能大于员工在项目作业的开始时间
            			if(-1==DateUtil.compare_date2(e_sd,DateUtil.formatG(p.getStartDate()))) {
            				m.put("id", e_id) ;
            				m.put("name", e_name) ;
            				m.put("e_sd", e_sd) ;
            				m.put("e_ed", e_ed) ;
            				m.put("pj_role", pj_role) ;
            				m.put("msg", false) ;
            				m.put("info", "开始作业时间不能小于项目开始时间") ;
            				
            				list.add(m) ;
            				continue ;
            			}
            			
        				m.put("id", e.getId()) ;
        				m.put("name", e.getTruename()) ;
        				m.put("e_sd", e_sd) ;
        				m.put("e_ed", e_ed) ;
        				m.put("pj_role", pj_role) ;
        				m.put("msg", true) ;
        				
        				ProjectEmpWorkingForm pwf = new ProjectEmpWorkingForm() ;
        				pwf.setEmpId(e.getId()) ;
        				pwf.setProject_id(projectid.toString()) ;
        				Serializable serid = this.pewService.add_import(pwf) ;
        				
        				if(null != serid) {
        					ProjectEmpWorkingForm pwf1 = new ProjectEmpWorkingForm() ;
        					pwf1.setIds(serid.toString()) ;
        					pwf1.setStartDate(DateUtil.formatGG(e_sd)) ;
        					pwf1.setEndDate(DateUtil.formatGG(e_ed)) ;
        					this.pewService.set_workdate(pwf1) ;
        					
        					ProjectEmpWorkingForm pwf2 = new ProjectEmpWorkingForm() ;
        					pwf2.setIds(serid.toString()) ;
        					pwf2.setProject_role(pj_role) ;
        					this.pewService.set_projectRole(pwf2) ;
        				}
        			} else {
        				m.put("id", e_id) ;
        				m.put("name", e_name) ;
        				m.put("e_sd", e_sd) ;
        				m.put("e_ed", e_ed) ;
        				m.put("pj_role", pj_role) ;
        				m.put("msg", false) ;
        			}
        			list.add(m) ;
        		} 
        		map.put("dev", list) ;
        		
        		//项目参与人员
        		List<Object> list1 = new ArrayList<Object>() ;
        		ProjectMailListForm mf = new ProjectMailListForm() ;
        		StringBuffer s = new StringBuffer() ;
        		for(int i=count+2;i<=lastRowNum;i++) {
        			Map<String, Object> m = new HashMap<String, Object>() ;
        			
        			if(null == sheet.getRow(i)) {
        				break ;
        			}
        			String e_id = getCellValue(sheet.getRow(i).getCell(0)) ;
        			String e_name = getCellValue(sheet.getRow(i).getCell(1)) ;
    				EmployeeEntity e = this.basedaoEmployee.get(EmployeeEntity.class, e_id) ;
        			if(null != e) {
        				m.put("id", e_id) ;
        				m.put("name", e.getTruename()) ;
        				m.put("msg", true) ;
        				
        				s.append(e.getId()+",") ;
        			} else {
        				m.put("id", e_id) ;
        				m.put("name", e_name) ;
        				m.put("msg", false) ;
        			}
        			list1.add(m) ;
        		}
        		map.put("cy", list1) ;
        		if(null != s && s.length() > 0) {
        			mf.setIds(s.deleteCharAt(s.length()-1).toString()) ;
        			mf.setProjectid(projectid.toString()) ;
        			this.addMailList(mf) ;
        		}
        		
        		j.setObj(map) ;
        	}
        }
        
        j.setMsg("导入数据完成！") ;
		j.setStatus(true) ;
		return j;
	}
	
	public static String getCellValue(Cell cell) {
		String str = null;
		switch (cell.getCellType()) {
		case Cell.CELL_TYPE_BLANK:
			str = "";
			break;
		case Cell.CELL_TYPE_BOOLEAN:
			str = String.valueOf(cell.getBooleanCellValue());
			break;
		case Cell.CELL_TYPE_FORMULA:
			str = String.valueOf(cell.getCellFormula());
			break;
		case Cell.CELL_TYPE_NUMERIC:
			str = String.valueOf((long) cell.getNumericCellValue());
			break;
		case Cell.CELL_TYPE_STRING:
			str = String.valueOf(cell.getStringCellValue());
			break;
		default:
			str = null;
			break;
		}
		return str;
	}
}
