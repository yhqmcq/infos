package com.infox.project.service;

import com.infox.common.web.page.DataGrid;
import com.infox.project.web.form.ProjectMainForm;

public interface ProjectMainServiceI {
	
	public void add(ProjectMainForm form) throws Exception ;
	
	public void delete(String id) throws Exception ;
	
	public void edit(ProjectMainForm form) throws Exception ;
	
	public ProjectMainForm get(String id) throws Exception ;
	
	public ProjectMainForm get(ProjectMainForm form) throws Exception ;
	
	public DataGrid datagrid(ProjectMainForm form) throws Exception ;

}
