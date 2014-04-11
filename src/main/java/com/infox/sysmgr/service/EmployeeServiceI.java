package com.infox.sysmgr.service;

import java.util.List;

import com.infox.common.web.page.DataGrid;
import com.infox.common.web.page.Json;
import com.infox.common.web.page.LoginInfoSession;
import com.infox.sysmgr.web.form.EmployeeForm;

public interface EmployeeServiceI {

	public Json add(EmployeeForm form) throws Exception ;
	
	public Json delete(String ids) throws Exception ;
	
	public Json edit(EmployeeForm form) throws Exception ;
	
	public EmployeeForm get(String id) throws Exception ;
	
	public DataGrid datagrid(EmployeeForm form) throws Exception ;
	
	public Json set_grant(EmployeeForm form) throws Exception ;
	
	public Json import_emp_data(EmployeeForm form) throws Exception ;
	
	public EmployeeForm getPermission(EmployeeForm form) throws Exception ;
	
	public EmployeeForm login(EmployeeForm user) throws Exception  ;
	
	public List<String> MyPermission(String id, String username) throws Exception ;
	
	public boolean editCurrentUserPwd(LoginInfoSession sessionInfo, String oldPwd, String pwd) throws Exception ;
	
	public void set_empjobs(EmployeeForm form) throws Exception ;
	
}
