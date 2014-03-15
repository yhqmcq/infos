package com.infox.project.service;

import com.infox.common.web.page.DataGrid;
import com.infox.common.web.page.Json;
import com.infox.project.web.form.OvertimeForm;

public interface OvertimeServiceI {
	
	public Json add(OvertimeForm form) throws Exception ;
	
	public Json delete(String id) throws Exception ;
	
	public Json delete(OvertimeForm id) throws Exception ;
	
	public Json edit(OvertimeForm form) throws Exception ;
	
	public OvertimeForm get(String id) throws Exception ;
	
	public OvertimeForm get(OvertimeForm form) throws Exception ;
	
	public DataGrid datagrid(OvertimeForm form) throws Exception ;

	
}
