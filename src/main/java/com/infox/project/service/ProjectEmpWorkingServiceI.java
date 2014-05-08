package com.infox.project.service;

import java.io.Serializable;

import com.infox.common.web.page.DataGrid;
import com.infox.project.web.form.ProjectEmpWorkingForm;
import com.infox.project.web.form.ProjectMainForm;

public interface ProjectEmpWorkingServiceI {
	
	public void add(ProjectEmpWorkingForm form) throws Exception ;
	
	public Serializable add_import(ProjectEmpWorkingForm form) throws Exception ;
	
	public void delete(String id) throws Exception ;
	
	public void edit(ProjectEmpWorkingForm form) throws Exception ;
	
	public ProjectEmpWorkingForm get(String id) throws Exception ;
	
	public ProjectEmpWorkingForm get(ProjectEmpWorkingForm form) throws Exception ;
	
	public DataGrid datagrid(ProjectEmpWorkingForm form) throws Exception ;
	
	public void set_workdate(ProjectEmpWorkingForm form) throws Exception ;
	
	public void set_projectRole(ProjectEmpWorkingForm form) throws Exception ;

	public void revert(ProjectEmpWorkingForm form) throws Exception ;
	
	public void saveAndSendMail(ProjectEmpWorkingForm form) throws Exception ;
	
	public void cancelOperate(ProjectEmpWorkingForm form) throws Exception ;
	
	public void projectMemberExpireNotify(ProjectMainForm form) throws Exception ;

}
