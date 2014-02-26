package com.infox.project.web.controll;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.infox.common.util.Constants;
import com.infox.common.web.BaseController;
import com.infox.common.web.page.DataGrid;
import com.infox.common.web.page.Json;
import com.infox.project.service.ProjectEmpWorkingServiceI;
import com.infox.project.web.form.ProjectEmpWorkingForm;

@Controller
@RequestMapping("/project/pwe_emp_working")
public class ProjectEmpWorking extends BaseController {
	
	@Autowired
	private ProjectEmpWorkingServiceI projectEWService ;
	
	@RequestMapping("/pwe_main.do")
	public String pwe_main() throws Exception {
		return  Constants.PROJECT + "pwe_main" ;
	}
	
	@RequestMapping("/pwe_form.do")
	public String pwe_form(ProjectEmpWorkingForm form, HttpServletRequest request) throws Exception {
		if(null != form.getId() && !"".equals(form.getId())) {
			request.setAttribute("id", form.getId()) ;
		}
		return Constants.PROJECT + "pwe_form" ;
	}
	
	@RequestMapping("/get.do")
	@ResponseBody
	public ProjectEmpWorkingForm get(ProjectEmpWorkingForm form, HttpServletRequest request) throws Exception {
		return this.projectEWService.get(form.getId()) ;
	}
	
	@RequestMapping("/add.do")
	@ResponseBody
	synchronized public Json add(ProjectEmpWorkingForm form) throws Exception {
		Json j = new Json() ;
		try {
			this.projectEWService.add(form) ;
			j.setStatus(true) ;
		} catch (Exception e) {
			e.printStackTrace() ;
			j.setMsg(e.getMessage()) ;
		}
		return j ;
	}
	
	@RequestMapping("/edit.do")
	@ResponseBody
	public Json edit(ProjectEmpWorkingForm form) throws Exception {
		Json j = new Json() ;
		try {
			this.projectEWService.edit(form) ;
			j.setStatus(true) ;
		} catch (Exception e) {
			throw e;
		}
		return j ;
	}
	
	@RequestMapping("/delete.do")
	@ResponseBody
	public Json delete(String ids) throws Exception {
		Json j = new Json();
		try {
			if(null != ids && !ids.equalsIgnoreCase("")) {
				String[] id = ids.split(",") ;
				for(int i=0;i<id.length;i++) {
					this.projectEWService.delete(id[i]) ;
				}
				j.setStatus(true);
			}
		} catch (Exception e) {
			throw e;
		}
		return j ;
	}
	
	@RequestMapping("/revert.do")
	@ResponseBody
	public Json revert(String ids) throws Exception {
		Json j = new Json();
		try {
			if(null != ids && !ids.equalsIgnoreCase("")) {
				String[] id = ids.split(",") ;
				for(int i=0;i<id.length;i++) {
					this.projectEWService.revert(id[i]) ;
				}
				j.setStatus(true);
			}
		} catch (Exception e) {
			throw e;
		}
		return j ;
	}
	
	@RequestMapping("/datagrid.do")
	@ResponseBody
	public DataGrid datagrid(ProjectEmpWorkingForm form) throws Exception {
		return this.projectEWService.datagrid(form) ;
	}
	
	@RequestMapping("/set_workdate.do")
	@ResponseBody
	public Json set_workdate(ProjectEmpWorkingForm form) throws Exception {
		Json j = new Json();
		try {
			this.projectEWService.set_workdate(form) ;
			j.setStatus(true);
		} catch (Exception e) {
			throw e;
		}
		return j ;
	}
	
}
