package com.infox.project.service.impl;

import java.util.ArrayList;
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
		form.setNotInStatus("9999") ;
		DataGrid datagrid = new DataGrid();
		datagrid.setTotal(this.total(form));
		datagrid.setRows(this.changeModel(this.find(form)));
		return datagrid;
	}
	
	private List<ProjectTaskTimeForm> changeModel(List<EmployeeEntity> entitys) {
		List<ProjectTaskTimeForm> forms = new ArrayList<ProjectTaskTimeForm>();

		if (null != entitys && entitys.size() > 0) {
			for (EmployeeEntity e : entitys) {
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
					System.out.println(e.getId() + "==" + e.getTruename()+"=="+DateUtil.formatG(ew.getStartDate()) + "<-->" + DateUtil.formatG(ew.getEndDate()));
					
					//计算有效天数（减去周六日）
					long totalDays = DateUtil.dateDiff(DateUtil.formatG(ew.getStartDate()), DateUtil.formatG(ew.getEndDate()));
					System.out.println(totalDays);
					
					allTotalDays += totalDays ;
					
				}
				uf.setTotalTaskTime(allTotalDays) ;
				
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
		System.out.println(hql);

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
