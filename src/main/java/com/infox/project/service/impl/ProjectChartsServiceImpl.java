package com.infox.project.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.infox.common.dao.BaseDaoI;
import com.infox.common.web.springmvc.RealPathResolver;
import com.infox.project.asynms.send.MailMessageSenderI;
import com.infox.project.entity.ProjectEmpWorkingEntity;
import com.infox.project.entity.ProjectMailListEntity;
import com.infox.project.entity.ProjectMainEntity;
import com.infox.project.service.ProjectChartsServiceI;
import com.infox.project.web.form.ProjectChartsForm;
import com.infox.sysmgr.entity.EmpJobEntity;
import com.infox.sysmgr.entity.EmployeeEntity;
import com.infox.sysmgr.entity.OrgDeptTreeEntity;
import com.infox.sysmgr.service.TaskSchedulerServiceI;

@Service
@Transactional
public class ProjectChartsServiceImpl implements ProjectChartsServiceI {

	@Autowired
	private BaseDaoI<ProjectMainEntity> basedaoProject;

	@Autowired
	private BaseDaoI<EmpJobEntity> basedaoEmpJob;

	@Autowired
	private BaseDaoI<OrgDeptTreeEntity> basedaoOrg;

	@Autowired
	private BaseDaoI<EmployeeEntity> basedaoEmployee;
	
	@Autowired
	private BaseDaoI<ProjectEmpWorkingEntity> basedaoProjectEW;

	@Autowired
	private BaseDaoI<ProjectMailListEntity> basedaoMailList;
	
	@Autowired
	private MailMessageSenderI mailMessageSend ;
	
	@Autowired
	private RealPathResolver realPathResolver ;
	
	@Autowired
	private TaskSchedulerServiceI taskScheduler ;
	
	@Override
	public String projectStatusTotal(ProjectChartsForm form) throws Exception {
		form.setInStatus("1,3") ;
		int month = Calendar.getInstance().get(Calendar.MONTH)+1 ;
		
		Map<String, Object> m1 = new HashMap<String, Object>() ;
		Map<String, Object> m2 = new HashMap<String, Object>() ;
		
		int[] data1 = new int[12] ;
		int[] data2 = new int[12] ;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>() ;
		
		for(int i=0;i<month;i++) {
			 //获取当前月第一天：
	        Calendar c = Calendar.getInstance();    
	        c.add(Calendar.MONTH, (1-(month-i)));
	        c.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
	        //System.out.println("当前月第一天:"+DateUtil.formatG(c.getTime()));
	        //获取当前月最后一天
	        Calendar ca = Calendar.getInstance();  
	        ca.add(Calendar.MONTH, (1-(month-i)));
	        ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));  
	        //System.out.println("当前月最后一天:"+DateUtil.formatG(ca.getTime()));
			
			form.setStartDate(c.getTime()) ;
			form.setEndDate(ca.getTime()) ;
			int run = 0 ;
			int close = 0 ;
			List<ProjectMainEntity> find = this.find(form) ;
			for (ProjectMainEntity p : find) {
				if(p.getStatus() == 1) {
					run ++ ;
				} else if(p.getStatus() == 3) {
					close ++ ;
				}
			}
			data1[i] = run ;
			data2[i] = close ;
		}
		m1.put("data", data1) ;
		m2.put("data", data2) ;
		list.add(m1) ;
		list.add(m2) ;
		return JSON.toJSONString(list);
	}
	
	private List<ProjectMainEntity> find(ProjectChartsForm form) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select t from ProjectMainEntity t where 1=1";
		hql = addWhere(hql, form, params) ;
		return this.basedaoProject.find(hql, params);
	}

	public Long total(ProjectChartsForm form) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select count(*) from ProjectMainEntity t where 1=1";
		hql = addWhere(hql, form, params);
		return this.basedaoProject.count(hql, params);
	}

	private String addWhere(String hql, ProjectChartsForm form, Map<String, Object> params) {
		if (null != form) {
			if (null != form.getNotInStatus() && !"".equals(form.getNotInStatus())) {
				hql += " and t.status not in (:notInStatus)";
				String[] split = form.getNotInStatus().split(",");
				Integer[] states = new Integer[split.length];
				for (int i = 0; i < states.length; i++) {
					states[i] = Integer.parseInt(split[i]);
				}
				params.put("notInStatus", states);
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
			
			if (null != form.getStartDate() && !"".equals(form.getStartDate())) {
				hql += " and t.endDate between :startdate and :enddate";
				params.put("startdate", form.getStartDate()) ;
				params.put("enddate", form.getEndDate()) ;
			}
		}
		return hql;
	}

}
