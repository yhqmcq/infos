package com.infox.project.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.infox.common.util.RandomUtils;
import com.infox.sysmgr.entity.EmployeeEntity;

/**
 * 员工加班
 * 类描述： 
 * 创建者： 杨浩泉
 * 项目名称： infos
 * 创建时间： 2014-3-14 下午9:11:00
 * 版本号： v1.0
 */
@Entity
@Table(name = "INFOX_PROJECT_OVERTIME")
@DynamicUpdate(true)
@DynamicInsert(true)
public class OvertimeEntity {

	private String id ;
	
	/** 加班开始时间 */
	private Date startDate ;
	
	/** 加班结束时间 */
	private Date endDate ;
	
	private Float hour ;
	
	private Date created = new Date() ;
	
	private EmployeeEntity emp ;
	
	private ProjectMainEntity project ;

	@ManyToOne
	@JoinColumn(name="PROJECT_ID")
	public ProjectMainEntity getProject() {
		return project;
	}

	public void setProject(ProjectMainEntity project) {
		this.project = project;
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Float getHour() {
		return hour;
	}

	public void setHour(Float hour) {
		this.hour = hour;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	@ManyToOne
	@JoinColumn(name = "EMP_ID")
	public EmployeeEntity getEmp() {
		return emp;
	}

	public void setEmp(EmployeeEntity emp) {
		this.emp = emp;
	}
	
	
}
