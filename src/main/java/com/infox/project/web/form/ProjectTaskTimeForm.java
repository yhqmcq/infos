package com.infox.project.web.form;

import java.io.Serializable;
import java.util.Date;

import com.infox.common.web.page.PageHelper;

public class ProjectTaskTimeForm extends PageHelper implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	
	private String emp_id ;
	
	private String emp_name ;
	
	private String emp_email ;
	
	private String dept_id ;
	
	private String dept_name ;
	
	private String position_id ;
	
	private String position_name ;
	
	private String project_id ;
	
	private String project_name ;
	
	private Date startDate ;
	
	private Date endDate ;
	
	/** 开始和结束日期，字符串 */
	private String sd ;
	private String ed ;
	
	private Integer Status ;
	
	/** 总月数 */
	private long totalTaskYear ;
	
	/** 总有效工作天数 */
	private long totalTaskTime ;
	
	/** 已消耗天数 */
	private long expendDays ;
	
	/** 个人人月 */
	private float mm ;
	
	/** 个人，已消耗人月 */
	private float expendMM ;
	
	/** 所有人月的累加 */
	private float allMM ;
	
	/** 用于IN查询(0,1,2,3,4) */
	private String inStatus;
	
	/** 用于NOT IN查询(0,1,2,3,4) */
	private String notInStatus;

	public float getMm() {
		return mm;
	}

	public void setMm(float mm) {
		this.mm = mm;
	}

	public float getAllMM() {
		return allMM;
	}

	public String getSd() {
		return sd;
	}

	public void setSd(String sd) {
		this.sd = sd;
	}

	public String getEd() {
		return ed;
	}

	public void setEd(String ed) {
		this.ed = ed;
	}

	public void setAllMM(float allMM) {
		this.allMM = allMM;
	}

	public String getId() {
		return id;
	}

	public String getPosition_id() {
		return position_id;
	}

	public void setPosition_id(String position_id) {
		this.position_id = position_id;
	}

	public float getExpendMM() {
		return expendMM;
	}

	public void setExpendMM(float expendMM) {
		this.expendMM = expendMM;
	}

	public long getExpendDays() {
		return expendDays;
	}

	public void setExpendDays(long expendDays) {
		this.expendDays = expendDays;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getEmp_email() {
		return emp_email;
	}

	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}

	public String getDept_id() {
		return dept_id;
	}

	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
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

	public Integer getStatus() {
		return Status;
	}

	public void setStatus(Integer status) {
		Status = status;
	}


	public long getTotalTaskYear() {
		return totalTaskYear;
	}

	public void setTotalTaskYear(long totalTaskYear) {
		this.totalTaskYear = totalTaskYear;
	}

	public long getTotalTaskTime() {
		return totalTaskTime;
	}

	public void setTotalTaskTime(long totalTaskTime) {
		this.totalTaskTime = totalTaskTime;
	}

	public String getInStatus() {
		return inStatus;
	}

	public void setInStatus(String inStatus) {
		this.inStatus = inStatus;
	}

	public String getNotInStatus() {
		return notInStatus;
	}

	public void setNotInStatus(String notInStatus) {
		this.notInStatus = notInStatus;
	}
	
	
}
