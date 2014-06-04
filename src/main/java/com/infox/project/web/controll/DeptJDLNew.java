package com.infox.project.web.controll;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infox.common.util.Constants;
import com.infox.common.web.BaseController;
import com.infox.common.web.page.DataGrid;
import com.infox.project.service.DeptJDLServiceNewI;
import com.infox.project.web.form.DeptJDLForm;

@Controller
@RequestMapping("/project/dept_jdl")
public class DeptJDLNew extends BaseController {

	@Autowired
	private DeptJDLServiceNewI jdlService ;
	
	@RequestMapping("/dept_jdl_main.do")
	public String dept_jdl_main() {
		return  Constants.PROJECT + "dept_jdl_main" ;
	}
	
	
	@RequestMapping("/datagrid.do")
	@ResponseBody
	public DataGrid datagrid(DeptJDLForm form) throws Exception {
		return this.jdlService.datagrid(form) ;
	}
	
}
