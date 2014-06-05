package com.infox.sysmgr.entity;

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

@Entity
@Table(name = "INFOX_SYSMGR_ORG_DEPT")
@DynamicUpdate(true)
@DynamicInsert(true)
public class OrgDeptTreeEntity implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private String id ;
	
	/** 组织名称 */
	private String fullname ;
	
	/** 组织编码 */
	private String code ;
	
	/** 英文名称 */
	private String ename ;
	
	/** 简称 */
	private String sname ;

	/** 组织图标 */
	private String iconCls ;
	
	/** 电话 */
	private String tel;
	
	/** 传真 */
	private String fax;
	
	private String type ;
	
	/** 描述 */
	private String description ;
	
	/** 创建者 */
	private String creater ;
	
	/** 修改者 */
	private String modifyer ;
	
	/** 父组织名称 */
	private String pname ;
	
	private int month1 ;
	private int month2 ;
	private int month3 ;
	private int month4 ;
	private int month5 ;
	private int month6 ;
	private int month7 ;
	private int month8 ;
	private int month9 ;
	private int month10 ;
	private int month11 ;
	private int month12 ;
	
	private Date created = new Date() ;
	
	private Date lastmod = new Date() ;
	
	private OrgDeptTreeEntity org ;
	
	private Set<OrgDeptTreeEntity> orgs = new HashSet<OrgDeptTreeEntity>() ;
	
	private Set<EmployeeEntity> users = new HashSet<EmployeeEntity>() ;
	
	@OneToMany(mappedBy = "org", fetch = FetchType.LAZY)
	@OrderBy("created desc")
	public Set<EmployeeEntity> getUsers() {
		return users;
	}

	public void setUsers(Set<EmployeeEntity> users) {
		this.users = users;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@ManyToOne
	@JoinColumn(name = "ORG_PID")
	public OrgDeptTreeEntity getOrg() {
		return org;
	}

	public void setOrg(OrgDeptTreeEntity org) {
		this.org = org;
	}

	@OneToMany(mappedBy = "org", fetch = FetchType.LAZY)
	@OrderBy("created desc")
	public Set<OrgDeptTreeEntity> getOrgs() {
		return orgs;
	}

	public void setOrgs(Set<OrgDeptTreeEntity> orgs) {
		this.orgs = orgs;
	}

	@Id
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getSname() {
		return sname;
	}

	public int getMonth1() {
		return month1;
	}

	public void setMonth1(int month1) {
		this.month1 = month1;
	}

	public int getMonth2() {
		return month2;
	}

	public void setMonth2(int month2) {
		this.month2 = month2;
	}

	public int getMonth3() {
		return month3;
	}

	public void setMonth3(int month3) {
		this.month3 = month3;
	}

	public int getMonth4() {
		return month4;
	}

	public void setMonth4(int month4) {
		this.month4 = month4;
	}

	public int getMonth5() {
		return month5;
	}

	public void setMonth5(int month5) {
		this.month5 = month5;
	}

	public int getMonth6() {
		return month6;
	}

	public void setMonth6(int month6) {
		this.month6 = month6;
	}

	public int getMonth7() {
		return month7;
	}

	public void setMonth7(int month7) {
		this.month7 = month7;
	}

	public int getMonth8() {
		return month8;
	}

	public void setMonth8(int month8) {
		this.month8 = month8;
	}

	public int getMonth9() {
		return month9;
	}

	public void setMonth9(int month9) {
		this.month9 = month9;
	}

	public int getMonth10() {
		return month10;
	}

	public void setMonth10(int month10) {
		this.month10 = month10;
	}

	public int getMonth11() {
		return month11;
	}

	public void setMonth11(int month11) {
		this.month11 = month11;
	}

	public int getMonth12() {
		return month12;
	}

	public void setMonth12(int month12) {
		this.month12 = month12;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
