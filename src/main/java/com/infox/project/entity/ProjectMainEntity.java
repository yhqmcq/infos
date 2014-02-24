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

import com.infox.common.util.UUIDHexGenerator;
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
	
	/** 项目编号 */
	private String code ;
	
	/** 创建者ID */
	private String createrId ;
	
	/** 创建者名称 */
	private String createrName ;
	
	/** 创建时间 */
	private Date created = new Date() ;
	
	/** 最后修改时间 */
	private Date lastmod = new Date() ;
	
	/** 项目所属公司部门 */
	private OrgDeptTreeEntity dept ;
	
	@ManyToOne
	@JoinColumn(name = "DEPT_PID")
	public OrgDeptTreeEntity getDept() {
		return dept;
	}

	public void setDept(OrgDeptTreeEntity dept) {
		this.dept = dept;
	}

	/** 自关联，树形结构 */
	private ProjectMainEntity project ;
	private Set<ProjectMainEntity> projects = new HashSet<ProjectMainEntity>() ;

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
		return UUIDHexGenerator.generator().toString();
	}

	public void setId(String id) {
		this.id = id;
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
