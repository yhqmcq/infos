package com.infox.project.web.form;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.infox.common.web.page.PageHelper;

public class ProjectMainForm extends PageHelper implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	
	/** 项目编号-唯一 */
	private String projectNum ;

	/** 项目名称 */
	private String name;

	/** 项目代号 */
	private String code;

	/** 项目开始日期 */
	private Date startDate;

	/** 项目结束日期 */
	private Date endDate;

	/** 团队名称 */
	private String team_name;

	/** 项目类型（短期迭代，长期项目，运维项目） */
	private Integer project_type;

	/** 项目状态（0.未开始，1.进行中，2.已挂起，3.已完成，4.激活，5.历史） */
	private Integer status;

	/** 所属部门（ID） */
	private String deptid;

	/** 所属部门（Name） */
	private String deptname;
	
	/** 所属部长 */
	private String deptLeader ;

	/** 项目负责人ID */
	private String leader_id;

	/** 项目负责人名称 */
	private String leader_name;

	/** 创建者ID */
	private String createrId;

	/** 创建者名称 */
	private String createrName;
	
	/** 作业范围 */
	private String taskScope ;
	
	/** 反馈BUG率 */
	private String project_buglv;
	
	/** 顾客满意度 */
	private String project_manyidu;
	
	/** 生产性目标 */
	private String project_scx;
	
	/** 项目目标 */
	private String project_target;

	/** 项目描述 */
	private String project_desc;
	
	/** 创建时间 */
	private Date created = new Date();

	/** 最后修改时间 */
	private Date lastmod = new Date();

	/** 总天数 */
	private long dateDiff;

	/** 剩余天数 */
	private long lastdateDiff;
	
	/** 总月数(实际工作天数除以当月的有效天数) */
	private Float totalMonth = new Float(0) ;
	
	/** 项目总人月 */
	private float mm ;

	/** 用于IN查询(0,1,2,3,4) */
	private String inStatus;
	/** 用于NOT IN查询(0,1,2,3,4) */
	private String notInStatus;

	private String pid;
	
	/** 用于项目详细信息 的开发人员统计 */
	private List<ProjectTaskTimeForm> devMemList ;
 
	public String getPid() {
		return pid;
	}

	public Float getTotalMonth() {
		return totalMonth;
	}

	public void setTotalMonth(Float totalMonth) {
		this.totalMonth = totalMonth;
	}

	public String getProject_buglv() {
		return project_buglv;
	}

	public void setProject_buglv(String project_buglv) {
		this.project_buglv = project_buglv;
	}

	public String getProject_manyidu() {
		return project_manyidu;
	}

	public void setProject_manyidu(String project_manyidu) {
		this.project_manyidu = project_manyidu;
	}

	public String getProject_scx() {
		return project_scx;
	}

	public void setProject_scx(String project_scx) {
		this.project_scx = project_scx;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getDeptLeader() {
		return deptLeader;
	}

	public void setDeptLeader(String deptLeader) {
		this.deptLeader = deptLeader;
	}

	public float getMm() {
		return mm;
	}

	public void setMm(float mm) {
		this.mm = mm;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public List<ProjectTaskTimeForm> getDevMemList() {
		return devMemList;
	}

	public void setDevMemList(List<ProjectTaskTimeForm> devMemList) {
		this.devMemList = devMemList;
	}

	public String getProject_target() {
		return project_target;
	}

	public String getTaskScope() {
		return taskScope;
	}

	public void setTaskScope(String taskScope) {
		this.taskScope = taskScope;
	}

	public void setProject_target(String project_target) {
		this.project_target = project_target;
	}

	public String getProject_desc() {
		return project_desc;
	}

	public void setProject_desc(String project_desc) {
		this.project_desc = project_desc;
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


	public String getLeader_id() {
		return leader_id;
	}

	public void setLeader_id(String leader_id) {
		this.leader_id = leader_id;
	}

	public String getLeader_name() {
		return leader_name;
	}

	public void setLeader_name(String leader_name) {
		this.leader_name = leader_name;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getTeam_name() {
		return team_name;
	}

	public String getProjectNum() {
		return projectNum;
	}

	public void setProjectNum(String projectNum) {
		this.projectNum = projectNum;
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
