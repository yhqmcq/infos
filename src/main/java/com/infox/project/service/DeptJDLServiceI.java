package com.infox.project.service;

import java.util.List;

import com.infox.common.web.page.DataGrid;
import com.infox.project.web.form.ProjectTaskTimeForm;

public interface DeptJDLServiceI {
	
	public DataGrid datagrid(ProjectTaskTimeForm form) throws Exception ;
	
	public List<ProjectTaskTimeForm> jdlGroupReport(ProjectTaskTimeForm form) throws Exception ;
	
}
