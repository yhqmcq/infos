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
import com.infox.common.web.page.DataGrid;
import com.infox.project.entity.ProjectEmpWorkingEntity;
import com.infox.project.entity.ProjectMainEntity;
import com.infox.project.service.ProjectEmpWorkingServiceI;
import com.infox.project.web.form.ProjectEmpWorkingForm;
import com.infox.sysmgr.entity.EmployeeEntity;

@Service
@Transactional
public class ProjectEmpWorkingServiceImpl implements ProjectEmpWorkingServiceI {
	
	@Autowired
	private BaseDaoI<ProjectEmpWorkingEntity> basedaoProjectEW;
	
	@Autowired
	private BaseDaoI<EmployeeEntity> basedaoEmployee;

	@Override
	public void add(ProjectEmpWorkingForm form) throws Exception {
		String empIds = form.getEmpIds() ;
		if(null != empIds && !"".equals(empIds)) {
			String[] empIdsSplit = empIds.split(",") ;
			for(int i=0;i<empIdsSplit.length;i++) {
				EmployeeEntity employeeEntity = this.basedaoEmployee.get(EmployeeEntity.class, empIdsSplit[i]) ;
				if(employeeEntity.getWorkStatus() != 1) {
					employeeEntity.setWorkStatus(1) ;
					
					ProjectEmpWorkingEntity entity = new ProjectEmpWorkingEntity();
					BeanUtils.copyProperties(form, entity);
					
					entity.setEmp(employeeEntity) ;
					entity.setEmp_name(employeeEntity.getTruename()) ;
					
					ProjectMainEntity project = new ProjectMainEntity() ;
					project.setId(form.getProject_id()) ;
					entity.setProject(project);
					
					this.basedaoProjectEW.save(entity);
				}
			}
		}
	}
	
	@Override
	public void delete(String id) throws Exception {
		ProjectEmpWorkingEntity entity = this.basedaoProjectEW.get(ProjectEmpWorkingEntity.class, id) ;
		del(entity);
	}
	private void del(ProjectEmpWorkingEntity entity) {
		if (entity.getPews() != null && entity.getPews().size() > 0) {
			for (ProjectEmpWorkingEntity r : entity.getPews()) {
				del(r);
			}
		}
		this.basedaoProjectEW.delete(entity);
	}

	@Override
	public void revert(String id) throws Exception {
		ProjectEmpWorkingEntity entity = this.basedaoProjectEW.get(ProjectEmpWorkingEntity.class, id) ;
		
		//将员工设为空闲人员
		EmployeeEntity emp = entity.getEmp() ;
		emp.setWorkStatus(0) ;
		
		//如果人员未设置起止日期，则删除人员
		if(entity.getStatus() == 0) {
			this.basedaoProjectEW.delete(entity) ;
			return ;
		}
		//标记为结束(退出项目组)
		entity.setStatus(4) ;
		//修改退出的时间
		entity.setCreated(new Date()) ;
	}

	@Override
	public void edit(ProjectEmpWorkingForm form) throws Exception {
		ProjectEmpWorkingEntity entity = this.basedaoProjectEW.get(ProjectEmpWorkingEntity.class, form.getId());
		BeanUtils.copyProperties(form, entity ,new String[]{"creater"});
		this.basedaoProjectEW.update(entity);
	}

	@Override
	public ProjectEmpWorkingForm get(String id) throws Exception {
		ProjectEmpWorkingEntity entity = this.basedaoProjectEW.get(ProjectEmpWorkingEntity.class, id);
		if(null != entity) {
			ProjectEmpWorkingForm form = new ProjectEmpWorkingForm();
			BeanUtils.copyProperties(entity, form);
			return form;
		} else {
			return null ;
		}
	}
	
	@Override
	public ProjectEmpWorkingForm get(ProjectEmpWorkingForm form) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select t from ProjectEmpWorkingEntity t where 1=1";
		hql = addWhere(hql, form, params) + addOrdeby(form);
		
		ProjectEmpWorkingEntity entity = this.basedaoProjectEW.get(hql, params) ;
		if(null != entity) {
			ProjectEmpWorkingForm pform = new ProjectEmpWorkingForm();
			BeanUtils.copyProperties(entity, pform);
			
			return pform;
		} else {
			return null ;
		}
	}

	@Override
	public DataGrid datagrid(ProjectEmpWorkingForm form) throws Exception {
		DataGrid datagrid = new DataGrid();
		datagrid.setTotal(this.total(form));
		datagrid.setRows(this.changeModel(this.find(form)));
		return datagrid;
	}

	private List<ProjectEmpWorkingForm> changeModel(List<ProjectEmpWorkingEntity> ProjectEmpWorkingEntity) {
		List<ProjectEmpWorkingForm> forms = new ArrayList<ProjectEmpWorkingForm>();

		if (null != ProjectEmpWorkingEntity && ProjectEmpWorkingEntity.size() > 0) {
			for (ProjectEmpWorkingEntity i : ProjectEmpWorkingEntity) {
				ProjectEmpWorkingForm uf = new ProjectEmpWorkingForm();
				BeanUtils.copyProperties(i, uf);
				forms.add(uf);
			}
		}
		return forms;
	}

	private List<ProjectEmpWorkingEntity> find(ProjectEmpWorkingForm form) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select t from ProjectEmpWorkingEntity t where 1=1";
		hql = addWhere(hql, form, params) + addOrdeby(form);
		return this.basedaoProjectEW.find(hql, params, form.getPage(), form.getRows());
	}

	private String addOrdeby(ProjectEmpWorkingForm form) {
		String orderString = "";
		if (form.getSort() != null && form.getOrder() != null) {
			orderString = " order by " + form.getSort() + " " + form.getOrder();
		}
		return orderString;
	}

	public Long total(ProjectEmpWorkingForm form) {
		Map<String, Object> params = new HashMap<String, Object>();

		String hql = "select count(*) from ProjectEmpWorkingEntity t where 1=1";

		hql = addWhere(hql, form, params);

		return this.basedaoProjectEW.count(hql, params);
	}

	private String addWhere(String hql, ProjectEmpWorkingForm form, Map<String, Object> params) {
		if (null != form) {
			if (null != form.getProject_id() && !"".equals(form.getProject_id())) {
				hql += " and t.project.id=:project_id";
				params.put("project_id", form.getProject_id());
			}
			/*if (!"".equals(form.getStatus())) {
				hql += " and t.status=:status";
				params.put("status", form.getStatus());
			}*/
			if (null != form.getInStatus() && !"".equals(form.getInStatus())) {
				hql += " and t.status in (:inStatus)";
				String[] split = form.getInStatus().split(",") ;
				Integer[] states = new Integer[split.length] ;
				for(int i=0;i<states.length;i++) {
					states[i] = Integer.parseInt(split[i]) ;
				}
				params.put("inStatus", states);
			}
		}
		return hql;
	}

	@Override
	public void set_workdate(ProjectEmpWorkingForm form) throws Exception {
		String ids = form.getIds() ;
		if(null != ids && !"".equals(ids)) {
			String[] id = ids.split(",") ;
			for (int i = 0; i < id.length; i++) {
				ProjectEmpWorkingEntity entity = this.basedaoProjectEW.get(ProjectEmpWorkingEntity.class, id[i]) ;
				
				if(entity.getStatus() == 0) {	//未设置日期
					entity.setStatus(1) ;
					entity.setStartDate(form.getStartDate()) ;
					entity.setEndDate(form.getEndDate()) ;
				} else {	//已设置日期，则延期（只修改结束日期）
					//记录历史信息，树状结构
					ProjectEmpWorkingEntity history = new ProjectEmpWorkingEntity() ;
					history.setStartDate(entity.getStartDate()) ;
					history.setEndDate(entity.getEndDate()) ;
					history.setEmp_name(entity.getEmp_name()) ;
					history.setProject_name(entity.getProject_name()) ;
					history.setStatus(3) ;
					history.setPew(entity) ;
					this.basedaoProjectEW.save(history) ;
					
					//entity.setStartDate(form.getStartDate()) ;
					entity.setEndDate(form.getEndDate()) ;
				}
				
				//已到期，不需设置，系统会使用定时器来设置为已过期
				
			}
		}
		
	}

}
