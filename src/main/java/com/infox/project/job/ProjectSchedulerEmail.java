package com.infox.project.job;

import java.util.Date;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.JobKey;
import org.quartz.SchedulerContext;
import org.quartz.SchedulerException;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;

import com.infox.common.util.DateUtil;
import com.infox.project.service.ProjectMainServiceI;
import com.infox.project.web.form.ProjectMainForm;
import com.infox.sysmgr.service.TaskSchedulerServiceI;
import com.infox.sysmgr.web.form.TaskForm;

public class ProjectSchedulerEmail implements Job {
	
	private static Logger logger = Logger.getLogger(ProjectSchedulerEmail.class);
	
	private TaskSchedulerServiceI taskService ;
	
	private ProjectMainServiceI projectService ;
	
	private JobKey jobKey ;

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		try {
			jobKey = context.getJobDetail().getKey();
			SchedulerContext schCtx = context.getScheduler().getContext();  
			ApplicationContext appCtx = (ApplicationContext)schCtx.get("applicationContext");
			taskService = (TaskSchedulerServiceI) appCtx.getBean("taskSchedulerServiceImpl") ;
			projectService = (ProjectMainServiceI) appCtx.getBean("projectMainServiceImpl") ;
			
			sendProjectDateMail() ;
			
			logger.info("执行任务"+"[项目结束提前邮件提醒]: " + jobKey + " 运行时间：" + DateUtil.formatF(new Date()));
		} catch (BeansException e) {
			e.printStackTrace();
		} catch (SchedulerException e) {
			e.printStackTrace();
		}		
	}
	
	public void sendProjectDateMail() {
		try {
			TaskForm taskForm = this.taskService.get(jobKey.getName()) ;
			ProjectMainForm form = new ProjectMainForm() ;
			form.setId(taskForm.getRelationOperate()) ;
			this.projectService.projectNotify(form) ;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
