package com.infox.project.web.controll;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infox.common.util.Constants;
import com.infox.common.web.BaseController;
import com.infox.common.web.page.DataGrid;
import com.infox.project.service.ProjectEmpWorkingServiceI;
import com.infox.project.service.ProjectMainServiceI;
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
	
	@RequestMapping("/project_tasktime_main.do")
	public String project_tasktime_main() {
		return  Constants.PROJECT + "project_tasktime_main" ;
	}
	
	@RequestMapping("/employeeTaskTimeReport.do")
	@ResponseBody
	public DataGrid employeeTaskTimeReport() {
		
		return null ;
	}
	
}
