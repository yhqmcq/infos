package com.infox.project.web.controll;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infox.common.web.BaseController;
import com.infox.common.web.page.DataGrid;
import com.infox.project.service.OvertimeServiceI;
import com.infox.project.web.form.OvertimeForm;

@Controller
@RequestMapping("/project/overtime")
public class Overtime extends BaseController {
	
	@Autowired
	private OvertimeServiceI overtimeService ;
	
	@RequestMapping("/datagrid.do")
	@ResponseBody
	public DataGrid datagrid(OvertimeForm form) throws Exception {
		return this.overtimeService.datagrid(form) ;
	}	

}
