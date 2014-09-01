package com.infox.project.service.impl;

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
	private RealPathResolver realPathResolver ;
	@Autowired
	private BaseDaoI<OvertimeEntity> basedaoOvertime ;
	
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
		//form.setEmp_id("1071") ;
		/*
		String sqlall = "" +
				"SELECT e " +
				"FROM EmployeeEntity AS e LEFT JOIN e.org AS d " +
				"left join fetch e.empWorks works " +
				"where e.org.id = '705624'" +
				"" ;
		List<EmployeeEntity> find = this.basedaoEmployee.find(sqlall) ;
		for (EmployeeEntity e : find) {
			System.out.println(e.getTruename());
		}
		System.out.println(find.size());
		
		
		//不写了，早点休息，明天去澳门赢点钱先（赢   赢   赢   赢   赢   赢   赢   赢   赢   赢   赢   赢   赢   赢   赢   赢   赢   赢   赢   赢   赢   赢 ）.................
		String hql = "select t from EmployeeEntity t where 1=1 and t.org.id='979739'" ;
		List<EmployeeEntity> emps = this.basedaoEmployee.find(hql) ;
		for (EmployeeEntity e : emps) {
			System.out.println(e.getId() + "==" + e.getTruename());
			Set<ProjectEmpWorkingEntity> empWorks = e.getEmpWorks() ;
			for (ProjectEmpWorkingEntity ew : empWorks) {
				System.out.println(DateUtil.formatG(ew.getStartDate()) + "<-->" + DateUtil.formatG(ew.getEndDate()));
			}
		}
		*/
		DataGrid datagrid = new DataGrid();
		datagrid.setTotal(this.total(form));
		datagrid.setRows(this.changeModel(this.find(form)));
		return datagrid;
	}
	
	@Override
	public DataGrid getMemberInfoList(ProjectTaskTimeForm form) throws Exception {
		DataGrid datagrid = new DataGrid();
		
		List<ProjectTaskTimeForm> forms = new ArrayList<ProjectTaskTimeForm>();
		
		String hql = "select t from ProjectEmpWorkingEntity t where 1=1 and t.emp.id=:emp_id" ;
		Map<String, Object> params = new HashMap<String, Object>() ;
		params.put("emp_id", form.getEmp_id()) ;
		List<ProjectEmpWorkingEntity> find = this.basedaoProjectEW.find(hql, params) ;
		
		for (ProjectEmpWorkingEntity p : find) {
			//人月
			Float totalMonth = new Float(0) ;
			//消耗人月
			Float extMonth = new Float(0) ;
			
			ProjectTaskTimeForm pf = new ProjectTaskTimeForm() ;
			EmployeeEntity e = p.getEmp() ;
			pf.setEmp_id(e.getId()) ;
			pf.setEmp_name(e.getTruename()) ;
			pf.setDept_name(e.getOrg().getFullname()) ;
			pf.setSd(DateUtil.formatG(p.getStartDate())) ;
			pf.setEd(DateUtil.formatG(p.getEndDate())) ;
			pf.setProject_name(p.getProject().getName()) ;
			pf.setProject_role(p.getProject_role()) ;
			
			//加班小时
			Map<String, Object> paramsOT = new HashMap<String, Object>() ;
			paramsOT.put("empid", e.getId()) ; paramsOT.put("project_id", p.getProject().getId()) ;
			OvertimeEntity oe = this.basedaoOvertime.get("select t from OvertimeEntity t where t.emp.id=:empid and t.project.id=:project_id", paramsOT) ;
			if(null != oe) {
				pf.setTotalHour(oe.getHour()) ;
			}
			
			//岗位
			StringBuffer sb1 = new StringBuffer() ;
			StringBuffer sb2 = new StringBuffer() ;
			Set<EmpJobEntity> empjobs = p.getEmp().getEmpjobs() ;
			for (EmpJobEntity eje : empjobs) {
				sb1.append(eje.getJob_name()) ;
				sb2.append(eje.getJob_sname()) ;
			}
			pf.setPosition_name(sb1.toString()) ;
			pf.setPosition_sname(sb2.toString()) ;
			
			
			
			
			
			long dateDiff = DateCal.getWorkingDays(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(p.getEndDate()));
			//员工总有效工作天数
			long lastdateDiff = 0 ;
			
			//如果结束日期大于今天，已消耗天数的则不以当前的日期来计算
			int compare_date2 = DateUtil.compare_date2(DateUtil.formatG(new Date()), DateUtil.formatG(p.getEndDate())) ;
			if(compare_date2 == 1) {
				lastdateDiff = DateCal.getWorkingDays(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(p.getEndDate())) ;
			} else {
				lastdateDiff = DateCal.getWorkingDays(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(new Date())) ;
			}
			
				
			String sd = DateUtil.formatG(p.getStartDate()) ;
			String ed = DateUtil.formatG(p.getEndDate()) ;
			Date startDate = DateUtil.formatGG(sd) ;
			Date endDate = DateUtil.formatGG(ed) ;
			
			//开始日期和结束日期相差的月数
			int monthSpace = DateUtil.getDiffer(sd, ed) ;
			
			Calendar c1 = Calendar.getInstance() ;
			c1.setTime(startDate) ;
			int currentMonth1 = c1.get(Calendar.MONTH)+1 ;
			int currentYear1 = c1.get(Calendar.YEAR) ;
			
			Calendar c2 = Calendar.getInstance() ;
			c2.setTime(endDate) ;
			int currentMonth2 = c2.get(Calendar.MONTH)+1 ;
			int currentYear2 = c2.get(Calendar.YEAR) ;
			
			for(int i=0;i<monthSpace;i++) {
				Calendar fristDay = Calendar.getInstance();
				fristDay.setTime(DateUtil.formatGG(sd)) ;
				fristDay.add(Calendar.MONTH, i);
				fristDay.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
				//System.out.print("当前月第一天:"+DateUtil.formatG(fristDay.getTime()));
				
				Calendar lastDay = Calendar.getInstance();  
				lastDay.setTime(DateUtil.formatGG(sd)) ;
				lastDay.add(Calendar.MONTH,(i));
				lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));  
				//System.out.println("\t当前月最后一天:"+DateUtil.formatG(lastDay.getTime()));
				
				//每个月的有效天数
				long diffDay = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
				
				String ym1 = currentYear1+""+currentMonth1 ;
				String ym2 = currentYear2+""+currentMonth2 ;
				String frist = fristDay.get(Calendar.YEAR)+""+(fristDay.get(Calendar.MONTH)+1) ;
				
				//时间有效工作天数
				Integer day = new Integer(0) ;
				
				//第一个月
				if(ym1.equals(frist) && !ym1.equals(ym2)) {
					long diff = DateCal.getWorkingDays(sd, DateUtil.formatG(lastDay.getTime()));
					day+=((Long)diff).intValue() ;
					totalMonth+=((Long)diff).floatValue()/((Long)diffDay).floatValue();
					System.out.println(((Long)diff).floatValue()/((Long)diffDay).floatValue());
					System.err.println("第一个月有效工作天数===="+sd+"=="+DateUtil.formatG(lastDay.getTime())+"==["+diff+"]"+"==【"+diffDay+"】"+((Long)diff).floatValue()/((Long)diffDay).floatValue());
					
					//计算已消耗人月
					if(lastdateDiff<=diff) {
						
					}
				}
				
				//中间月
				if(!ym1.equals(frist) && !ym2.equals(frist) && !ym1.equals(ym2)) {
					long diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
					day+=((Long)diff).intValue() ;
					totalMonth+=((Long)diff).floatValue()/((Long)diffDay).floatValue();
					System.out.println(((Long)diff).floatValue()/((Long)diffDay).floatValue());
					System.err.println("中间月有效工作天数===="+DateUtil.formatG(fristDay.getTime())+"=="+DateUtil.formatG(lastDay.getTime())+"==["+diff+"]"+"==【"+diffDay+"】"+((Long)diff).floatValue()/((Long)diffDay).floatValue());
				}
				
				//最后一个月
				if(ym2.equals(frist) && !ym1.equals(ym2)) {
					long diff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), ed);
					day+=((Long)diff).intValue() ;
					totalMonth+=((Long)diff).floatValue()/((Long)diffDay).floatValue();
					System.err.println("最后一个月有效工作天数===="+DateUtil.formatG(fristDay.getTime())+"=="+ed+"==["+diff+"]"+"==【"+diffDay+"】"+((Long)diff).floatValue()/((Long)diffDay).floatValue());
				}
				
				//单月（开始日期和结束日期都在单月）
				if(ym1.equals(ym2)) {
					long diff = DateCal.getWorkingDays(sd, ed);
					day+=((Long)diff).intValue() ;
					totalMonth+=((Long)diff).floatValue()/((Long)diffDay).floatValue();
					System.err.println("开始日期和结束日期都在单月有效工作天数===="+sd+"=="+DateUtil.formatG(lastDay.getTime())+"==["+diff+"]"+"==【"+diffDay+"】"+((Long)diff).floatValue()/((Long)diffDay).floatValue());
				}
				
				day = 0 ;
				System.out.println("");
				}
				
			pf.setTotalTaskTime(dateDiff) ;
			pf.setExpendDays(lastdateDiff) ;
			pf.setMm(totalMonth) ;
			pf.setExpendMM((pf.getExpendDays()/21f)) ;
			
			pf.setStatus(p.getStatus()) ;
			
			forms.add(pf) ;
		}
		
		
		datagrid.setRows(forms);
		return datagrid;
	}
	
	private List<ProjectTaskTimeForm> changeModel(List<EmployeeEntity> entitys) {
		List<ProjectTaskTimeForm> forms = new ArrayList<ProjectTaskTimeForm>();

		if (null != entitys && entitys.size() > 0) {
			for (EmployeeEntity e : entitys) {
				//总天数
				long allTotalDays = 0 ;
				//总月数
				Float allTotalYear = new Float(0) ;
				//总人月
				Float allTotalMM = new Float(0) ;
				//总加班小时
				float allOtTime = 0f ;
				
				ProjectTaskTimeForm uf = new ProjectTaskTimeForm();
				
				uf.setEmp_id(e.getId()) ;
				uf.setEmp_name(e.getTruename()) ;
				
				OrgDeptTreeEntity org = e.getOrg() ;
				if(null != org) {
					uf.setDept_id(e.getOrg().getId()) ;
					uf.setDept_name(e.getOrg().getFullname()) ;
				}
				
				Set<EmpJobEntity> empjobs = e.getEmpjobs() ;
				if(null != empjobs && empjobs.size() > 0) {
					StringBuffer sIds = new StringBuffer() ;
					StringBuffer sNames = new StringBuffer() ;
					for (EmpJobEntity ej : empjobs) {
						sIds.append(ej.getId()+",".trim()) ;
						sNames.append(ej.getJob_name()+",".trim()) ;
					}
					uf.setPosition_id(sIds.deleteCharAt(sIds.length()-1).toString());
					uf.setPosition_name(sNames.deleteCharAt(sNames.length()-1).toString());
				}
				
				//加班小时
				Set<OvertimeEntity> overtime = e.getOvertime() ;
				for (OvertimeEntity oe : overtime) {
					allOtTime += oe.getHour() ;
				}
				
				Calendar c = Calendar.getInstance() ;
				c.setTime(DateUtil.formatGG("2014-01-01")) ;
				c.add(Calendar.MONTH, 0-(c.get(Calendar.MONTH)));
				c.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
				String yd1 = DateUtil.formatG(c.getTime()) ;
				c.add(Calendar.MONTH,12-(c.get(Calendar.MONTH))-1);
				c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));  
				String yd2 = DateUtil.formatG(c.getTime()) ;
				
				
				System.out.println("---"+yd1+"=="+yd2);
				//根据年份选择
				Map<String, Object> params = new HashMap<String, Object>() ;
				params.put("empid", e.getId()) ;
				params.put("startdate", DateUtil.formatGG(yd1)) ;
				params.put("enddate",  DateUtil.formatGG(yd2)) ;
						
				List<ProjectEmpWorkingEntity> pews = this.basedaoProjectEW.find("select t from ProjectEmpWorkingEntity t where t.emp.id=:empid and t.startDate between :startdate and :enddate", params) ;
				for (ProjectEmpWorkingEntity ew : pews) {
				
					//计算有效天数（减去周六日）
					//long totalDays = DateCal.getWorkingDays(DateUtil.formatG(ew.getStartDate()), DateUtil.formatG(ew.getEndDate()));
					//allTotalDays += totalDays ;
					
					//员工的每个月的人月(计算当前月的上一个月)
					String sd = DateUtil.formatG(ew.getStartDate()) ;
					String ed = DateUtil.formatG(ew.getEndDate()) ;
					Date startDate = DateUtil.formatGG(sd) ;
					Date endDate = DateUtil.formatGG(ed) ;
					
					Calendar c1 = Calendar.getInstance() ;
					c1.setTime(startDate) ;
					int currentMonth1 = c1.get(Calendar.MONTH)+1 ;
					
					Calendar c2 = Calendar.getInstance() ;
					c2.setTime(endDate) ;
					int currentMonth2 = c2.get(Calendar.MONTH)+1 ;
					
					Calendar c3 = Calendar.getInstance() ;
					c3.setTime(new Date()) ;
					int currentMonth3 = c3.get(Calendar.MONTH)+1 ;
					
					//实际工作天数
					Integer day = new Integer(0) ;
					
					for(int i=0;i<currentMonth3;i++) {
						
						if(i+1<currentMonth3) {
							Calendar fristDay = Calendar.getInstance();
							fristDay.add(Calendar.MONTH, (i-currentMonth3+1));
							fristDay.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
							//System.out.print((i-currentMonth3+1)+"当前月第一天:"+DateUtil.formatG(fristDay.getTime()));
							
							Calendar lastDay = Calendar.getInstance();  
							lastDay.add(Calendar.MONTH,(i-currentMonth3+1));
							lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));  
							//System.out.print("\t当前月最后一天:"+DateUtil.formatG(lastDay.getTime()) +"\r\n");
							
							//每个月的有效天数
							long diffDay = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
							
							if(i+1>=currentMonth1 && i+1<currentMonth2) {
								if(currentMonth1 == i+1) {
									long dateDiff = DateCal.getWorkingDays(sd, DateUtil.formatG(lastDay.getTime()));
									day = ((Long)dateDiff).intValue() ;
									//System.err.println("\t\t\t\t\t"+i+"=="+day+"==第一个月有效工作天数===="+sd+"=="+DateUtil.formatG(lastDay.getTime())+"==["+dateDiff+"]");
								} else {
									long dateDiff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
									day = ((Long)dateDiff).intValue() ;
									//System.err.println("\t\t\t\t\t"+i+"=="+day+"==中间月有效工作天数===="+DateUtil.formatG(fristDay.getTime())+"==="+DateUtil.formatG(lastDay.getTime())+"==["+dateDiff+"]");
								}
							} 
							
							//最后一个月,但开始和结束日期不能是同一个月份
							if(i+1 == currentMonth2 && currentMonth1 != currentMonth2) {
								long dateDiff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), ed);
								day = ((Long)dateDiff).intValue() ;
								//System.err.println("\t\t\t\t\t"+i+"=="+day+"==最后一个月有效工作天数===="+DateUtil.formatG(fristDay.getTime())+"==="+ed+"==["+dateDiff+"]");
							}
							
							//开始和结束的月份是同一个月，说明该员工的有效工作日都是在当月，计算有效工作日期，则需要开始和结束日期
							if(currentMonth1 == currentMonth2 && i+1 == currentMonth2) {
								long dateDiff = DateCal.getWorkingDays(sd, ed);
								day = ((Long)dateDiff).intValue() ;
								//System.err.println("\t\t\t\t\t"+i+"=="+day+"==同一个月份有效工作天数===="+sd+"==="+ed+"==["+dateDiff+"]");
							}
							
							//总天数(实际的工作天数)
							allTotalDays += day ;
							//总月数（实际的工作天数除以当月的有效天数）
							allTotalYear += (((Integer)day).floatValue()/((Long)diffDay).floatValue()) ;
							//总人月（实际工作天数除以当月的有效天数）
							allTotalMM += (((Integer)day).floatValue()/((Long)diffDay).floatValue()) ;
							
							switch (i+1) {
							case 1:
								uf.setMonth1(uf.getMonth1()+((Integer)day).floatValue()/diffDay) ;
								break;
							case 2:
								uf.setMonth2(uf.getMonth2()+((Integer)day).floatValue()/diffDay) ;
								break;
							case 3:
								uf.setMonth3(uf.getMonth3()+((Integer)day).floatValue()/diffDay) ;
								break;
							case 4:
								uf.setMonth4(uf.getMonth4()+((Integer)day).floatValue()/diffDay) ;
								break;
							case 5:
								uf.setMonth5(uf.getMonth5()+((Integer)day).floatValue()/diffDay) ;
								break;
							case 6:
								uf.setMonth6(uf.getMonth6()+((Integer)day).floatValue()/diffDay) ;
								break;
							case 7:
								uf.setMonth7(uf.getMonth7()+((Integer)day).floatValue()/diffDay) ;
								break;
							case 8:
								uf.setMonth8(uf.getMonth8()+((Integer)day).floatValue()/diffDay) ;
								break;
							case 9:
								uf.setMonth9(uf.getMonth9()+((Integer)day).floatValue()/diffDay) ;
								break;
							case 10:
								uf.setMonth10(uf.getMonth10()+((Integer)day).floatValue()/diffDay) ;
								break;
							case 11:
								uf.setMonth11(uf.getMonth11()+((Integer)day).floatValue()/diffDay) ;
								break;
							case 12:
								uf.setMonth12(uf.getMonth12()+((Integer)day).floatValue()/diffDay) ;
								break;
							default:
								break;
							}
							
							day = 0 ;
						}
					}
					
				}
				uf.setTotalTaskTime(allTotalDays) ;	//总天数
				uf.setTotalTaskYear(allTotalYear) ;	//总月数
				uf.setAllMM(allTotalMM) ;			//总人月
				//uf.setTotalTaskYear((float)allTotalDays / 21f) ;	//总月数
				//uf.setAllMM((float)uf.getTotalTaskTime() / 21f) ;	//总人月
				uf.setTotalHour(allOtTime) ; 	//加班小时
				
				forms.add(uf);
			}
		}
		return forms;
	}
	
	public static int workday(String sd, String ed) {
		Date startDate = DateUtil.formatGG(sd) ;
		Date endDate = DateUtil.formatGG(ed) ;
		
		Calendar c1 = Calendar.getInstance() ;
		c1.setTime(startDate) ;
		int currentMonth1 = c1.get(Calendar.MONTH)+1 ;
		
		Calendar c2 = Calendar.getInstance() ;
		c2.setTime(endDate) ;
		int currentMonth2 = c2.get(Calendar.MONTH)+1 ;
		
		Calendar c3 = Calendar.getInstance() ;
		c3.setTime(new Date()) ;
		int currentMonth3 = c3.get(Calendar.MONTH)+1 ;
		
		System.out.println("startDate当前月：" + currentMonth1);
		System.out.println("endDate当前月：" + currentMonth2);
		System.out.println("currentMonth3当前月：" + currentMonth3+"\r\n");
		
		Integer day = new Integer(0) ;
		
		for(int i=0;i<currentMonth3;i++) {
			
			if(i+1<currentMonth3) {
				Calendar fristDay = Calendar.getInstance();
				fristDay.add(Calendar.MONTH, (i-currentMonth3+1));
				fristDay.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
				System.out.print((i-currentMonth3+1)+"当前月第一天:"+DateUtil.formatG(fristDay.getTime()));
				
				Calendar lastDay = Calendar.getInstance();  
				lastDay.add(Calendar.MONTH,(i-currentMonth3+1));
				lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));  
				System.out.print("\t当前月最后一天:"+DateUtil.formatG(lastDay.getTime()) +"\r\n");
				
				if(i+1>=currentMonth1 && i+1<currentMonth2) {
					if(currentMonth1 == i+1) {
						long dateDiff = DateCal.getWorkingDays(sd, DateUtil.formatG(lastDay.getTime()));
						day = ((Long)dateDiff).intValue() ;
						System.err.println("\t\t\t\t\t"+i+"=="+day+"==第一个月有效工作天数===="+sd+"=="+DateUtil.formatG(lastDay.getTime())+"==["+dateDiff+"]");
					} else {
						long dateDiff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), DateUtil.formatG(lastDay.getTime()));
						day = ((Long)dateDiff).intValue() ;
						System.err.println("\t\t\t\t\t"+i+"=="+day+"==中间月有效工作天数===="+DateUtil.formatG(fristDay.getTime())+"==="+DateUtil.formatG(lastDay.getTime())+"==["+dateDiff+"]");
					}
				} 
				
				//最后一个月,但开始和结束日期不能是同一个月份
				if(i+1 == currentMonth2 && currentMonth1 != currentMonth2) {
					long dateDiff = DateCal.getWorkingDays(DateUtil.formatG(fristDay.getTime()), ed);
					day = ((Long)dateDiff).intValue() ;
					System.err.println("\t\t\t\t\t"+i+"=="+day+"==最后一个月有效工作天数===="+DateUtil.formatG(fristDay.getTime())+"==="+ed+"==["+dateDiff+"]");
				}
				
				//开始和结束的月份是同一个月，说明该员工的有效工作日都是在当月，计算有效工作日期，则需要开始和结束日期
				if(currentMonth1 == currentMonth2 && i+1 == currentMonth2) {
					long dateDiff = DateCal.getWorkingDays(sd, ed);
					day = ((Long)dateDiff).intValue() ;
					System.err.println("\t\t\t\t\t"+i+"=="+day+"==同一个月份有效工作天数===="+sd+"==="+ed+"==["+dateDiff+"]");
				}
				
			}
		}
		System.out.println("");
		return currentMonth3;
	}
	
	public static void main(String[] args) {
		
		workday("2014-03-09", "2014-06-13") ;
		
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
				String[] split = form.getInStatus().split(",") ;
				Integer[] states = new Integer[split.length] ;
				for(int i=0;i<states.length;i++) {
					states[i] = Integer.parseInt(split[i]) ;
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
				String[] split = form.getInStatus().split(",") ;
				Integer[] states = new Integer[split.length] ;
				for(int i=0;i<states.length;i++) {
					states[i] = Integer.parseInt(split[i]) ;
				}
				params.put("workStatus", states);
			}
		}
		return hql;
	}


}
