package com.infox.project.web.form;

import java.util.Date;

import com.infox.common.web.page.PageHelper;

public class OvertimeForm extends PageHelper {

	private String id;

	/** 加班开始时间 */
	private Date startDate;

	/** 加班结束时间 */
	private Date endDate;

	/** 相差小时 */
	private Float hour;

	private Date created = new Date();
	
	private String emp_ids ;
	
	private String project_id ;
	

	public String getEmp_ids() {
		return emp_ids;
	}

	public void setEmp_ids(String emp_ids) {
		this.emp_ids = emp_ids;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getId() {
		return id;
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
	

}
