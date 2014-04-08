package com.infox.sysmgr.entity;

import java.io.Serializable;
import java.sql.Clob;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.infox.common.util.StringUtil;
import com.infox.project.entity.OvertimeEntity;
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
	
	/** 毕业时间 */
	private Date bysj ;
	
	/** 入职时间 */
	private Date rzsj ;
	
	/** 最后一次变更日期（岗位变更实施日期） */
	private String positionDate ;
	
	/** 备注(岗位变更历史) */
	private Clob remark ;
	
	/** 是否主管 */
	private String isLeader ;
	
	/** 日语级别 */
	private String japanese ;
	
	/** 到岗类型（0不选,1新增、2转入、3在职，4新人培训、5停薪留职返回） */
	private Integer dbmType = new Integer(0) ;
	
	/** 离岗类型（0不选,1转出——开发部、2转出——非开发部、3离职、4停薪留职） */
	private Integer lbmType = new Integer(0) ;
	
	/** 到部门日前 */
	private String dbmDate ;
	
	/** 离开部门日前 */
	private String lbmDate ;
	
	/** 员工状态(1在职，2离职，3停薪留职，4出差) */
	private Integer state = new Integer(0) ;
	
	/** 员工工作状态（0空闲，1已在项目，2出差，3离职） */
	private Integer workStatus = new Integer(0) ;
	
	private OrgDeptTreeEntity org ;
	
	private Set<ProjectEmpWorkingEntity> empWorks = new HashSet<ProjectEmpWorkingEntity>(0) ;
	
	private Set<RoleEntity> roles = new HashSet<RoleEntity>(0) ;
	
	/** 员工职位角色 */
	private Set<EmpJobEntity> empjobs = new HashSet<EmpJobEntity>() ;
	
	/** 员工加班 */
	private Set<OvertimeEntity> overtime = new HashSet<OvertimeEntity>() ;
	
	
	@OneToMany
	@JoinColumn(name = "EMP_ID")
	public Set<OvertimeEntity> getOvertime() {
		return overtime;
	}

	public void setOvertime(Set<OvertimeEntity> overtime) {
		this.overtime = overtime;
	}

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

	@Temporal(TemporalType.DATE)
	public Date getBysj() {
		return bysj;
	}

	public void setBysj(Date bysj) {
		this.bysj = bysj;
	}

	@Temporal(TemporalType.DATE)
	public Date getRzsj() {
		return rzsj;
	}

	public void setRzsj(Date rzsj) {
		this.rzsj = rzsj;
	}


	public Clob getRemark() {
		return remark;
	}

	public void setRemark(Clob remark) {
		this.remark = remark;
	}

	public String getIsLeader() {
		return isLeader;
	}

	public void setIsLeader(String isLeader) {
		this.isLeader = isLeader;
	}


	public String getJapanese() {
		return japanese;
	}

	public void setJapanese(String japanese) {
		this.japanese = japanese;
	}


	public Integer getWorkStatus() {
		return workStatus;
	}

	public void setWorkStatus(Integer workStatus) {
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


	public Integer getDbmType() {
		return dbmType;
	}

	public void setDbmType(Integer dbmType) {
		this.dbmType = dbmType;
	}

	public Integer getLbmType() {
		return lbmType;
	}

	public void setLbmType(Integer lbmType) {
		this.lbmType = lbmType;
	}

	public String getDbmDate() {
		return dbmDate;
	}

	public void setDbmDate(String dbmDate) {
		this.dbmDate = dbmDate;
	}

	public String getLbmDate() {
		return lbmDate;
	}

	public void setLbmDate(String lbmDate) {
		this.lbmDate = lbmDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
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

	public String getPositionDate() {
		return positionDate;
	}

	public void setPositionDate(String positionDate) {
		this.positionDate = positionDate;
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
