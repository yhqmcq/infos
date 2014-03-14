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
import com.infox.project.entity.OvertimeEntity;
import com.infox.project.service.OvertimeServiceI;
import com.infox.project.web.form.OvertimeForm;

@Service
@Transactional
public class OvertimeServiceImpl implements OvertimeServiceI {
	
	@Autowired
	private BaseDaoI<OvertimeEntity> basedaoOvertime ;

	@Override
	public void add(OvertimeForm form) throws Exception {
		OvertimeEntity entity = new OvertimeEntity();
		BeanUtils.copyProperties(form, entity);
		this.basedaoOvertime.save(entity) ;
	}

	@Override
	public void delete(String id) throws Exception {
		this.basedaoOvertime.delete(this.basedaoOvertime.get(OvertimeEntity.class, id)) ;
	}

	@Override
	public void edit(OvertimeForm form) throws Exception {
		OvertimeEntity entity = this.basedaoOvertime.get(OvertimeEntity.class, form.getId()) ;
		BeanUtils.copyProperties(form, entity);
		this.basedaoOvertime.update(entity) ;
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
		}
		return hql;
	}

}
