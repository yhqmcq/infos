package com.infox.project.web.form;

import java.util.Date;

import com.infox.common.web.page.PageHelper;

public class OvertimeForm extends PageHelper {

	private String id;

	/** 加班开始时间 */
	private Date startDate;

	/** 加班结束时间 */
	private Date endDate;

	private Float hour;

	private Date created = new Date();

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
