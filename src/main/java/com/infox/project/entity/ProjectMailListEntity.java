package com.infox.project.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.infox.common.util.RandomUtils;

/**
 * 项目参与人员邮件列表
 * 类描述： 
 * 创建者： 杨浩泉
 * 项目名称： infos
 * 创建时间： 2014-2-27 上午8:45:47
 * 版本号： v1.0
 */
@Entity
@Table(name = "INFOX_PROJECT_MAILLIST")
@DynamicUpdate(true)
@DynamicInsert(true)
public class ProjectMailListEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private String id ;
	
	private String empid ;
	
	private String empname ;
	
	private String email ;
	
	private String deptid ;
	
	private String deptname ;
	
	private String empjobid ;
	
	private String empjobname ;
	
	private String project_name ;
	
	private ProjectMainEntity projectmain ;

	@ManyToOne
	@JoinColumn(name="PROJECT_ID")
	public ProjectMainEntity getProjectmain() {
		return projectmain;
	}

	public void setProjectmain(ProjectMainEntity projectmain) {
		this.projectmain = projectmain;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Id
	public String getId() {
		if (this.id != null) {
			return this.id;
		}
		return RandomUtils.generateNumber(6);
	}
	
}
