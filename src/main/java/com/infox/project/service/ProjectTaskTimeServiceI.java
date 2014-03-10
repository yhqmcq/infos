package com.infox.project.service;

import com.infox.common.web.page.DataGrid;
import com.infox.project.web.form.ProjectTaskTimeForm;

public interface ProjectTaskTimeServiceI {
	
	
	public ProjectTaskTimeForm get(String id) throws Exception ;
	
	public ProjectTaskTimeForm get(ProjectTaskTimeForm form) throws Exception ;
	
	public DataGrid datagrid(ProjectTaskTimeForm form) throws Exception ;
	
	public DataGrid getMemberInfoList(ProjectTaskTimeForm form) throws Exception ;
	
}
