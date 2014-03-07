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
import com.infox.sysmgr.entity.EmployeeEntity;

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
	
	private EmployeeEntity employee ;
	
	private ProjectMainEntity projectmain ;
	
	
	@ManyToOne
	@JoinColumn(name="EMP_ID")
	public EmployeeEntity getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeEntity employee) {
		this.employee = employee;
	}

	@ManyToOne
	@JoinColumn(name="PROJECT_ID")
	public ProjectMainEntity getProjectmain() {
		return projectmain;
	}

	public void setProjectmain(ProjectMainEntity projectmain) {
		this.projectmain = projectmain;
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
