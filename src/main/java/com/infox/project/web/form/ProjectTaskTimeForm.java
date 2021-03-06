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
	
	/** 到岗类型（0不选,1新增、2转入、3在职，4新人培训） */
	private Integer dbmType ;
	
	/** 离岗类型（0不选,1转出——开发部、2转出——非开发部、3离职） */
	private Integer lbmType ;
	
	/** 到部门日前 */
	private String dbmDate ;
	
	/** 离开部门日前 */
	private String lbmDate ;
	
	/** 岗位变更日期 */
	private String positionDate ;
	
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
	
	private String dept_reportIds ;
	
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
	
	private String smonth1 ;
	private String smonth2 ;
	private String smonth3 ;
	private String smonth4 ;
	private String smonth5 ;
	private String smonth6 ;
	private String smonth7 ;
	private String smonth8 ;
	private String smonth9 ;
	private String smonth10 ;
	private String smonth11 ;
	private String smonth12 ;
	
	
	//标准天数
	int bzts1 ;
	int bzts2 ;
	int bzts3 ;
	int bzts4 ;
	int bzts5 ;
	int bzts6 ;
	int bzts7 ;
	int bzts8 ;
	int bzts9 ;
	int bzts10 ;
	int bzts11 ;
	int bzts12 ;
	
	private String viewType ;	//查询类型
	
	private String deptsView ; //部长,本部长
	
	private String exportDept ;	//过滤生产部门的稼动率


	public int getBzts1() {
		return bzts1;
	}

	public void setBzts1(int bzts1) {
		this.bzts1 = bzts1;
	}

	public int getBzts2() {
		return bzts2;
	}

	public void setBzts2(int bzts2) {
		this.bzts2 = bzts2;
	}

	public int getBzts3() {
		return bzts3;
	}

	public void setBzts3(int bzts3) {
		this.bzts3 = bzts3;
	}

	public int getBzts4() {
		return bzts4;
	}

	public void setBzts4(int bzts4) {
		this.bzts4 = bzts4;
	}

	public int getBzts5() {
		return bzts5;
	}

	public void setBzts5(int bzts5) {
		this.bzts5 = bzts5;
	}

	public int getBzts6() {
		return bzts6;
	}

	public void setBzts6(int bzts6) {
		this.bzts6 = bzts6;
	}

	public int getBzts7() {
		return bzts7;
	}

	public void setBzts7(int bzts7) {
		this.bzts7 = bzts7;
	}

	public int getBzts8() {
		return bzts8;
	}

	public void setBzts8(int bzts8) {
		this.bzts8 = bzts8;
	}

	public int getBzts9() {
		return bzts9;
	}

	public void setBzts9(int bzts9) {
		this.bzts9 = bzts9;
	}

	public int getBzts10() {
		return bzts10;
	}

	public void setBzts10(int bzts10) {
		this.bzts10 = bzts10;
	}

	public int getBzts11() {
		return bzts11;
	}

	public void setBzts11(int bzts11) {
		this.bzts11 = bzts11;
	}

	public int getBzts12() {
		return bzts12;
	}

	public void setBzts12(int bzts12) {
		this.bzts12 = bzts12;
	}

	public String getExportDept() {
		return exportDept;
	}

	public void setExportDept(String exportDept) {
		this.exportDept = exportDept;
	}

	public String getSmonth1() {
		return smonth1;
	}

	public void setSmonth1(String smonth1) {
		this.smonth1 = smonth1;
	}

	public String getSmonth2() {
		return smonth2;
	}

	public void setSmonth2(String smonth2) {
		this.smonth2 = smonth2;
	}

	public String getSmonth3() {
		return smonth3;
	}

	public void setSmonth3(String smonth3) {
		this.smonth3 = smonth3;
	}

	public String getSmonth4() {
		return smonth4;
	}

	public void setSmonth4(String smonth4) {
		this.smonth4 = smonth4;
	}

	public String getSmonth5() {
		return smonth5;
	}

	public void setSmonth5(String smonth5) {
		this.smonth5 = smonth5;
	}

	public String getSmonth6() {
		return smonth6;
	}

	public void setSmonth6(String smonth6) {
		this.smonth6 = smonth6;
	}

	public String getSmonth7() {
		return smonth7;
	}

	public void setSmonth7(String smonth7) {
		this.smonth7 = smonth7;
	}

	public String getSmonth8() {
		return smonth8;
	}

	public void setSmonth8(String smonth8) {
		this.smonth8 = smonth8;
	}

	public String getSmonth9() {
		return smonth9;
	}

	public void setSmonth9(String smonth9) {
		this.smonth9 = smonth9;
	}

	public String getSmonth10() {
		return smonth10;
	}

	public void setSmonth10(String smonth10) {
		this.smonth10 = smonth10;
	}

	public String getSmonth11() {
		return smonth11;
	}

	public void setSmonth11(String smonth11) {
		this.smonth11 = smonth11;
	}

	public String getSmonth12() {
		return smonth12;
	}

	public void setSmonth12(String smonth12) {
		this.smonth12 = smonth12;
	}

	public String getDept_reportIds() {
		return dept_reportIds;
	}

	public void setDept_reportIds(String dept_reportIds) {
		this.dept_reportIds = dept_reportIds;
	}

	public String getDeptsView() {
		return deptsView;
	}

	public void setDeptsView(String deptsView) {
		this.deptsView = deptsView;
	}

	public String getViewType() {
		return viewType;
	}

	public void setViewType(String viewType) {
		this.viewType = viewType;
	}

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

	public String getPositionDate() {
		return positionDate;
	}

	public void setPositionDate(String positionDate) {
		this.positionDate = positionDate;
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
