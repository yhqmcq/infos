package com.infox.sysmgr.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infox.common.dao.BaseDaoI;
import com.infox.common.freemarker.FreeMarkerToMailTemplateUtil;
import com.infox.common.mail.MailVO;
import com.infox.common.util.ClobUtil;
import com.infox.common.util.DateUtil;
import com.infox.common.util.RandomUtils;
import com.infox.common.util.StringUtil;
import com.infox.common.web.page.DataGrid;
import com.infox.common.web.page.Json;
import com.infox.common.web.page.LoginInfoSession;
import com.infox.common.web.springmvc.RealPathResolver;
import com.infox.project.asynms.send.MailMessageSenderI;
import com.infox.project.entity.ProjectMainEntity;
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
	private MailMessageSenderI mailMessageSend ;
	
	@Autowired
	private BaseDaoI<MenuEntity> basedaoMenu;
	
	@Autowired
	private RealPathResolver realPathResolver ;
	
	@Autowired
	private BaseDaoI<ProjectMainEntity> basedaoProject ;
	
	@Override
	public Json add(EmployeeForm form) throws Exception {
		Json j = new Json() ;
		
		Long emailCount = this.basedaoEmployee.count("select count(t.email) from EmployeeEntity t where t.email='"+form.getEmail()+"'") ;
		if(emailCount >= 1) {
			j.setMsg("该邮箱已存在！") ;
			return j ;
		}
		
		Long idCount = this.basedaoEmployee.count("select count(t.id) from EmployeeEntity t where t.id='"+form.getId()+"'") ;
		if(idCount >= 1) {
			j.setMsg("该工号已存在！") ;
			return j ;
		}
		
		
		EmployeeForm employee = this.get(form.getId()) ;
		if(null == employee) {
			EmployeeEntity entity = new EmployeeEntity();
			BeanUtils.copyProperties(form, entity);
			entity.setTruename(StringUtil.replaceAllSpace(form.getTruename())) ;
			
			entity.setAccount(form.getEmail().substring(0,form.getEmail().indexOf("@"))) ;
			entity.setPassword(RandomUtils.generateNumber(8)) ;
			
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
			if(null == entity.getWorkStatus()) {
				entity.setWorkStatus(0) ;
			}
			
			this.basedaoEmployee.save(entity);
			
			if(null != entity.getOrg()) {
				modifyDeptMemNum(entity.getOrg().getId()) ;
			}
			
			String rootPath = this.realPathResolver.get("/WEB-INF/security_views/sysmgr/ftl") ;
			Map<String,Object> model = new HashMap<String,Object>() ;
			model.put("name", entity.getTruename()) ;
			model.put("account", entity.getAccount()) ;
			model.put("password", entity.getPassword()) ;
			model.put("reportURL", this.realPathResolver.getServerRoot()+this.realPathResolver.getContextPath()) ;
			model.put("context_path",this.realPathResolver.getServerRoot()+this.realPathResolver.getContextPath()) ;
			model.put("currentdate", new Date()) ;
			
			MailVO mail = new MailVO() ;
			mail.setSubject("华智项目管理系统[登录账号和密码]") ;
			mail.setRecipientTO(entity.getEmail()) ;
			mail.setContent(FreeMarkerToMailTemplateUtil.MailTemplateToString(rootPath, "login_account.ftl", model)) ;
			this.mailMessageSend.sendMail(mail) ;
			
			j.setMsg("用户保存成功！") ; j.setStatus(true) ;
			return j ;
		} else {
			j.setMsg("该用户已存在！") ;
			return j ;
		}
		
	}
	
	private void modifyDeptMemNum(String deptid) {
		
		int count = this.basedaoEmployee.count("select count(t) from EmployeeEntity t where t.org.id='"+deptid+"'").intValue() ;
		
		OrgDeptTreeEntity dept = this.basedaoOrg.get(OrgDeptTreeEntity.class, deptid) ;
		
		Calendar ccc = Calendar.getInstance() ;
		switch (ccc.get(Calendar.MONTH)+1) {
		case 1:
			dept.setMonth1(count) ;
			break;
		case 2:
			dept.setMonth2(count) ;
			break;
		case 3:
			dept.setMonth3(count) ;
			break;
		case 4:
			dept.setMonth4(count) ;
			break;
		case 5:
			dept.setMonth5(count) ;
			break;
		case 6:
			dept.setMonth6(count) ;
			break;
		case 7:
			dept.setMonth7(count) ;
			break;
		case 8:
			dept.setMonth8(count) ;
			break;
		case 9:
			dept.setMonth9(count) ;
			break;
		case 10:
			dept.setMonth10(count) ;
			break;
		case 11:
			dept.setMonth11(count) ;
			break;
		case 12:
			dept.setMonth12(count) ;
			break;
		default:
			break;
		}
		this.basedaoOrg.update(dept) ;
	}

	@Override
	public Json delete(String ids) throws Exception {
		Json j = new Json() ;
		List<ProjectMainEntity> p = this.basedaoProject.find("select t from ProjectMainEntity t where t.emp.id='"+ids+"'") ;
		if(null == p || p.isEmpty()) {
			if(null != ids && !ids.equalsIgnoreCase("")) {
				String[] id = ids.split(",") ;
				for(int i=0;i<id.length;i++) {
					EmployeeEntity employeeEntity = this.basedaoEmployee.get(EmployeeEntity.class, id[i]) ;
					String deptid = employeeEntity.getOrg().getId() ;
					this.basedaoEmployee.delete(employeeEntity);
					modifyDeptMemNum(deptid) ;
				}
				j.setMsg("删除成功！"); j.setStatus(true) ;
			}
			
		} else {
			StringBuffer s = new StringBuffer() ;
			s.append("无法删除，该用户担任以下项目PM，请联系PJ管理更好PM后再删除！<br/><br/>") ;
			for (ProjectMainEntity pp : p) {
				s.append(pp.getName() + "<br>") ;
			}
			j.setMsg(s.toString()) ;
		}
		return j;
		
	}
	
	@Override
	public Json edit(EmployeeForm form) throws Exception {
		Json j = new Json() ;
		
		EmployeeEntity entity = this.basedaoEmployee.get(EmployeeEntity.class, form.getId());
		
		BeanUtils.copyProperties(form, entity ,new String[]{"creater","remark","account"});
		entity.setTruename(StringUtil.replaceAllSpace(form.getTruename())) ;

		if (form.getOrgid() != null && !"".equalsIgnoreCase(form.getOrgid())) {
			entity.setOrg(this.basedaoOrg.get(OrgDeptTreeEntity.class, form.getOrgid()));
		}
		
		//只能是一个职位
		Set<EmpJobEntity> ejid = entity.getEmpjobs() ;
		String str1 = "" ; String str2 = "" ;
		for (EmpJobEntity ej : ejid) {
			str1 = ej.getId() ; str2 = ej.getJob_name() ;
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
		if(null == entity.getWorkStatus()) {
			entity.setWorkStatus(0) ;
		}
		if(null != entity.getLbmType() && 3 == entity.getLbmType()) {
			entity.setWorkStatus(3) ;
		}
		if(null != entity.getLbmType() && 4 == entity.getLbmType()) {
			entity.setWorkStatus(4) ;
		}
		
		
		Set<EmpJobEntity> ejidAfter = entity.getEmpjobs() ;
		String str2After = "" ;
		for (EmpJobEntity ej : ejidAfter) {
			str2After = ej.getJob_name() ;
		}
		
		if(null != form.getJobids() && !"".equals(form.getJobids())) {
			if(!str1.equals(form.getJobids())) {
				String remark = "岗位变更历史[变更前岗位：" + str2 + "    变更后岗位："+str2After+"    实施日期："+form.getPositionDate()+"]" + (null!=ClobUtil.getString(entity.getRemark())?","+ClobUtil.getString(entity.getRemark())+",":",") ;
				entity.setRemark(ClobUtil.getClob(remark.substring(0,remark.length()-1))) ;
			}
		}
		
		
		this.basedaoEmployee.update(entity);
		
		modifyDeptMemNum(entity.getOrg().getId()) ;
		
		j.setMsg("编辑成功！") ;
		j.setStatus(true) ;
		return j ;
	}
	

	@Override
	public Json import_emp_data(EmployeeForm form) throws Exception {
		Json j = new Json() ;
		
		File file = new File(form.getFilepath()) ;
		Workbook book = null;
        try {
            book = new XSSFWorkbook(new FileInputStream(file));
        } catch (Exception ex) {
            book = new HSSFWorkbook(new FileInputStream(file));
        }
        
        if(null != book) {
        	Sheet sheet = book.getSheetAt(0) ;
        	int lastRowNum = sheet.getLastRowNum() ;
        	if(lastRowNum > 0) {
        		List<Object> list = new ArrayList<Object>() ;
        		
        		for(int i=3; i<=lastRowNum; i++) {
        			
        			String id = getCellValue(sheet.getRow(i).getCell(1)) ;
        			String name = getCellValue(sheet.getRow(i).getCell(2)) ;
        			String sex = getCellValue(sheet.getRow(i).getCell(3)) ;
        			String email = getCellValue(sheet.getRow(i).getCell(4)) ;
        			String dept = getCellValue(sheet.getRow(i).getCell(5)) ;
        			String jp = getCellValue(sheet.getRow(i).getCell(6)) ;
        			String bysj = getCellValue(sheet.getRow(i).getCell(7)) ;
        			String rzsj = getCellValue(sheet.getRow(i).getCell(8)) ;
        			String position = getCellValue(sheet.getRow(i).getCell(9)) ;
        			
        			if(null == email || "".equals(email)) {
        				email = RandomUtils.generateNumber(15)+"@whizen.com" ;
        			}
        			System.out.println(i+"==" + email);
        			
        			OrgDeptTreeEntity od = this.basedaoOrg.get("select t from OrgDeptTreeEntity t where t.sname='"+StringUtil.replaceAllSpace(dept)+"'") ;
        			EmpJobEntity je = this.basedaoEmpJob.get("select t from EmpJobEntity t where t.job_name='"+StringUtil.replaceAllSpace(position)+"'") ;
        			
        			if(null == od) {
        				j.setMsg("导入数据失败，该部门不存在！["+dept+"]") ;
        				return j ;
        			}
        			if(je == null) {
        				j.setMsg("导入数据失败，该公司岗位不存在！["+position+"]") ;
        				return j ;
        			}
        			
        			EmployeeForm emp_form = new EmployeeForm() ;
        			emp_form.setId(id) ;
        			emp_form.setTruename(name) ;
        			emp_form.setSex(sex) ;
        			emp_form.setEmail(email) ;
        			emp_form.setOrgid(od.getId()) ;
        			emp_form.setJapanese(jp) ;
        			emp_form.setBysj(DateUtil.formatGG(bysj)) ;
        			emp_form.setRzsj(DateUtil.formatGG(rzsj)) ;
        			emp_form.setJobids(je.getId()) ;
        			emp_form.setDbmType(3) ;
        			emp_form.setStatus("N") ;
        			
        			try {
						Json json = this.add(emp_form) ;
						if(json.isStatus()) {
							Map<String, Object> map = new HashMap<String, Object>() ;
							map.put("id", id) ;
							map.put("truename", name) ;
							map.put("msg", json.getMsg()) ;
							map.put("status", true) ;
							list.add(map) ;
						} else{
							Map<String, Object> map = new HashMap<String, Object>() ;
							map.put("id", id) ;
							map.put("truename", name) ;
							map.put("status", false) ;
							list.add(map) ;
						}
					} catch (Exception e) {
						e.printStackTrace();
					} 
        			//System.out.println(i+"=="+id+"=="+name+"=="+sex+"=="+dept+"=="+jp+"=="+bysj+"=="+rzsj+"=="+position);
        		}
        		
        		j.setObj(list) ;
        	}
        }
        j.setMsg("导入数据完成！") ;
		j.setStatus(true) ;
		
		return j ;
	}
	
	public static String getCellValue(Cell cell) {
		String str = null;
		switch (cell.getCellType()) {
		case Cell.CELL_TYPE_BLANK:
			str = "";
			break;
		case Cell.CELL_TYPE_BOOLEAN:
			str = String.valueOf(cell.getBooleanCellValue());
			break;
		case Cell.CELL_TYPE_FORMULA:
			str = String.valueOf(cell.getCellFormula());
			break;
		case Cell.CELL_TYPE_NUMERIC:
			str = String.valueOf((long) cell.getNumericCellValue());
			break;
		case Cell.CELL_TYPE_STRING:
			str = String.valueOf(cell.getStringCellValue());
			break;
		default:
			str = null;
			break;
		}
		return str;
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
				StringBuffer sIds = new StringBuffer() ;
				StringBuffer sNames = new StringBuffer() ;
				for (EmpJobEntity ej : empjobs) {
					sIds.append(ej.getId()+",".trim()) ;
					sNames.append(ej.getJob_name()+",".trim()) ;
				}
				form.setJobids(sIds.deleteCharAt(sIds.length()-1).toString());
				form.setPosition(sNames.deleteCharAt(sNames.length()-1).toString());
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

	private List<EmployeeForm> changeModel(List<EmployeeEntity> entity) {
		List<EmployeeForm> forms = new ArrayList<EmployeeForm>();

		if (null != entity && entity.size() > 0) {
			for (EmployeeEntity i : entity) {
				//i.setDbmDate(DateUtil.formatG(i.getRzsj())) ;
				EmployeeForm uf = new EmployeeForm();
				BeanUtils.copyProperties(i, uf, new String[]{"remark"});
				uf.setRemark(ClobUtil.getString(i.getRemark())) ;
				OrgDeptTreeEntity org = i.getOrg() ;
				if(null != org) {
					uf.setOrgname(org.getSname()) ;
				}
				Set<EmpJobEntity> empjobs = i.getEmpjobs() ;
				if(null != empjobs && empjobs.size() > 0) {
					StringBuffer sIds = new StringBuffer() ;
					StringBuffer names = new StringBuffer() ;
					StringBuffer snames = new StringBuffer() ;
					for (EmpJobEntity ej : empjobs) {
						sIds.append(ej.getId()+",".trim()) ;
						names.append(ej.getJob_name()+",".trim()) ;
						snames.append(ej.getJob_sname()+",".trim()) ;
					}
					uf.setJobids(sIds.deleteCharAt(sIds.length()-1).toString());
					uf.setPosition(names.deleteCharAt(names.length()-1).toString());
					uf.setPosition_sname(snames.deleteCharAt(snames.length()-1).toString());
				}
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
			if (form.getWorkStatus() != null && !"".equals(form.getWorkStatus())) {
				hql += " and t.workStatus=:workStatus";
				params.put("workStatus", form.getWorkStatus());
			}
			if (form.getLbmType() != null && !"".equals(form.getLbmType())) {
				hql += " and t.lbmType=:lbmType";
				params.put("lbmType", form.getLbmType());
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
	public Json set_grant(EmployeeForm form) throws Exception {
		Json j = new Json() ;
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
		j.setMsg("授权成功！"); j.setStatus(true) ;
		return j ;
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
