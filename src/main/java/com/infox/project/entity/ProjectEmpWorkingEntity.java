package com.infox.project.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.infox.common.util.RandomUtils;
import com.infox.sysmgr.entity.EmployeeEntity;

/**
 * 项目开发人员表
 * 类描述： 
 * 创建者： 杨浩泉
 * 项目名称： infos
 * 创建时间： 2014-2-26 上午9:53:39
 * 版本号： v1.0
 */
@Entity
@Table(name = "INFOX_PROJECT_EMP_WORKING")
@DynamicUpdate(true)
@DynamicInsert(true)
public class ProjectEmpWorkingEntity {

	private String id ;
	
	/** 员工名称 */
	private String emp_name ;
	
	/** 项目名称 */
	private String project_name ;
	
	/** 开始日期 */
	private Date startDate ;
	
	/** 结束日期 */
	private Date endDate ;
	
	/** 关联员工 */
	private EmployeeEntity emp ; 
	
	/** 关联项目 */
	private ProjectMainEntity project ;
	
	/** 状态标记（0.未设置日期，1.已设置日期，2.已到期，3.历史信息） */
	private Integer status ;
	
	private Date created = new Date() ;
	
	/** 自关联 */
	private ProjectEmpWorkingEntity pew ;
	private Set<ProjectEmpWorkingEntity> pews = new HashSet<ProjectEmpWorkingEntity>() ;
	

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	@Temporal(TemporalType.DATE)
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	@Temporal(TemporalType.DATE)
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@ManyToOne
	@JoinColumn(name="EMP_ID")
	public EmployeeEntity getEmp() {
		return emp;
	}

	public void setEmp(EmployeeEntity emp) {
		this.emp = emp;
	}

	@ManyToOne
	@JoinColumn(name="PROJECT_ID")
	public ProjectMainEntity getProject() {
		return project;
	}

	public void setProject(ProjectMainEntity project) {
		this.project = project;
	}

	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="PEW_PID")
	public ProjectEmpWorkingEntity getPew() {
		return pew;
	}

	public void setPew(ProjectEmpWorkingEntity pew) {
		this.pew = pew;
	}

	@OneToMany
	@JoinColumn(name = "PEW_PID")
	public Set<ProjectEmpWorkingEntity> getPews() {
		return pews;
	}

	public void setPews(Set<ProjectEmpWorkingEntity> pews) {
		this.pews = pews;
	}

	@Id
	public String getId() {
		if (this.id != null) {
			return this.id;
		}
		return RandomUtils.generateNumber(6);
	}
	
	public void setId(String id) {
		this.id = id;
	}
}
