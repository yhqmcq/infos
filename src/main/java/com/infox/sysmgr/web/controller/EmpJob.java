package com.infox.sysmgr.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infox.common.util.Constants;
import com.infox.common.web.BaseController;
import com.infox.common.web.page.Json;
import com.infox.sysmgr.service.EmpJobServiceI;
import com.infox.sysmgr.web.form.EmpJobForm;

@Controller
@RequestMapping("/sysmgr/empjob")
public class EmpJob extends BaseController {
	
	@Autowired
	private EmpJobServiceI empjobservice ;
	
	@RequestMapping("/empjob_main.do")
	public String empjob_main() throws Exception {
		return Constants.SYSTEM + "empjob_main" ;
	}
	
	@RequestMapping("/empjob_form.do")
	public String empjob_form(EmpJobForm form, HttpServletRequest request) throws Exception {
		if(null != form.getId() && !"".equals(form.getId())) {
			request.setAttribute("id", form.getId()) ;
		}
		return Constants.SYSTEM + "empjob_form" ;
	}
	
	@RequestMapping("/get.do")
	@ResponseBody
	public EmpJobForm get(EmpJobForm form, HttpServletRequest request) throws Exception {
		return this.empjobservice.get(form.getId()) ;
	}
	
	@RequestMapping("/add.do")
	@ResponseBody
	public Json add(EmpJobForm form) throws Exception {
		Json json = new Json() ;
		try {
			this.empjobservice.add(form) ;
			json.setStatus(true) ;
		} catch (Exception e) {
			throw e;
		}
		return json ;
	}
	
	@RequestMapping("/edit.do")
	@ResponseBody
	public Json edit(EmpJobForm form) throws Exception {
		Json json = new Json() ;
		try {
			this.empjobservice.edit(form) ;
			json.setStatus(true) ;
		} catch (Exception e) {
			throw e;
		}
		return json ;
	}
	
	@RequestMapping("/delete.do")
	@ResponseBody
	public Json delete(String id) throws Exception {
		Json j = new Json();
		try {
			this.empjobservice.delete(id) ;
			j.setStatus(true);
		} catch (Exception e) {
			throw e;
		}
		return j ;
	}
	
	@RequestMapping("/treegrid.do")
	@ResponseBody
	public List<EmpJobForm> treegrid(EmpJobForm form ,String mode) throws Exception {
		return this.empjobservice.treegrid(form ,mode) ;
	}

}
