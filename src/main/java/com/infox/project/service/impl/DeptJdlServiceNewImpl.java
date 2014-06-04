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
import com.infox.common.util.BeanUtils;
import com.infox.common.web.page.DataGrid;
import com.infox.project.entity.ProjectEmpWorkingEntity;
import com.infox.project.service.DeptJDLServiceNewI;
import com.infox.project.web.form.DeptJDLForm;
import com.infox.sysmgr.entity.EmployeeEntity;
import com.infox.sysmgr.entity.OrgDeptTreeEntity;
@Service
@Transactional
public class DeptJdlServiceNewImpl implements DeptJDLServiceNewI {
	
	@Autowired
	private BaseDaoI<OrgDeptTreeEntity> basedaoOrg;

	@Autowired
	private BaseDaoI<EmployeeEntity> basedaoEmployee;
	
	
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
	
	private void compute(OrgDeptTreeEntity entity, DeptJDLForm form) {
		System.out.println("部门：" + entity.getFullname());
		
		//部门所有人员
		Set<EmployeeEntity> users = entity.getUsers() ;
		for (EmployeeEntity emp : users) {
			System.out.println("\t名称："+emp.getTruename()+" 到部门类型："+emp.getDbmType() + "离部门类型："+emp.getLbmType());
			
			//人员参与的项目
			Set<ProjectEmpWorkingEntity> works = emp.getEmpWorks() ;
			for (ProjectEmpWorkingEntity work : works) {
				System.out.println("\t\t开始日期："+work.getStartDate() + " 结束日期："+work.getEndDate());
				
				
				
			}
			
		}
		
		
	}

	@Override
	public DataGrid datagrid(DeptJDLForm form) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select t from OrgDeptTreeEntity t where 1=1 and t.compute=0" ;
		hql = addWhere(hql, form, params) + addOrdeby(form);
		
		List<OrgDeptTreeEntity> entitys = this.basedaoOrg.find(hql, params) ;
		
		List<DeptJDLForm> forms = new ArrayList<DeptJDLForm>() ;
		
		for (OrgDeptTreeEntity dept : entitys) {
			DeptJDLForm f = new DeptJDLForm() ; 
			BeanUtils.copyProperties(dept, f) ;
			compute(dept, f) ;
			forms.add(f) ;
		}
		
		DataGrid datagrid = new DataGrid();
		datagrid.setRows(forms);
		return datagrid;
	}
	
	private String addOrdeby(DeptJDLForm form) {
		String orderString = "";
		if (form.getSort() != null && form.getOrder() != null) {
			orderString = " order by " + form.getSort() + " " + form.getOrder();
		}
		return orderString;
	}
	
	private String addWhere(String hql, DeptJDLForm form, Map<String, Object> params) {
		if (null != form) {
			if (form.getFullname() != null && !"".equals(form.getFullname())) {
				hql += " and t.fullname=:fullname";
				params.put("fullname", form.getFullname());
			}
			if (form.getSname() != null && !"".equals(form.getSname())) {
				hql += " and t.sname=:sname";
				params.put("sname", form.getSname());
			}
		}
		return hql;
	}

}
