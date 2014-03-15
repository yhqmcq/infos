package com.infox.project.web.controll;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infox.common.web.BaseController;
import com.infox.common.web.page.DataGrid;
import com.infox.common.web.page.Json;
import com.infox.project.service.OvertimeServiceI;
import com.infox.project.web.form.OvertimeForm;

@Controller
@RequestMapping("/project/overtime")
public class Overtime extends BaseController {
	
	@Autowired
	private OvertimeServiceI overtimeService ;
	
	@RequestMapping("/add.do")
	@ResponseBody
	public Json add(OvertimeForm form) throws Exception {
		try {
			return this.overtimeService.add(form) ;
		} catch (Exception e) { 
			e.printStackTrace() ;
		}
		return null;
	}
	
	@RequestMapping("/edit.do")
	@ResponseBody
	public Json edit(OvertimeForm form) throws Exception {
		try {
			return this.overtimeService.edit(form) ;
		} catch (Exception e) {
			e.printStackTrace() ;
		}
		return null;
	}
	
	@RequestMapping("/delete.do")
	@ResponseBody
	public Json delete(OvertimeForm form) throws Exception {
		try {
			return this.overtimeService.delete(form);
		} catch (Exception e) {
			e.printStackTrace() ;
		}
		return null;
	}
	
	@RequestMapping("/datagrid.do")
	@ResponseBody
	public DataGrid datagrid(OvertimeForm form) throws Exception {
		return this.overtimeService.datagrid(form) ;
	}	

}
