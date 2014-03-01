package com.infox.project.web.form;

import java.io.Serializable;

import com.infox.common.web.page.PageHelper;

public class ProjectMailListForm extends PageHelper implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id ;
	
	private String empid ;
	
	private String empname ;
	
	private String email ;
	
	private String deptid ;
	
	private String deptname ;
	
	private String empjobid ;
	
	private String empjobname ;
	
	private String projectid ;
	
	private String project_name ;

	public String getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmpid() {
		return empid;
	}

	public void setEmpid(String empid) {
		this.empid = empid;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public String getDeptid() {
		return deptid;
	}

	public void setDeptid(String deptid) {
		this.deptid = deptid;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

	public String getEmpjobid() {
		return empjobid;
	}

	public void setEmpjobid(String empjobid) {
		this.empjobid = empjobid;
	}

	public String getEmpjobname() {
		return empjobname;
	}

	public void setEmpjobname(String empjobname) {
		this.empjobname = empjobname;
	}

	public String getProjectid() {
		return projectid;
	}

	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
}
