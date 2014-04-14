package com.infox.project.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.infox.common.util.RandomUtils;
import com.infox.sysmgr.entity.EmployeeEntity;
import com.infox.sysmgr.entity.OrgDeptTreeEntity;

/**
 * 项目管理表
 * 类描述： 
 * 创建者： 杨浩泉
 * 项目名称： infos
 * 创建时间： 2014-2-24 上午9:05:14
 * 版本号： v1.0
 */
@Entity
@Table(name = "INFOX_PROJECT_PROJECT")
@DynamicUpdate(true)
@DynamicInsert(true)
public class ProjectMainEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id ;
	
	/** 项目编号-唯一 */
	private String projectNum ;
	
	/** 合同编号 */
	private String contractNum ;
	
	/** 合同受注状况 */
	private Integer shouzhu = new Integer(0);
	
	/** 项目名称 */
	private String name ;
	
	/** 项目系数 */
	private Float quot = new Float(0);
	
	/** 项目代号 */
	private String code ;
	
	/** 项目开始日期 */
	private Date startDate ;
	
	/** 项目结束日期 */
	private Date endDate ;
	
	/** 团队名称 */
	private String team_name ;
	
	/** 项目类型（短期迭代，长期项目，运维项目） */
	private String project_type ;
	
	/** 项目状态（0.未开始，1.进行中，2.已挂起，3.已完成，4.激活，5.历史） */
	private Integer status ;
	
	/** 创建者ID */
	private String createrId ;
	
	/** 创建者名称 */
	private String createrName ;
	
	/** 作业范围 */
	private String taskScope ;
	
	/** 项目规模 */
	private Float project_gm = new Float(0);
	
	/** 所属部门（Name） */
	private String deptname ;
	
	/** 反馈BUG率 */
	private String project_buglv;
	
	/** 顾客满意度 */
	private String project_manyidu;
	
	/** 生产性目标 */
	private String project_scx;
	
	/** 报价总人月 */
	private String project_bjzry;
	/** 预计投入总人月 */
	private String project_yjtrzry;
	/** 报价生产性 */
	private String project_bjscx;
	/** 预定生产性 */
	private String project_ydscx;
	/** 粗利润率 */
	private String project_clrl;
	
	/** 项目目标 */
	private String project_target ;
	
	/** 项目描述 */
	private String project_desc ;
	
	/** 创建时间 */
	private Date created = new Date() ;
	
	/** 最后修改时间 */
	private Date lastmod = new Date() ;
	
	/** 项目负责人 */
	private EmployeeEntity emp ;
	
	/** 项目所属公司部门 */
	private OrgDeptTreeEntity dept ;
	
	/** 项目参与人员邮件列表 */
	private Set<ProjectMailListEntity> projectmails = new HashSet<ProjectMailListEntity>() ;
	
	/** 自关联，树形结构 */
	private ProjectMainEntity project ;
	private Set<ProjectMainEntity> projects = new HashSet<ProjectMainEntity>() ;

	/** 项目开发人员列表（起止日期） */
	private Set<ProjectEmpWorkingEntity> pwe = new HashSet<ProjectEmpWorkingEntity>() ;
	
	@OneToMany
	@JoinColumn(name="PROJECT_ID")
	public Set<ProjectMailListEntity> getProjectmails() {
		return projectmails;
	}

	public void setProjectmails(Set<ProjectMailListEntity> projectmails) {
		this.projectmails = projectmails;
	}

	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name="PROJECT_ID")
	@OrderBy("id")
	public Set<ProjectEmpWorkingEntity> getPwe() {
		return pwe;
	}

	public void setPwe(Set<ProjectEmpWorkingEntity> pwe) {
		this.pwe = pwe;
	}

	@ManyToOne
	@JoinColumn(name = "EMP_ID")
	public EmployeeEntity getEmp() {
		return emp;
	}

	public void setEmp(EmployeeEntity emp) {
		this.emp = emp;
	}

	@ManyToOne
	@JoinColumn(name = "DEPT_PID")
	public OrgDeptTreeEntity getDept() {
		return dept;
	}

	public String getTaskScope() {
		return taskScope;
	}

	public void setTaskScope(String taskScope) {
		this.taskScope = taskScope;
	}

	public void setDept(OrgDeptTreeEntity dept) {
		this.dept = dept;
	}
	
	@ManyToOne
	@JoinColumn(name = "PROJECT_PID")
	public ProjectMainEntity getProject() {
		return project;
	}

	public void setProject(ProjectMainEntity project) {
		this.project = project;
	}

	@OneToMany(mappedBy = "project", fetch = FetchType.LAZY)
	@OrderBy("created desc")
	public Set<ProjectMainEntity> getProjects() {
		return projects;
	}

	public void setProjects(Set<ProjectMainEntity> projects) {
		this.projects = projects;
	}

	public String getContractNum() {
		return contractNum;
	}

	public void setContractNum(String contractNum) {
		this.contractNum = contractNum;
	}


	public Float getQuot() {
		return quot;
	}

	public void setQuot(Float quot) {
		this.quot = quot;
	}


	@Id
	public String getId() {
		if (this.id != null) {
			return this.id;
		}
		return RandomUtils.generateNumber(6);
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDeptname() {
		return deptname;
	}


	public Float getProject_gm() {
		return project_gm;
	}

	public void setProject_gm(Float project_gm) {
		this.project_gm = project_gm;
	}


	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCreaterId() {
		return createrId;
	}

	public void setCreaterId(String createrId) {
		this.createrId = createrId;
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

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}


	public String getProject_type() {
		return project_type;
	}

	public void setProject_type(String project_type) {
		this.project_type = project_type;
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

	public String getProject_bjzry() {
		return project_bjzry;
	}

	public void setProject_bjzry(String project_bjzry) {
		this.project_bjzry = project_bjzry;
	}

	public String getProject_yjtrzry() {
		return project_yjtrzry;
	}

	public void setProject_yjtrzry(String project_yjtrzry) {
		this.project_yjtrzry = project_yjtrzry;
	}

	public String getProject_bjscx() {
		return project_bjscx;
	}

	public void setProject_bjscx(String project_bjscx) {
		this.project_bjscx = project_bjscx;
	}

	public String getProject_ydscx() {
		return project_ydscx;
	}

	public void setProject_ydscx(String project_ydscx) {
		this.project_ydscx = project_ydscx;
	}

	public String getProject_clrl() {
		return project_clrl;
	}

	public void setProject_clrl(String project_clrl) {
		this.project_clrl = project_clrl;
	}

	public String getProject_target() {
		return project_target;
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getCreaterName() {
		return createrName;
	}

	public String getProjectNum() {
		return projectNum;
	}

	public void setProjectNum(String projectNum) {
		this.projectNum = projectNum;
	}

	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}

	public Date getLastmod() {
		return lastmod;
	}

	public void setLastmod(Date lastmod) {
		this.lastmod = lastmod;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getShouzhu() {
		return shouzhu;
	}

	public void setShouzhu(Integer shouzhu) {
		this.shouzhu = shouzhu;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}
}
