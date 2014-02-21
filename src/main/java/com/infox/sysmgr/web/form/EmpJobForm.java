package com.infox.sysmgr.web.form;

import java.util.Date;

import com.infox.common.web.page.Tree;

public class EmpJobForm extends Tree<EmpJobForm> {

	private String id;

	/** 职位名称 */
	private String job_name;

	/** 职位简称 */
	private String job_sname;

	/** 职位级别 */
	private String job_level;

	/** 职位描述 */
	private String description;

	private Date created = new Date();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getJob_name() {
		return job_name;
	}

	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}

	public String getJob_sname() {
		return job_sname;
	}

	public void setJob_sname(String job_sname) {
		this.job_sname = job_sname;
	}

	public String getJob_level() {
		return job_level;
	}

	public void setJob_level(String job_level) {
		this.job_level = job_level;
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
	
	

}
