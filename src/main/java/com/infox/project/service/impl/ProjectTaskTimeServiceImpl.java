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
import com.infox.project.service.ProjectTaskTimeServiceI;
import com.infox.project.web.form.ProjectTaskTimeForm;
import com.infox.sysmgr.entity.EmpJobEntity;
import com.infox.sysmgr.entity.EmployeeEntity;
import com.infox.sysmgr.entity.OrgDeptTreeEntity;
import com.infox.sysmgr.web.form.EmployeeForm;

@Service
@Transactional
public class ProjectTaskTimeServiceImpl implements ProjectTaskTimeServiceI {

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
	public ProjectTaskTimeForm get(String id) throws Exception {

		return null;
	}

	@Override
	public ProjectTaskTimeForm get(ProjectTaskTimeForm form) throws Exception {

		return null;
	}

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
		
		int step = 1;
		
		List<EmployeeEntity> entitys = this.find(form);
		if (null != entitys && entitys.size() > 0) {
			for (EmployeeEntity e : entitys) {
				
				//if("徐瀅".equals(e.getTruename())){
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
					
					String yd1 = DateUtil.formatG(c.getTime());
					c.add(Calendar.MONTH, 12 - (c.get(Calendar.MONTH)) - 1);
					c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
					String yd2 = DateUtil.formatG(c.getTime());
					
					// 根据年份选择
					Map<String, Object> params = new HashMap<String, Object>();
					params.put("empid", e.getId());
					//params.put("startdate", DateUtil.formatGG(yd1));
					//params.put("enddate", DateUtil.formatGG(yd2));
					
					// 获取个人的所有工时人月等等
					//List<ProjectEmpWorkingEntity> pews = this.basedaoProjectEW.find("select t from ProjectEmpWorkingEntity t where t.emp.id=:empid and t.startDate between :startdate and :enddate", params);
					List<ProjectEmpWorkingEntity> pews = this.basedaoProjectEW.find("select t from ProjectEmpWorkingEntity t where t.emp.id=:empid", params);
					
					
					//如果一个人拥有两个项目,但项目A的结束日期在3.15,B项目在3.16开始,会造成汇总时数据有误,因为总的有效天数多一个了一个月的有效天数
					int dgxm=1 ;
					List<String> lastEndDate = new ArrayList<String>() ;
					
					for (ProjectEmpWorkingEntity ew : pews) {
						// 计算有效天数（减去周六日）(工作多少天就加多少天)
						long totalDays = DateCal.getWorkingDays(DateUtil.formatG(ew.getStartDate()), DateUtil.formatG(ew.getEndDate()));
						//allTotalDays += totalDays;
						
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
									} else {
										int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
										fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
										
										sjyxts = ((Integer)diff).floatValue() ;
										sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
										
										quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
										allTotalDays += wd ;
										System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  2稼动率2="+quot);
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
											} else {
												int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
												fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
												
												sjyxts = ((Integer)diff).floatValue() ;
												sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
												allTotalDays += wd ;
												quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
												System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  3稼2动率"+quot);
											}
										} else {
											int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
											fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
											
											sjyxts = ((Integer)diff).floatValue() ;
											sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
											
											quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
											allTotalDays += wd ;
											System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  3稼3动率"+quot);
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
									} else {
										int wd = DateCal.getWorkingDays(DateUtil.formatG(ew.getStartDate()), DateUtil.formatG(ew.getEndDate()));
										fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
										
										sjyxts = ((Integer)diff).floatValue() ;
										sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
										
										quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
										
										allTotalDays += wd ;
										System.out.println(DateUtil.formatG(ew.getStartDate())+"=="+DateUtil.formatG(ew.getEndDate())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  4稼2动率"+quot);
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
										} else {
											int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
											fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
											
											sjyxts = ((Integer)diff).floatValue() ;
											sjgzts = ((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) ;
											
											quot = NumberUtils.formatNum((((Integer) wd).floatValue() * (null != ew.getProject().getQuot()?ew.getProject().getQuot():0f))/((Integer)diff).floatValue()) ;
											
											allTotalDays += wd ;
											System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+(null != ew.getProject().getQuot()?ew.getProject().getQuot():0f) +"  5稼动率"+quot);
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
										
										int count = 0 ;
										
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
									//原本是fc的,人月
									//uf.setMonth1(NumberUtils.formatNum(uf.getMonth1() + fc));
									uf.setMonth1(NumberUtils.formatNum(uf.getMonth1() + quot));
									month1 += uf.getMonth1();
									allyxts1 += sjyxts ;
									allgzts1 += sjgzts ;
									break;
								case 2:
									uf.setMonth2(NumberUtils.formatNum(uf.getMonth2() + quot));
									month2 += uf.getMonth2();
									allyxts2 += sjyxts ;
									allgzts2 += sjgzts ;
									break;
								case 3:
									uf.setMonth3(NumberUtils.formatNum(uf.getMonth3() + quot));
									month3 += uf.getMonth3() ;
									allyxts3 += sjyxts ;
									allgzts3 += sjgzts ;
									break;
								case 4:
									uf.setMonth4(NumberUtils.formatNum(uf.getMonth4() + quot));
									month4 += uf.getMonth4();
									allyxts4 += sjyxts ;
									allgzts4 += sjgzts ;
									break;
								case 5:
									uf.setMonth5(NumberUtils.formatNum(uf.getMonth5() + quot));
									month5 += uf.getMonth5();
									allyxts5 += sjyxts ;
									allgzts5 += sjgzts ;
									break;
								case 6:
									uf.setMonth6(NumberUtils.formatNum(uf.getMonth6() + quot));
									month6 += uf.getMonth6();
									allyxts6 += sjyxts ;
									allgzts6 += sjgzts ;
									break;
								case 7:
									uf.setMonth7(NumberUtils.formatNum(uf.getMonth7() + quot));
									month7 += uf.getMonth7();
									allyxts7 += sjyxts ;
									allgzts7 += sjgzts ;
									break;
								case 8:
									uf.setMonth8(NumberUtils.formatNum(uf.getMonth8() + quot));
									month8 += uf.getMonth8();
									allyxts8 += sjyxts ;
									allgzts8 += sjgzts ;
									break;
								case 9:
									uf.setMonth9(NumberUtils.formatNum(uf.getMonth9() + quot));
									month9 += uf.getMonth9();
									allyxts9 += sjyxts ;
									allgzts9 += sjgzts ;
									break;
								case 10:
									uf.setMonth10(NumberUtils.formatNum(uf.getMonth10() + quot));
									month10 += uf.getMonth10();
									allyxts10 += sjyxts ;
									allgzts10 += sjgzts ;
									break;
								case 11:
									uf.setMonth11(NumberUtils.formatNum(uf.getMonth11() + quot));
									month11 += uf.getMonth11();
									allyxts11 += sjyxts ;
									allgzts11 += sjgzts ;
									break;
								case 12:
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
					// uf.setTotalTaskYear((float)allTotalDays / 21f) ; //总月数
					// uf.setAllMM((float)uf.getTotalTaskTime() / 21f) ; //总人月
					// uf.setTotalHour(allOtTime) ; //加班小时
					uf.setTotalTaskTime(allTotalDays); // 总天数
					uf.setTotalTaskYear(NumberUtils.formatNum(allTotalYear)); // 总月数
					uf.setAllMM(extTotalMM); // 总人月 消耗
					uf.setNormalHour(allNormalHour); // 平时加班
					uf.setWeekendHour(allWeekendHour); // 周末加班
					uf.setHolidaysHour(allHolidaysHour); // 节假日加班
					
					forms.add(uf);
				//}
				
				}
		}

		datagrid.setTotal(this.total(form));
		datagrid.setRows(forms);

		
		//计算稼动率 率公式(当月总的稼动率 / 部门当月的人数)
		Calendar ccc = Calendar.getInstance() ;
		int month = ccc.get(Calendar.MONTH)+1 ;
		int count = 0 ;
		OrgDeptTreeEntity dept = null ;
		if(form.getDept_id() != null) {
			dept = this.basedaoOrg.get(OrgDeptTreeEntity.class, form.getDept_id()) ;
			count = this.basedaoEmployee.count("select count(t) from EmployeeEntity t where t.org.id='"+form.getDept_id()+"'").intValue() ;
			
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		/*
		map.put("month1", (form.getDept_id()!=null && 1<month?dept.getMonth1()!=0?nt.format(month1/dept.getMonth1()):nt.format(0.0):count!=0?nt.format(month1/count):nt.format(0.0)));
		map.put("month2", (form.getDept_id()!=null && 2<month?dept.getMonth2()!=0?nt.format(month2/dept.getMonth2()):nt.format(0.0):count!=0?nt.format(month2/count):nt.format(0.0)));
		map.put("month3", (form.getDept_id()!=null && 3<month?dept.getMonth3()!=0?nt.format(month3/dept.getMonth3()):nt.format(0.0):count!=0?nt.format(month3/count):nt.format(0.0)));
		map.put("month4", (form.getDept_id()!=null && 4<month?dept.getMonth4()!=0?nt.format(month4/dept.getMonth4()):nt.format(0.0):count!=0?nt.format(month4/count):nt.format(0.0)));
		map.put("month5", (form.getDept_id()!=null && 5<month?dept.getMonth5()!=0?nt.format(month5/dept.getMonth5()):nt.format(0.0):count!=0?nt.format(month5/count):nt.format(0.0)));
		map.put("month6", (form.getDept_id()!=null && 6<month?dept.getMonth6()!=0?nt.format(month6/dept.getMonth6()):nt.format(0.0):count!=0?nt.format(month6/count):nt.format(0.0)));
		map.put("month7", (form.getDept_id()!=null && 7<month?dept.getMonth7()!=0?nt.format(month7/dept.getMonth7()):nt.format(0.0):count!=0?nt.format(month7/count):nt.format(0.0)));
		map.put("month8", (form.getDept_id()!=null && 8<month?dept.getMonth8()!=0?nt.format(month8/dept.getMonth8()):nt.format(0.0):count!=0?nt.format(month8/count):nt.format(0.0)));
		map.put("month9", (form.getDept_id()!=null && 9<month?dept.getMonth9()!=0?nt.format(month9/dept.getMonth9()):nt.format(0.0):count!=0?nt.format(month9/count):nt.format(0.0)));
		map.put("month10", (form.getDept_id()!=null && 10<month?dept.getMonth10()!=0?nt.format(month10/dept.getMonth10()):nt.format(0.0):count!=0?nt.format(month10/count):nt.format(0.0)));
		map.put("month11", (form.getDept_id()!=null && 11<month?dept.getMonth11()!=0?nt.format(month11/dept.getMonth11()):nt.format(0.0):count!=0?nt.format(month11/count):nt.format(0.0)));
		map.put("month12", (form.getDept_id()!=null && 12<=month?dept.getMonth12()!=0?nt.format(month12/dept.getMonth12()):nt.format(0.0):count!=0?nt.format(month12/count):nt.format(0.0)));
		*/ 
		//System.out.println("allyxts2："+allyxts2 + "=----=" + allgzts2);
		System.out.println("有效天数1："+allyxts1 + "   工作天数：" + allgzts1 + "   率：" + nt.format(allgzts1/allyxts1));
		System.out.println("有效天数2："+allyxts2 + "   工作天数：" + allgzts2 + "   率：" + nt.format(allgzts2/allyxts2));
		System.out.println("有效天数3："+allyxts3 + "   工作天数：" + allgzts3 + "   率：" + nt.format(allgzts3/allyxts3));
		System.out.println("有效天数4："+allyxts4 + "   工作天数：" + allgzts4 + "   率：" + nt.format(allgzts4/allyxts4));
		System.out.println("有效天数5："+allyxts5 + "   工作天数：" + allgzts5 + "   率：" + nt.format(allgzts5/allyxts5));
		System.out.println("有效天数6："+allyxts6 + "   工作天数：" + allgzts6 + "   率：" + nt.format(allgzts6/allyxts6));
		map.put("month1", (allgzts1>0?nt.format(allgzts1/allyxts1):nt.format(0.0)));
		map.put("month2", (allgzts2>0?nt.format(allgzts2/allyxts2):nt.format(0.0)));
		map.put("month3", (allgzts3>0?nt.format(allgzts3/allyxts3):nt.format(0.0)));
		map.put("month4", (allgzts4>0?nt.format(allgzts4/allyxts4):nt.format(0.0)));
		map.put("month5", (allgzts5>0?nt.format(allgzts5/allyxts5):nt.format(0.0)));
		map.put("month6", (allgzts6>0?nt.format(allgzts6/allyxts6):nt.format(0.0)));
		map.put("month7", (allgzts7>0?nt.format(allgzts7/allyxts7):nt.format(0.0)));
		map.put("month8", (allgzts8>0?nt.format(allgzts8/allyxts8):nt.format(0.0)));
		map.put("month9", (allgzts9>0?nt.format(allgzts9/allyxts9):nt.format(0.0)));
		map.put("month10", (allgzts10>0?nt.format(allgzts10/allyxts10):nt.format(0.0)));
		map.put("month11", (allgzts11>0?nt.format(allgzts11/allyxts11):nt.format(0.0)));
		map.put("month12", (allgzts12>0?nt.format(allgzts12/allyxts12):nt.format(0.0)));
		
		map.put("totalTaskTime", "汇总");
		footer.add(map);

		// datagrid.setRows(this.changeModel(this.find(form), form));
		datagrid.setFooter(footer);
		return datagrid;
	}

	@Override
	public DataGrid getMemberInfoList(ProjectTaskTimeForm form) throws Exception {
		DataGrid datagrid = new DataGrid();

		List<ProjectTaskTimeForm> forms = new ArrayList<ProjectTaskTimeForm>();

		String hql = "select t from ProjectEmpWorkingEntity t where 1=1 and t.emp.id=:emp_id";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("emp_id", form.getEmp_id());
		List<ProjectEmpWorkingEntity> find = this.basedaoProjectEW.find(hql, params);

		for (ProjectEmpWorkingEntity p : find) {
			// 人月
			Float totalMonth = new Float(0);
			// 消耗人月
			Float extMonth = new Float(0);

			ProjectTaskTimeForm pf = new ProjectTaskTimeForm();
			EmployeeEntity e = p.getEmp();
			pf.setEmp_id(e.getId());
			pf.setEmp_name(e.getTruename());
			pf.setDept_name(e.getOrg().getSname());
			pf.setSd(DateUtil.formatG(p.getStartDate()));
			pf.setEd(DateUtil.formatG(p.getEndDate()));
			ProjectMainEntity project = p.getProject() ;
			pf.setProject_role(p.getProject_role());
			if(project != null) {
				pf.setProject_name(project.getName());
				pf.setQuot(project.getQuot()) ;
			}

			// 加班小时
			Map<String, Object> paramsOT = new HashMap<String, Object>();
			paramsOT.put("empid", e.getId());
			paramsOT.put("project_id", p.getProject().getId());
			OvertimeEntity oe = this.basedaoOvertime.get("select t from OvertimeEntity t where t.emp.id=:empid and t.project.id=:project_id", paramsOT);
			if (null != oe) {
				// pf.setTotalHour(oe.getHour()) ;
				pf.setNormalHour(oe.getNormalHour());
				pf.setWeekendHour(oe.getWeekendHour());
				pf.setHolidaysHour(oe.getHolidaysHour());

				// 总加班小时
				pf.setTotalHour(oe.getNormalHour() + oe.getWeekendHour() + oe.getHolidaysHour());
			}

			// 岗位
			StringBuffer sb1 = new StringBuffer();
			StringBuffer sb2 = new StringBuffer();
			Set<EmpJobEntity> empjobs = p.getEmp().getEmpjobs();
			for (EmpJobEntity eje : empjobs) {
				sb1.append(eje.getJob_name());
				sb2.append(eje.getJob_sname());
			}
			pf.setPosition_name(sb1.toString());
			pf.setPosition_sname(sb2.toString());

			// 员工总有效工作天数
			long dateDiff = DateCal.getWorkingDays(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(p.getEndDate()));

			// 消耗天数
			long lastdateDiff = 0;

			// 获取休息的天数（用于计算已消耗人月）
			Calendar h1 = Calendar.getInstance();
			h1.setTime(DateUtil.formatGG(DateUtil.formatG(p.getStartDate())));
			Calendar h2 = Calendar.getInstance();
			h2.setTime(DateUtil.formatGG(DateUtil.formatG(p.getEndDate())));

			// 如果结束日期大于今天，已消耗天数的则不以当前的日期来计算
			int compare_date2 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(p.getEndDate()));
			if (compare_date2 == 1) {
				lastdateDiff = DateCal.getWorkingDays(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(p.getEndDate()));
			} else {
				Calendar c1 = Calendar.getInstance();
				c1.setTime(new Date());
				Calendar c2 = Calendar.getInstance();
				c2.setTime(p.getStartDate());
				// 必须是当年的才计算
				if (c1.get(Calendar.YEAR) == c2.get(Calendar.YEAR)) {
					lastdateDiff = DateCal.getWorkingDays(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(new Date()));
				} else {
					lastdateDiff = 0;
				}
			}

			// if(p.getEmp().getTruename().equals("徐瀅")) {

			String sd = DateUtil.formatG(p.getStartDate());
			String ed = DateUtil.formatG(p.getEndDate());
			Date startDate = DateUtil.formatGG(sd);
			Date endDate = DateUtil.formatGG(ed);

			// 开始日期和结束日期相差的月数
			int monthSpace = DateUtil.getDiffer(sd, ed);

			Calendar c1 = Calendar.getInstance();
			c1.setTime(startDate);
			int currentMonth1 = c1.get(Calendar.MONTH) + 1;
			int currentYear1 = c1.get(Calendar.YEAR);

			Calendar c2 = Calendar.getInstance();
			c2.setTime(endDate);
			int currentMonth2 = c2.get(Calendar.MONTH) + 1;
			int currentYear2 = c2.get(Calendar.YEAR);

			for (int i = 0; i < monthSpace; i++) {
				Calendar fristDay = Calendar.getInstance();
				fristDay.setTime(DateUtil.formatGG(sd));
				fristDay.add(Calendar.MONTH, i);
				fristDay.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天

				Calendar lastDay = Calendar.getInstance();
				lastDay.setTime(DateUtil.formatGG(sd));
				lastDay.add(Calendar.MONTH, (i));
				lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));

				// 每个月的有效天数
				long diffDay = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));

				String ym1 = currentYear1 + "" + currentMonth1;
				String ym2 = currentYear2 + "" + currentMonth2;
				String frist = fristDay.get(Calendar.YEAR) + "" + (fristDay.get(Calendar.MONTH) + 1);

				// 实际有效工作天数
				Integer day = new Integer(0);

				// 第一个月
				if (ym1.equals(frist) && !ym1.equals(ym2)) {
					long diff = DateCal.getWorkingDays(sd, DateUtil.formatG(lastDay.getTime()));
					day += ((Long) diff).intValue();
					totalMonth += ((Long) diff).floatValue() / ((Long) diffDay).floatValue();

					Calendar ho1 = Calendar.getInstance();
					ho1.setTime(DateUtil.formatGG(DateUtil.formatG(c1.getTime())));
					Calendar ho2 = Calendar.getInstance();

					int cdd1 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(lastDay.getTime()));

					if (cdd1 == 1) {
						ho2.setTime(DateUtil.formatGG(DateUtil.formatG(lastDay.getTime())));
					} else {
						ho2.setTime(DateUtil.formatGG(DateUtil.formatG(new Date())));
					}

					int hocount = DateCal.getHolidays(ho1, ho2);

					Calendar cc1 = Calendar.getInstance();
					if (cdd1 == 1) {
						cc1.setTime(DateUtil.formatGG(DateUtil.formatG(lastDay.getTime())));
					} else {
						// 消耗的天数
						int xhd = DateCal.getWorkingDays(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(new Date()));
						cc1.setTime(DateUtil.formatGG(DateUtil.formatG(c1.getTime())));
						cc1.add(Calendar.DAY_OF_WEEK, xhd + hocount);
					}

					Calendar c1a = Calendar.getInstance();
					c1a.setTime(new Date());
					Calendar c2a = Calendar.getInstance();
					c2a.setTime(p.getStartDate());
					// 必须是当年的才计算
					if (c1a.get(Calendar.YEAR) == c2a.get(Calendar.YEAR)) {
						int workingDays = DateCal.getWorkingDays(DateUtil.formatG(c1.getTime()), DateUtil.formatG(cc1.getTime()));
						extMonth += NumberUtils.formatNum(((Integer) workingDays).floatValue() / ((Long) diffDay).floatValue());
					} else {
						extMonth = 0f;
					}
				}

				// 中间月
				if (!ym1.equals(frist) && !ym2.equals(frist) && !ym1.equals(ym2)) {
					long diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
					day += ((Long) diff).intValue();
					totalMonth += ((Long) diff).floatValue() / ((Long) diffDay).floatValue();

					int t1 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(fristDay.getTime()));
					if (t1 == 0 || t1 > 0) {
						Calendar ho1 = Calendar.getInstance();
						ho1.setTime(DateUtil.formatGG(DateUtil.formatG(fristDay.getTime())));

						Calendar ho2 = Calendar.getInstance();
						int cdd1 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(lastDay.getTime()));
						if (cdd1 == 1) {
							ho2.setTime(DateUtil.formatGG(DateUtil.formatG(lastDay.getTime())));
						} else {
							ho2.setTime(DateUtil.formatGG(DateUtil.formatG(new Date())));
						}

						int hocount = DateCal.getHolidays(ho1, ho2);

						Calendar cc1 = Calendar.getInstance();
						if (cdd1 == 1) {
							cc1.setTime(DateUtil.formatGG(DateUtil.formatG(lastDay.getTime())));
						} else {
							// 消耗的天数
							int xhd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(new Date()));
							cc1.setTime(DateUtil.formatGG(DateUtil.formatG(fristDay.getTime())));
							cc1.add(Calendar.DAY_OF_WEEK, xhd + hocount);
						}
						Calendar c1a = Calendar.getInstance();
						c1a.setTime(new Date());
						Calendar c2a = Calendar.getInstance();
						c2a.setTime(p.getStartDate());
						// 必须是当年的才计算
						if (c1a.get(Calendar.YEAR) == c2a.get(Calendar.YEAR)) {
							int workingDays = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(cc1.getTime()));
							extMonth += NumberUtils.formatNum(((Integer) workingDays).floatValue() / ((Long) diffDay).floatValue());
						} else {
							extMonth = 0f;
						}

					}
				}

				// 最后一个月
				if (ym2.equals(frist) && !ym1.equals(ym2)) {
					long diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), ed);
					day += ((Long) diff).intValue();
					totalMonth += ((Long) diff).floatValue() / ((Long) diffDay).floatValue();

					int t1 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(fristDay.getTime()));
					if (t1 == 0 || t1 > 0) {
						Calendar ho1 = Calendar.getInstance();
						ho1.setTime(DateUtil.formatGG(DateUtil.formatG(fristDay.getTime())));

						Calendar ho2 = Calendar.getInstance();
						int cdd1 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(lastDay.getTime()));
						if (cdd1 == 1) {
							ho2.setTime(DateUtil.formatGG(DateUtil.formatG(p.getEndDate())));
						} else {
							ho2.setTime(DateUtil.formatGG(DateUtil.formatG(new Date())));
						}

						int hocount = DateCal.getHolidays(ho1, ho2);

						Calendar cc1 = Calendar.getInstance();
						if (cdd1 == 1) {
							cc1.setTime(DateUtil.formatGG(DateUtil.formatG(p.getEndDate())));
						} else {
							int xhd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(new Date()));
							cc1.setTime(DateUtil.formatGG(DateUtil.formatG(fristDay.getTime())));
							cc1.add(Calendar.DAY_OF_WEEK, xhd + hocount);
						}

						// 表示该人员已退出项目，将按退出时间来计算
						if (p.getStatus() == 4) {
							int workingDays = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(p.getEndDate()));
							extMonth += NumberUtils.formatNum(((Integer) workingDays).floatValue() / ((Long) diffDay).floatValue());
						} else {
							Calendar c1a = Calendar.getInstance();
							c1a.setTime(new Date());
							Calendar c2a = Calendar.getInstance();
							c2a.setTime(p.getStartDate());
							// 必须是当年的才计算
							if (c1a.get(Calendar.YEAR) == c2a.get(Calendar.YEAR)) {
								int workingDays = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(cc1.getTime()));
								extMonth += NumberUtils.formatNum(((Integer) workingDays).floatValue() / ((Long) diffDay).floatValue());
							} else {
								extMonth = 0f;
							}

						}
					}
				}

				// 单月（开始日期和结束日期都在单月）
				if (ym1.equals(ym2)) {
					long diff = DateCal.getWorkingDays(sd, ed);
					day += ((Long) diff).intValue();
					totalMonth += ((Long) diff).floatValue() / ((Long) diffDay).floatValue();

					//////System.out.println("*********************equals*************************");
					Calendar ho1 = Calendar.getInstance();
					ho1.setTime(DateUtil.formatGG(DateUtil.formatG(c1.getTime())));
					Calendar ho2 = Calendar.getInstance();

					int cdd1 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(lastDay.getTime()));
					if (cdd1 == 1) {
						ho2.setTime(DateUtil.formatGG(DateUtil.formatG(p.getEndDate())));
					} else {
						ho2.setTime(DateUtil.formatGG(DateUtil.formatG(new Date())));
					}

					int hocount = DateCal.getHolidays(ho1, ho2);

					Calendar cc1 = Calendar.getInstance();
					if (cdd1 == 1) {
						cc1.setTime(DateUtil.formatGG(DateUtil.formatG(p.getEndDate())));
					} else {
						// 消耗的天数
						int xhd = DateCal.getWorkingDays(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(new Date()));
						cc1.setTime(DateUtil.formatGG(DateUtil.formatG(c1.getTime())));
						cc1.add(Calendar.DAY_OF_WEEK, xhd + hocount);
					}

					// 表示该人员已退出项目，将按退出时间来计算
					if (p.getStatus() == 4) {
						int workingDays = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(p.getEndDate()));
						extMonth += NumberUtils.formatNum(((Integer) workingDays).floatValue() / ((Long) diffDay).floatValue());
					} else {
						int workingDays = DateCal.getWorkingDays(DateUtil.formatG(c1.getTime()), DateUtil.formatG(cc1.getTime()));
						extMonth += NumberUtils.formatNum(((Integer) workingDays).floatValue() / ((Long) diffDay).floatValue());
					}
					// ////System.out.println("***********************equals***********************\r\n");
				}

				day = 0;
				// }
			}
			pf.setTotalTaskTime(dateDiff);
			pf.setExpendDays(lastdateDiff);
			pf.setMm(totalMonth);
			pf.setExpendMM(extMonth);

			pf.setStatus(p.getStatus());

			forms.add(pf);
		}

		datagrid.setRows(forms);
		return datagrid;
	}

	private List<ProjectTaskTimeForm> changeModel(List<EmployeeEntity> entitys, ProjectTaskTimeForm form) {
		List<ProjectTaskTimeForm> forms = new ArrayList<ProjectTaskTimeForm>();

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
				// if("徐瀅".equals(e.getTruename())) {

				// 当前年的一月一号
				Calendar cyear = Calendar.getInstance();
				cyear.setTime(new Date());
				cyear.add(Calendar.YEAR, 0);
				cyear.add(Calendar.MONTH, 0 - (cyear.get(Calendar.MONTH)));

				Calendar c = Calendar.getInstance();
				c.setTime(cyear.getTime());
				c.add(Calendar.MONTH, 0 - (c.get(Calendar.MONTH)));
				c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天

				String yd1 = DateUtil.formatG(c.getTime());
				c.add(Calendar.MONTH, 12 - (c.get(Calendar.MONTH)) - 1);
				c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
				String yd2 = DateUtil.formatG(c.getTime());

				// 根据年份选择
				Map<String, Object> params = new HashMap<String, Object>();
				params.put("empid", e.getId());
				params.put("startdate", DateUtil.formatGG(yd1));
				params.put("enddate", DateUtil.formatGG(yd2));

				// 获取个人的所有工时人月等等
				List<ProjectEmpWorkingEntity> pews = this.basedaoProjectEW.find("select t from ProjectEmpWorkingEntity t where t.emp.id=:empid and t.startDate between :startdate and :enddate", params);

				for (ProjectEmpWorkingEntity ew : pews) {

					// 计算有效天数（减去周六日）
					long totalDays = DateCal.getWorkingDays(DateUtil.formatG(ew.getStartDate()), DateUtil.formatG(ew.getEndDate()));
					allTotalDays += totalDays;

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
						//////System.out.print((i)+"当前月第一天:"+DateUtil.formatG(fristDay.getTime()));

						Calendar lastDay = Calendar.getInstance();
						lastDay.setTime(new Date());
						lastDay.add(Calendar.MONTH, ((ary1.get(Calendar.MONTH) + 1) - (cd.get(Calendar.MONTH) + 1) + i));
						lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));
						//////System.out.println("\t当前月最后一天:"+DateUtil.formatG(lastDay.getTime())+"==天数："+DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime())));

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

					Calendar ary11 = Calendar.getInstance();
					ary11.setTime(DateUtil.formatGG(DateUtil.formatG(ew.getStartDate())));
					String ym11 = ary11.get(Calendar.YEAR) + "" + ary11.get(Calendar.MONTH);

					Calendar ary22 = Calendar.getInstance();
					ary22.setTime(DateUtil.formatGG(DateUtil.formatG(ew.getEndDate())));
					String ym22 = ary22.get(Calendar.YEAR) + "" + ary22.get(Calendar.MONTH);

					Calendar cd1 = Calendar.getInstance();
					cd1.setTime(new Date());

					int m2 = (ary22.get(Calendar.MONTH) + 1) - (ary11.get(Calendar.MONTH) + 1);

					for (int i = 0; i <= m2; i++) {

						Float fc = new Float(0);

						Calendar fristDay = Calendar.getInstance();
						fristDay.setTime(new Date());
						fristDay.add(Calendar.MONTH, ((ary11.get(Calendar.MONTH) + 1) - (cd1.get(Calendar.MONTH) + 1) + i));
						fristDay.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
						//////System.out.print((i)+"当前月第一天:"+DateUtil.formatG(fristDay.getTime()));

						Calendar lastDay = Calendar.getInstance();
						lastDay.setTime(new Date());
						lastDay.add(Calendar.MONTH, ((ary11.get(Calendar.MONTH) + 1) - (cd1.get(Calendar.MONTH) + 1) + i));
						lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));
						//////System.out.println("\t当前月最后一天:"+DateUtil.formatG(lastDay.getTime())+"==天数："+DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime())));

						int diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));

						// 如果是第一个月，并且不是最后一个月
						if (i == 0 && m2 != 0) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(ary11.getTime()), DateUtil.formatG(lastDay.getTime()));
							fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
							//////System.out.println(DateUtil.formatG(ary11.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
						// 中间月
						if (i != 0 && i != m2) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
							fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
							//////System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
						// 最后一个月，但开始和结束不是在同一个月
						if (i == m2 && !ym11.equals(ym22)) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
							fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
							//////System.out.println("end======"+DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
						// 开始和结束是在同一个月
						if (ym11.equals(ym22)) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(ew.getStartDate()), DateUtil.formatG(ew.getEndDate()));
							fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
							//////System.out.println(DateUtil.formatG(ew.getStartDate())+"=="+DateUtil.formatG(ew.getEndDate())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}

						// 当前月
						if (!ym11.equals(ym22) && (fristDay.get(Calendar.YEAR) + "" + (fristDay.get(Calendar.MONTH) + 1)).equals((cd.get(Calendar.YEAR) + "" + (cd.get(Calendar.MONTH) + 1)))) {
							// 表示该人员已退出项目，按退出时间来计算
							if (ew.getStatus() == 4) {
								int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
								fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
							} else {
								int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(new Date()));
								fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
							}
						}

						switch ((fristDay.get(Calendar.MONTH) + 1)) {
						case 1:
							uf.setMonth1(NumberUtils.formatNum(uf.getMonth1() + fc));
							break;
						case 2:
							uf.setMonth2(NumberUtils.formatNum(uf.getMonth2() + fc));
							break;
						case 3:
							uf.setMonth3(NumberUtils.formatNum(uf.getMonth3() + fc));
							break;
						case 4:
							uf.setMonth4(NumberUtils.formatNum(uf.getMonth4() + fc));
							break;
						case 5:
							uf.setMonth5(NumberUtils.formatNum(uf.getMonth5() + fc));
							break;
						case 6:
							uf.setMonth6(NumberUtils.formatNum(uf.getMonth6() + fc));
							break;
						case 7:
							uf.setMonth7(NumberUtils.formatNum(uf.getMonth7() + fc));
							break;
						case 8:
							uf.setMonth8(NumberUtils.formatNum(uf.getMonth8() + fc));
							break;
						case 9:
							uf.setMonth9(NumberUtils.formatNum(uf.getMonth9() + fc));
							break;
						case 10:
							uf.setMonth10(NumberUtils.formatNum(uf.getMonth10() + fc));
							break;
						case 11:
							uf.setMonth11(NumberUtils.formatNum(uf.getMonth11() + fc));
							break;
						case 12:
							uf.setMonth12(NumberUtils.formatNum(uf.getMonth12() + fc));
							break;
						default:
							break;
						}

					}

					//////System.out.println("*********************************end计算每个月的人月*************************************\r\n");

					/*
					 * //////System.out.println("*********************************begin计算每个月的人月*************************************"); //员工的每个月的人月(计算当前月的上一个月) String sd = DateUtil.formatG(ew.getStartDate()) ; String ed = DateUtil.formatG(ew.getEndDate()) ; Date startDate = DateUtil.formatGG(sd) ; Date endDate = DateUtil.formatGG(ed) ;
					 * 
					 * Calendar c1 = Calendar.getInstance() ; c1.setTime(startDate) ; int currentMonth1 = c1.get(Calendar.MONTH)+1 ;
					 * 
					 * Calendar c2 = Calendar.getInstance() ; c2.setTime(endDate) ; int currentMonth2 = c2.get(Calendar.MONTH)+1 ;
					 * 
					 * Calendar c3 = Calendar.getInstance() ; c3.setTime(new Date()) ; int currentMonth3 = c3.get(Calendar.MONTH)+1 ;
					 * 
					 * //实际工作天数 Integer day = new Integer(0) ;
					 * 
					 * for(int i=0;i<currentMonth3;i++) {
					 * 
					 * if(i+1<currentMonth3) { Calendar fristDay = Calendar.getInstance(); fristDay.add(Calendar.MONTH, (i-currentMonth3+1)); fristDay.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 ////////System.out.print((i-currentMonth3+1)+"当前月第一天:"+DateUtil.formatG(fristDay.getTime()));
					 * 
					 * Calendar lastDay = Calendar.getInstance(); lastDay.add(Calendar.MONTH,(i-currentMonth3+1)); lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));
					 * 
					 * //每个月的有效天数 long diffDay = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
					 * 
					 * if(i+1>=currentMonth1 && i+1<currentMonth2) { if(currentMonth1 == i+1) { long dateDiff = DateCal.getWorkingDays(sd, DateUtil.formatG(lastDay.getTime())); day = ((Long)dateDiff).intValue() ; //////System.err.println(""+i+"=="+day+"==第一个月有效工作天数===="+sd+"=="+DateUtil.formatG(lastDay.getTime())+"==["+dateDiff+"]"+"--"+((Integer)day).floatValue()/diffDay); } else { long dateDiff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime())); day = ((Long)dateDiff).intValue() ; //////System.err.println(""+i+"=="+day+"==中间月有效工作天数===="+DateUtil.formatG(fristDay.getTime())+"==="+DateUtil.formatG(lastDay.getTime())+"==["+dateDiff+"]"+"--"+((Integer)day).floatValue()/diffDay); } }
					 * 
					 * //最后一个月,但开始和结束日期不能是同一个月份 if(i+1 == currentMonth2 && currentMonth1 != currentMonth2) { long dateDiff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), ed); day = ((Long)dateDiff).intValue() ; //////System.err.println(""+i+"=="+day+"==最后一个月有效工作天数===="+DateUtil.formatG(fristDay.getTime())+"==="+ed+"==["+dateDiff+"]"+"--"+((Integer)day).floatValue()/diffDay); }
					 * 
					 * //开始和结束的月份是同一个月，说明该员工的有效工作日都是在当月，计算有效工作日期，则需要开始和结束日期 if(currentMonth1 == currentMonth2 && i+1 == currentMonth2) { long dateDiff = DateCal.getWorkingDays(sd, ed); day = ((Long)dateDiff).intValue() ; //////System.err.println(""+i+"=="+day+"==同一个月份有效工作天数===="+sd+"==="+ed+"==["+dateDiff+"]"+"--"+((Integer)day).floatValue()/diffDay); }
					 * 
					 * //总天数(实际的工作天数) 只能算消耗的？ //extTotalDays += day ;
					 * 
					 * //总月数（实际的工作天数除以当月的有效天数） 只能算消耗的？ extTotalYear += NumberUtils.formatNum((((Integer)day).floatValue()/((Long)diffDay).floatValue())) ;
					 * 
					 * //总人月（实际工作天数除以当月的有效天数） extTotalMM += NumberUtils.formatNum((((Integer)day).floatValue()/((Long)diffDay).floatValue())) ;
					 * 
					 * switch (i+1) { case 1: uf.setMonth1(NumberUtils.formatNum(uf.getMonth1()+((Integer)day).floatValue()/diffDay)) ; break; case 2: uf.setMonth2(NumberUtils.formatNum(uf.getMonth2()+((Integer)day).floatValue()/diffDay)) ; break; case 3: uf.setMonth3(NumberUtils.formatNum(uf.getMonth3()+((Integer)day).floatValue()/diffDay)) ; break; case 4: uf.setMonth4(NumberUtils.formatNum(uf.getMonth4()+((Integer)day).floatValue()/diffDay)) ; break; case 5: uf.setMonth5(NumberUtils.formatNum(uf.getMonth5()+((Integer)day).floatValue()/diffDay)) ; break; case 6: uf.setMonth6(NumberUtils.formatNum(uf.getMonth6()+((Integer)day).floatValue()/diffDay)) ; break; case 7: uf.setMonth7(NumberUtils.formatNum(uf.getMonth7()+((Integer)day).floatValue()/diffDay)) ; break; case 8: uf.setMonth8(NumberUtils.formatNum(uf.getMonth8()+((Integer)day).floatValue()/diffDay)) ; break; case 9: uf.setMonth9(NumberUtils.formatNum(uf.getMonth9()+((Integer)day).floatValue()/diffDay)) ; break; case 10: uf.setMonth10(NumberUtils.formatNum(uf.getMonth10()+((Integer)day).floatValue()/diffDay)) ; break; case 11: uf.setMonth11(NumberUtils.formatNum(uf.getMonth11()+((Integer)day).floatValue()/diffDay)) ; break; case 12: uf.setMonth12(NumberUtils.formatNum(uf.getMonth12()+((Integer)day).floatValue()/diffDay)) ; break; default: break; }
					 * 
					 * day = 0 ; } //////System.out.println("*********************************begin计算每个月的人月*************************************\r\n");
					 * 
					 * }
					 */
					// }

				}

				uf.setTotalTaskTime(allTotalDays); // 总天数
				uf.setTotalTaskYear(NumberUtils.formatNum(allTotalYear)); // 总月数
				uf.setAllMM(extTotalMM); // 总人月 消耗
				// uf.setTotalTaskYear((float)allTotalDays / 21f) ; //总月数
				// uf.setAllMM((float)uf.getTotalTaskTime() / 21f) ; //总人月
				// uf.setTotalHour(allOtTime) ; //加班小时
				uf.setNormalHour(allNormalHour); // 平时加班
				uf.setWeekendHour(allWeekendHour); // 周末加班
				uf.setHolidaysHour(allHolidaysHour); // 节假日加班

				forms.add(uf);
			}
		}
		return forms;
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
		
		//form.setEmp_id("0993") ;
		//form.setDept_id("649496") ;
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
