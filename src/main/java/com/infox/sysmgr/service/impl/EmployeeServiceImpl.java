package com.infox.sysmgr.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infox.common.dao.BaseDaoI;
import com.infox.common.util.StringUtil;
import com.infox.common.web.page.DataGrid;
import com.infox.common.web.page.LoginInfoSession;
import com.infox.sysmgr.entity.EmpJobEntity;
import com.infox.sysmgr.entity.EmployeeEntity;
import com.infox.sysmgr.entity.MenuEntity;
import com.infox.sysmgr.entity.OrgDeptTreeEntity;
import com.infox.sysmgr.entity.RoleEntity;
import com.infox.sysmgr.service.EmployeeServiceI;
import com.infox.sysmgr.web.form.EmployeeForm;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeServiceI {
	
	@Autowired
	private BaseDaoI<EmployeeEntity> basedaoEmployee;

	@Autowired
	private BaseDaoI<EmpJobEntity> basedaoEmpJob;

	@Autowired
	private BaseDaoI<OrgDeptTreeEntity> basedaoOrg;

	@Autowired
	private BaseDaoI<RoleEntity> basedaoRole;
	
	@Autowired
	private BaseDaoI<MenuEntity> basedaoMenu;

	@Override
	public void add(EmployeeForm form) throws Exception {
		EmployeeForm employee = this.get(form.getId()) ;
		if(null == employee) {
			EmployeeEntity entity = new EmployeeEntity();
			BeanUtils.copyProperties(form, entity);
			entity.setTruename(StringUtil.replaceBlank(form.getTruename())) ;
			
			if (form.getOrgid() != null && !"".equalsIgnoreCase(form.getOrgid())) {
				entity.setOrg(this.basedaoOrg.get(OrgDeptTreeEntity.class, form.getOrgid()));
			}
			String jobs = form.getJobids() ;
			if (jobs != null && !"".equalsIgnoreCase(jobs)) {
				String[] split = jobs.split(",") ;
				Set<EmpJobEntity> empjobs = new HashSet<EmpJobEntity>() ;
				for (String jobid : split) {
					empjobs.add(this.basedaoEmpJob.get(EmpJobEntity.class, jobid)) ;
				}
				entity.setEmpjobs(empjobs) ;
			}
			this.basedaoEmployee.save(entity);
		} else {
			throw new Exception("该用户已存在！ ") ;
		}
		
	}

	@Override
	public void delete(String id) throws Exception {
		this.basedaoEmployee.delete(this.basedaoEmployee.get(EmployeeEntity.class, id));
	}

	@Override
	public void edit(EmployeeForm form) throws Exception {
		EmployeeEntity entity = this.basedaoEmployee.get(EmployeeEntity.class, form.getId());
		entity.setTruename(StringUtil.replaceBlank(form.getTruename())) ;
		BeanUtils.copyProperties(form, entity ,new String[]{"creater"});

		if (form.getOrgid() != null && !"".equalsIgnoreCase(form.getOrgid())) {
			entity.setOrg(this.basedaoOrg.get(OrgDeptTreeEntity.class, form.getOrgid()));
		}
		String jobs = form.getJobids() ;
		if (jobs != null && !"".equalsIgnoreCase(jobs)) {
			String[] split = jobs.split(",") ;
			Set<EmpJobEntity> empjobs = new HashSet<EmpJobEntity>() ;
			for (String jobid : split) {
				empjobs.add(this.basedaoEmpJob.get(EmpJobEntity.class, jobid)) ;
			}
			entity.setEmpjobs(empjobs) ;
		} else {
			entity.setEmpjobs(null) ;
		}

		this.basedaoEmployee.update(entity);
	}

	@Override
	public EmployeeForm get(String id) throws Exception {
		EmployeeEntity entity = this.basedaoEmployee.get(EmployeeEntity.class, id);
		if(null != entity) {
			EmployeeForm form = new EmployeeForm();
			BeanUtils.copyProperties(entity, form);
			
			if (null != entity.getOrg()) {
				form.setOrgid(entity.getOrg().getId());
			}
			Set<EmpJobEntity> empjobs = entity.getEmpjobs() ;
			if(null != empjobs && empjobs.size() > 0) {
				StringBuffer s = new StringBuffer() ;
				for (EmpJobEntity ej : empjobs) {
					s.append(ej.getId()+",".trim()) ;
				}
				form.setJobids(s.deleteCharAt(s.length()-1).toString());
			}
			return form;
		} else {
			return null ;
		}
	}

	@Override
	public DataGrid datagrid(EmployeeForm form) throws Exception {
		DataGrid datagrid = new DataGrid();
		datagrid.setTotal(this.total(form));
		datagrid.setRows(this.changeModel(this.find(form)));
		return datagrid;
	}

	private List<EmployeeForm> changeModel(List<EmployeeEntity> EmployeeEntity) {
		List<EmployeeForm> forms = new ArrayList<EmployeeForm>();

		if (null != EmployeeEntity && EmployeeEntity.size() > 0) {
			for (EmployeeEntity i : EmployeeEntity) {
				EmployeeForm uf = new EmployeeForm();
				BeanUtils.copyProperties(i, uf);
				forms.add(uf);
			}
		}
		return forms;
	}

	private List<EmployeeEntity> find(EmployeeForm form) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select t from EmployeeEntity t where 1=1";
		hql = addWhere(hql, form, params) + addOrdeby(form);
		return this.basedaoEmployee.find(hql, params, form.getPage(), form.getRows());
	}

	private String addOrdeby(EmployeeForm form) {
		String orderString = "";
		if (form.getSort() != null && form.getOrder() != null) {
			orderString = " order by " + form.getSort() + " " + form.getOrder();
		}
		return orderString;
	}

	public Long total(EmployeeForm form) {
		Map<String, Object> params = new HashMap<String, Object>();

		String hql = "select count(*) from EmployeeEntity t where 1=1";

		hql = addWhere(hql, form, params);

		return this.basedaoEmployee.count(hql, params);
	}

	private String addWhere(String hql, EmployeeForm form, Map<String, Object> params) {
		if (null != form) {
			if (form.getQ() != null && !"".equals(form.getQ())) {
				hql += " and t.id like :id";
				params.put("id", "%%" + form.getQ() + "%%");
			}
			if (form.getId() != null && !"".equals(form.getId())) {
				hql += " and t.id=:id";
				params.put("id", form.getId());
			}
			if (form.getTruename() != null && !"".equals(form.getTruename())) {
				form.setTruename(StringUtil.replaceBlank(form.getTruename())) ;
				hql += " and t.truename like :truename";
				params.put("truename", "%%" + form.getTruename() + "%%");
			}
			if (form.getAccount() != null && !"".equals(form.getAccount())) {
				hql += " and t.account like :account";
				params.put("account", "%%" + form.getAccount() + "%%");
			}
			if (form.getSex() != null && !"".equals(form.getSex())) {
				hql += " and t.sex like :sex";
				params.put("sex", "%%" + form.getSex() + "%%");
			}
			if (form.getTel() != null && !"".equals(form.getTel())) {
				hql += " and t.tel like :tel";
				params.put("tel", "%%" + form.getTel() + "%%");
			}
			if (form.getEmail() != null && !"".equals(form.getEmail())) {
				hql += " and t.email like :email";
				params.put("email", "%%" + form.getEmail() + "%%");
			}
			if (form.getOrgname() != null && !"".equals(form.getOrgname())) {
				hql += " and t.orgname like :orgname";
				params.put("orgname", "%%" + form.getOrgname() + "%%");
			}
			if (form.getOnlineState() != null && !"".equals(form.getOrgname())) {
				hql += " and t.onlineState=:onlineState";
				params.put("onlineState", form.getOnlineState());
			}
			if (form.getOrgid() != null && !"".equals(form.getOrgid())) {
				hql += " and t.org.id=:orgid";
				params.put("orgid", form.getOrgid());
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

	@Override
	public void set_grant(EmployeeForm form) throws Exception {
		
		if (form.getIds() != null && !"".equalsIgnoreCase(form.getIds())) {
			List<RoleEntity> roles = new ArrayList<RoleEntity>();
			if (form.getRoleIds() != null && form.getRoleIds().length() > 0) {
				for (String roleId : form.getRoleIds().split(",")) {
					roles.add(this.basedaoRole.get(RoleEntity.class, roleId));
				}
			}
			for (String id : form.getIds().split(",")) {
				if (id != null && !id.equalsIgnoreCase("")) {
					EmployeeEntity t = this.basedaoEmployee.get(EmployeeEntity.class, id);
					t.setRoles(new HashSet<RoleEntity>(roles));
				}
			}
		}
		
	}
	
	@Override
	public void set_empjobs(EmployeeForm form) throws Exception {
		
		String jobs = form.getJobids() ;
		if (jobs != null && !"".equalsIgnoreCase(jobs)) {
			String[] split = jobs.split(",") ;
			Set<EmpJobEntity> empjobs = new HashSet<EmpJobEntity>() ;
			for (String jobid : split) {
				empjobs.add(this.basedaoEmpJob.get(EmpJobEntity.class, jobid)) ;
			}
			
			for (String id : form.getIds().split(",")) {
				if (id != null && !id.equalsIgnoreCase("")) {
					EmployeeEntity t = this.basedaoEmployee.get(EmployeeEntity.class, id);
					t.setEmpjobs(empjobs) ;
				}
			}
		}

		if (form.getIds() != null && !"".equalsIgnoreCase(form.getIds())) {
			List<RoleEntity> roles = new ArrayList<RoleEntity>();
			if (form.getRoleIds() != null && form.getRoleIds().length() > 0) {
				for (String roleId : form.getRoleIds().split(",")) {
					roles.add(this.basedaoRole.get(RoleEntity.class, roleId));
				}
			}
			for (String id : form.getIds().split(",")) {
				if (id != null && !id.equalsIgnoreCase("")) {
					EmployeeEntity t = this.basedaoEmployee.get(EmployeeEntity.class, id);
					t.setRoles(new HashSet<RoleEntity>(roles));
				}
			}
		}

	}

	@Override
	public EmployeeForm getPermission(EmployeeForm form) throws Exception {

		EmployeeForm r = new EmployeeForm();

		EmployeeEntity t = this.basedaoEmployee.get("select distinct t from EmployeeEntity t left join fetch t.roles role where t.id = '" + form.getId() + "'");

		if (t != null) {
			BeanUtils.copyProperties(t, r);
			Set<RoleEntity> s = t.getRoles();
			if (s != null && !s.isEmpty()) {
				boolean b = false;
				String ids = "";
				String names = "";
				for (RoleEntity tr : s) {
					if (b) {
						ids += ",";
						names += ",";
					} else {
						b = true;
					}
					ids += tr.getId();
					names += tr.getName();
				}

				r.setRoleIds(ids);
				r.setRoleNames(names);
			}
		}
		return r;
	}

	@Override
	public EmployeeForm login(EmployeeForm user) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("account", user.getAccount());
		params.put("password", user.getPassword());
		EmployeeEntity t = this.basedaoEmployee.get("from EmployeeEntity t where t.account = :account and t.password = :password", params);
		if (t != null) {
			BeanUtils.copyProperties(t, user);
		} else {
			user = null;
		}
		return user;
	}

	@Override
	public List<String> MyPermission(String id, String account) throws Exception {
		List<String> resourceList = new ArrayList<String>();
		
		//超级管理员默认拥有所有操作权限
		if("admin".equals(account)) {
			String hql = "select t from MenuEntity t where 1=1 and t.href != '' " ;
			List<MenuEntity> menus = this.basedaoMenu.find(hql) ;
			for (MenuEntity m : menus) {
				resourceList.add(m.getHref());
			}
			
		} else {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", id);
			EmployeeEntity t = this.basedaoEmployee.get("from EmployeeEntity t join fetch t.roles role join fetch role.menus menu where t.id = :id", params);
			if (t != null) {
				Set<RoleEntity> roles = t.getRoles();
				if (roles != null && !roles.isEmpty()) {
					for (RoleEntity role : roles) {
						Set<MenuEntity> menus = role.getMenus();
						if (menus != null && !menus.isEmpty()) {
							for (MenuEntity resource : menus) {
								if (resource != null && resource.getHref() != null && !"".equals(resource.getHref())) {
									resourceList.add(resource.getHref());
								}
							}
						}
					}
				}
			}
		}
		
		return resourceList;
	}

	@Override
	public boolean editCurrentUserPwd(LoginInfoSession sessionInfo, String oldPwd, String pwd) throws Exception {
		EmployeeEntity u = this.basedaoEmployee.get(EmployeeEntity.class, sessionInfo.getEmp().getId());
		if (u.getPassword().equalsIgnoreCase(oldPwd)) {// 说明原密码输入正确
			u.setPassword(pwd);
			u.setLastmod(new Date());
			return true;
		}
		return false;
	}

}
