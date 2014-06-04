package com.infox.project.service.impl;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infox.common.dao.BaseDaoI;
import com.infox.common.util.Constants;
import com.infox.common.util.DateCal;
import com.infox.common.util.DateUtil;
import com.infox.common.util.NumberUtils;
import com.infox.common.web.page.DataGrid;
import com.infox.common.web.page.LoginInfoSession;
import com.infox.common.web.springmvc.RealPathResolver;
import com.infox.project.entity.OvertimeEntity;
import com.infox.project.entity.ProjectEmpWorkingEntity;
import com.infox.project.entity.ProjectMailListEntity;
import com.infox.project.entity.ProjectMainEntity;
import com.infox.project.service.DeptJDLServiceI;
import com.infox.project.web.form.ProjectTaskTimeForm;
import com.infox.sysmgr.entity.EmpJobEntity;
import com.infox.sysmgr.entity.EmployeeEntity;
import com.infox.sysmgr.entity.OrgDeptTreeEntity;
import com.infox.sysmgr.web.form.EmployeeForm;

@Service
@Transactional
public class DeptJDLServiceImpl implements DeptJDLServiceI {

	@Autowired
	private BaseDaoI<ProjectEmpWorkingEntity> basedaoProjectEW;
	@Autowired
	private BaseDaoI<ProjectMainEntity> basedaoProject;
	@Autowired
	private BaseDaoI<EmpJobEntity> basedaoEmpJob;
	@Autowired
	private BaseDaoI<OrgDeptTreeEntity> basedaoOrg;
	@Autowired
	private BaseDaoI<EmployeeEntity> basedaoEmployee;
	@Autowired
	private BaseDaoI<ProjectMailListEntity> basedaoMailList;
	@Autowired
	private RealPathResolver realPathResolver;
	@Autowired
	private BaseDaoI<OvertimeEntity> basedaoOvertime;

	@Override
	public DataGrid datagrid(ProjectTaskTimeForm form) throws Exception {
		DataGrid datagrid = new DataGrid();

		List<ProjectTaskTimeForm> forms = new ArrayList<ProjectTaskTimeForm>();
		List<Map<String, Object>> footer = new ArrayList<Map<String, Object>>();

		// 获取格式化对象
		NumberFormat nt = NumberFormat.getPercentInstance();
		nt.setMinimumFractionDigits(0);

		// 汇总（累积当前月的总人月/当前月的人数）
		Float month1 = new Float(0);
		Float month2 = new Float(0);
		Float month3 = new Float(0);
		Float month4 = new Float(0);
		Float month5 = new Float(0);
		Float month6 = new Float(0);
		Float month7 = new Float(0);
		Float month8 = new Float(0);
		Float month9 = new Float(0);
		Float month10 = new Float(0);
		Float month11 = new Float(0);
		Float month12 = new Float(0);
		
		//汇总（当月所以人员的总有效天数）
		Float allyxts1 = new Float(0);
		Float allyxts2 = new Float(0);
		Float allyxts3 = new Float(0);
		Float allyxts4 = new Float(0);
		Float allyxts5 = new Float(0);
		Float allyxts6 = new Float(0);
		Float allyxts7 = new Float(0);
		Float allyxts8 = new Float(0);
		Float allyxts9 = new Float(0);
		Float allyxts10 = new Float(0);
		Float allyxts11 = new Float(0);
		Float allyxts12 = new Float(0);
		
		//汇总（当月所以人员的总工作天数）
		Float allgzts1 = new Float(0);
		Float allgzts2 = new Float(0);
		Float allgzts3 = new Float(0);
		Float allgzts4 = new Float(0);
		Float allgzts5 = new Float(0);
		Float allgzts6 = new Float(0);
		Float allgzts7 = new Float(0);
		Float allgzts8 = new Float(0);
		Float allgzts9 = new Float(0);
		Float allgzts10 = new Float(0);
		Float allgzts11 = new Float(0);
		Float allgzts12 = new Float(0);
		
		//部门人员当月的标准工资天数（实际工作天数累加）
		Float m_days1 = new Float(0);
		Float m_days2 = new Float(0);
		Float m_days3 = new Float(0);
		Float m_days4 = new Float(0);
		Float m_days5 = new Float(0);
		Float m_days6 = new Float(0);
		Float m_days7 = new Float(0);
		Float m_days8 = new Float(0);
		Float m_days9 = new Float(0);
		Float m_days10 = new Float(0);
		Float m_days11 = new Float(0);
		Float m_days12 = new Float(0);
		
		//参与项目的人员工作天数
		List<String> totalJDLDay1 = new ArrayList<String>() ;
		List<String> totalJDLDay2 = new ArrayList<String>() ;
		List<String> totalJDLDay3 = new ArrayList<String>() ;
		List<String> totalJDLDay4 = new ArrayList<String>() ;
		List<String> totalJDLDay5 = new ArrayList<String>() ;
		List<String> totalJDLDay6 = new ArrayList<String>() ;
		List<String> totalJDLDay7 = new ArrayList<String>() ;
		List<String> totalJDLDay8 = new ArrayList<String>() ;
		List<String> totalJDLDay9 = new ArrayList<String>() ;
		List<String> totalJDLDay10 = new ArrayList<String>() ;
		List<String> totalJDLDay11 = new ArrayList<String>() ;
		List<String> totalJDLDay12 = new ArrayList<String>() ;
		
		//部门所有人员
		List<String> allUsers = new ArrayList<String>() ;
		//为参与的人员
		List<String> noTotalJDLDay1 = new ArrayList<String>() ;
		List<String> noTotalJDLDay2 = new ArrayList<String>() ;
		List<String> noTotalJDLDay3 = new ArrayList<String>() ;
		List<String> noTotalJDLDay4 = new ArrayList<String>() ;
		List<String> noTotalJDLDay5 = new ArrayList<String>() ;
		List<String> noTotalJDLDay6 = new ArrayList<String>() ;
		List<String> noTotalJDLDay7 = new ArrayList<String>() ;
		List<String> noTotalJDLDay8 = new ArrayList<String>() ;
		List<String> noTotalJDLDay9 = new ArrayList<String>() ;
		List<String> noTotalJDLDay10 = new ArrayList<String>() ;
		List<String> noTotalJDLDay11 = new ArrayList<String>() ;
		List<String> noTotalJDLDay12 = new ArrayList<String>() ;
		
		
		int step = 1;
		
		List<EmployeeEntity> entitys = this.find(form);
		if (null != entitys && entitys.size() > 0) {
			for (EmployeeEntity e : entitys) {
				
				
					// 总天数
					long allTotalDays = 0;
					// 总月数
					Float allTotalYear = new Float(0);
					// 总人月
					// Float allTotalMM = new Float(0) ;
					
					// 总天数消耗
					// long extTotalDays = 0 ;
					// 总月数消耗
					// Float extTotalYear = new Float(0) ;
					// 总人月消耗
					Float extTotalMM = new Float(0);
					
					// 总加班小时
					// float allOtTime = 0f ;
					float allNormalHour = 0f;
					float allWeekendHour = 0f;
					float allHolidaysHour = 0f;
					
					ProjectTaskTimeForm uf = new ProjectTaskTimeForm();
					
					uf.setEmp_id(e.getId());
					uf.setEmp_name(e.getTruename());
					uf.setDbmType(e.getDbmType()) ;
					uf.setDbmDate(e.getDbmDate()) ;
					uf.setLbmType(e.getLbmType()) ;
					uf.setLbmDate(e.getLbmDate()) ;
					
					OrgDeptTreeEntity org = e.getOrg();
					if (null != org) {
						uf.setDept_id(e.getOrg().getId());
						uf.setDept_name(e.getOrg().getSname());
					}
					
					Set<EmpJobEntity> empjobs = e.getEmpjobs();
					if (null != empjobs && empjobs.size() > 0) {
						StringBuffer sIds = new StringBuffer();
						StringBuffer sNames = new StringBuffer();
						for (EmpJobEntity ej : empjobs) {
							sIds.append(ej.getId() + ",".trim());
							sNames.append(ej.getJob_name() + ",".trim());
						}
						uf.setPosition_id(sIds.deleteCharAt(sIds.length() - 1).toString());
						uf.setPosition_name(sNames.deleteCharAt(sNames.length() - 1).toString());
					}
					
					// 加班小时
					Set<OvertimeEntity> overtime = e.getOvertime();
					for (OvertimeEntity oe : overtime) {
						// allOtTime += oe.getHour() ;
						allNormalHour += oe.getNormalHour();
						allWeekendHour += oe.getWeekendHour();
						allHolidaysHour += oe.getHolidaysHour();
					}
					
					// 当前年的一月一号
					Calendar cyear1 = Calendar.getInstance();
					cyear1.setTime(new Date());
					cyear1.set(Calendar.MONTH, 0) ;
					cyear1.set(Calendar.DAY_OF_MONTH, 1);
					
					// 当前年的一月当前日
					Calendar cyear = Calendar.getInstance();
					cyear.setTime(new Date());
					cyear.add(Calendar.YEAR, 0);
					cyear.add(Calendar.DAY_OF_MONTH, 1);
					
					Calendar c = Calendar.getInstance();
					c.setTime(cyear.getTime());
					c.add(Calendar.MONTH, 0 - (c.get(Calendar.MONTH)));
					c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
					
					c.add(Calendar.MONTH, 12 - (c.get(Calendar.MONTH)) - 1);
					c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
					
					
					
					
					// 根据年份选择
					//Map<String, Object> params = new HashMap<String, Object>();
					//params.put("empid", e.getId());
					
					// 获取个人的所有工时人月等等
					//List<ProjectEmpWorkingEntity> pews = this.basedaoProjectEW.find("select t from ProjectEmpWorkingEntity t where t.emp.id=:empid", params);
					Set<ProjectEmpWorkingEntity> pews = e.getEmpWorks() ;
					
					//如果一个人拥有两个项目,但项目A的结束日期在3.15,B项目在3.16开始,会造成汇总时数据有误,因为总的有效天数多一个了一个月的有效天数
					int dgxm=1 ;
					List<String> lastEndDate = new ArrayList<String>() ;
					
					if(null != pews && pews.size() > 0) {
						for (ProjectEmpWorkingEntity ew : pews) {
							// 计算有效天数（减去周六日）(工作多少天就加多少天)
							
							//////System.out.println("******************************begin计算总人月**************************************");
							
							Calendar ary1 = Calendar.getInstance();
							ary1.setTime(DateUtil.formatGG(DateUtil.formatG(ew.getStartDate())));
							String ym1 = ary1.get(Calendar.YEAR) + "" + ary1.get(Calendar.MONTH);
							
							Calendar ary2 = Calendar.getInstance();
							ary2.setTime(DateUtil.formatGG(DateUtil.formatG(ew.getEndDate())));
							String ym2 = ary2.get(Calendar.YEAR) + "" + ary2.get(Calendar.MONTH);
							
							Calendar cd = Calendar.getInstance();
							cd.setTime(new Date());
							
							int m = (ary2.get(Calendar.MONTH) + 1) - (ary1.get(Calendar.MONTH) + 1);
							
							// 人月累加
							Float zry = new Float(0);
							for (int i = 0; i <= m; i++) {
								
								Calendar fristDay = Calendar.getInstance();
								fristDay.setTime(new Date());
								fristDay.add(Calendar.MONTH, ((ary1.get(Calendar.MONTH) + 1) - (cd.get(Calendar.MONTH) + 1) + i));
								fristDay.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
								
								Calendar lastDay = Calendar.getInstance();
								lastDay.setTime(new Date());
								lastDay.add(Calendar.MONTH, ((ary1.get(Calendar.MONTH) + 1) - (cd.get(Calendar.MONTH) + 1) + i));
								lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));
								
								int diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
								
								// 如果是第一个月，并且不是最后一个月
								if (i == 0 && m != 0) {
									int wd = DateCal.getWorkingDays(DateUtil.formatG(ary1.getTime()), DateUtil.formatG(lastDay.getTime()));
									zry += NumberUtils.formatNum(uf.getMonth10() + ((Integer) wd).floatValue() / diff);
									//////System.out.println(DateUtil.formatG(ary1.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
								}
								// 中间月
								if (i != 0 && i != m) {
									int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
									zry += NumberUtils.formatNum(uf.getMonth10() + ((Integer) wd).floatValue() / diff);
									//////System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
								}
								// 最后一个月，但开始和结束不是在同一个月
								if (i == m && !ym1.equals(ym2)) {
									int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
									zry += NumberUtils.formatNum(uf.getMonth10() + ((Integer) wd).floatValue() / diff);
									//////System.out.println("end======"+DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
								}
								// 开始和结束是在同一个月
								if (ym1.equals(ym2)) {
									int wd = DateCal.getWorkingDays(DateUtil.formatG(ew.getStartDate()), DateUtil.formatG(ew.getEndDate()));
									zry += NumberUtils.formatNum(uf.getMonth10() + ((Integer) wd).floatValue() / diff);
									//////System.out.println(DateUtil.formatG(ew.getStartDate())+"=="+DateUtil.formatG(ew.getEndDate())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
								}
							}
							
							// 总月数（实际的工作天数除以当月的有效天数） 只能算消耗的？
							allTotalYear += NumberUtils.formatNum(zry);
							zry = 0f;
							//////System.out.println("*********************************end计算总人月*************************************\r\n");
							
							
							//////System.out.println("*********************************begin计算每个月的人月*************************************");
							
							//这里会修改数据库的数据
							//ew.setStartDate(DateUtil.formatGG("2014-01-01")) ;
							
							Calendar ary11 = Calendar.getInstance();
							ary11.setTime(DateUtil.formatGG(DateUtil.formatG(ew.getStartDate())));
							String ym11 = ary11.get(Calendar.YEAR) + "" + (ary11.get(Calendar.MONTH)+1);
							
							Calendar ary22 = Calendar.getInstance();
							ary22.setTime(DateUtil.formatGG(DateUtil.formatG(ew.getEndDate())));
							String ym22 = ary22.get(Calendar.YEAR) + "" + (ary22.get(Calendar.MONTH)+1);
							
							Calendar cd1 = Calendar.getInstance();
							cd1.setTime(new Date());
							
							//////System.out.println(DateUtil.formatG(ew.getStartDate())+"============"+ary11.get(Calendar.YEAR) + "==============" + cd1.get(Calendar.YEAR));
							//判断年份，如果开始日期的年份小于当前年份，则将开始日期重置为当前年的一月一号，在计算稼动率，稼动率只算今天的。
							if(ary11.get(Calendar.YEAR) < cd1.get(Calendar.YEAR)) {
								ary11.set(Calendar.YEAR, cd1.get(Calendar.YEAR)) ;
								ary11.set(Calendar.MONTH, 0) ;
								ary11.set(Calendar.DAY_OF_MONTH, 1) ;
							}
							
							int wdcc = DateUtil.compare_date2(DateUtil.formatG(ew.getEndDate()), DateUtil.formatG(cyear1.getTime())) ;
							if(wdcc == 1) {
								
								int m2 = (ary22.get(Calendar.MONTH) + 1) - (ary11.get(Calendar.MONTH) + 1);
								
								int startDateMonth = (ary11.get(Calendar.MONTH) + 1) ;
								int currentMonth = (cd1.get(Calendar.MONTH) + 1) ;
								
								
								
								int month_for = startDateMonth - currentMonth ;
								for (int i = 0; i <= m2; i++) {
									//人月
									Float fc = new Float(0);
									//当前月的实际有效天数
									Float sjyxts = new Float(0) ;
									//当前月的实际工作天数
									Float sjgzts = new Float(0) ;
									
									//当月稼动率=（项目天数*系数）/21
									Float quot = new Float(0) ;
									
									
									Float month_days = new Float(0);
									
									Calendar fristDay = Calendar.getInstance();
									fristDay.setTime(new Date());
									fristDay.add(Calendar.MONTH, month_for + i);
									fristDay.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
									
									Calendar lastDay = Calendar.getInstance();
									lastDay.setTime(new Date());
									lastDay.add(Calendar.MONTH, month_for + i);
									lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));
									
									int diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
									
									// 如果是第一个月，并且不是最后一个月
									if (i == 0 && m2 != 0) {
										//开始日期和当前日期不在同一个月才进行就是,如果开始日期和当前日期是在同一个月则由下面的当月进行计算
										if(!ym11.equals((cd.get(Calendar.YEAR) + "" + (cd.get(Calendar.MONTH) + 1)))) {
											
											//判断该员工的到部门类型是否新增或转入
											EmployeeEntity emp = ew.getEmp() ;
											if(null != emp.getDbmType() && !"".equals(emp.getDbmType())) {
												if(emp.getDbmType() == 1 || emp.getDbmType() == 2 || emp.getDbmType() == 5 || emp.getDbmType() == 4 || emp.getDbmType() == 6) {
													Calendar dbc = Calendar.getInstance() ;
													dbc.setTime(DateUtil.formatGG(emp.getDbmDate())) ;
													if((dbc.get(Calendar.YEAR) + "" + (dbc.get(Calendar.MONTH) + 1)).equals((fristDay.get(Calendar.YEAR) + "" + (fristDay.get(Calendar.MONTH) + 1)))) {
														diff = DateCal.getWorkingDays(emp.getDbmDate(), DateUtil.formatG(lastDay.getTime()));
														////System.out.println("到部门-标准天数：" + diff +"=="+emp.getDbmDate()+"=="+DateUtil.formatG(lastDay.getTime()));
													}
												}
											}
											lastEndDate.add(DateUtil.formatG(ew.getEndDate())) ;
											int wd = DateCal.getWorkingDays(DateUtil.formatG(ary11.getTime()), DateUtil.formatG(lastDay.getTime()));
											fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
											
											sjyxts = ((Integer)diff).floatValue() ;
											sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
											
											quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
											allTotalDays += wd ;
											System.out.println(DateUtil.formatG(ary11.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  1稼动率"+quot);
											month_days = (float) wd * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
										}
										
										
										//如果一个人拥有两个项目,但项目A的结束日期在3.15,B项目在3.16开始,会造成汇总时数据有误,因为总的有效天数多一个了一个月的有效天数
										if(dgxm>1) {
											String d = lastEndDate.get(lastEndDate.size()-1) ;
											Calendar ccc = Calendar.getInstance() ;
											ccc.setTime(DateUtil.formatGG(d)) ;
											
											Calendar ddd = Calendar.getInstance() ;
											ddd.setTime(ew.getStartDate()) ;
											String c1 = ccc.get(Calendar.YEAR)+""+(ccc.get(Calendar.MONTH)+1) ;
											String d1 = ddd.get(Calendar.YEAR)+""+(ddd.get(Calendar.MONTH)+1) ;
											
											if(c1.equals(d1)) {
												//System.out.println("" + ew.getEmp().getTruename()+"=-====1======"+dgxm+"---"+sjyxts);
												
												switch (ccc.get(Calendar.MONTH)+1) {
												case 1:
													allyxts1 = allyxts1 - sjyxts ;
													break;
												case 2:
													allyxts2 = allyxts2 - sjyxts ;
													break;
												case 3:
													allyxts3 = allyxts3 - sjyxts ;
													break;
												case 4:
													allyxts4 = allyxts4 - sjyxts ;
													break;
												case 5:
													allyxts5 = allyxts5 - sjyxts ;
													break;
												case 6:
													allyxts6 = allyxts6 - sjyxts ;
													break;
												case 7:
													allyxts7 = allyxts7 - sjyxts ;
													break;
												case 8:
													allyxts8 = allyxts8 - sjyxts ;
													break;
												case 9:
													allyxts9 = allyxts9 - sjyxts ;
													break;
												case 10:
													allyxts10 = allyxts10 - sjyxts ;
													break;
												case 11:
													allyxts11 = allyxts12 - sjyxts ;
													break;
												case 12:
													allyxts12 = allyxts12 - sjyxts ;
													break;
												default:
													break;
												}
											}
										}
										
										
										
										Float sjyxts1 = new Float(0) ;
										//如果到部门的日期是否小于进入项目的开始日期，如果是则计算之前月份的标准天数，如（到部门：2014-02-17 进项目的开始日期：2014-04-01）也需要计算2、3月份的标准天数（2月10天，3月21天）
										//if(null != e.getDbmDate() && !"".equals(e.getDbmDate())) {
										//System.out.println("到部门时间："+e.getDbmDate() + "  进项目的开始工作时间："+ew.getStartDate());
										
										Calendar dbmsj = Calendar.getInstance() ;
										dbmsj.setTime(new Date()) ;
										
										//在职，则为旧员工，则按当前年的一月一号来计算
										if(e.getDbmType() == 3) {
											dbmsj.set(Calendar.MONTH, 0) ;
											dbmsj.set(Calendar.DAY_OF_MONTH, 1);
											
										} else {	//转入或其他的则按到部门时间来计算
											dbmsj.setTime(DateUtil.formatGG(e.getDbmDate())) ;
										}
										
										//到部门的时间
										Calendar dbmCal = Calendar.getInstance() ;
										dbmCal.setTime(dbmsj.getTime()) ;
										
										//进项目工作的开始时间
										Calendar projectStartCal = Calendar.getInstance() ;
										projectStartCal.setTime(ew.getStartDate()) ;
										
										int ps = (projectStartCal.get(Calendar.MONTH)+1) ;
										int dbmDate = (dbmCal.get(Calendar.MONTH)+1) ;
										
										if(dbmDate < ps) {
											
											int months = ps - dbmDate ;
											for(int di=1; di<months+1; di++) {
												int swithMonth = 0 ;
												
												//说明，当前月相隔到部门的月只是相差一个月，所以不能按整月的有效天数计算，只能按到部门的实际日期来计算
												if(di == 1) {
													swithMonth = (dbmCal.get(Calendar.MONTH)+1) ;
													
													//最后一天
													Calendar dbmCalLast = Calendar.getInstance() ;
													dbmCalLast.setTime(dbmCal.getTime()) ;
													dbmCalLast.set(Calendar.DAY_OF_MONTH, dbmCal.getActualMaximum(Calendar.DAY_OF_MONTH));
													
													int workingDays = DateCal.getWorkingDays(DateUtil.formatG(dbmCal.getTime()), DateUtil.formatG(dbmCalLast.getTime()));
													
													sjyxts1 = ((Integer)workingDays).floatValue() ;
													//System.out.println("=1=="+DateUtil.formatG(dbmCal.getTime())+"="+DateUtil.formatG(dbmCalLast.getTime()) +"===" + sjyxts1);
													
													
													if(dgxm>1) {
														switch (swithMonth) {
														case 1:
															allyxts1 = allyxts1 - sjyxts1 ;
															break;
														case 2:
															allyxts2 = allyxts2 - sjyxts1 ;
															break;
														case 3:
															allyxts3 = allyxts3 - sjyxts1 ;
															break;
														case 4:
															allyxts4 = allyxts4 - sjyxts1 ;
															break;
														case 5:
															allyxts5 = allyxts5 - sjyxts1 ;
															break;
														case 6:
															allyxts6 = allyxts6 - sjyxts1 ;
															break;
														case 7:
															allyxts7 = allyxts7 - sjyxts1 ;
															break;
														case 8:
															allyxts8 = allyxts8 - sjyxts1 ;
															break;
														case 9:
															allyxts9 = allyxts9 - sjyxts1 ;
															break;
														case 10:
															allyxts10 = allyxts10 - sjyxts1 ;
															break;
														case 11:
															allyxts11 = allyxts12 - sjyxts1 ;
															break;
														case 12:
															allyxts12 = allyxts12 - sjyxts1 ;
															break;
														default:
															break;
														}
													}
												}
												if(di > 1) {
													int setMonth = dbmDate++ ;
													
													dbmCal.set(Calendar.MONTH, setMonth) ;
													dbmCal.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
													String d1 = DateUtil.formatG(dbmCal.getTime()) ;
													
													dbmCal.set(Calendar.DAY_OF_MONTH, dbmCal.getActualMaximum(Calendar.DAY_OF_MONTH));
													String d2 = DateUtil.formatG(dbmCal.getTime()) ;
													
													int workingDays = DateCal.getWorkingDays(d1, d2);
													
													sjyxts1 = ((Integer)workingDays).floatValue() ;
													
													swithMonth = (dbmCal.get(Calendar.MONTH)+1) ;
													
													//System.out.println("=2=="+d1 +"==="+d2 +"===" + sjyxts1);
													
													if(dgxm>1) {
														switch (swithMonth) {
														case 1:
															allyxts1 = allyxts1 - sjyxts1 ;
															break;
														case 2:
															allyxts2 = allyxts2 - sjyxts1 ;
															break;
														case 3:
															allyxts3 = allyxts3 - sjyxts1 ;
															break;
														case 4:
															allyxts4 = allyxts4 - sjyxts1 ;
															break;
														case 5:
															allyxts5 = allyxts5 - sjyxts1 ;
															break;
														case 6:
															allyxts6 = allyxts6 - sjyxts1 ;
															break;
														case 7:
															allyxts7 = allyxts7 - sjyxts1 ;
															break;
														case 8:
															allyxts8 = allyxts8 - sjyxts1 ;
															break;
														case 9:
															allyxts9 = allyxts9 - sjyxts1 ;
															break;
														case 10:
															allyxts10 = allyxts10 - sjyxts1 ;
															break;
														case 11:
															allyxts11 = allyxts12 - sjyxts1 ;
															break;
														case 12:
															allyxts12 = allyxts12 - sjyxts1 ;
															break;
														default:
															break;
														}
													}
												}
												
												
												
												switch (swithMonth) {
												case 1:
													allyxts1 += sjyxts1 ;
													break;
												case 2:
													allyxts2 += sjyxts1 ;
													break;
												case 3:
													allyxts3 += sjyxts1 ;
													break;
												case 4:
													allyxts4 += sjyxts1 ;
													break;
												case 5:
													allyxts5 += sjyxts1 ;
													break;
												case 6:
													allyxts6 += sjyxts1 ;
													break;
												case 7:
													allyxts7 += sjyxts1 ;
													break;
												case 8:
													allyxts8 += sjyxts1 ;
													break;
												case 9:
													allyxts9 += sjyxts1 ;
													break;
												case 10:
													allyxts10 += sjyxts1 ;
													break;
												case 11:
													allyxts11 += sjyxts1 ;
													break;
												case 12:
													allyxts12 += sjyxts1 ;
													break;
												default:
													break;
												}
											}
											//}
										}
										
									}
									// 中间月
									if (i != 0 && i != m2) {
										
										//如果这个月等于当前月
										if((fristDay.get(Calendar.YEAR) + "" + (fristDay.get(Calendar.MONTH) + 1)).equals((cd.get(Calendar.YEAR) + "" + (cd.get(Calendar.MONTH) + 1)))) {
											int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(new Date()));
											fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
											
											sjyxts = ((Integer)diff).floatValue() ;
											sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
											
											quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
											allTotalDays += wd ;
											System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  2稼动率1="+quot);
											
											month_days = (float) wd * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
										} else {
											int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
											fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
											
											sjyxts = ((Integer)diff).floatValue() ;
											sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
											
											quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
											allTotalDays += wd ;
											System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  2稼动率2="+quot);
											
											month_days = (float) wd * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
										}
										
										
										int count = 0 ;
										int aa = DateUtil.compare_date2(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(new Date())) ;
										if(aa>=0){
											sjyxts = 0f ;
											List<EmployeeEntity> totalEntitys = this.find(form);
											for (EmployeeEntity ec : totalEntitys) {
												if(null == ec.getLbmType()) {
													count ++ ;
												} else {
													if(2!=ec.getLbmType() && 3!=ec.getLbmType()&& 4!=ec.getLbmType()) {
														count ++ ;
													}
												}
											}
											
											//System.out.println("中间："+count*diff+"=="+(((Integer)count).floatValue() * ((Integer)diff).floatValue()));
											switch ((fristDay.get(Calendar.MONTH) + 1)) {
											case 1:
												allyxts1 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 2:
												allyxts2 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 3:
												allyxts3 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 4:
												allyxts4 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 5:
												allyxts5 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 6:
												allyxts6 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 7:
												allyxts7 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 8:
												allyxts8 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 9:
												allyxts9 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 10:
												allyxts10 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 11:
												allyxts11 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 12:
												allyxts12 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											default:
												break;
											}
										}
									}
									
									
									// 最后一个月，但开始和结束不是在同一个月
									if (i == m2 && !ym11.equals(ym22)) {
										
										//如果是退出项目的，则下面的来计算
										if(ew.getStatus() == 4) {
											int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
											fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
											
											
											sjyxts = ((Integer)diff).floatValue() ;
											sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
											
											quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
											
											lastEndDate.add(DateUtil.formatG(ew.getEndDate())) ;
											allTotalDays += wd ;
											System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  3稼0动率"+quot);
											
											month_days = (float) wd * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
										}
										
										//并且不是已退出项目的
										if(ew.getStatus() != 4) {
											EmployeeEntity emp = ew.getEmp() ;
											//判断该员工的离部门类型是否离职或转出
											if(null != emp.getLbmType() && !"".equals(emp.getLbmType())) {
												if(emp.getLbmType() == 1) {
													Calendar dbc = Calendar.getInstance() ;
													
													//离开部门（转出-到开发部，但还在开发部，并且还是在当前项目中，计算稼动率则按当前项目的结束时间来计算）
													dbc.setTime(DateUtil.formatGG(emp.getLbmDate())) ;
													if((dbc.get(Calendar.YEAR) + "" + (dbc.get(Calendar.MONTH) + 1)).equals((fristDay.get(Calendar.YEAR) + "" + (fristDay.get(Calendar.MONTH) + 1)))) {
														diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
														System.out.println("离部门（转出-开发部，但还在项目中）-标准天数：" + diff +"=="+DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate()));
													}
												}
												
												//（转出-到非开发部，离职，停薪留职，计算方式一样，按转出的日期计算）
												if(emp.getLbmType() == 2 || emp.getLbmType() == 3 || emp.getLbmType() == 4) {
													
													diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), emp.getLbmDate());
													System.out.println("离部门（转出-非开发部，离职，停薪留职）-标准天数：" + diff +"=="+DateUtil.formatG(fristDay.getTime())+"=="+emp.getLbmDate());
													
													//如果离部门时间小于项目的结束时间，则按离部门时间计算，并修改项目的结束时间为离部门时间
													int cdd1 = DateUtil.compare_date2(emp.getLbmDate(), DateUtil.formatG(ew.getEndDate())) ;
													if(cdd1 == -1) {
														ew.setEndDate(DateUtil.formatGG(emp.getLbmDate())) ;
													}
												}
											}
											
											//如果这个月等于当前月
											if((fristDay.get(Calendar.YEAR) + "" + (fristDay.get(Calendar.MONTH) + 1)).equals((cd.get(Calendar.YEAR) + "" + (cd.get(Calendar.MONTH) + 1)))) {
												//判断当前日期是否小于结束日期，如果小于则按当前日期来计算，否则按结束日期来计算
												int cdd1 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(ew.getEndDate())) ;
												if(cdd1 == -1) {
													int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(new Date()));
													fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
													
													sjyxts = ((Integer)diff).floatValue() ;
													sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
													
													quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
													System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  3稼1动率"+quot);
													
													month_days = (float) wd * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
												} else {
													int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
													fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
													
													sjyxts = ((Integer)diff).floatValue() ;
													sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
													allTotalDays += wd ;
													quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
													System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  3稼2动率"+quot);
													
													month_days = (float) wd * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
												}
											} else {
												int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
												fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
												
												sjyxts = ((Integer)diff).floatValue() ;
												sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
												
												quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
												allTotalDays += wd ;
												System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  3稼3动率"+quot);
												
												month_days = (float) wd * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
											}
										}
										
										int count = 0 ;
										int aa = DateUtil.compare_date2(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(new Date())) ;
										if(aa>=0){
											sjyxts = 0f;
											List<EmployeeEntity> totalEntitys = this.find(form);
											for (EmployeeEntity ec : totalEntitys) {
												if(null == ec.getLbmType()) {
													count ++ ;
												} else {
													if(2!=ec.getLbmType() && 3!=ec.getLbmType()&& 4!=ec.getLbmType()) {
														count ++ ;
													}
												}
											}
											switch ((fristDay.get(Calendar.MONTH) + 1)) {
											case 1:
												allyxts1 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 2:
												allyxts2 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 3:
												allyxts3 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 4:
												allyxts4 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 5:
												allyxts5 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 6:
												allyxts6 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 7:
												allyxts7 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 8:
												allyxts8 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 9:
												allyxts9 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 10:
												allyxts10 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 11:
												allyxts11 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											case 12:
												allyxts12 = (((Integer)count).floatValue() * ((Integer)diff).floatValue()) ;
												break;
											default:
												break;
											}
										}
									}
									
									
									
									// 开始和结束是在同一个月
									if (ym11.equals(ym22)) {
										lastEndDate.add(DateUtil.formatG(ew.getEndDate())) ;
										EmployeeEntity emp = ew.getEmp() ;
										//判断该员工的到部门类型是否新增或转入
										if(null != emp.getDbmType() && !"".equals(emp.getDbmType())) {
											if(emp.getDbmType() == 1 || emp.getDbmType() == 2 || emp.getDbmType() == 5 || emp.getDbmType() == 4 || emp.getDbmType() == 6) {
												Calendar dbc = Calendar.getInstance() ;
												dbc.setTime(DateUtil.formatGG(emp.getDbmDate())) ;
												if((dbc.get(Calendar.YEAR) + "" + (dbc.get(Calendar.MONTH) + 1)).equals((fristDay.get(Calendar.YEAR) + "" + (fristDay.get(Calendar.MONTH) + 1)))) {
													diff = DateCal.getWorkingDays(emp.getDbmDate(), DateUtil.formatG(lastDay.getTime()));
													System.out.println("到部门-标准天数：" + diff +"=="+emp.getDbmDate()+"=="+DateUtil.formatG(lastDay.getTime()));
												}
											}
										}
										//判断该员工的离部门类型是否离职或转出
										if(null != emp.getLbmType() && !"".equals(emp.getLbmType())) {
											if(emp.getLbmType() == 1) {
												Calendar dbc = Calendar.getInstance() ;
												dbc.setTime(DateUtil.formatGG(emp.getLbmDate())) ;
												if((dbc.get(Calendar.YEAR) + "" + (dbc.get(Calendar.MONTH) + 1)).equals((fristDay.get(Calendar.YEAR) + "" + (fristDay.get(Calendar.MONTH) + 1)))) {
													diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
													System.out.println("离部门（转出-开发部）-标准天数：" + diff +"=="+DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate()));
												}
											}
											if(emp.getLbmType() == 2 || emp.getLbmType() == 3 || emp.getLbmType() == 4) {
												Calendar dbc = Calendar.getInstance() ;
												dbc.setTime(DateUtil.formatGG(emp.getLbmDate())) ;
												if((dbc.get(Calendar.YEAR) + "" + (dbc.get(Calendar.MONTH) + 1)).equals((fristDay.get(Calendar.YEAR) + "" + (fristDay.get(Calendar.MONTH) + 1)))) {
													diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), emp.getLbmDate());
													System.out.println("离部门（转出-非开发部，离职，停薪留职）-标准天数：" + diff +"=="+DateUtil.formatG(fristDay.getTime())+"=="+emp.getLbmDate());
													
													//如果离部门时间小于项目的结束时间，则按离部门时间计算，并修改项目的结束时间为离部门时间
													int cdd1 = DateUtil.compare_date2(emp.getLbmDate(), DateUtil.formatG(ew.getEndDate())) ;
													if(cdd1 == -1) {
														ew.setEndDate(DateUtil.formatGG(emp.getLbmDate())) ;
													}
												}
											}
										}
										
										//判断当前日期是否小于结束日期，如果小于则按当前日期来计算，否则按结束日期来计算
										int cdd1 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(ew.getEndDate())) ;
										if(cdd1 == -1) {
											int wd = DateCal.getWorkingDays(DateUtil.formatG(ew.getStartDate()), DateUtil.formatG(new Date()));
											fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
											
											sjyxts = ((Integer)diff).floatValue() ;
											sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
											
											quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
											
											allTotalDays += wd ;
											System.out.println(DateUtil.formatG(ew.getStartDate())+"=="+DateUtil.formatG(ew.getEndDate())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  4稼1动率"+quot);
											
											month_days = (float) wd * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
										} else {
											int wd = DateCal.getWorkingDays(DateUtil.formatG(ew.getStartDate()), DateUtil.formatG(ew.getEndDate()));
											fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
											
											sjyxts = ((Integer)diff).floatValue() ;
											sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
											
											quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
											
											allTotalDays += wd ;
											System.out.println(DateUtil.formatG(ew.getStartDate())+"=="+DateUtil.formatG(ew.getEndDate())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  4稼2动率"+quot);
											
											month_days = (float) wd * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
										}
									}
									
									
									// 当前月
									if (!ym11.equals(ym22) && (fristDay.get(Calendar.YEAR) + "" + (fristDay.get(Calendar.MONTH) + 1)).equals((cd.get(Calendar.YEAR) + "" + (cd.get(Calendar.MONTH) + 1)))) {
										EmployeeEntity emp = ew.getEmp() ;
										//判断该员工的到部门类型是否新增或转入
										if(null != emp.getDbmType() && !"".equals(emp.getDbmType())) {
											if(emp.getDbmType() == 1 || emp.getDbmType() == 2 || emp.getDbmType() == 5 || emp.getDbmType() == 4 || emp.getDbmType() == 6) {
												Calendar dbc = Calendar.getInstance() ;
												dbc.setTime(DateUtil.formatGG(emp.getDbmDate())) ;
												if((dbc.get(Calendar.YEAR) + "" + (dbc.get(Calendar.MONTH) + 1)).equals((fristDay.get(Calendar.YEAR) + "" + (fristDay.get(Calendar.MONTH) + 1)))) {
													diff = DateCal.getWorkingDays(emp.getDbmDate(), DateUtil.formatG(lastDay.getTime()));
													System.out.println("到部门-标准天数：" + diff +"=="+emp.getDbmDate()+"=="+DateUtil.formatG(lastDay.getTime()));
												}
											}
										}
										//判断该员工的离部门类型是否离职或转出
										if(null != emp.getLbmType() && !"".equals(emp.getLbmType())) {
											if(emp.getLbmType() == 1) {
												Calendar dbc = Calendar.getInstance() ;
												dbc.setTime(DateUtil.formatGG(emp.getLbmDate())) ;
												if((dbc.get(Calendar.YEAR) + "" + (dbc.get(Calendar.MONTH) + 1)).equals((fristDay.get(Calendar.YEAR) + "" + (fristDay.get(Calendar.MONTH) + 1)))) {
													diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
													System.out.println("离部门（转出-开发部）-标准天数：" + diff +"=="+DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate()));
												}
											}
											if(emp.getLbmType() == 2 || emp.getLbmType() == 3 || emp.getLbmType() == 4) {
												Calendar dbc = Calendar.getInstance() ;
												dbc.setTime(DateUtil.formatGG(emp.getLbmDate())) ;
												if((dbc.get(Calendar.YEAR) + "" + (dbc.get(Calendar.MONTH) + 1)).equals((fristDay.get(Calendar.YEAR) + "" + (fristDay.get(Calendar.MONTH) + 1)))) {
													diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), emp.getLbmDate());
													System.out.println("离部门（转出-非开发部，离职，停薪留职）-标准天数：" + diff +"=="+DateUtil.formatG(fristDay.getTime())+"=="+emp.getLbmDate());
													
													//如果离部门时间小于项目的结束时间，则按离部门时间计算，并修改项目的结束时间为离部门时间
													int cdd1 = DateUtil.compare_date2(emp.getLbmDate(), DateUtil.formatG(ew.getEndDate())) ;
													if(cdd1 == -1) {
														ew.setEndDate(DateUtil.formatGG(emp.getLbmDate())) ;
													}
												}
											}
										}
										
										// 表示该人员已退出项目，按退出时间来计算
										if (ew.getStatus() == 4) {
											//判断当前日期是否小于结束日期，如果小于则按当前日期来计算，否则按结束日期来计算
											int cdd1 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(ew.getEndDate())) ;
											if(cdd1 == -1) {
												int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(new Date()));
												fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
												
												sjyxts = ((Integer)diff).floatValue() ;
												sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
												
												quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
												System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  5稼动率"+quot);
												
												month_days = (float) wd * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
											} else {
												int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
												fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
												
												sjyxts = ((Integer)diff).floatValue() ;
												sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
												
												quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
												
												allTotalDays += wd ;
												System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  5稼动率"+quot);
												
												month_days = (float) wd * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
											}
										}
										
										
										
										if(ym11.equals((cd.get(Calendar.YEAR) + "" + (cd.get(Calendar.MONTH) + 1)))) {
											int wd = DateCal.getWorkingDays(DateUtil.formatG(ew.getStartDate()), DateUtil.formatG(new Date()));
											fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
											
											sjyxts = ((Integer)diff).floatValue() ;
											sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
											
											quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
											
											allTotalDays += wd ;
											System.out.println(DateUtil.formatG(ew.getStartDate())+"=="+DateUtil.formatG(new Date())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  --6稼动率"+quot);
											
											month_days = (float) wd * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
										}
										//allyxts4 = 152f;
										
										
										
										
										//如果到部门的日期是否小于进入项目的开始日期，如果是则计算之前月份的标准天数，如（到部门：2014-02-17 进项目的开始日期：2014-04-01）也需要计算2、3月份的标准天数（2月10天，3月21天）
										if(null != e.getDbmDate() && !"".equals(e.getDbmDate())) {
											//////System.out.println("到部门时间："+e.getDbmDate() + "  进项目的开始工作时间："+ew.getStartDate());
											
											//到部门的时间
											Calendar dbmCal = Calendar.getInstance() ;
											dbmCal.setTime(DateUtil.formatGG(e.getDbmDate())) ;
											
											//进项目工作的开始时间
											Calendar projectStartCal = Calendar.getInstance() ;
											projectStartCal.setTime(ew.getStartDate()) ;
											
											int ps = (projectStartCal.get(Calendar.MONTH)+1) ;
											int dbmDate = (dbmCal.get(Calendar.MONTH)+1) ;
											
											if(dbmDate < ps) {
												int months = ps - dbmDate ;
												for(int di=1; di<months+1; di++) {
													int swithMonth = 0 ;
													
													//说明，当前月相隔到部门的月只是相差一个月，所以不能按整月的有效天数计算，只能按到部门的实际日期来计算
													if(di == 1) {
														swithMonth = (dbmCal.get(Calendar.MONTH)+1) ;
														
														//最后一天
														Calendar dbmCalLast = Calendar.getInstance() ;
														dbmCalLast.setTime(DateUtil.formatGG(e.getDbmDate())) ;
														dbmCalLast.set(Calendar.DAY_OF_MONTH, dbmCal.getActualMaximum(Calendar.DAY_OF_MONTH));
														
														int workingDays = DateCal.getWorkingDays(e.getDbmDate(), DateUtil.formatG(dbmCalLast.getTime()));
														
														sjyxts = ((Integer)workingDays).floatValue() ;
														System.out.println("==="+e.getDbmDate()+"="+DateUtil.formatG(dbmCalLast.getTime()) +"===" + sjyxts);
													}
													
													if(di > 1) {
														int setMonth = dbmDate++ ;
														
														System.out.println(DateUtil.formatG(dbmCal.getTime()) +"==="+dbmCal.get(Calendar.MONTH)+"=="+di+"==" + ((di-(dbmCal.get(Calendar.MONTH)==0?dbmCal.get(Calendar.MONTH)+1:dbmCal.get(Calendar.MONTH)))+1));
														dbmCal.set(Calendar.MONTH, setMonth) ;
														
														dbmCal.set(Calendar.MONTH, setMonth) ;
														dbmCal.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
														String d1 = DateUtil.formatG(dbmCal.getTime()) ;
														
														dbmCal.set(Calendar.DAY_OF_MONTH, dbmCal.getActualMaximum(Calendar.DAY_OF_MONTH));
														String d2 = DateUtil.formatG(dbmCal.getTime()) ;
														
														int workingDays = DateCal.getWorkingDays(d1, d2);
														
														sjyxts = ((Integer)workingDays).floatValue() ;
														
														swithMonth = (dbmCal.get(Calendar.MONTH)+1) ;
														
														System.out.println("==="+d1 +"==="+d2 +"===" + sjyxts);
													}
													
													switch (swithMonth) {
													case 1:
														allyxts1 += sjyxts ;
														break;
													case 2:
														allyxts2 += sjyxts ;
														break;
													case 3:
														allyxts3 += sjyxts ;
														break;
													case 4:
														allyxts4 += sjyxts ;
														break;
													case 5:
														allyxts5 += sjyxts ;
														break;
													case 6:
														allyxts6 += sjyxts ;
														break;
													case 7:
														allyxts7 += sjyxts ;
														break;
													case 8:
														allyxts8 += sjyxts ;
														break;
													case 9:
														allyxts9 += sjyxts ;
														break;
													case 10:
														allyxts10 += sjyxts ;
														break;
													case 11:
														allyxts11 += sjyxts ;
														break;
													case 12:
														allyxts12 += sjyxts ;
														break;
													default:
														break;
													}
												}
											}
											
										}
										
									}
									
									if (!ym11.equals(ym22) && (fristDay.get(Calendar.YEAR) + "" + (fristDay.get(Calendar.MONTH) + 1)).equals((cd.get(Calendar.YEAR) + "" + (cd.get(Calendar.MONTH) + 1)))) {
										if(step==1) {
											step ++ ;
											Float ext_d = new Float(0) ;
											Calendar cm1 = Calendar.getInstance() ;
											cm1.setTime(new Date()) ;
											cm1.set(Calendar.DAY_OF_MONTH, 1);
											
											Calendar cm2 = Calendar.getInstance() ;
											cm2.setTime(new Date()) ;
											cm2.set(Calendar.DAY_OF_MONTH, cm2.getActualMaximum(Calendar.DAY_OF_MONTH));
											
											int workingDays2 = DateCal.getWorkingDays(DateUtil.formatG(cm1.getTime()), DateUtil.formatG(cm2.getTime())) ;
											
											int aa = DateUtil.compare_date2(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(new Date())) ;
											if(aa<=0){
												
												List<EmployeeEntity> totalEntitys = this.find(form);
												for (EmployeeEntity ec : totalEntitys) {
													
													List<ProjectEmpWorkingEntity> find = this.basedaoProjectEW.find("select t from ProjectEmpWorkingEntity t where t.emp.lbmType is null and t.endDate<'"+DateUtil.formatG(fristDay.getTime())+"' and t.emp.id='"+ec.getId()+"' order by t.endDate") ;
													ext_d += (null != find?find.size()*workingDays2:0f) ;
												}
												//System.out.println("-------------------"+allyxts4+"...."+diff+".....-==+"+count+".........-=="+ext_d);
												
												switch ((fristDay.get(Calendar.MONTH) + 1)) {
												case 1:
													allyxts1 += ext_d ;
													break;
												case 2:
													allyxts2 += ext_d ;
													break;
												case 3:
													allyxts3 += ext_d ;
													break;
												case 4:
													allyxts4 += ext_d ;
													break;
												case 5:
													allyxts5 += ext_d ;
													break;
												case 6:
													allyxts6 += ext_d ;
													break;
												case 7:
													allyxts7 += ext_d ;
													break;
												case 8:
													allyxts8 += ext_d ;
													break;
												case 9:
													allyxts9 += ext_d ;
													break;
												case 10:
													allyxts10 += ext_d ;
													break;
												case 11:
													allyxts11 += ext_d ;
													break;
												case 12:
													allyxts12 += ext_d ;
													break;
												default:
													break;
												}
											}
										}
									}
									
									switch ((fristDay.get(Calendar.MONTH) + 1)) {
									case 1:
										totalJDLDay1.add(e.getTruename()) ;
										
										//原本是fc的,人月
										//uf.setMonth1(NumberUtils.formatNum(uf.getMonth1() + fc));
										System.out.println("====1===="+quot+"====="+month_days);
										m_days1 += month_days ;
										
										uf.setMonth1(NumberUtils.formatNum(uf.getMonth1() + quot));
										month1 += uf.getMonth1();
										allyxts1 += sjyxts ;
										allgzts1 += sjgzts ;
										break;
									case 2:
										totalJDLDay2.add(e.getTruename()) ;
										System.out.println("====2===="+quot+"====="+month_days);
										m_days2 += month_days ;
										
										uf.setMonth2(NumberUtils.formatNum(uf.getMonth2() + quot));
										month2 += uf.getMonth2();
										allyxts2 += sjyxts ;
										allgzts2 += sjgzts ;
										break;
									case 3:
										totalJDLDay3.add(e.getTruename()) ;
										System.out.println("====3===="+quot+"====="+month_days);
										m_days3 += month_days ;
										
										uf.setMonth3(NumberUtils.formatNum(uf.getMonth3() + quot));
										month3 += uf.getMonth3() ;
										allyxts3 += sjyxts ;
										allgzts3 += sjgzts ;
										break;
									case 4:
										totalJDLDay4.add(e.getTruename()) ;
										System.out.println("====4===="+quot+"====="+month_days);
										m_days4 += month_days ;
										
										System.out.println("------" + e.getTruename());
										
										uf.setMonth4(NumberUtils.formatNum(uf.getMonth4() + quot));
										month4 += uf.getMonth4();
										allyxts4 += sjyxts ;
										allgzts4 += sjgzts ;
										break;
									case 5:
										totalJDLDay5.add(e.getTruename()) ;
										System.out.println("====5===="+quot+"====="+month_days);
										m_days5 += month_days ;
										
										uf.setMonth5(NumberUtils.formatNum(uf.getMonth5() + quot));
										month5 += uf.getMonth5();
										allyxts5 += sjyxts ;
										allgzts5 += sjgzts ;
										break;
									case 6:
										totalJDLDay6.add(e.getTruename()) ;
										System.out.println("====6===="+quot+"====="+month_days);
										m_days6 += month_days ;
										
										uf.setMonth6(NumberUtils.formatNum(uf.getMonth6() + quot));
										month6 += uf.getMonth6();
										allyxts6 += sjyxts ;
										allgzts6 += sjgzts ;
										break;
									case 7:
										totalJDLDay7.add(e.getTruename()) ;
										System.out.println("====7===="+quot+"====="+month_days);
										m_days7 += month_days ;
										
										uf.setMonth7(NumberUtils.formatNum(uf.getMonth7() + quot));
										month7 += uf.getMonth7();
										allyxts7 += sjyxts ;
										allgzts7 += sjgzts ;
										break;
									case 8:
										totalJDLDay8.add(e.getTruename()) ;
										System.out.println("====8===="+quot+"====="+month_days);
										m_days8 += month_days ;
										
										uf.setMonth8(NumberUtils.formatNum(uf.getMonth8() + quot));
										month8 += uf.getMonth8();
										allyxts8 += sjyxts ;
										allgzts8 += sjgzts ;
										break;
									case 9:
										totalJDLDay9.add(e.getTruename()) ;
										System.out.println("====9===="+quot+"====="+month_days);
										m_days9 += month_days ;
										
										uf.setMonth9(NumberUtils.formatNum(uf.getMonth9() + quot));
										month9 += uf.getMonth9();
										allyxts9 += sjyxts ;
										allgzts9 += sjgzts ;
										break;
									case 10:
										totalJDLDay10.add(e.getTruename()) ;
										System.out.println("====10===="+quot+"====="+month_days);
										m_days10 += month_days ;
										
										uf.setMonth10(NumberUtils.formatNum(uf.getMonth10() + quot));
										month10 += uf.getMonth10();
										allyxts10 += sjyxts ;
										allgzts10 += sjgzts ;
										break;
									case 11:
										totalJDLDay11.add(e.getTruename()) ;
										System.out.println("====11===="+quot+"====="+month_days);
										m_days11 += month_days ;
										
										uf.setMonth11(NumberUtils.formatNum(uf.getMonth11() + quot));
										month11 += uf.getMonth11();
										allyxts11 += sjyxts ;
										allgzts11 += sjgzts ;
										break;
									case 12:
										totalJDLDay12.add(e.getTruename()) ;
										System.out.println("====12===="+quot+"====="+month_days);
										m_days12 += month_days ;
										
										uf.setMonth12(NumberUtils.formatNum(uf.getMonth12() + quot));
										month12 += uf.getMonth12();
										allyxts12 += sjyxts ;
										allgzts12 += sjgzts ;
										break;
									default:
										break;
									}
								}
							}
							
							dgxm ++ ;
						}
					} else {
						
					}
					
					allUsers.add(e.getTruename()) ;
					
					uf.setTotalTaskTime(allTotalDays); // 总天数
					uf.setTotalTaskYear(NumberUtils.formatNum(allTotalYear)); // 总月数
					uf.setAllMM(extTotalMM); // 总人月 消耗
					uf.setNormalHour(allNormalHour); // 平时加班
					uf.setWeekendHour(allWeekendHour); // 周末加班
					uf.setHolidaysHour(allHolidaysHour); // 节假日加班
					forms.add(uf);
				
				}
		}

		datagrid.setTotal(this.total(form));
		datagrid.setRows(forms);
		
		
		System.out.println(totalJDLDay1);
		System.out.println(totalJDLDay2);
		System.out.println(totalJDLDay3);
		System.out.println(totalJDLDay4);
		System.out.println(totalJDLDay5);
		System.out.println(totalJDLDay6);
		System.out.println(totalJDLDay7);
		System.out.println(totalJDLDay8);
		System.out.println(totalJDLDay9);
		System.out.println(totalJDLDay10);
		System.out.println(totalJDLDay11);
		System.out.println(totalJDLDay12);
		
		System.out.println("所有人："+allUsers.size()+"=="+allUsers);
		System.out.println("-----------------------------------------------------------------------");
		
		List<String> removeList1 = removeList(allUsers, totalJDLDay1) ;
		Integer npDate1 = getNoProjectDate(removeList1, 1) ;	//为参加项目人员的实际工作天数累加
		System.out.println("总天数：" + npDate1+"\t需统计的人：" + removeList1.size()+"=="+removeList1+"\n");
		
		List<String> removeList2 = removeList(allUsers, totalJDLDay2) ;
		Integer npDate2 = getNoProjectDate(removeList2, 2) ;	//为参加项目人员的实际工作天数累加
		System.out.println("总天数：" + npDate2+"\t需统计的人：" + removeList2.size()+"=="+removeList2+"\n");
		
		List<String> removeList3 = removeList(allUsers, totalJDLDay3) ;
		Integer npDate3 = getNoProjectDate(removeList3, 3) ;	//为参加项目人员的实际工作天数累加
		System.out.println("总天数：" + npDate3+"\t需统计的人：" + removeList3.size()+"=="+removeList3+"\n");
		
		List<String> removeList4 = removeList(allUsers, totalJDLDay4) ;
		Integer npDate4 = getNoProjectDate(removeList4, 4) ;	//为参加项目人员的实际工作天数累加
		System.out.println("总天数：" + npDate4+"\t需统计的人：" + removeList4.size()+"=="+removeList4+"\n");
		
		List<String> removeList5 = removeList(allUsers, totalJDLDay5) ;
		Integer npDate5 = getNoProjectDate(removeList5, 5) ;	//为参加项目人员的实际工作天数累加
		System.out.println("总天数：" + npDate5+"\t需统计的人：" + removeList5.size()+"=="+removeList5+"\n");
		
		List<String> removeList6 = removeList(allUsers, totalJDLDay6) ;
		Integer npDate6 = getNoProjectDate(removeList6, 6) ;	//为参加项目人员的实际工作天数累加
		System.out.println("总天数：" + npDate6+"\t需统计的人：" + removeList6.size()+"=="+removeList6+"\n");
		
		List<String> removeList7 = removeList(allUsers, totalJDLDay7) ;
		Integer npDate7 = getNoProjectDate(removeList7, 7) ;	//为参加项目人员的实际工作天数累加
		System.out.println("总天数：" + npDate7+"\t需统计的人：" + removeList7.size()+"=="+removeList7+"\n");
		
		List<String> removeList8 = removeList(allUsers, totalJDLDay8) ;
		Integer npDate8 = getNoProjectDate(removeList8, 8) ;	//为参加项目人员的实际工作天数累加
		System.out.println("总天数：" + npDate8+"\t需统计的人：" + removeList8.size()+"=="+removeList8+"\n");
		
		List<String> removeList9 = removeList(allUsers, totalJDLDay9) ;
		Integer npDate9 = getNoProjectDate(removeList9, 9) ;	//为参加项目人员的实际工作天数累加
		System.out.println("总天数：" + npDate9+"\t需统计的人：" + removeList9.size()+"=="+removeList9+"\n");
		
		List<String> removeList10 = removeList(allUsers, totalJDLDay10) ;
		Integer npDate10 = getNoProjectDate(removeList10, 10) ;	//为参加项目人员的实际工作天数累加
		System.out.println("总天数：" + npDate10+"\t需统计的人：" + removeList10.size()+"=="+removeList10+"\n");
		
		List<String> removeList11 = removeList(allUsers, totalJDLDay11) ;
		Integer npDate11 = getNoProjectDate(removeList11, 11) ;	//为参加项目人员的实际工作天数累加
		System.out.println("总天数：" + npDate11+"\t需统计的人：" + removeList11.size()+"=="+removeList11+"\n");
		
		List<String> removeList12 = removeList(allUsers, totalJDLDay12) ;
		Integer npDate12 = getNoProjectDate(removeList12, 12) ;	//为参加项目人员的实际工作天数累加
		System.out.println("总天数：" + npDate12+"\t需统计的人：" + removeList12.size()+"=="+removeList12+"\n");
		
		System.out.println("[1月]总实际工作天数\t" + "有项目人员天数累加:["+m_days1+"] \t无项目人员天数累加：["+npDate1+"] \t计算:(m_days1/(npDate))="+nt.format(((m_days1/360))));
		System.out.println("[2月]总实际工作天数\t" + "有项目人员天数累加:["+m_days2+"] \t无项目人员天数累加：["+npDate2+"] \t计算:(m_days2/(npDate))="+nt.format(((m_days2/npDate2))));
		System.out.println("[3月]总实际工作天数\t" + "有项目人员天数累加:["+m_days3+"] \t无项目人员天数累加：["+npDate3+"] \t计算:(m_days3/(npDate))="+((m_days3/(npDate3))));
		System.out.println((m_days2/npDate2));
		/*System.out.println("2月总实际工作天数：" + m_days2);
		System.out.println("3月总实际工作天数：" + m_days3);
		System.out.println("4月总实际工作天数：" + m_days4);
		System.out.println("5月总实际工作天数：" + m_days5);
		System.out.println("6月总实际工作天数：" + m_days6);
		System.out.println("7月总实际工作天数：" + m_days7);
		System.out.println("8月总实际工作天数：" + m_days8);
		System.out.println("9月总实际工作天数：" + m_days9);
		System.out.println("10月总实际工作天数：" + m_days10);
		System.out.println("11月总实际工作天数：" + m_days11);
		System.out.println("12月总实际工作天数：" + m_days12);*/
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("month1", nt.format(m_days1/npDate1));
		map.put("month2", nt.format(m_days2/npDate2));
		map.put("month3", nt.format(m_days3/npDate3));
		map.put("month4", nt.format(m_days4/npDate4));
		map.put("month5", nt.format(m_days5/npDate5));
		map.put("month6", nt.format(m_days6/npDate6));
		map.put("month7", nt.format(m_days7/npDate7));
		map.put("month8", nt.format(m_days8/npDate8));
		map.put("month9", nt.format(m_days9/npDate9));
		map.put("month10", nt.format(m_days10/npDate10));
		map.put("month11", nt.format(m_days11/npDate11));
		map.put("month12", nt.format(m_days12/npDate12));
		
		map.put("totalTaskTime", "汇总");
		footer.add(map);
		
		datagrid.setFooter(footer);
		
		return datagrid;
	}
	
	//获取部门所有为参与项目的用户的实际工作天数（过滤条件，根据在职状态，离职状态...）
	public Integer getNoProjectDate(List<String> list, int month) {
		Integer totalDay = new Integer(0) ;
		
		String[] split = splitType(list) ;
		if(split!=null && split.length > 0) {
			Map<String, Object> params = new HashMap<String, Object>() ;
			String hql = "select t from EmployeeEntity t where t.truename in(:str)" ;
			params.put("str", split) ;
			List<EmployeeEntity> find = this.basedaoEmployee.find(hql, params) ;
			
			
			
			for (EmployeeEntity emp : find) {
				
				//判断（到部门状态）
				if(null != emp.getDbmType() && !"".equals(emp.getDbmType())) {
					
					//3：在职
					if(emp.getDbmType() == 3) {
						Calendar start = Calendar.getInstance() ;	//本月的第一天
						start.setTime(new Date()) ; start.set(Calendar.MONTH, month-1) ; start.set(Calendar.DAY_OF_MONTH, 1) ;
						Calendar end = Calendar.getInstance() ;		//本月的最后一天
						end.setTime(new Date()) ; end.set(Calendar.MONTH, month-1) ; end.set(Calendar.DAY_OF_MONTH, end.getActualMaximum(Calendar.DAY_OF_MONTH)) ;
						int wd = DateCal.getWorkingDays(DateUtil.formatG(start.getTime()), DateUtil.formatG(end.getTime()));  
						totalDay += wd ;
						
						System.out.println(emp.getTruename() + "\t到部门类型：" +emp.getDbmType()+"\t"+DateUtil.formatG(start.getTime())+"=="+DateUtil.formatG(end.getTime()) + "  实际工作天数：" + wd);
					}
					
					//1：新增、2：转入、4：试用、5：停薪留职返回、6、 返聘
					if(emp.getDbmType() == 1 || emp.getDbmType() == 2 || emp.getDbmType() == 5 || emp.getDbmType() == 4 || emp.getDbmType() == 6) {
						Calendar now = Calendar.getInstance() ;		//当前的年和月
						now.setTime(new Date()) ; now.set(Calendar.MONTH, month-1) ;
						
						Calendar dbmDate = Calendar.getInstance() ;	//到部门的日期
						dbmDate.setTime(DateUtil.formatGG(emp.getDbmDate())) ; 
						
						//判断到部门的年是否今天,如果是则按到部门日期进行设置
						if(dbmDate.get(Calendar.YEAR) == now.get(Calendar.YEAR)) {
							//在判断该月是否和到部门的月相同,如果相同则计算,如果不相同则不计算天数. 天数返回0
							if(now.get(Calendar.MONTH) == dbmDate.get(Calendar.MONTH)) {
								Calendar start = Calendar.getInstance() ;	//部门的日期
								start.setTime(dbmDate.getTime()) ;
								
								Calendar end = Calendar.getInstance() ;	
								end.setTime(start.getTime()) ; 
								end.set(Calendar.DAY_OF_MONTH, end.getActualMaximum(Calendar.DAY_OF_MONTH)) ;
								
								int wd = DateCal.getWorkingDays(DateUtil.formatG(start.getTime()), DateUtil.formatG(end.getTime()));  
								totalDay += wd ;
								System.out.println(emp.getTruename() + "\t到部门类型：" +emp.getDbmType()+"\t"+DateUtil.formatG(start.getTime())+"=="+DateUtil.formatG(end.getTime()) + "  实际工作天数：" + wd);
							}
							
							//如果本月大于到部门的月,则按本月的一号开始设置
							if((month-1) > dbmDate.get(Calendar.MONTH)) {
								Calendar start = Calendar.getInstance() ;	//本月的第一天
								start.setTime(new Date()) ; start.set(Calendar.MONTH, month-1) ; start.set(Calendar.DAY_OF_MONTH, 1) ;
								
								//判断,如果离部门类型不为空,则不能按该月的最后一天来设置,应该按离开部门的日期来设置
								if(null != emp.getLbmType() && !"".equals(emp.getLbmType())) {
									
									//2：转出-到非开发部、3：离职、4：停薪留职（计算方式一样，按离开部门的日期设置）
									if(emp.getLbmType() == 2 || emp.getLbmType() == 3 || emp.getLbmType() == 4) {
										Calendar lbmDate = Calendar.getInstance() ;	//离部门的日期
										lbmDate.setTime(DateUtil.formatGG(emp.getLbmDate())) ; 
										
										//如果本月与离部门的月份相同,则将日期设置为离部门的日期
										if(now.get(Calendar.MONTH) == lbmDate.get(Calendar.MONTH)) {
											Calendar end = Calendar.getInstance() ;	
											end.setTime(DateUtil.formatGG(emp.getLbmDate())) ; 
											
											int wd = DateCal.getWorkingDays(DateUtil.formatG(start.getTime()), DateUtil.formatG(end.getTime()));  
											totalDay += wd ;
											System.out.println(emp.getTruename() + "\t到部门类型：" +emp.getDbmType()+"\t"+DateUtil.formatG(start.getTime())+"=="+DateUtil.formatG(end.getTime()) + "  实际工作天数：" + wd);
										}
										if((month-1) < lbmDate.get(Calendar.MONTH)) {
											Calendar end = Calendar.getInstance() ;	
											end.setTime(start.getTime()) ; 
											end.set(Calendar.DAY_OF_MONTH, end.getActualMaximum(Calendar.DAY_OF_MONTH)) ;
											
											int wd = DateCal.getWorkingDays(DateUtil.formatG(start.getTime()), DateUtil.formatG(end.getTime()));  
											totalDay += wd ;
											System.out.println(emp.getTruename() + "\t到部门类型：" +emp.getDbmType()+"\t"+DateUtil.formatG(start.getTime())+"=="+DateUtil.formatG(end.getTime()) + "  实际工作天数：" + wd);
											
										}
										
										
									}
									//1：转出-到开发部（还在开发部，并还在改项目，按本月的最后一天计算）
									if(emp.getLbmType() == 1) {
										Calendar end = Calendar.getInstance() ;	
										end.setTime(start.getTime()) ; 
										end.set(Calendar.DAY_OF_MONTH, end.getActualMaximum(Calendar.DAY_OF_MONTH)) ;
										
										int wd = DateCal.getWorkingDays(DateUtil.formatG(start.getTime()), DateUtil.formatG(end.getTime()));  
										totalDay += wd ;
										System.out.println(emp.getTruename() + "\t到部门类型：" +emp.getDbmType()+"\t"+DateUtil.formatG(start.getTime())+"=="+DateUtil.formatG(end.getTime()) + "  实际工作天数：" + wd);
										
									}
									
								} else {
									Calendar end = Calendar.getInstance() ;	
									end.setTime(start.getTime()) ; 
									end.set(Calendar.DAY_OF_MONTH, end.getActualMaximum(Calendar.DAY_OF_MONTH)) ;
									
									int wd = DateCal.getWorkingDays(DateUtil.formatG(start.getTime()), DateUtil.formatG(end.getTime()));  
									totalDay += wd ;
									System.out.println(emp.getTruename() + "\t到部门类型：" +emp.getDbmType()+"\t"+DateUtil.formatG(start.getTime())+"=="+DateUtil.formatG(end.getTime()) + "  实际工作天数：" + wd);
								}
							}
							
						} else {	//如果不是今年或小于当前年,则按当月一号开始进行设置
							Calendar start = Calendar.getInstance() ;	//本月的第一天
							start.setTime(new Date()) ; start.set(Calendar.MONTH, month-1) ; start.set(Calendar.DAY_OF_MONTH, 1) ;
							
							Calendar end = Calendar.getInstance() ;	
							end.setTime(start.getTime()) ; 
							end.set(Calendar.DAY_OF_MONTH, end.getActualMaximum(Calendar.DAY_OF_MONTH)) ;
							
							int wd = DateCal.getWorkingDays(DateUtil.formatG(start.getTime()), DateUtil.formatG(end.getTime()));  
							totalDay += wd ;
							System.out.println(emp.getTruename() + "\t到部门类型：" +emp.getDbmType()+"\t"+DateUtil.formatG(start.getTime())+"=="+DateUtil.formatG(end.getTime()) + "  实际工作天数：" + wd);
						}
						
					}
					
					
					
					
					
				}//判断（到部门状态）结束
				
			}//员工循环结束
		}
		
		
		return totalDay;
	}
	
	public List<String> removeList(List<String> l1, List<String> l2) {
		List<String> list1 = new ArrayList<String>() ;
		for (String string : l1) {
			list1.add(string) ;
		}
		for (int i = 0; i < l2.size(); i++) {
			String temp = l2.get(i);
			if(list1.contains(temp)) {
				list1.remove(temp) ;
			}
		}
		return list1;
	}

	public String[] splitType(List<String> list) {
		String[] strs = new String[list.size()] ;
		for(int i=0; i<list.size(); i++) {
			strs[i] = list.get(i) ;
		}
		return strs ;
	}

	private List<EmployeeEntity> find(ProjectTaskTimeForm form) {
		
		LoginInfoSession sessionInfo = Constants.getSessionInfo() ;
		EmployeeForm emp = sessionInfo.getEmp() ;
		
		//如果不是经理专用按钮，则根据用户的ID，或是否部长来进行查询
		if(!"".equals(form.getViewType()) && "Y".equals(form.getViewType())) {
			
		} else {
			//是否部长
			if(null != emp.getIsLeader() && "Y".equals(emp.getIsLeader())) {
				EmployeeEntity eee = this.basedaoEmployee.get(EmployeeEntity.class, emp.getId()) ;
				if(null != eee.getOrg()) {
					form.setDept_id(eee.getOrg().getId()) ;
				}
			} else if(null != emp.getIsLeader() && "YY".equals(emp.getIsLeader())) {	//本部长
				EmployeeEntity eee = this.basedaoEmployee.get(EmployeeEntity.class, emp.getId()) ;
				OrgDeptTreeEntity org = eee.getOrg() ;
				if(null != org) {
					//本部长
					OrgDeptTreeEntity orgDeptTreeEntity = this.basedaoOrg.get(OrgDeptTreeEntity.class, org.getId()) ;
					Set<OrgDeptTreeEntity> orgs = orgDeptTreeEntity.getOrgs() ;
					StringBuffer sb = new StringBuffer() ;
					//sb.append(org.getId()+",") ;
					if(null != orgs && orgs.size() > 0) {
						for (OrgDeptTreeEntity ds : orgs) {
							sb.append(ds.getId()+",") ;
						}
						if(sb.length() > 0) {
							sb.deleteCharAt(sb.length() -1) ;
						}
						
						form.setDeptsView(sb.toString()) ;
					}
				}
			} else {
				form.setEmp_id(emp.getId()) ;
			}
		}
		
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select t from EmployeeEntity t where 1=1";
		hql = addWhere(hql, form, params) + addOrdeby(form);
		return this.basedaoEmployee.find(hql, params, form.getPage(), form.getRows());
	}

	private String addOrdeby(ProjectTaskTimeForm form) {
		String orderString = "";
		if (form.getSort() != null && form.getOrder() != null) {
			orderString = " order by " + form.getSort() + " " + form.getOrder();
		}
		return orderString;
	}

	public Long total(ProjectTaskTimeForm form) {
		Map<String, Object> params = new HashMap<String, Object>();

		String hql = "select count(*) from EmployeeEntity t where 1=1";

		hql = addWhere(hql, form, params);

		return this.basedaoProjectEW.count(hql, params);
	}

	private String addWhere(String hql, ProjectTaskTimeForm form, Map<String, Object> params) {
		if (null != form) {
			if (null != form.getEmp_id() && !"".equals(form.getEmp_id())) {
				hql += " and t.id=:emp_id";
				params.put("emp_id", form.getEmp_id());
			}
			if (null != form.getDept_id() && !"".equals(form.getDept_id())) {
				hql += " and t.org.id=:dept_id";
				params.put("dept_id", form.getDept_id());
			}
			if (null != form.getProject_id() && !"".equals(form.getProject_id())) {
				hql += " and t.project.id=:project_id";
				params.put("project_id", form.getProject_id());
			}
			if (null != form.getStatus() && !"".equals(form.getStatus())) {
				hql += " and t.status=:status";
				params.put("status", form.getStatus());
			}
			if (null != form.getInStatus() && !"".equals(form.getInStatus())) {
				hql += " and t.status in (:inStatus)";
				String[] split = form.getInStatus().split(",");
				Integer[] states = new Integer[split.length];
				for (int i = 0; i < states.length; i++) {
					states[i] = Integer.parseInt(split[i]);
				}
				params.put("inStatus", states);
			}
			if (null != form.getNotInStatus() && !"".equals(form.getNotInStatus())) {
				hql += " and t.workStatus not in (:workStatus)";
				String[] split = form.getNotInStatus().split(",");
				Integer[] states = new Integer[split.length];
				for (int i = 0; i < states.length; i++) {
					states[i] = Integer.parseInt(split[i]);
				}
				params.put("workStatus", states);
			}
			if (null != form.getInStatus() && !"".equals(form.getInStatus())) {
				hql += " and t.workStatus in (:workStatus)";
				String[] split = form.getInStatus().split(",");
				Integer[] states = new Integer[split.length];
				for (int i = 0; i < states.length; i++) {
					states[i] = Integer.parseInt(split[i]);
				}
				params.put("workStatus", states);
			}
			
			if (null != form.getDeptsView() && !"".equals(form.getDeptsView())) {
				hql += " and t.org.id in (:depts)";
				String[] split = form.getDeptsView().split(",");
				
				params.put("depts", split);
				System.out.println(hql);
			}
		}
		return hql;
	}

}
