package com.infox.project.web.form;

import java.util.Date;

import com.infox.common.web.page.PageHelper;

public class ProjectMainForm extends PageHelper {
	
	private String id ;
	
	/** 项目名称 */
	private String name ;
	
	/** 项目代号 */
	private String code ;
	
	/** 项目开始日期 */
	private Date startDate ;
	
	/** 项目结束日期 */
	private Date endDate ;
	
	/** 团队名称 */
	private String team_name ;
	
	/** 项目类型（短期迭代，长期项目，运维项目） */
	private int project_type = 0 ;
	
	/** 项目状态（未开始，进行中，已挂起，已完成，激活） */
	private int status = 0 ;
	
	/** 项目负责人 */
	private String lead ;
	
	/** 创建者ID */
	private String createrId ;
	
	/** 创建者名称 */
	private String createrName ;
	
	/** 创建时间 */
	private Date created = new Date() ;
	
	/** 最后修改时间 */
	private Date lastmod = new Date() ;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
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

	public String getLead() {
		return lead;
	}

	public void setLead(String lead) {
		this.lead = lead;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public int getProject_type() {
		return project_type;
	}

	public void setProject_type(int project_type) {
		this.project_type = project_type;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCreaterId() {
		return createrId;
	}

	public void setCreaterId(String createrId) {
		this.createrId = createrId;
	}

	public String getCreaterName() {
		return createrName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setCreaterName(String createrName) {
		this.createrName = createrName;
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

	
	
}
