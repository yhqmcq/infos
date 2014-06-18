package com.infox.project.web.controll;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infox.common.util.Constants;
import com.infox.common.web.BaseController;
import com.infox.common.web.page.DataGrid;
import com.infox.project.service.DeptJDLServiceI;
import com.infox.project.web.form.ProjectTaskTimeForm;

@Controller
@RequestMapping("/project/jdl")
public class DeptJDL extends BaseController {

	@Autowired
	private DeptJDLServiceI jdlService ;
	
	@RequestMapping("/jdl_main.do")
	public String project_tasktime_main() {
		return  Constants.PROJECT + "jdl_main" ;
	}
	
	@RequestMapping("/jdl_group_page.do")
	public String jdl_group_page() {
		return  Constants.PROJECT + "jdl_group_page" ;
	}
	
	
	@RequestMapping("/getMemberInfoListDialog.do")
	public String getMemberInfoListDialog(ProjectTaskTimeForm form, HttpServletRequest request) throws Exception {
		request.setAttribute("id", form.getId()) ;
		return  Constants.PROJECT + "project_tasktime_infoDialog" ;
	}
	
	@RequestMapping("/employeeTaskTimeReport.do")
	@ResponseBody
	public DataGrid employeeTaskTimeReport(ProjectTaskTimeForm form) throws Exception {
		return this.jdlService.datagrid(form) ;
	}
	
	@RequestMapping("/employeeTaskTimeReport_leader.do")
	@ResponseBody
	public DataGrid employeeTaskTimeReport_leader(ProjectTaskTimeForm form, HttpServletRequest request) throws Exception {
		form.setViewType("Y") ;
		request.getSession().setAttribute("ViewType", "Y") ;
		return this.jdlService.datagrid(form) ;
	}
	
	@RequestMapping("/doNotNeedAuth_jdl_group.do")
	@ResponseBody
	public List<ProjectTaskTimeForm> doNotNeedAuth_jdl_group(ProjectTaskTimeForm form, HttpServletRequest request) throws Exception {
		return this.jdlService.jdlGroupReport(form) ;
	}
	
}
