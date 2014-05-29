package com.infox.common.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtil {

	public static final String FORMAT_STYLE_A = "yyyy-MM";
	public static final String FORMAT_STYLE_B = "MM-dd";
	public static final String FORMAT_STYLE_C = "HH:mm";
	public static final String FORMAT_STYLE_D = "MM-dd HH:mm";
	public static final String FORMAT_STYLE_E = "yyyy-MM-dd HH:mm";
	public static final String FORMAT_STYLE_F = "yyyy-MM-dd HH:mm:ss";
	public static final String FORMAT_STYLE_G = "yyyy-MM-dd";
	public static final String FORMAT_STYLE_H = "MM月dd日";
	public static final String FORMAT_STYLE_I = "yyyyMMdd-HHmmss";

	/** 年-月 */
	public static String formatA(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_STYLE_A);
		return sdf.format(date);
	}

	/** 月-日 */
	public static String formatB(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_STYLE_B);
		return sdf.format(date);
	}

	/** 时-分 */
	public static String formatC(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_STYLE_C);
		return sdf.format(date);
	}

	/** 月-日 时:分 */
	public static String formatD(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_STYLE_D);
		return sdf.format(date);
	}

	/** 年-月-日 时:分 */
	public static String formatE(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_STYLE_E);
		return sdf.format(date);
	}
	
	/** 年-月-日 时:分:秒 */
	public static String formatF(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_STYLE_F);
		if(null != date && !"".equals(date)) {
			return sdf.format(date);
		}
		return null;
	}
	
	/** 年月日 时分秒 */
	public static String formatI(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_STYLE_I);
		if(null != date && !"".equals(date)) {
			return sdf.format(date);
		}
		return null;
	}
	
	/** 年-月-日 时:分:秒 */
	public static Date formatFF(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_STYLE_F);
		try {
			if(null != date && !"".equals(date)) {
				return sdf.parse(date) ;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	/** 年-月-日 */
	public static String formatG(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_STYLE_G);
		if(null != date && !"".equals(date)) {
			return sdf.format(date);
		}
		return null;
	}
	
	/** 年-月-日 */
	public static Date formatGG(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_STYLE_G);
		try {
			if(null != date && !"".equals(date)) {
				return sdf.parse(date) ;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	/** 月-日 中午 */
	public static String formatH(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_STYLE_H);
		return sdf.format(date);
	}
	
	public static String getCurrentDate() {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_STYLE_G);
		return sdf.format(new Date());
	}
	public static String getCurrentDateTime() {
		SimpleDateFormat sdf = new SimpleDateFormat(FORMAT_STYLE_F);
		return sdf.format(new Date());
	}
	public static String getCurrentDateTimes() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-ddHHmmss");
		Date d = new Date() ;
		return sdf.format(d)+"-"+d.getTime() ;
	}

	/**
	 * 获得上、下午
	 * 
	 * @return
	 */
	public static String getAP_PM() {
		int am_pm = Calendar.getInstance().get(Calendar.AM_PM);
		switch (am_pm) {
		case 0:
			return "上午";
		case 1:
			return "下午";
		}
		return "获得AM_PM失败";
	}

	/**
	 * 获得当前日期的周几
	 * 
	 * @return
	 */
	public static String getWeek() {
		return convertWeek(Calendar.getInstance().get(Calendar.DAY_OF_WEEK) - 1);
	}

	/**
	 * 获得指定日期的周几
	 * 
	 * @param date
	 *            java.util.Date日期对象
	 * @return
	 */
	public static String getWeek(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return convertWeek(Calendar.getInstance().get(Calendar.DAY_OF_WEEK) - 1);
	}

	/**
	 * 日期类型转字符串类型
	 * 
	 * @param date
	 * @param dateFormat
	 * @return
	 */
	public static String dateToString(Date date, String dateFormat) {
		if (date == null)
			return "";
		try {
			return new SimpleDateFormat(dateFormat).format(date);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	/**
	 * 获得指定日期的周几
	 * 
	 * @param date
	 *            字符串
	 * @return
	 */
	public static String getWeek(String date) {
		Calendar calendar = Calendar.getInstance();
		try {
			calendar.setTime(new SimpleDateFormat(FORMAT_STYLE_G).parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return convertWeek(calendar.get(Calendar.DAY_OF_WEEK) - 1);
	}

	/**
	 * 获得周几
	 * 
	 * @return
	 */
	public static String convertWeek(int week) {

		switch (week) {
		case 0:
			return "星期日";
		case 1:
			return "星期一";
		case 2:
			return "星期二";
		case 3:
			return "星期三";
		case 4:
			return "星期四";
		case 5:
			return "星期五";
		case 6:
			return "星期六";
		}
		return "日前操作失败";
	}

	/**
	 * 比较两个日期大小及计算相隔天数
	 * 
	 * 第一个日期
	 * 
	 * @param firstYear
	 * @param firstMonth
	 * @param firstDay
	 *            第二个日期
	 * @param secondYear
	 * @param secondMonth
	 * @param secondDay
	 */
	public static void compare_date1(int firstYear, int firstMonth, int firstDay, int secondYear, int secondMonth, int secondDay) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(firstYear, firstMonth, firstDay);

		long timeOne = calendar.getTimeInMillis();
		calendar.set(secondYear, secondMonth, secondDay);
		long timeTwo = calendar.getTimeInMillis();
		Date date1 = new Date(timeOne);
		Date date2 = new Date(timeTwo);
		if (date2.equals(date1)) {
			System.out.println("两个日期相同");
		} else if (date2.after(date1)) {
			System.out.println("第二个日期大");
		} else if (date2.before(date1)) {
			System.out.println("第一个日期大");
		}
		long days = (timeOne - timeTwo) / (1000 * 60 * 60 * 24);
		System.out.println(firstYear + "年" + firstMonth + "月" + firstDay + "日");
		System.out.println(secondYear + "年" + secondMonth + "月" + secondDay + "日");
		System.out.println("相隔天数 " + days);
	}

	/**
	 * 比较两个日期大小和时间
	 * 
	 * @param fristDate
	 * @param enddate
	 * @return 返回-1、0、1（小于、相等、大于）
	 */
	public static int compare_datetime2(String fristDate, String enddate) {
		try {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Date d1 = df.parse(fristDate);
			Date d2 = df.parse(enddate);
			int ss = d1.compareTo(d2);
			return ss;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	/**
	 * 比较两个日期大小和时间
	 * 
	 * @param fristDate
	 * @param enddate
	 * @return 返回-1、0、1（小于、相等、大于）
	 */
	public static int compare_datetime2(Date fristDate, Date enddate) {
		try {
			int ss = fristDate.compareTo(enddate);
			return ss;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	/**
	 * 比较两个日期大小和时间
	 * 
	 * @param fristDate
	 * @param enddate
	 * @return 返回-1、0、1（小于、相等、大于）
	 */
	public static int compare_date2(String fristDate, String enddate) {
		try {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date d1 = df.parse(fristDate);
			Date d2 = df.parse(enddate);
			int ss = d1.compareTo(d2);
			return ss;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 计算两个日期的间隔(yyyy-MM-dd HH:mm:ss)
	 * @param startdate 开始日期
	 * @param enddate 结束日期
	 * @return
	 */
	public static String getBetweenDataTime(String startdate, String enddate) {
		try {
			SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date begin = dfs.parse(startdate);
			Date end = dfs.parse(enddate);
			long between = (end.getTime() - begin.getTime()) / 1000;// 除以1000是为了转换成秒
			
			long day1 = between / (24 * 3600);
			long hour1 = between % (24 * 3600) / 3600;
			long minute1 = between % 3600 / 60;
			long second1 = between % 60 / 60;
			
			return day1 + "天 " + hour1 + "小时 " + minute1 + "分 " + second1 + "秒 ";
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 计算相差月数
	 * 方法描述 : 
	 * 创建者：杨浩泉 
	 * 项目名称： infos
	 * 类名： DateUtil.java
	 * 版本： v1.0
	 * 创建时间： 2014-3-15 下午11:53:19
	 * @param begin
	 * @param end
	 * @return
	 * @throws Exception int
	 */
	public static int getDiffer(String begin, String end) {
		try {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date beginDate = df.parse(begin);
			Date endDate = df.parse(end);
			Calendar c1 = Calendar.getInstance();
			c1.setTime(beginDate);
			Calendar c2 = Calendar.getInstance();
			c2.setTime(endDate);

			int beginYear = c1.get(Calendar.YEAR);
			int beginMonth = c1.get(Calendar.MONTH) + 1;

			int endYear = c2.get(Calendar.YEAR);
			int endMonth = c2.get(Calendar.MONTH) + 1;

			int difMonth = (endYear - beginYear) * 12 + (endMonth - beginMonth) + 1;

			return difMonth;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return 0;

	}
	
	/**
	 * 计算两个日期的间隔(yyyy-MM-dd)
	 * @param startdate 开始日期
	 * @param enddate 结束日期
	 * @return
	 */
	public static String getBetweenDays(String startdate, String enddate) {
		try {
			SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd");
			Date begin = dfs.parse(startdate);
			Date end = dfs.parse(enddate);
			long between = (end.getTime() - begin.getTime()) / 1000;// 除以1000是为了转换成秒
			
			long day1 = between / (24 * 3600);
			
			return day1 + "天";
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 计算两个日期的间隔(HH:mm:ss)
	 * @param startdate 开始日期
	 * @param enddate 结束日期
	 * @return
	 */
	public static String getBetweenTime(String startdate, String enddate) {
		try {
			SimpleDateFormat dfs = new SimpleDateFormat("HH:mm:ss");
			Date begin = dfs.parse(startdate);
			Date end = dfs.parse(enddate);
			long between = (end.getTime() - begin.getTime()) / 1000;// 除以1000是为了转换成秒

			long hour1 = between % (24 * 3600) / 3600;
			long minute1 = between % 3600 / 60;
			long second1 = between % 60 / 60;

			return hour1 + "小时 " + minute1 + "分 " + second1 + "秒 ";
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 计算年龄精确到年月日
	 * @param birthday
	 * @return
	 */
	@SuppressWarnings("unused")
	public static String getBabyAge(String birthday) {
		String age = "";
		int day = 0;
		int y = 0;
		int m = 0;
		int d = 0;

		if (birthday != null && birthday.length() == 10) {
			String[] time = birthday.split("-");
			y = Integer.parseInt(time[0]);
			m = Integer.parseInt(time[1]);
			d = Integer.parseInt(time[2]);
	

		Calendar selectDate = Calendar.getInstance();
		Calendar currentDate = Calendar.getInstance();
		selectDate.set(Calendar.YEAR, y);
		selectDate.set(Calendar.MONTH, m - 1);
		selectDate.set(Calendar.DAY_OF_MONTH, d);
		//上一个月
		int lastMonth=(currentDate.get(Calendar.MONTH)+1)-1; 
		int years = currentDate.get(Calendar.YEAR) - selectDate.get(Calendar.YEAR);
		int months = currentDate.get(Calendar.MONTH) - selectDate.get(Calendar.MONTH);
		int days = currentDate.get(Calendar.DAY_OF_MONTH)- selectDate.get(Calendar.DAY_OF_MONTH);
		if (days < 0) {
			months = months - 1;
			switch (lastMonth) {
			case 1:
			case 3:
			case 5:
			case 7:
			case 8:
			case 10:
			case 12:
				day = 31;
				break;
			case 4:
			case 6:
			case 9:
			case 11:
				day = 30;
				break;
			default:
				if (Calendar.YEAR % 4 == 0 && Calendar.YEAR % 100 != 0 || Calendar.YEAR % 400 == 0) {
					day = 28;
				} else {
					day = 29;
				}
				break;
			}
			days = days + day;
		}
		if (months < 0) {
			years = years - 1;
			months = months + 12;
		}
		if (years < 0) {
			years = 0;
		}
		if(years==0){
			if(months==0){
				if(days==0){
					age="今天是宝宝的出生日期";
				}else{
					age=days + "天";
				}
			}else{
				if(days==0){
					age=months + "个月";
				}else{
					age =months + "个月又" + days + "天";
				}
			}
		}else{
			if(months==0){
				if(days==0){
					age = years + "岁";
				}else{
					age = years + "岁又" + days + "天";
				}
			}else{
				if(days==0){
					age = years + "岁" + months + "个月";
				}else{
					age = years + "岁" + months + "个月又" + days + "天";
				}
				
			}
		}
		
	  }
		return age;
	}
	
	/**
	 * 根据两个日期计算每月的天数，并且除去周六日
	 * 方法描述 : 
	 * 创建者：杨浩泉 
	 * 项目名称： infos
	 * 类名： DateUtil.java
	 * 版本： v1.0
	 * 创建时间： 2014-2-24 下午10:07:38
	 * @param startDate
	 * @param endDate
	 * @return long
	 */
	public static long dateDiff(String startDate, String endDate) {
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		GregorianCalendar endGC = new GregorianCalendar();
		long times, days1 = 0l;
		try {
			times = sd.parse(endDate).getTime() - sd.parse(startDate).getTime();
			long days = times / (1000 * 24 * 60 * 60);
			
			days1 = (days / 7) * 5;
			
			long days2 = days % 7;
			endGC.setTime(sd.parse(endDate));
			int weekDay = endGC.get(Calendar.DAY_OF_WEEK);
			if (weekDay == 1) {
				days1 += days2 > 2 ? days2 - 2 : 0;
			} else if (weekDay == 7) {
				days1 += days2 > 1 ? days2 - 1 : 0;
			} else if (weekDay - 1 < days2) {
				days1 += days2 - 2;
			} else if (weekDay - 1 > days2) {
				days1 += days2;
			} else if (weekDay - 1 == days2) {
				days1 += weekDay - 1;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return days1;
	}

	/**
	 * 日期转换为Cron表达式
	 * 方法描述 : 
	 * 创建者：杨浩泉 
	 * 项目名称： infos
	 * 类名： DateUtil.java
	 * 版本： v1.0
	 * 创建时间： 2014-3-4 下午2:05:46
	 * @param datetime
	 * @param day
	 * @return
	 * @throws ParseException String[]
	 */
	public static String[] getDateCron(String datetime, int day) throws ParseException {
		String[] cron = new String[2] ;
		
		Date dt = new SimpleDateFormat("yyyy-MM-dd HH:ss:mm").parse(datetime) ;
		Calendar sc = Calendar.getInstance() ;
		sc.setTime(dt) ;
		
		cron[0] = sc.get(Calendar.MINUTE)+" "+sc.get(Calendar.SECOND)+" "+sc.get(Calendar.HOUR_OF_DAY)+" "+sc.get(Calendar.DAY_OF_MONTH)+" "+(sc.get(Calendar.MONTH)+1)+" ? " ;
		//提前天数，避开周六日
		
		if(day > 0) {
			sc.set(Calendar.DAY_OF_MONTH, sc.get(Calendar.DAY_OF_MONTH)-day); 
			if(sc.get(Calendar.DAY_OF_WEEK) == 6) {
				sc.set(Calendar.DAY_OF_MONTH, sc.get(Calendar.DAY_OF_MONTH)-1); 
			}
			if(sc.get(Calendar.DAY_OF_WEEK)-1 == 0) {
				sc.set(Calendar.DAY_OF_MONTH, sc.get(Calendar.DAY_OF_MONTH)-2); 
			}
			sc.set(Calendar.YEAR, Integer.parseInt(new SimpleDateFormat("yyyy").format(dt))) ;
			cron[1] = sc.get(Calendar.MINUTE)+" "+sc.get(Calendar.SECOND)+" "+sc.get(Calendar.HOUR_OF_DAY)+" "+sc.get(Calendar.DAY_OF_MONTH)+" "+(sc.get(Calendar.MONTH)+1)+" ? " ;
		}
		return cron ;
	}
	
	public static void main(String[] args) throws ParseException {
		//String datetime = "2014-03-4 12:46:00" ;
		
		//String[] dateCron = getDateCron(datetime, 2) ;
		//System.out.println(dateCron[0]);
		//System.out.println(dateCron[1]);
		
		
		/*
		String startDate="2014-02-25";
		String endDate="2014-02-27";
		System.out.println(dateDiff(startDate, endDate));
		String startdate = "2013-10-21 17:10:11";
		String enddate = "2013-10-21 17:10:11";

		System.out.println(getBetweenDataTime(startdate, enddate));
		System.out.println(getBetweenDays(startdate, enddate));
		
		
		String startdate1 = "08:30:30";
		String enddate1 = "09:50:30";
		System.out.println(getBetweenTime(startdate1, enddate1));
		
		System.out.println(getBabyAge("1988-05-11"));
		*/
		
		String strDateStart = "2014-03-03";
		String strDateEnd = "2014-05-26";
		
		//System.out.println(dateDiff(strDateStart, strDateEnd));
		
		//int dutyDays = getDutyDays(formatGG(strDateStart), formatGG(strDateEnd)) ;
		//System.out.println(dutyDays);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date_start = sdf.parse(strDateStart);
		Date date_end = sdf.parse(strDateEnd);
		Calendar cal_start = Calendar.getInstance();
		Calendar cal_end = Calendar.getInstance();
		cal_start.setTime(date_start);
		cal_end.setTime(date_end);
		System.out.println("星期-->" + DateCal.getChineseWeek(cal_start) + " 日期-->" + cal_start.get(Calendar.YEAR) + "-" + (cal_start.get(Calendar.MONTH) + 1) + "-" + cal_start.get(Calendar.DAY_OF_MONTH));
		System.out.println("星期-->" + DateCal.getChineseWeek(cal_end) + " 日期-->" + cal_end.get(Calendar.YEAR) + "-" + (cal_end.get(Calendar.MONTH) + 1) + "-" + cal_end.get(Calendar.DAY_OF_MONTH));
		System.out.println("工作日为-->" + DateCal.getWorkingDay(cal_start, cal_end));
		System.out.println("休息日-->" + DateCal.getHolidays(cal_start, cal_end));
		
		System.out.println(DateCal.getWorkingDays(formatG(date_start), formatG(date_end)));
	}
	
	/**
	 * 包含今天
	 * 方法描述 : 
	 * 创建者：杨浩泉 
	 * 项目名称： infos
	 * 类名： DateUtil.java
	 * 版本： v1.0
	 * 创建时间： 2014-3-7 下午6:35:45
	 * @param startDate
	 * @param endDate
	 * @return int
	 */
	
	/*public static int getDutyDays(java.util.Date startDate, java.util.Date endDate) {
		int result = 0;
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
		while (startDate.compareTo(endDate) <= 0) {
			if (startDate.getDay() != 6 && startDate.getDay() != 0)
				result++;
			startDate.setDate(startDate.getDate() + 1);
		}
		return result;
	}*/

}
