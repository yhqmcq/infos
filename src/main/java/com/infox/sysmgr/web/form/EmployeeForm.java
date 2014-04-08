package com.infox.sysmgr.web.form;

import java.util.Date;

import com.infox.common.web.page.PageHelper;

public class EmployeeForm extends PageHelper{
	private String id;

	private String account;

	private String password;

	private String status;

	private String truename;
	
	private String sex ;

	private String email;

	private String tel;

	private String description;
	
	/** 毕业时间 */
	private Date bysj ;
	
	/** 入职时间 */
	private Date rzsj ;
	
	/** 最后一次变更日期（岗位变更实施日期） */
	private String positionDate ;
	
	/** 备注(岗位变更历史) */
	private String remark ;
	
	private Date created = new Date();

	private Date lastmod = new Date();

	private String creater;

	private String modifyer;
	
	private String orgid ;

	private String orgname;
	
	private String roleIds ;
	
	private String roleNames ;
	
	private String oldPwd;
	
	private String kaptcha ;
	
	private String ip ;
	
	private String onlineState ;
	
	private String jobids ;
	
	private String position ;
	
	private String position_sname ;
	
	/** 到岗类型（0不选,1新增、2转入、3在职，4新人培训） */
	private Integer dbmType ;
	
	/** 离岗类型（0不选,1转出——开发部、2转出——非开发部、3离职） */
	private Integer lbmType ;
	
	/** 到部门日前 */
	private String dbmDate ;
	
	/** 离开部门日前 */
	private String lbmDate ;
	
	/** 员工状态(1在职，2离职，3停薪留职，4出差) */
	private Integer state = new Integer(0) ;
	
	/** 是否主管 */
	private String isLeader ;
	
	/** 日语级别 */
	private String japanese ;
	
	/** 员工工作状态（0空闲，1已在项目，2出差） */
	private Integer workStatus ;
	
	/** 用于IN查询(0,1,2,3,4) */
	private String inStatus;
	/** 用于NOT IN查询(0,1,2,3,4) */
	private String notInStatus;

	public String getInStatus() {
		return inStatus;
	}

	public void setInStatus(String inStatus) {
		this.inStatus = inStatus;
	}

	public String getNotInStatus() {
		return notInStatus;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getPosition_sname() {
		return position_sname;
	}

	public void setPosition_sname(String position_sname) {
		this.position_sname = position_sname;
	}

	public String getIsLeader() {
		return isLeader;
	}

	public void setIsLeader(String isLeader) {
		this.isLeader = isLeader;
	}

	public Date getBysj() {
		return bysj;
	}

	public void setBysj(Date bysj) {
		this.bysj = bysj;
	}

	public Date getRzsj() {
		return rzsj;
	}

	public void setRzsj(Date rzsj) {
		this.rzsj = rzsj;
	}

	public String getJapanese() {
		return japanese;
	}

	public void setJapanese(String japanese) {
		this.japanese = japanese;
	}

	public void setNotInStatus(String notInStatus) {
		this.notInStatus = notInStatus;
	}

	public Integer getWorkStatus() {
		return workStatus;
	}

	public void setWorkStatus(Integer workStatus) {
		this.workStatus = workStatus;
	}

	public String getJobids() {
		return jobids;
	}

	public void setJobids(String jobids) {
		this.jobids = jobids;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getOnlineState() {
		return onlineState;
	}

	public void setOnlineState(String onlineState) {
		this.onlineState = onlineState;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getKaptcha() {
		return kaptcha;
	}

	public void setKaptcha(String kaptcha) {
		this.kaptcha = kaptcha;
	}

	public String getOldPwd() {
		return oldPwd;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

	public String getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(String roleIds) {
		this.roleIds = roleIds;
	}

	public Integer getDbmType() {
		return dbmType;
	}

	public void setDbmType(Integer dbmType) {
		this.dbmType = dbmType;
	}

	public Integer getLbmType() {
		return lbmType;
	}

	public void setLbmType(Integer lbmType) {
		this.lbmType = lbmType;
	}

	public String getDbmDate() {
		return dbmDate;
	}

	public void setDbmDate(String dbmDate) {
		this.dbmDate = dbmDate;
	}

	public String getLbmDate() {
		return lbmDate;
	}

	public void setLbmDate(String lbmDate) {
		this.lbmDate = lbmDate;
	}

	public String getRoleNames() {
		return roleNames;
	}

	public void setRoleNames(String roleNames) {
		this.roleNames = roleNames;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTruename() {
		return truename;
	}

	public void setTruename(String truename) {
		this.truename = truename;
	}

	public String getSex() {
		return sex;
	}

	public String getPositionDate() {
		return positionDate;
	}

	public void setPositionDate(String positionDate) {
		this.positionDate = positionDate;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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

	public Date getLastmod() {
		return lastmod;
	}

	public void setLastmod(Date lastmod) {
		this.lastmod = lastmod;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getModifyer() {
		return modifyer;
	}

	public void setModifyer(String modifyer) {
		this.modifyer = modifyer;
	}

	public String getOrgid() {
		return orgid;
	}

	public void setOrgid(String orgid) {
		this.orgid = orgid;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	
	

}
