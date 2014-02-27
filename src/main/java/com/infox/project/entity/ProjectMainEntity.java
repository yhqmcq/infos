package com.infox.project.entity;

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
public class ProjectMainEntity {

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
	
	/** 创建者ID */
	private String createrId ;
	
	/** 创建者名称 */
	private String createrName ;
	
	/** 所属部门（Name） */
	private String deptname ;
	
	/** 项目负责人 */
	private String project_leader ;
	
	/** 创建时间 */
	private Date created = new Date() ;
	
	/** 最后修改时间 */
	private Date lastmod = new Date() ;
	
	/** 项目负责人 */
	private EmployeeEntity emp_leader ;
	
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
	public Set<ProjectEmpWorkingEntity> getPwe() {
		return pwe;
	}

	public void setPwe(Set<ProjectEmpWorkingEntity> pwe) {
		this.pwe = pwe;
	}

	@ManyToOne
	@JoinColumn(name = "EMP_ID")
	public EmployeeEntity getEmp_leader() {
		return emp_leader;
	}

	public void setEmp_leader(EmployeeEntity emp_leader) {
		this.emp_leader = emp_leader;
	}

	@ManyToOne
	@JoinColumn(name = "DEPT_PID")
	public OrgDeptTreeEntity getDept() {
		return dept;
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

	public String getProject_leader() {
		return project_leader;
	}

	public void setProject_leader(String project_leader) {
		this.project_leader = project_leader;
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

	public String getCreaterName() {
		return createrName;
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

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}
}
