package com.infox.project.web.form;

import java.io.Serializable;
import java.util.Date;

import com.infox.common.web.page.PageHelper;

public class ProjectEmpWorkingForm extends PageHelper implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private String id ;
	
	/** 员工名称 */
	private String emp_name ;
	
	/** 项目ID */
	private String project_id ;
	
	/** 项目名称 */
	private String project_name ;
	
	/** 开始日期 */
	private Date startDate ;
	
	/** 结束日期 */
	private Date endDate ;
	
	/** 员工ID */
	private String empIds ;
	
	/** 状态标记（0.未设置日期，1.已设置日期，2.已到期，3.历史信息，4.结束-退出项目组） */
	private Integer status ;
	
	/** 用于IN查询(0,1,2,3,4) */
	private String inStatus ;
	
	public String getInStatus() {
		return inStatus;
	}

	public void setInStatus(String inStatus) {
		this.inStatus = inStatus;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getEmpIds() {
		return empIds;
	}

	public void setEmpIds(String empIds) {
		this.empIds = empIds;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmp_name() {
		return emp_name;
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
}
