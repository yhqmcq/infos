package com.infox.project.web.form;

import java.util.Date;

import com.infox.common.web.page.PageHelper;

public class ProjectMainForm extends PageHelper {
	
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
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
