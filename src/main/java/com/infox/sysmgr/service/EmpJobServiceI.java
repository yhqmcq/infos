package com.infox.sysmgr.service;

import java.util.List;

import com.infox.sysmgr.web.form.EmpJobForm;

public interface EmpJobServiceI {
	
	public void add(EmpJobForm form) throws Exception ;
	
	public void delete(String id) throws Exception ;
	
	public void edit(EmpJobForm form) throws Exception ;
	
	public EmpJobForm get(String id) throws Exception ;
	
	public List<EmpJobForm> treegrid(EmpJobForm form ,String mode) throws Exception ;

}
