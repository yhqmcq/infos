package com.infox.project.web.form;

import com.infox.common.web.page.PageHelper;


public class DeptJDLForm extends PageHelper{
	
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
	
	/** 是否计算部门稼动率 */
	private Integer compute = new Integer(0) ;
	
	private String pname ;
	
	private Float month1 = new Float(0) ;
	private Float month2 = new Float(0) ;
	private Float month3 = new Float(0) ;
	private Float month4 = new Float(0) ;
	private Float month5 = new Float(0) ;
	private Float month6 = new Float(0) ;
	private Float month7 = new Float(0) ;
	private Float month8 = new Float(0) ;
	private Float month9 = new Float(0) ;
	private Float month10 = new Float(0) ;
	private Float month11 = new Float(0) ;
	private Float month12 = new Float(0) ;
	
	
	
	public Integer getCompute() {
		return compute;
	}
	public void setCompute(Integer compute) {
		this.compute = compute;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Float getMonth1() {
		return month1;
	}
	public void setMonth1(Float month1) {
		this.month1 = month1;
	}
	public Float getMonth2() {
		return month2;
	}
	public void setMonth2(Float month2) {
		this.month2 = month2;
	}
	public Float getMonth3() {
		return month3;
	}
	public void setMonth3(Float month3) {
		this.month3 = month3;
	}
	public Float getMonth4() {
		return month4;
	}
	public void setMonth4(Float month4) {
		this.month4 = month4;
	}
	public Float getMonth5() {
		return month5;
	}
	public void setMonth5(Float month5) {
		this.month5 = month5;
	}
	public Float getMonth6() {
		return month6;
	}
	public void setMonth6(Float month6) {
		this.month6 = month6;
	}
	public Float getMonth7() {
		return month7;
	}
	public void setMonth7(Float month7) {
		this.month7 = month7;
	}
	public Float getMonth8() {
		return month8;
	}
	public void setMonth8(Float month8) {
		this.month8 = month8;
	}
	public Float getMonth9() {
		return month9;
	}
	public void setMonth9(Float month9) {
		this.month9 = month9;
	}
	public Float getMonth10() {
		return month10;
	}
	public void setMonth10(Float month10) {
		this.month10 = month10;
	}
	public Float getMonth11() {
		return month11;
	}
	public void setMonth11(Float month11) {
		this.month11 = month11;
	}
	public Float getMonth12() {
		return month12;
	}
	public void setMonth12(Float month12) {
		this.month12 = month12;
	}
	
	
	
}
