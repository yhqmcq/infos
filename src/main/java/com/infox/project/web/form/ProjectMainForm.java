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
	
	/** 所属部门（ID） */
	private String deptid ;
	
	/** 所属部门（Name） */
	private String deptname ;
	
	/** 项目负责人 */
	private String project_leader ;
	
	/** 创建者ID */
	private String createrId ;
	
	/** 创建者名称 */
	private String createrName ;
	
	/** 创建时间 */
	private Date created = new Date() ;
	
	/** 最后修改时间 */
	private Date lastmod = new Date() ;
	
	/** 总天数 */
	private long dateDiff ;
	
	/** 剩余天数 */
	private long lastdateDiff ;
	
	public long getLastdateDiff() {
		return lastdateDiff;
	}

	public void setLastdateDiff(long lastdateDiff) {
		this.lastdateDiff = lastdateDiff;
	}

	public long getDateDiff() {
		return dateDiff;
	}

	public void setDateDiff(long dateDiff) {
		this.dateDiff = dateDiff;
	}

	public String getDeptid() {
		return deptid;
	}

	public void setDeptid(String deptid) {
		this.deptid = deptid;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

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

	public String getProject_leader() {
		return project_leader;
	}

	public void setProject_leader(String project_leader) {
		this.project_leader = project_leader;
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
