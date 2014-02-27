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
	private Integer project_type ;
	
	/** 项目状态（0.未开始，1.进行中，2.已挂起，3.已完成，4.激活，5.历史） */
	private Integer status ;
	
	/** 所属部门（ID） */
	private String deptid ;
	
	/** 所属部门（Name） */
	private String deptname ;
	
	/** 项目负责人ID */
	private String project_leader_id ;
	
	/** 项目负责人名称 */
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
	
	/** 用于IN查询(0,1,2,3,4) */
	private String inStatus ;
	/** 用于NOT IN查询(0,1,2,3,4) */
	private String notInStatus ;
	
	private String pid ;
	
	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
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

	public long getLastdateDiff() {
		return lastdateDiff;
	}

	public void setLastdateDiff(long lastdateDiff) {
		this.lastdateDiff = lastdateDiff;
	}

	public String getProject_leader_id() {
		return project_leader_id;
	}

	public void setProject_leader_id(String project_leader_id) {
		this.project_leader_id = project_leader_id;
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


	public Integer getProject_type() {
		return project_type;
	}

	public void setProject_type(Integer project_type) {
		this.project_type = project_type;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
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
