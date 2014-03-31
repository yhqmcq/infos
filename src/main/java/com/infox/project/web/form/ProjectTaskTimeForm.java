package com.infox.project.web.form;

import java.io.Serializable;
import java.util.Date;

import com.infox.common.web.page.PageHelper;

public class ProjectTaskTimeForm extends PageHelper implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	
	private String emp_id ;
	
	private String emp_name ;
	
	private String emp_email ;
	
	private String dept_id ;
	
	private String dept_name ;
	
	private String position_id ;
	
	private String position_name ;
	
	private String position_sname ;
	
	private Float quot = new Float(0);
	
	private String project_id ;
	
	private String project_name ;
	
	private String project_role ;
	
	private Date startDate ;
	
	private Date endDate ;
	
	/** 加班开始时间 */
	private Date otStartDate ;
	
	/** 加班结束时间 */
	private Date otEndDate ;
	
	/** 统计加班小时 */
	private Float totalHour ;
	
	/** 统计当前加班小时 */
	private Float totalCurrentHour ;
	
	/** 总加班率 */
	private String totalAllHourLV ;
	
	/** 当前加班率 */
	private String totalCurrentHourLV ;
	
	/** 平时加班 */
	private Float normalHour = new Float(0) ;
	
	/** 周末加班 */
	private Float weekendHour = new Float(0) ;
	
	/** 节假日加班 */
	private Float holidaysHour = new Float(0) ;
	
	/** 结算平时加班 */
	private Float normalHour1 = new Float(0) ;
	
	/** 结算周末加班 */
	private Float weekendHour1 = new Float(0) ;
	
	/** 结算节假日加班 */
	private Float holidaysHour1 = new Float(0) ;
	
	/** 剩余平时加班 */
	private Float sum1 = new Float(0) ;
	
	/** 剩余周末加班 */
	private Float sum2 = new Float(0) ;
	
	/** 剩余节假日加班 */
	private Float sum3 = new Float(0) ;
	
	
	
	/** 开始和结束日期，字符串 */
	private String sd ;
	private String ed ;
	
	private Integer Status ;
	
	/** 稼动率查询的年份 */
	private String year ;
	
	/** 总月数 */
	private float totalTaskYear ;
	
	/** 总有效工作天数 */
	private long totalTaskTime ;
	
	/** 已消耗天数 */
	private long expendDays ;
	
	/** 个人人月 */
	private float mm ;
	
	/** 个人，已消耗人月 */
	private float expendMM ;
	
	/** 所有人月的累加 */
	private float allMM ;
	
	/** 用于IN查询(0,1,2,3,4) */
	private String inStatus;
	
	/** 用于NOT IN查询(0,1,2,3,4) */
	private String notInStatus;
	
	private String truename ;
	
	private String email ;

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
	

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public Float getMonth1() {
		return month1;
	}

	public String getTruename() {
		return truename;
	}

	public Float getQuot() {
		return quot;
	}

	public void setQuot(Float quot) {
		this.quot = quot;
	}

	public void setTruename(String truename) {
		this.truename = truename;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setMonth1(Float month1) {
		this.month1 = month1;
	}

	public Float getNormalHour() {
		return normalHour;
	}

	public void setNormalHour(Float normalHour) {
		this.normalHour = normalHour;
	}

	public Float getWeekendHour() {
		return weekendHour;
	}

	public void setWeekendHour(Float weekendHour) {
		this.weekendHour = weekendHour;
	}

	public Float getNormalHour1() {
		return normalHour1;
	}

	public void setNormalHour1(Float normalHour1) {
		this.normalHour1 = normalHour1;
	}

	public Float getWeekendHour1() {
		return weekendHour1;
	}

	public void setWeekendHour1(Float weekendHour1) {
		this.weekendHour1 = weekendHour1;
	}

	public Float getHolidaysHour1() {
		return holidaysHour1;
	}

	public void setHolidaysHour1(Float holidaysHour1) {
		this.holidaysHour1 = holidaysHour1;
	}

	public Float getSum1() {
		return sum1;
	}

	public void setSum1(Float sum1) {
		this.sum1 = sum1;
	}

	public Float getSum2() {
		return sum2;
	}

	public void setSum2(Float sum2) {
		this.sum2 = sum2;
	}

	public Float getSum3() {
		return sum3;
	}

	public void setSum3(Float sum3) {
		this.sum3 = sum3;
	}

	public String getTotalCurrentHourLV() {
		return totalCurrentHourLV;
	}

	public void setTotalCurrentHourLV(String totalCurrentHourLV) {
		this.totalCurrentHourLV = totalCurrentHourLV;
	}

	public Float getHolidaysHour() {
		return holidaysHour;
	}

	public void setHolidaysHour(Float holidaysHour) {
		this.holidaysHour = holidaysHour;
	}

	public Float getMonth2() {
		return month2;
	}

	public String getTotalAllHourLV() {
		return totalAllHourLV;
	}

	public void setTotalAllHourLV(String totalAllHourLV) {
		this.totalAllHourLV = totalAllHourLV;
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

	public Date getOtStartDate() {
		return otStartDate;
	}

	public void setOtStartDate(Date otStartDate) {
		this.otStartDate = otStartDate;
	}

	public Date getOtEndDate() {
		return otEndDate;
	}

	public void setOtEndDate(Date otEndDate) {
		this.otEndDate = otEndDate;
	}

	public Float getTotalHour() {
		return totalHour;
	}

	public void setTotalHour(Float totalHour) {
		this.totalHour = totalHour;
	}

	public String getPosition_sname() {
		return position_sname;
	}

	public void setPosition_sname(String position_sname) {
		this.position_sname = position_sname;
	}

	public float getMm() {
		return mm;
	}

	public String getProject_role() {
		return project_role;
	}

	public void setProject_role(String project_role) {
		this.project_role = project_role;
	}

	public void setMm(float mm) {
		this.mm = mm;
	}

	public float getAllMM() {
		return allMM;
	}

	public String getSd() {
		return sd;
	}

	public Float getTotalCurrentHour() {
		return totalCurrentHour;
	}

	public void setTotalCurrentHour(Float totalCurrentHour) {
		this.totalCurrentHour = totalCurrentHour;
	}

	public float getTotalTaskYear() {
		return totalTaskYear;
	}

	public void setTotalTaskYear(float totalTaskYear) {
		this.totalTaskYear = totalTaskYear;
	}

	public void setSd(String sd) {
		this.sd = sd;
	}

	public String getEd() {
		return ed;
	}

	public void setEd(String ed) {
		this.ed = ed;
	}

	public void setAllMM(float allMM) {
		this.allMM = allMM;
	}

	public String getId() {
		return id;
	}

	public String getPosition_id() {
		return position_id;
	}

	public void setPosition_id(String position_id) {
		this.position_id = position_id;
	}

	public float getExpendMM() {
		return expendMM;
	}

	public void setExpendMM(float expendMM) {
		this.expendMM = expendMM;
	}

	public long getExpendDays() {
		return expendDays;
	}

	public void setExpendDays(long expendDays) {
		this.expendDays = expendDays;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getEmp_email() {
		return emp_email;
	}

	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}

	public String getDept_id() {
		return dept_id;
	}

	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
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

	public Integer getStatus() {
		return Status;
	}

	public void setStatus(Integer status) {
		Status = status;
	}


	public long getTotalTaskTime() {
		return totalTaskTime;
	}

	public void setTotalTaskTime(long totalTaskTime) {
		this.totalTaskTime = totalTaskTime;
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
	
	
}
