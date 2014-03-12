package com.infox.project.web.form;

import java.util.Date;

public class ProjectChartsForm {
	
	/** 年份 */
	private String year ;
	
	/** 月份 */
	private String month ;
	
	private Date startDate ;
	
	private Date endDate ;

	/** 用于IN查询(0,1,2,3,4) */
	private String inStatus;
	
	/** 用于NOT IN查询(0,1,2,3,4) */
	private String notInStatus;
	
	
	
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

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}
	

}
