package com.infox.sysmgr.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.infox.common.util.UUIDHexGenerator;

/**
 * 员工职位表
 * 类描述： 
 * 创建者： 杨浩泉
 * 项目名称： infos
 * 创建时间： 2014-2-22 上午12:08:11
 * 版本号： v1.0
 */
@Entity
@Table(name = "INFOX_SYSMGR_EMPJOB")
@DynamicUpdate(true)
@DynamicInsert(true)
public class EmpJobEntity {
	
	private String id;
	
	/** 职位名称 */
	private String job_name ;
	
	/** 职位简称 */
	private String job_sname ;
	
	/** 职位级别 */
	private String job_level ;
	
	/** 职位描述 */
	private String description ;
	
	private Date created = new Date() ;
	
	private EmpJobEntity empjob ;
	
	private Set<EmpJobEntity> empjobs = new HashSet<EmpJobEntity>() ;
	
	private Set<EmployeeEntity> emps = new HashSet<EmployeeEntity>(0) ;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "INFOX_SYSMGR_EMP_JOB", joinColumns = { @JoinColumn(name = "EMPJOB_ID", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "EMP_ID", nullable = false, updatable = false) })
	public Set<EmployeeEntity> getEmps() {
		return emps;
	}

	public void setEmps(Set<EmployeeEntity> emps) {
		this.emps = emps;
	}
	

	@ManyToOne
	@JoinColumn(name = "EMPJOB_PID")
	public EmpJobEntity getEmpjob() {
		return empjob;
	}

	public void setEmpjob(EmpJobEntity empjob) {
		this.empjob = empjob;
	}

	@OneToMany(mappedBy = "empjob", fetch = FetchType.LAZY)
	@OrderBy("created desc")
	public Set<EmpJobEntity> getEmpjobs() {
		return empjobs;
	}

	public void setEmpjobs(Set<EmpJobEntity> empjobs) {
		this.empjobs = empjobs;
	}

	@Id
	public String getId() {
		if (this.id != null) {
			return this.id;
		}
		return UUIDHexGenerator.generator().toString();
	}

	public String getJob_sname() {
		return job_sname;
	}

	public void setJob_sname(String job_sname) {
		this.job_sname = job_sname;
	}

	public String getJob_name() {
		return job_name;
	}

	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}

	public String getJob_level() {
		return job_level;
	}

	public void setJob_level(String job_level) {
		this.job_level = job_level;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}
	

}
