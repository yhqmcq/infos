package com.infox.project.web.controll;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infox.common.util.Constants;
import com.infox.common.web.BaseController;
import com.infox.common.web.page.DataGrid;
import com.infox.project.service.ProjectEmpWorkingServiceI;
import com.infox.project.service.ProjectMainServiceI;
import com.infox.project.service.ProjectTaskTimeServiceI;
import com.infox.project.web.form.ProjectTaskTimeForm;
import com.infox.sysmgr.service.EmployeeServiceI;

@Controller
@RequestMapping("/project/project_report")
public class ProjectTaskTime extends BaseController {

	@Autowired
	private EmployeeServiceI empService ;
	
	@Autowired
	private ProjectMainServiceI projectService ;
	
	@Autowired
	private ProjectEmpWorkingServiceI projectWorkService ;
	
	@Autowired
	private ProjectTaskTimeServiceI projectTaskTimeService ;
	
	@RequestMapping("/project_tasktime_main.do")
	public String project_tasktime_main() {
		return  Constants.PROJECT + "project_tasktime_main" ;
	}
	
	@RequestMapping("/getMemberInfoListDialog.do")
	public String getMemberInfoListDialog(ProjectTaskTimeForm form, HttpServletRequest request) throws Exception {
		request.setAttribute("id", form.getId()) ;
		return  Constants.PROJECT + "project_tasktime_infoDialog" ;
	}
	
	@RequestMapping("/employeeTaskTimeReport.do")
	@ResponseBody
	public DataGrid employeeTaskTimeReport(ProjectTaskTimeForm form) throws Exception {
		return this.projectTaskTimeService.datagrid(form) ;
	}
	
	@RequestMapping("/employeeTaskTimeReport_leader.do")
	@ResponseBody
	public DataGrid employeeTaskTimeReport_leader(ProjectTaskTimeForm form, HttpServletRequest request) throws Exception {
		form.setViewType("Y") ;
		request.getSession().setAttribute("ViewType", "Y") ;
		return this.projectTaskTimeService.datagrid(form) ;
	}
	
	@RequestMapping("/getMemberInfoList.do")
	@ResponseBody
	public DataGrid getMemberInfoList(ProjectTaskTimeForm form) throws Exception {
		return this.projectTaskTimeService.getMemberInfoList(form) ;
	}
	
}
