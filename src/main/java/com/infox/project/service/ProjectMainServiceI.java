package com.infox.project.service;

import java.io.Serializable;

import com.infox.common.web.page.DataGrid;
import com.infox.common.web.page.Json;
import com.infox.project.web.form.ProjectMailListForm;
import com.infox.project.web.form.ProjectMainForm;

public interface ProjectMainServiceI {
	
	public Serializable add(ProjectMainForm form) throws Exception ;
	
	public void delete(String id) throws Exception ;
	
	public void edit(ProjectMainForm form) throws Exception ;
	
	public ProjectMainForm get(String id) throws Exception ;
	
	public ProjectMainForm get(ProjectMainForm form) throws Exception ;
	
	public ProjectMainForm get_ProjectDetail(String id) throws Exception ;
	
	public DataGrid get_ProjectDevList(String id) throws Exception ;
	
	public DataGrid get_ProjectAllDevMember(String id) throws Exception ;
	
	public DataGrid datagrid(ProjectMainForm form) throws Exception ;

	public void addMailList(ProjectMailListForm form) throws Exception ;
	
	public void deleteMailList(String id) throws Exception ;
	
	public DataGrid maillist_datagrid(ProjectMailListForm form) throws Exception ;
	
	public Json statusChange(ProjectMainForm form) throws Exception ;
	
	public void projectNotify(ProjectMainForm form) throws Exception ;
	
	public Json import_project_info(ProjectMainForm form) throws Exception ;
	
}
