package com.infox.sysmgr.web.form;

import java.util.Date;
import java.util.List;

public class OrgDeptTreeForm {
	
	private String id ;
	
	/** 组织名称 */
	private String fullname ;
	
	/** 组织编码 */
	private String code ;
	
	/** 英文名称 */
	private String ename ;
	
	/** 简称 */
	private String sname ;

	/** 电话 */
	private String tel;
	
	/** 传真 */
	private String fax;
	
	/** 机构或部门（O, D） */
	private String type ;
	
	/** 描述 */
	private String description ;
	
	/** 创建者 */
	private String creater ;
	
	/** 修改者 */
	private String modifyer ;
	
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
	
	private String compute ;
	
	private Date created = new Date() ;
	
	private Date lastmod = new Date();
	
	private String pname ;
	
	private String text;
	private String state ;// open,closed
	private boolean checked = false;
	private Object attributes;
	private List<OrgDeptTreeForm> children;
	private String iconCls;
	private String pid;
	
	

	public String getCompute() {
		return compute;
	}

	public void setCompute(String compute) {
		this.compute = compute;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getState() {
		return state;
	}
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	public void setState(String state) {
		this.state = state;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public Object getAttributes() {
		return attributes;
	}

	public void setAttributes(Object attributes) {
		this.attributes = attributes;
	}

	public List<OrgDeptTreeForm> getChildren() {
		return children;
	}

	public void setChildren(List<OrgDeptTreeForm> children) {
		this.children = children;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
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

	public void setCode(String code) {
		this.code = code;
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

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
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
