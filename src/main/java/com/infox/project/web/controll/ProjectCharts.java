package com.infox.project.web.controll;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infox.common.util.Constants;
import com.infox.common.web.BaseController;
import com.infox.project.service.ProjectChartsServiceI;
import com.infox.project.web.form.ProjectChartsForm;

@Controller
@RequestMapping("/project/project_charts")
public class ProjectCharts extends BaseController {
	
	@Autowired
	private ProjectChartsServiceI projectChartService ;
	
	@RequestMapping("/doNotNeedSession_chart_projectST_page.do")
	public String doNotNeedSession_chart_projectST_page() throws Exception {
		return Constants.PROJECT + "charts/chart_project" ;
	}
	
	@RequestMapping("/doNotNeedSession_chart_projectST.do")
	@ResponseBody
	public String doNotNeedSession_chart_projectST(ProjectChartsForm form, HttpServletRequest request) throws Exception {
		return this.projectChartService.projectStatusTotal(form) ;
	}
	

}
