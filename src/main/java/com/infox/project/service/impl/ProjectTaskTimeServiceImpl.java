package com.infox.project.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infox.common.dao.BaseDaoI;
import com.infox.common.util.DateUtil;
import com.infox.common.web.page.DataGrid;
import com.infox.common.web.springmvc.RealPathResolver;
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
		
		
		//按照这样来查,去赢多多钱回来再搞,没钱没精神!!!!!有钱俺就不干程序员了.................
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
			ProjectTaskTimeForm pf = new ProjectTaskTimeForm() ;
			EmployeeEntity e = p.getEmp() ;
			pf.setEmp_id(e.getId()) ;
			pf.setEmp_name(e.getTruename()) ;
			pf.setDept_name(e.getOrg().getFullname()) ;
			pf.setSd(DateUtil.formatG(p.getStartDate())) ;
			pf.setEd(DateUtil.formatG(p.getEndDate())) ;
			pf.setProject_name(p.getProject().getName()) ;
			pf.setProject_role(p.getProject_role()) ;
			
			StringBuffer sb1 = new StringBuffer() ;
			StringBuffer sb2 = new StringBuffer() ;
			Set<EmpJobEntity> empjobs = p.getEmp().getEmpjobs() ;
			for (EmpJobEntity eje : empjobs) {
				sb1.append(eje.getJob_name()) ;
				sb2.append(eje.getJob_sname()) ;
			}
			pf.setPosition_name(sb1.toString()) ;
			pf.setPosition_sname(sb2.toString()) ;
			
			long dateDiff = DateUtil.dateDiff(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(p.getEndDate()));
			long lastdateDiff = 0 ;
			
			//如果结束日期大于今天，已消耗天数的则不以当前的日期来计算
			int compare_date2 = DateUtil.compare_date2(DateUtil.formatF(new Date()), DateUtil.formatF(p.getEndDate())) ;
			if(compare_date2 == 1) {
				lastdateDiff = DateUtil.dateDiff(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(p.getEndDate())) ;
			} else {
				lastdateDiff = DateUtil.dateDiff(DateUtil.formatG(p.getStartDate()), DateUtil.formatG(new Date())) ;
			}
			
			int compare_date3 = DateUtil.compare_date2(DateUtil.formatF(p.getStartDate()), DateUtil.formatF(new Date())) ;
			if(compare_date3 == 1) {
				pf.setTotalTaskTime(0) ;
				pf.setExpendDays(0) ;
				pf.setMm(0) ;
				pf.setExpendMM(0) ;
			} else {
				pf.setTotalTaskTime(dateDiff) ;
				pf.setExpendDays(lastdateDiff) ;
				pf.setMm(dateDiff/21f) ;
				pf.setExpendMM((pf.getExpendDays()/21f)) ;
			}
			
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
				
				//获得所有工时
				Set<ProjectEmpWorkingEntity> empWorks = e.getEmpWorks() ;
				for (ProjectEmpWorkingEntity ew : empWorks) {
					//计算有效天数（减去周六日）
					long totalDays = DateUtil.dateDiff(DateUtil.formatG(ew.getStartDate()), DateUtil.formatG(ew.getEndDate()));
					
					allTotalDays += totalDays ;
					
				}
				uf.setTotalTaskTime(allTotalDays) ;
				uf.setTotalTaskYear((float)allTotalDays / 21f) ;	//总月数
				uf.setAllMM((float)uf.getTotalTaskTime() / 21f) ;	//总人月
				
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
