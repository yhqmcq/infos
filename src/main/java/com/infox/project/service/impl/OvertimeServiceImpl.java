package com.infox.project.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infox.common.dao.BaseDaoI;
import com.infox.common.util.BeanUtils;
import com.infox.common.web.page.DataGrid;
import com.infox.common.web.page.Json;
import com.infox.project.entity.OvertimeEntity;
import com.infox.project.entity.ProjectMainEntity;
import com.infox.project.service.OvertimeServiceI;
import com.infox.project.web.form.OvertimeForm;
import com.infox.sysmgr.entity.EmployeeEntity;

@Service
@Transactional
public class OvertimeServiceImpl implements OvertimeServiceI {
	
	@Autowired
	private BaseDaoI<OvertimeEntity> basedaoOvertime ;

	@Override
	public Json add(OvertimeForm form) throws Exception {
		
		if(null == form.getNormalHour()) 
			form.setNormalHour(0f) ;
		if(null == form.getWeekendHour()) 
			form.setWeekendHour(0f) ;
		if(null == form.getHolidaysHour()) 
			form.setHolidaysHour(0f) ;
		
		Json j = new Json() ;
		
		if(form.getEmp_ids() != null && form.getEmp_ids() != "") {
			ProjectMainEntity project = new ProjectMainEntity() ;
			project.setId(form.getProject_id()) ;
			
			String[] emp_id = form.getEmp_ids().split(",") ;
			for (String id : emp_id) {
				
				Map<String, Object> params = new HashMap<String, Object>() ;
				params.put("empid", id) ; params.put("project_id", form.getProject_id()) ;
				OvertimeEntity oe = this.basedaoOvertime.get("select t from OvertimeEntity t where t.emp.id=:empid and t.project.id=:project_id", params) ;
				if(null != oe) {
					oe.setStartDate(form.getStartDate()) ;
					oe.setEndDate(form.getEndDate()) ;
					oe.setHour(form.getHour()) ;
					oe.setNormalHour(form.getNormalHour()) ;
					oe.setWeekendHour(form.getWeekendHour()) ;
					oe.setHolidaysHour(form.getHolidaysHour()) ;
					
					oe.setNormalHour1(form.getNormalHour1()) ;
					oe.setWeekendHour1(form.getWeekendHour1()) ;
					oe.setHolidaysHour1(form.getHolidaysHour1()) ;
					
				} else {
					EmployeeEntity emp = new EmployeeEntity() ;
					emp.setId(id) ;
					
					OvertimeEntity entity = new OvertimeEntity();
					BeanUtils.copyProperties(form, entity);
					
					entity.setEmp(emp) ;
					entity.setProject(project) ;
					this.basedaoOvertime.save(entity) ;
				}
			}
			j.setStatus(true) ;
			j.setMsg("设置加班时间成功！") ;
		} else {
			j.setMsg("为选择需要设置的加班人员！") ;
		}
		return j ;
	}

	@Override
	public Json delete(String id) throws Exception {
		Json j = new Json() ;
		this.basedaoOvertime.delete(this.basedaoOvertime.get(OvertimeEntity.class, id)) ;
		return j ;
	}
	
	@Override
	public Json delete(OvertimeForm form) throws Exception {
		Json j = new Json() ;

		String[] emp_id = form.getEmp_ids().split(",") ;
		for (String id : emp_id) {
			Map<String, Object> params = new HashMap<String, Object>() ;
			params.put("empid", id) ; params.put("project_id", form.getProject_id()) ;
			OvertimeEntity oe = this.basedaoOvertime.get("select t from OvertimeEntity t where t.emp.id=:empid and t.project.id=:project_id", params) ;
			if(null != oe) {
				this.basedaoOvertime.delete(oe) ;
			}
		}
		j.setStatus(true) ;
		j.setMsg("重置加班时间成功！") ;
		return j ;
	}

	@Override
	public Json edit(OvertimeForm form) throws Exception {
		Json j = new Json() ;
		OvertimeEntity entity = this.basedaoOvertime.get(OvertimeEntity.class, form.getId()) ;
		BeanUtils.copyProperties(form, entity);
		this.basedaoOvertime.update(entity) ;
		return j ;
	}

	@Override
	public OvertimeForm get(String id) throws Exception {
		OvertimeForm form = new OvertimeForm() ;
		OvertimeEntity entity = this.basedaoOvertime.get(OvertimeEntity.class, id) ;
		BeanUtils.copyProperties(entity, form);
		return form;
	}

	@Override
	public OvertimeForm get(OvertimeForm form) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select t from OvertimeEntity t where 1=1";
		hql = addWhere(hql, form, params) + addOrdeby(form);
		
		OvertimeEntity entity = this.basedaoOvertime.get(hql, params) ;
		if(null != entity) {
			OvertimeForm pform = new OvertimeForm();
			BeanUtils.copyProperties(entity, pform);
			
			return pform;
		} else {
			return null ;
		}
	}

	@Override
	public DataGrid datagrid(OvertimeForm form) throws Exception {
		DataGrid datagrid = new DataGrid();
		datagrid.setTotal(this.total(form));
		datagrid.setRows(this.changeModel(this.find(form)));
		return datagrid;
	}
	
	private List<OvertimeForm> changeModel(List<OvertimeEntity> OvertimeEntity) {
		List<OvertimeForm> forms = new ArrayList<OvertimeForm>();

		if (null != OvertimeEntity && OvertimeEntity.size() > 0) {
			for (OvertimeEntity i : OvertimeEntity) {
				OvertimeForm uf = new OvertimeForm();
				BeanUtils.copyProperties(i, uf);
				forms.add(uf);
			}
		}
		return forms;
	}

	private List<OvertimeEntity> find(OvertimeForm form) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select t from OvertimeEntity t where 1=1";
		hql = addWhere(hql, form, params) + addOrdeby(form);
		return this.basedaoOvertime.find(hql, params, form.getPage(), form.getRows());
	}

	private String addOrdeby(OvertimeForm form) {
		String orderString = "";
		if (form.getSort() != null && form.getOrder() != null) {
			orderString = " order by " + form.getSort() + " " + form.getOrder();
		}
		return orderString;
	}

	public Long total(OvertimeForm form) {
		Map<String, Object> params = new HashMap<String, Object>();

		String hql = "select count(*) from OvertimeEntity t where 1=1";

		hql = addWhere(hql, form, params);

		return this.basedaoOvertime.count(hql, params);
	}

	private String addWhere(String hql, OvertimeForm form, Map<String, Object> params) {
		if (null != form) {
			if(null != form.getProject_id() && !form.getProject_id().equals("")) {
				hql += " and t.project.id=:project_id" ;
				params.put("project_id", form.getProject_id()) ;
			}
		}
		return hql;
	}

}
