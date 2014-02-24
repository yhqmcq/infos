package com.infox.sysmgr.service;

import java.util.List;

import com.infox.sysmgr.web.form.OrgDeptTreeForm;

public interface OrgDeptTreeServiceI {
	
	public void add(OrgDeptTreeForm form) throws Exception ;
	
	public void delete(String id) throws Exception ;
	
	public void edit(OrgDeptTreeForm form) throws Exception ;
	
	public OrgDeptTreeForm get(String id) throws Exception ;
	
	public List<OrgDeptTreeForm> org_treegrid(OrgDeptTreeForm form ,String mode) throws Exception ;

}
