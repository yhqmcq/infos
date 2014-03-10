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
import com.infox.project.service.ProjectMainServiceI;
import com.infox.project.web.form.ProjectMailListForm;
import com.infox.project.web.form.ProjectMainForm;

@Controller
@RequestMapping("/project/project_main")
public class ProjectMain extends BaseController {
	
	@Autowired
	private ProjectMainServiceI projectService ;
	
	@RequestMapping("/project_main.do")
	public String project_main() throws Exception {
		return  Constants.PROJECT + "project_main" ;
	}
	
	@RequestMapping("/project_form.do")
	public String project_form(ProjectMainForm form, HttpServletRequest request) throws Exception {
		if(null != form.getId() && !"".equals(form.getId())) {
			request.setAttribute("id", form.getId()) ;
		}
		return Constants.PROJECT + "project_form" ;
	}
	
	@RequestMapping("/project_member.do")
	public String project_member(ProjectMainForm form, HttpServletRequest request) throws Exception {
		if(null != form.getId() && !"".equals(form.getId())) {
			request.setAttribute("project", this.projectService.get(form.getId())) ;
		}
		return Constants.PROJECT + "project_member" ;
	}
	
	@RequestMapping("/project_maillist.do")
	public String project_maillist(ProjectMainForm form, HttpServletRequest request) throws Exception {
		if(null != form.getId() && !"".equals(form.getId())) {
			request.setAttribute("project", this.projectService.get(form.getId())) ;
		}
		return Constants.PROJECT + "project_maillist" ;
	}
	
	@RequestMapping("/project_detail.do")
	public String project_detail(ProjectMainForm form, HttpServletRequest request) throws Exception {
		if(null != form.getId() && !"".equals(form.getId())) {
			request.setAttribute("id", form.getId()) ;
		}
		return Constants.PROJECT + "project_detail" ;
	}
	
	@RequestMapping("/project_Devdetail.do")
	public String project_Devdetail(ProjectMainForm form, HttpServletRequest request) throws Exception {
		if(null != form.getId() && !"".equals(form.getId())) {
			request.setAttribute("id", form.getId()) ;
		}
		return Constants.PROJECT + "project_dev_list" ;
	}
	
	@RequestMapping("/get_ProjectDevList.do")
	@ResponseBody
	public DataGrid get_ProjectDevList(ProjectMainForm form, HttpServletRequest request) throws Exception {
		return this.projectService.get_ProjectDevList(form.getId()) ;
	}
	
	@RequestMapping("/get_ProjectDetail.do")
	@ResponseBody
	public ProjectMainForm get_ProjectDetail(ProjectMainForm form, HttpServletRequest request) throws Exception {
		return this.projectService.get_ProjectDetail(form.getId()) ;
	}
	
	@RequestMapping("/get.do")
	@ResponseBody
	public ProjectMainForm get(ProjectMainForm form, HttpServletRequest request) throws Exception {
		return this.projectService.get(form.getId()) ;
	}
	
	@RequestMapping("/add.do")
	@ResponseBody
	synchronized public Json add(ProjectMainForm form) throws Exception {
		Json j = new Json() ;
		try {
			this.projectService.add(form) ;
			j.setStatus(true) ;
		} catch (Exception e) {
			e.printStackTrace() ;
			j.setMsg(e.getMessage()) ;
		}
		return j ;
	}
	
	@RequestMapping("/edit.do")
	@ResponseBody
	public Json edit(ProjectMainForm form) throws Exception {
		Json j = new Json() ;
		try {
			this.projectService.edit(form) ;
			j.setStatus(true) ;
		} catch (Exception e) {
			throw e;
		}
		return j ;
	}
	
	@RequestMapping("/statusChange.do")
	@ResponseBody
	public Json statusChange(ProjectMainForm form) throws Exception {
		return this.projectService.statusChange(form) ;
	}
	
	@RequestMapping("/delete.do")
	@ResponseBody
	public Json delete(String ids) throws Exception {
		Json j = new Json();
		try {
			if(null != ids && !ids.equalsIgnoreCase("")) {
				String[] id = ids.split(",") ;
				for(int i=0;i<id.length;i++) {
					this.projectService.delete(id[i]) ;
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
	public DataGrid datagrid(ProjectMainForm form) throws Exception {
		return this.projectService.datagrid(form) ;
	}
	
	@RequestMapping("/addMailList.do")
	@ResponseBody
	synchronized public Json addMailList(ProjectMailListForm form) throws Exception {
		Json j = new Json() ;
		try {
			this.projectService.addMailList(form) ;
			j.setStatus(true) ;
		} catch (Exception e) {
			e.printStackTrace() ;
			j.setMsg(e.getMessage()) ;
		}
		return j ;
	}
	
	@RequestMapping("/deleteMailList.do")
	@ResponseBody
	public Json deleteMailList(String ids) throws Exception {
		Json j = new Json();
		try {
			if(null != ids && !ids.equalsIgnoreCase("")) {
				String[] id = ids.split(",") ;
				for(int i=0;i<id.length;i++) {
					this.projectService.deleteMailList(id[i]) ;
				}
				j.setStatus(true);
			}
		} catch (Exception e) {
			throw e;
		}
		return j ;
	}
	
	@RequestMapping("/datagrid_MailList.do")
	@ResponseBody
	public DataGrid datagrid_MailList(ProjectMailListForm form) throws Exception {
		return this.projectService.maillist_datagrid(form) ;
	}
	
	

}
