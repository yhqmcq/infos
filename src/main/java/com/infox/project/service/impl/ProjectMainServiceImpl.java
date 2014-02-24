package com.infox.project.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infox.common.dao.BaseDaoI;
import com.infox.common.util.DateUtil;
import com.infox.common.web.page.DataGrid;
import com.infox.project.entity.ProjectMainEntity;
import com.infox.project.service.ProjectMainServiceI;
import com.infox.project.web.form.ProjectMainForm;
import com.infox.sysmgr.entity.EmpJobEntity;
import com.infox.sysmgr.entity.OrgDeptTreeEntity;

@Service
@Transactional
public class ProjectMainServiceImpl implements ProjectMainServiceI {
	
	@Autowired
	private BaseDaoI<ProjectMainEntity> basedaoProject;

	@Autowired
	private BaseDaoI<EmpJobEntity> basedaoEmpJob;

	@Autowired
	private BaseDaoI<OrgDeptTreeEntity> basedaoOrg;

	@Override
	public void add(ProjectMainForm form) throws Exception {
		ProjectMainForm project = this.get(form.getCode()) ;
		if(null == project) {
			ProjectMainEntity entity = new ProjectMainEntity();
			BeanUtils.copyProperties(form, entity, new String[]{"id"});
			
			if(null != form.getDeptid() && !"".equalsIgnoreCase(form.getDeptid())) {
				OrgDeptTreeEntity dept = new OrgDeptTreeEntity() ;
				dept.setId(form.getDeptid()) ;
				entity.setDept(dept) ;
			}
			
			this.basedaoProject.save(entity);
		} else {
			throw new Exception("该项目已存在！ ") ;
		}
		
	}

	@Override
	public void delete(String id) throws Exception {
		this.basedaoProject.delete(this.basedaoProject.get(ProjectMainEntity.class, id));
	}

	@Override
	public void edit(ProjectMainForm form) throws Exception {
		ProjectMainEntity entity = this.basedaoProject.get(ProjectMainEntity.class, form.getId());
		BeanUtils.copyProperties(form, entity ,new String[]{"creater"});
		this.basedaoProject.update(entity);
	}

	@Override
	public ProjectMainForm get(String id) throws Exception {
		ProjectMainEntity entity = this.basedaoProject.get(ProjectMainEntity.class, id);
		if(null != entity) {
			ProjectMainForm form = new ProjectMainForm();
			BeanUtils.copyProperties(entity, form);
			
			OrgDeptTreeEntity dept = entity.getDept() ;
			if(null != dept) {
				form.setDeptid(dept.getId()) ;
			}
			
			return form;
		} else {
			return null ;
		}
	}
	
	@Override
	public ProjectMainForm get(ProjectMainForm form) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select t from ProjectMainEntity t where 1=1";
		hql = addWhere(hql, form, params) + addOrdeby(form);
		
		ProjectMainEntity entity = this.basedaoProject.get(hql, params) ;
		if(null != entity) {
			ProjectMainForm pform = new ProjectMainForm();
			BeanUtils.copyProperties(entity, pform);
			
			return pform;
		} else {
			return null ;
		}
	}

	@Override
	public DataGrid datagrid(ProjectMainForm form) throws Exception {
		DataGrid datagrid = new DataGrid();
		datagrid.setTotal(this.total(form));
		datagrid.setRows(this.changeModel(this.find(form)));
		return datagrid;
	}

	private List<ProjectMainForm> changeModel(List<ProjectMainEntity> ProjectMainEntity) {
		List<ProjectMainForm> forms = new ArrayList<ProjectMainForm>();

		if (null != ProjectMainEntity && ProjectMainEntity.size() > 0) {
			for (ProjectMainEntity i : ProjectMainEntity) {
				ProjectMainForm uf = new ProjectMainForm();
				BeanUtils.copyProperties(i, uf);
				long dateDiff = DateUtil.dateDiff(DateUtil.formatG(i.getStartDate()), DateUtil.formatG(i.getEndDate())) ;
				long lastdateDiff = DateUtil.dateDiff(DateUtil.formatG(new Date()), DateUtil.formatG(i.getEndDate())) ;
				uf.setDateDiff(dateDiff) ;
				uf.setLastdateDiff(lastdateDiff) ;
				forms.add(uf);
			}
		}
		return forms;
	}

	private List<ProjectMainEntity> find(ProjectMainForm form) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select t from ProjectMainEntity t where 1=1";
		hql = addWhere(hql, form, params) + addOrdeby(form);
		return this.basedaoProject.find(hql, params, form.getPage(), form.getRows());
	}

	private String addOrdeby(ProjectMainForm form) {
		String orderString = "";
		if (form.getSort() != null && form.getOrder() != null) {
			orderString = " order by " + form.getSort() + " " + form.getOrder();
		}
		return orderString;
	}

	public Long total(ProjectMainForm form) {
		Map<String, Object> params = new HashMap<String, Object>();

		String hql = "select count(*) from ProjectMainEntity t where 1=1";

		hql = addWhere(hql, form, params);

		return this.basedaoProject.count(hql, params);
	}

	private String addWhere(String hql, ProjectMainForm form, Map<String, Object> params) {
		if (null != form) {
			if (form.getCode() != null && !"".equals(form.getCode())) {
				hql += " and t.code=:code";
				params.put("code", form.getCode());
			}
		}
		return hql;
	}

}
