package com.infox.project.service;

import com.infox.common.web.page.DataGrid;
import com.infox.project.web.form.OvertimeForm;

public interface OvertimeServiceI {
	
	public void add(OvertimeForm form) throws Exception ;
	
	public void delete(String id) throws Exception ;
	
	public void edit(OvertimeForm form) throws Exception ;
	
	public OvertimeForm get(String id) throws Exception ;
	
	public OvertimeForm get(OvertimeForm form) throws Exception ;
	
	public DataGrid datagrid(OvertimeForm form) throws Exception ;

	
}
