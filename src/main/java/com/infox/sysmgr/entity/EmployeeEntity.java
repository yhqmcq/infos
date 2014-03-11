package com.infox.sysmgr.entity;

import java.io.Serializable;
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
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.infox.common.util.StringUtil;
import com.infox.project.entity.ProjectEmpWorkingEntity;

@Entity
@Table(name = "INFOX_SYSMGR_EMP")
@DynamicUpdate(true)
@DynamicInsert(true)
public class EmployeeEntity implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private String id ;
	
	private String account ;
	
	private String password ;
	
	private String status ;
	
	private String truename ;
	
	private String sex ;
	
	private String email ;
	
	private String tel ;
	
	private String description ;
	
	private Date created = new Date() ;
	
	private Date lastmod = new Date() ;
	
	private String creater;
	
	private String modifyer;
	
	/** 是否主管 */
	private String isLeader ;
	
	/** 日语级别 */
	private String japanese ;
	
	/** 员工工作状态（0空闲，1已在项目，2出差） */
	private int workStatus = 0 ;
	
	private OrgDeptTreeEntity org ;
	
	private Set<ProjectEmpWorkingEntity> empWorks = new HashSet<ProjectEmpWorkingEntity>(0) ;
	
	private Set<RoleEntity> roles = new HashSet<RoleEntity>(0) ;
	
	/** 员工职位角色 */
	private Set<EmpJobEntity> empjobs = new HashSet<EmpJobEntity>() ;
	
	@OneToMany
	@JoinColumn(name = "EMP_ID")
	public Set<ProjectEmpWorkingEntity> getEmpWorks() {
		return empWorks;
	}

	public void setEmpWorks(Set<ProjectEmpWorkingEntity> empWorks) {
		this.empWorks = empWorks;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "INFOX_SYSMGR_EMP_JOB", joinColumns = { @JoinColumn(name = "EMP_ID", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "EMPJOB_ID", nullable = false, updatable = false) })
	public Set<EmpJobEntity> getEmpjobs() {
		return empjobs;
	}

	public void setEmpjobs(Set<EmpJobEntity> empjobs) {
		this.empjobs = empjobs;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "INFOX_SYSMGR_EMP_ROLE", joinColumns = { @JoinColumn(name = "EMP_ID", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "ROLE_ID", nullable = false, updatable = false) })
	public Set<RoleEntity> getRoles() {
		return roles;
	}

	public void setRoles(Set<RoleEntity> roles) {
		this.roles = roles;
	}

	public String getIsLeader() {
		return isLeader;
	}

	public void setIsLeader(String isLeader) {
		this.isLeader = isLeader;
	}

	public int getWorkStatus() {
		return workStatus;
	}

	public String getJapanese() {
		return japanese;
	}

	public void setJapanese(String japanese) {
		this.japanese = japanese;
	}

	public void setWorkStatus(int workStatus) {
		this.workStatus = workStatus;
	}

	@Id
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	public String getTruename() {
		if(this.truename != null && !"".equals(this.truename)) {
			return StringUtil.replaceBlank(this.truename) ;
		}
		return truename;
	}

	public void setTruename(String truename) {
		this.truename = truename;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getLastmod() {
		return lastmod;
	}

	public void setLastmod(Date lastmod) {
		this.lastmod = lastmod;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getModifyer() {
		return modifyer;
	}

	public void setModifyer(String modifyer) {
		this.modifyer = modifyer;
	}

	@ManyToOne
	@JoinColumn(name = "ORG_PID")
	public OrgDeptTreeEntity getOrg() {
		return org;
	}

	public void setOrg(OrgDeptTreeEntity org) {
		this.org = org;
	}
	
	

}
