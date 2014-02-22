package com.infox.sysmgr.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.infox.common.dao.BaseDaoI;
import com.infox.common.util.RandomUtils;
import com.infox.sysmgr.entity.EmpJobEntity;
import com.infox.sysmgr.service.EmpJobServiceI;
import com.infox.sysmgr.web.form.EmpJobForm;

@Service
@Transactional
public class EmpJobServiceImpl implements EmpJobServiceI {

	@Autowired
	private BaseDaoI<EmpJobEntity> basedaoEmpJob;

	@Override
	public void add(EmpJobForm form) throws Exception {
		
		EmpJobEntity entity = new EmpJobEntity();
		BeanUtils.copyProperties(form, entity);
		entity.setId(RandomUtils.generateNumber(6)) ;
		
		if(form.getPid() != null && !"".equalsIgnoreCase(form.getPid())) {
			entity.setEmpjob(this.basedaoEmpJob.get(EmpJobEntity.class, form.getPid())) ;
		}

		this.basedaoEmpJob.save(entity);
	}

	@Override
	public void delete(String id) throws Exception {
		EmpJobEntity t = this.basedaoEmpJob.get(EmpJobEntity.class, id);
		del(t);
	}

	private void del(EmpJobEntity entity) {

		if (entity.getEmpjobs() != null && entity.getEmpjobs().size() > 0) {
			for (EmpJobEntity r : entity.getEmpjobs()) {
				del(r);
			}
		}
		this.basedaoEmpJob.delete(entity);
	}

	@Override
	public void edit(EmpJobForm form) throws Exception {
		
		EmpJobEntity entity = this.basedaoEmpJob.get(EmpJobEntity.class, form.getId());
		
		if(entity != null) {
			BeanUtils.copyProperties(form, entity ,new String[]{"creater"});
			
			if (form.getPid() != null && !form.getPid().equalsIgnoreCase("")) {
				entity.setEmpjob(basedaoEmpJob.get(EmpJobEntity.class, form.getPid()));
			}
			if (form.getPid() != null && !form.getPid().equalsIgnoreCase("")) {// 说明前台选中了上级资源
				EmpJobEntity pt = basedaoEmpJob.get(EmpJobEntity.class, form.getPid());
				isChildren(entity, pt);// 说明要将当前资源修改到当前资源的子/孙子资源下
				entity.setEmpjob(pt);
			} else {
				entity.setEmpjob(null);// 前台没有选中上级资源，所以就置空
			}
		}

	}
	
	/**
	 * 判断是否是将当前节点修改到当前节点的子节点
	 * @param entity 当前节点
	 * @param pt 要修改到的节点
	 * @return
	 */
	private boolean isChildren(EmpJobEntity entity, EmpJobEntity pt) {
		if (pt != null && pt.getEmpjob() != null) {
			if (pt.getEmpjob().getId().equalsIgnoreCase(entity.getId())) {
				pt.setEmpjob(null);
				return true;
			} else {
				return isChildren(entity, pt.getEmpjob());
			}
		}
		return false;
	}


	@Override
	public EmpJobForm get(String id) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		EmpJobEntity entity = this.basedaoEmpJob.get("from EmpJobEntity t where t.id = :id", params);
		
		EmpJobForm r = new EmpJobForm();
		
		if(null != entity) {
			BeanUtils.copyProperties(entity, r);
			if (entity.getEmpjob() != null) {
				r.setPid(entity.getEmpjob().getId());
			}
		}
		return r ;
	}

	@Override
	public List<EmpJobForm> treegrid(EmpJobForm form ,String mode) throws Exception {
		String hql = "select t from EmpJobEntity t where t.empjob is null order by created desc" ;
		
		List<EmpJobEntity> entitys = this.basedaoEmpJob.find(hql) ;
		
		List<EmpJobForm> orgsform = new ArrayList<EmpJobForm>() ;
		
		for (EmpJobEntity menuEntity : entitys) {
			orgsform.add(recursiveNode(menuEntity ,mode)) ;
		}
		
		return orgsform ;
	}
	
	public EmpJobForm recursiveNode(EmpJobEntity me ,String mode) {
		EmpJobForm mf = new EmpJobForm() ;
		BeanUtils.copyProperties(me, mf) ;
		
		//combotree方式显示
		mf.setText(me.getJob_name()) ;
		
		if(null != me.getEmpjobs() && me.getEmpjobs().size() > 0) {
			mf.setState("closed") ;
			
			Set<EmpJobEntity> rs = me.getEmpjobs() ;
			List<EmpJobForm> children = new ArrayList<EmpJobForm>();
			for (EmpJobEntity menuEntity : rs) {
				
				//combotree方式显示
				if("combotree".equalsIgnoreCase(mode)) {
						EmpJobForm tn = recursiveNode(menuEntity ,mode) ;
						BeanUtils.copyProperties(menuEntity ,tn) ;
						children.add(tn);
				} else {
					EmpJobForm tn = recursiveNode(menuEntity ,mode) ;
					BeanUtils.copyProperties(menuEntity ,tn) ;
					children.add(tn);
				}
			}
			
			mf.setChildren(children) ;
			mf.setState("open");
		}
		return mf ;
	}

}
