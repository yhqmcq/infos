package com.infox.project.web.form;

import java.io.Serializable;
import java.util.Date;

import com.infox.common.web.page.PageHelper;

public class ProjectEmpWorkingForm extends PageHelper implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private String id ;
	
	/** 员工名称 */
	private String truename ;
	
	private Date rzsj ;
	
	/** 员工部门 */
	private String orgname ;
	
	/** 项目ID */
	private String project_id ;
	
	/** 项目名称 */
	private String project_name ;
	
	/** 人员在项目中的角色 */
	private String project_role ;
	
	/** 开始日期 */
	private Date startDate ;
	
	/** 结束日期 */
	private Date endDate ;
	
	/** 员工IDs */
	private String empId ;
	
	/** 状态标记（0.未设置日期，1.已设置日期，2.已到期，3.历史信息，4.结束-退出项目组） */
	/** 状态2暂时没有用到，因为人员到期后则标记该人员已退出项目 */
	private Integer status ;
	
	/** 用于IN查询(0,1,2,3,4) */
	private String inStatus ;
	
	/** 变更日期的人员ID */
	private String bgMembers ;
 
	public String getBgMembers() {
		return bgMembers;
	}

	public void setBgMembers(String bgMembers) {
		this.bgMembers = bgMembers;
	}
	
	public String getInStatus() {
		return inStatus;
	}

	public Date getRzsj() {
		return rzsj;
	}

	public void setRzsj(Date rzsj) {
		this.rzsj = rzsj;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setInStatus(String inStatus) {
		this.inStatus = inStatus;
	}

	public String getProject_role() {
		return project_role;
	}

	public void setProject_role(String project_role) {
		this.project_role = project_role;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTruename() {
		return truename;
	}

	public void setTruename(String truename) {
		this.truename = truename;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
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
}
