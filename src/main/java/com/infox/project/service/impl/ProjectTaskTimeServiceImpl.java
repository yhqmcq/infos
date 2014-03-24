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
import com.infox.common.util.DateCal;
import com.infox.common.util.DateUtil;
import com.infox.common.util.NumberUtils;
import com.infox.common.web.page.DataGrid;
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
				
				OrgDeptTreeEntity org = e.getOrg();
				if (null != org) {
					uf.setDept_id(e.getOrg().getId());
					uf.setDept_name(e.getOrg().getFullname());
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
					
					//System.out.println("******************************begin计算总人月**************************************");
					
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
						//System.out.print((i)+"当前月第一天:"+DateUtil.formatG(fristDay.getTime()));
						
						Calendar lastDay = Calendar.getInstance();
						lastDay.setTime(new Date());
						lastDay.add(Calendar.MONTH, ((ary1.get(Calendar.MONTH) + 1) - (cd.get(Calendar.MONTH) + 1) + i));
						lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));
						//System.out.println("\t当前月最后一天:"+DateUtil.formatG(lastDay.getTime())+"==天数："+DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime())));
						
						int diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
						
						// 如果是第一个月，并且不是最后一个月
						if (i == 0 && m != 0) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(ary1.getTime()), DateUtil.formatG(lastDay.getTime()));
							zry += NumberUtils.formatNum(uf.getMonth10() + ((Integer) wd).floatValue() / diff);
							//System.out.println(DateUtil.formatG(ary1.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
						// 中间月
						if (i != 0 && i != m) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
							zry += NumberUtils.formatNum(uf.getMonth10() + ((Integer) wd).floatValue() / diff);
							//System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
						// 最后一个月，但开始和结束不是在同一个月
						if (i == m && !ym1.equals(ym2)) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
							zry += NumberUtils.formatNum(uf.getMonth10() + ((Integer) wd).floatValue() / diff);
							//System.out.println("end======"+DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
						// 开始和结束是在同一个月
						if (ym1.equals(ym2)) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(ew.getStartDate()), DateUtil.formatG(ew.getEndDate()));
							zry += NumberUtils.formatNum(uf.getMonth10() + ((Integer) wd).floatValue() / diff);
							//System.out.println(DateUtil.formatG(ew.getStartDate())+"=="+DateUtil.formatG(ew.getEndDate())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
					}
					
					// 总月数（实际的工作天数除以当月的有效天数） 只能算消耗的？
					allTotalYear += NumberUtils.formatNum(zry);
					zry = 0f;
					//System.out.println("*********************************end计算总人月*************************************\r\n");
					
					//System.out.println("*********************************begin计算每个月的人月*************************************");
					
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
						
						//人月
						Float fc = new Float(0);
						
						//当月稼动率=（项目1天数*系数1+项目2天数*0.5+项目3天数*0.2）/21
						Float quot = new Float(0) ;
						
						Calendar fristDay = Calendar.getInstance();
						fristDay.setTime(new Date());
						fristDay.add(Calendar.MONTH, ((ary11.get(Calendar.MONTH) + 1) - (cd1.get(Calendar.MONTH) + 1) + i));
						fristDay.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
						//System.out.print((i)+"当前月第一天:"+DateUtil.formatG(fristDay.getTime()));
						
						Calendar lastDay = Calendar.getInstance();
						lastDay.setTime(new Date());
						lastDay.add(Calendar.MONTH, ((ary11.get(Calendar.MONTH) + 1) - (cd1.get(Calendar.MONTH) + 1) + i));
						lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));
						//System.out.println("\t当前月最后一天:"+DateUtil.formatG(lastDay.getTime())+"==天数："+DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime())));
						
						int diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
						
						// 如果是第一个月，并且不是最后一个月
						if (i == 0 && m2 != 0) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(ary11.getTime()), DateUtil.formatG(lastDay.getTime()));
							fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
							
							quot = NumberUtils.formatNum((((Integer) wd).floatValue() * ew.getProject().getQuot())/((Integer)diff).floatValue()) ;
							
							//System.out.println(DateUtil.formatG(ary11.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+ew.getProject().getQuot() +"  1稼动率"+quot);
							
							//System.out.println("==="+(((Integer) wd).floatValue() / diff));
							
							//System.out.println(DateUtil.formatG(ary11.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
						// 中间月
						if (i != 0 && i != m2) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
							fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
							
							quot = NumberUtils.formatNum((((Integer) wd).floatValue() * ew.getProject().getQuot())/((Integer)diff).floatValue()) ;
							
							//System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+ew.getProject().getQuot() +"  2稼动率"+quot);
							
							//System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
						// 最后一个月，但开始和结束不是在同一个月
						if (i == m2 && !ym11.equals(ym22)) {
							//并且不是已退出想的，如果是退出项目的，则有下面的来计算
							if(ew.getStatus() != 4) {
								int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
								fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
								
								quot = NumberUtils.formatNum((((Integer) wd).floatValue() * ew.getProject().getQuot())/((Integer)diff).floatValue()) ;
								//System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+ew.getProject().getQuot() +"  3稼22动率"+quot);
							}
							
							//System.out.println("end======"+DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
						// 开始和结束是在同一个月
						if (ym11.equals(ym22)) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(ew.getStartDate()), DateUtil.formatG(ew.getEndDate()));
							fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
							
							quot = NumberUtils.formatNum((((Integer) wd).floatValue() * ew.getProject().getQuot())/((Integer)diff).floatValue()) ;
							//System.out.println(DateUtil.formatG(ew.getStartDate())+"=="+DateUtil.formatG(ew.getEndDate())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+ew.getProject().getQuot() +"  4稼动率"+quot);
							
							//System.out.println(DateUtil.formatG(ew.getStartDate())+"=="+DateUtil.formatG(ew.getEndDate())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
						
						// 当前月
						if (!ym11.equals(ym22) && (fristDay.get(Calendar.YEAR) + "" + (fristDay.get(Calendar.MONTH) + 1)).equals((cd.get(Calendar.YEAR) + "" + (cd.get(Calendar.MONTH) + 1)))) {
							// 表示该人员已退出项目，按退出时间来计算
							if (ew.getStatus() == 4) {
								int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
								fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
								
								quot = NumberUtils.formatNum((((Integer) wd).floatValue() * ew.getProject().getQuot())/((Integer)diff).floatValue()) ;
								
								//System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+ew.getProject().getQuot() +"  5稼动率"+quot);
								
							} else {
								int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(new Date()));
								fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
								
								quot = NumberUtils.formatNum((((Integer) wd).floatValue() * ew.getProject().getQuot())/((Integer)diff).floatValue()) ;
								//System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(new Date())+ew.getEmp().getTruename() +"  项目："+ ew.getProject().getName() + "  当月有效天数"+diff  + "  实际工作天数"+wd  + "  系数"+ew.getProject().getQuot() +"  6稼动率"+quot);
								
							}
						}
						
						switch ((fristDay.get(Calendar.MONTH) + 1)) {
						case 1:
							//原本是fc的,人月
							//uf.setMonth1(NumberUtils.formatNum(uf.getMonth1() + fc));
							uf.setMonth1(NumberUtils.formatNum(uf.getMonth1() + quot));
							month1 += uf.getMonth1();
							break;
						case 2:
							uf.setMonth2(NumberUtils.formatNum(uf.getMonth2() + quot));
							month2 += uf.getMonth2();
							break;
						case 3:
							uf.setMonth3(NumberUtils.formatNum(uf.getMonth3() + quot));
							month3 += uf.getMonth3();
							break;
						case 4:
							uf.setMonth4(NumberUtils.formatNum(uf.getMonth4() + quot));
							month4 += uf.getMonth4();
							break;
						case 5:
							uf.setMonth5(NumberUtils.formatNum(uf.getMonth5() + quot));
							month5 += uf.getMonth5();
							break;
						case 6:
							uf.setMonth6(NumberUtils.formatNum(uf.getMonth6() + quot));
							month6 += uf.getMonth6();
							break;
						case 7:
							uf.setMonth7(NumberUtils.formatNum(uf.getMonth7() + quot));
							month7 += uf.getMonth7();
							break;
						case 8:
							uf.setMonth8(NumberUtils.formatNum(uf.getMonth8() + quot));
							month8 += uf.getMonth8();
							break;
						case 9:
							uf.setMonth9(NumberUtils.formatNum(uf.getMonth9() + quot));
							month9 += uf.getMonth9();
							break;
						case 10:
							uf.setMonth10(NumberUtils.formatNum(uf.getMonth10() + quot));
							month10 += uf.getMonth10();
							break;
						case 11:
							uf.setMonth11(NumberUtils.formatNum(uf.getMonth11() + quot));
							month11 += uf.getMonth11();
							break;
						case 12:
							uf.setMonth12(NumberUtils.formatNum(uf.getMonth12() + quot));
							month12 += uf.getMonth12();
							break;
						default:
							break;
						}
					}
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
				if(e.getTruename().equals("徐瀅")) {
				}
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
			pf.setDept_name(e.getOrg().getFullname());
			pf.setSd(DateUtil.formatG(p.getStartDate()));
			pf.setEd(DateUtil.formatG(p.getEndDate()));
			pf.setProject_name(p.getProject().getName());
			pf.setProject_role(p.getProject_role());

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

					//System.out.println("*********************equals*************************");
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
					// System.out.println("***********************equals***********************\r\n");
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
					uf.setDept_name(e.getOrg().getFullname());
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

					//System.out.println("******************************begin计算总人月**************************************");

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
						//System.out.print((i)+"当前月第一天:"+DateUtil.formatG(fristDay.getTime()));

						Calendar lastDay = Calendar.getInstance();
						lastDay.setTime(new Date());
						lastDay.add(Calendar.MONTH, ((ary1.get(Calendar.MONTH) + 1) - (cd.get(Calendar.MONTH) + 1) + i));
						lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));
						//System.out.println("\t当前月最后一天:"+DateUtil.formatG(lastDay.getTime())+"==天数："+DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime())));

						int diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));

						// 如果是第一个月，并且不是最后一个月
						if (i == 0 && m != 0) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(ary1.getTime()), DateUtil.formatG(lastDay.getTime()));
							zry += NumberUtils.formatNum(uf.getMonth10() + ((Integer) wd).floatValue() / diff);
							//System.out.println(DateUtil.formatG(ary1.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
						// 中间月
						if (i != 0 && i != m) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
							zry += NumberUtils.formatNum(uf.getMonth10() + ((Integer) wd).floatValue() / diff);
							//System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
						// 最后一个月，但开始和结束不是在同一个月
						if (i == m && !ym1.equals(ym2)) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
							zry += NumberUtils.formatNum(uf.getMonth10() + ((Integer) wd).floatValue() / diff);
							//System.out.println("end======"+DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
						// 开始和结束是在同一个月
						if (ym1.equals(ym2)) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(ew.getStartDate()), DateUtil.formatG(ew.getEndDate()));
							zry += NumberUtils.formatNum(uf.getMonth10() + ((Integer) wd).floatValue() / diff);
							//System.out.println(DateUtil.formatG(ew.getStartDate())+"=="+DateUtil.formatG(ew.getEndDate())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
					}

					// 总月数（实际的工作天数除以当月的有效天数） 只能算消耗的？
					allTotalYear += NumberUtils.formatNum(zry);
					zry = 0f;
					//System.out.println("*********************************end计算总人月*************************************\r\n");

					//System.out.println("*********************************begin计算每个月的人月*************************************");

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
						//System.out.print((i)+"当前月第一天:"+DateUtil.formatG(fristDay.getTime()));

						Calendar lastDay = Calendar.getInstance();
						lastDay.setTime(new Date());
						lastDay.add(Calendar.MONTH, ((ary11.get(Calendar.MONTH) + 1) - (cd1.get(Calendar.MONTH) + 1) + i));
						lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));
						//System.out.println("\t当前月最后一天:"+DateUtil.formatG(lastDay.getTime())+"==天数："+DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime())));

						int diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));

						// 如果是第一个月，并且不是最后一个月
						if (i == 0 && m2 != 0) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(ary11.getTime()), DateUtil.formatG(lastDay.getTime()));
							fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
							//System.out.println(DateUtil.formatG(ary11.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
						// 中间月
						if (i != 0 && i != m2) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
							fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
							//System.out.println(DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
						// 最后一个月，但开始和结束不是在同一个月
						if (i == m2 && !ym11.equals(ym22)) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(ew.getEndDate()));
							fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
							//System.out.println("end======"+DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(ew.getEndDate())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
						}
						// 开始和结束是在同一个月
						if (ym11.equals(ym22)) {
							int wd = DateCal.getWorkingDays(DateUtil.formatG(ew.getStartDate()), DateUtil.formatG(ew.getEndDate()));
							fc = NumberUtils.formatNum(((Integer) wd).floatValue() / diff);
							//System.out.println(DateUtil.formatG(ew.getStartDate())+"=="+DateUtil.formatG(ew.getEndDate())+"  天数："+wd+"=="+NumberUtils.formatNum(uf.getMonth10()+((Integer)wd).floatValue()/diff));
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

					//System.out.println("*********************************end计算每个月的人月*************************************\r\n");

					/*
					 * //System.out.println("*********************************begin计算每个月的人月*************************************"); //员工的每个月的人月(计算当前月的上一个月) String sd = DateUtil.formatG(ew.getStartDate()) ; String ed = DateUtil.formatG(ew.getEndDate()) ; Date startDate = DateUtil.formatGG(sd) ; Date endDate = DateUtil.formatGG(ed) ;
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
					 * if(i+1<currentMonth3) { Calendar fristDay = Calendar.getInstance(); fristDay.add(Calendar.MONTH, (i-currentMonth3+1)); fristDay.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 ////System.out.print((i-currentMonth3+1)+"当前月第一天:"+DateUtil.formatG(fristDay.getTime()));
					 * 
					 * Calendar lastDay = Calendar.getInstance(); lastDay.add(Calendar.MONTH,(i-currentMonth3+1)); lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));
					 * 
					 * //每个月的有效天数 long diffDay = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
					 * 
					 * if(i+1>=currentMonth1 && i+1<currentMonth2) { if(currentMonth1 == i+1) { long dateDiff = DateCal.getWorkingDays(sd, DateUtil.formatG(lastDay.getTime())); day = ((Long)dateDiff).intValue() ; //System.err.println(""+i+"=="+day+"==第一个月有效工作天数===="+sd+"=="+DateUtil.formatG(lastDay.getTime())+"==["+dateDiff+"]"+"--"+((Integer)day).floatValue()/diffDay); } else { long dateDiff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime())); day = ((Long)dateDiff).intValue() ; //System.err.println(""+i+"=="+day+"==中间月有效工作天数===="+DateUtil.formatG(fristDay.getTime())+"==="+DateUtil.formatG(lastDay.getTime())+"==["+dateDiff+"]"+"--"+((Integer)day).floatValue()/diffDay); } }
					 * 
					 * //最后一个月,但开始和结束日期不能是同一个月份 if(i+1 == currentMonth2 && currentMonth1 != currentMonth2) { long dateDiff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), ed); day = ((Long)dateDiff).intValue() ; //System.err.println(""+i+"=="+day+"==最后一个月有效工作天数===="+DateUtil.formatG(fristDay.getTime())+"==="+ed+"==["+dateDiff+"]"+"--"+((Integer)day).floatValue()/diffDay); }
					 * 
					 * //开始和结束的月份是同一个月，说明该员工的有效工作日都是在当月，计算有效工作日期，则需要开始和结束日期 if(currentMonth1 == currentMonth2 && i+1 == currentMonth2) { long dateDiff = DateCal.getWorkingDays(sd, ed); day = ((Long)dateDiff).intValue() ; //System.err.println(""+i+"=="+day+"==同一个月份有效工作天数===="+sd+"==="+ed+"==["+dateDiff+"]"+"--"+((Integer)day).floatValue()/diffDay); }
					 * 
					 * //总天数(实际的工作天数) 只能算消耗的？ //extTotalDays += day ;
					 * 
					 * //总月数（实际的工作天数除以当月的有效天数） 只能算消耗的？ extTotalYear += NumberUtils.formatNum((((Integer)day).floatValue()/((Long)diffDay).floatValue())) ;
					 * 
					 * //总人月（实际工作天数除以当月的有效天数） extTotalMM += NumberUtils.formatNum((((Integer)day).floatValue()/((Long)diffDay).floatValue())) ;
					 * 
					 * switch (i+1) { case 1: uf.setMonth1(NumberUtils.formatNum(uf.getMonth1()+((Integer)day).floatValue()/diffDay)) ; break; case 2: uf.setMonth2(NumberUtils.formatNum(uf.getMonth2()+((Integer)day).floatValue()/diffDay)) ; break; case 3: uf.setMonth3(NumberUtils.formatNum(uf.getMonth3()+((Integer)day).floatValue()/diffDay)) ; break; case 4: uf.setMonth4(NumberUtils.formatNum(uf.getMonth4()+((Integer)day).floatValue()/diffDay)) ; break; case 5: uf.setMonth5(NumberUtils.formatNum(uf.getMonth5()+((Integer)day).floatValue()/diffDay)) ; break; case 6: uf.setMonth6(NumberUtils.formatNum(uf.getMonth6()+((Integer)day).floatValue()/diffDay)) ; break; case 7: uf.setMonth7(NumberUtils.formatNum(uf.getMonth7()+((Integer)day).floatValue()/diffDay)) ; break; case 8: uf.setMonth8(NumberUtils.formatNum(uf.getMonth8()+((Integer)day).floatValue()/diffDay)) ; break; case 9: uf.setMonth9(NumberUtils.formatNum(uf.getMonth9()+((Integer)day).floatValue()/diffDay)) ; break; case 10: uf.setMonth10(NumberUtils.formatNum(uf.getMonth10()+((Integer)day).floatValue()/diffDay)) ; break; case 11: uf.setMonth11(NumberUtils.formatNum(uf.getMonth11()+((Integer)day).floatValue()/diffDay)) ; break; case 12: uf.setMonth12(NumberUtils.formatNum(uf.getMonth12()+((Integer)day).floatValue()/diffDay)) ; break; default: break; }
					 * 
					 * day = 0 ; } //System.out.println("*********************************begin计算每个月的人月*************************************\r\n");
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
				hql += " and t.emp.id=:emp_id";
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
		}
		return hql;
	}

}
