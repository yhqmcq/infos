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
import com.infox.project.service.ProjectEmpWorkingServiceI;
import com.infox.project.web.form.ProjectMainForm;
import com.infox.sysmgr.service.TaskSchedulerServiceI;
import com.infox.sysmgr.web.form.TaskForm;

public class ProjectMemberWorkSchedulerEmail implements Job {
	
	private static Logger logger = Logger.getLogger(ProjectMemberWorkSchedulerEmail.class);

	private TaskSchedulerServiceI taskService ;
	
	private ProjectEmpWorkingServiceI projectMemberWork ;
	
	private JobKey jobKey ;

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		try {
			jobKey = context.getJobDetail().getKey();
			SchedulerContext schCtx = context.getScheduler().getContext();  
			ApplicationContext appCtx = (ApplicationContext)schCtx.get("applicationContext");
			taskService = (TaskSchedulerServiceI) appCtx.getBean("taskSchedulerServiceImpl") ;
			projectMemberWork = (ProjectEmpWorkingServiceI) appCtx.getBean("projectEmpWorkingServiceImpl") ;
			
			sendProjectMemberExpireNotify() ;
			
			logger.info("执行任务"+"[项目人员期满提醒]: " + jobKey + " 运行时间：" + DateUtil.formatF(new Date()));
		} catch (BeansException e) {
			e.printStackTrace();
		} catch (SchedulerException e) {
			e.printStackTrace();
		}		
	}
	
	public void sendProjectMemberExpireNotify() {
		try {
			TaskForm taskForm = this.taskService.get(jobKey.getName()) ;
			ProjectMainForm form = new ProjectMainForm() ;
			form.setId(taskForm.getRelationOperate().split(":M")[0]) ;
			
			this.projectMemberWork.projectMemberExpireNotify(form) ;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
