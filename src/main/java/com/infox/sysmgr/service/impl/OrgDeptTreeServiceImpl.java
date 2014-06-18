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
import com.infox.sysmgr.entity.EmployeeEntity;
import com.infox.sysmgr.entity.OrgDeptTreeEntity;
import com.infox.sysmgr.service.OrgDeptTreeServiceI;
import com.infox.sysmgr.web.form.OrgDeptTreeForm;

@Service
@Transactional
public class OrgDeptTreeServiceImpl implements OrgDeptTreeServiceI {
	
	@Autowired
	private BaseDaoI<OrgDeptTreeEntity> basedaoOrg;

	@Autowired
	private BaseDaoI<EmployeeEntity> basedaoEmployee;

	@Override
	public void add(OrgDeptTreeForm form) throws Exception {
		
		OrgDeptTreeEntity entity = new OrgDeptTreeEntity();
		BeanUtils.copyProperties(form, entity);
		entity.setId(RandomUtils.generateNumber(6)) ;
		
		if(form.getPid() != null && !"".equalsIgnoreCase(form.getPid())) {
			entity.setOrg(this.basedaoOrg.get(OrgDeptTreeEntity.class, form.getPid())) ;
		}

		this.basedaoOrg.save(entity);
	}

	@Override
	public void delete(String id) throws Exception {
		OrgDeptTreeEntity t = this.basedaoOrg.get(OrgDeptTreeEntity.class, id);
		del(t);
	}

	private void del(OrgDeptTreeEntity entity) {
		if (entity.getOrgs() != null && entity.getOrgs().size() > 0) {
			for (OrgDeptTreeEntity r : entity.getOrgs()) {
				del(r);
			}
		}
		this.basedaoOrg.delete(entity);
	}

	@Override
	public void edit(OrgDeptTreeForm form) throws Exception {
		
		OrgDeptTreeEntity entity = this.basedaoOrg.get(OrgDeptTreeEntity.class, form.getId());
		
		if(entity != null) {
			BeanUtils.copyProperties(form, entity ,new String[]{"creater"});
			
			if (form.getPid() != null && !form.getPid().equalsIgnoreCase("")) {
				entity.setOrg(basedaoOrg.get(OrgDeptTreeEntity.class, form.getPid()));
			}
			if (form.getPid() != null && !form.getPid().equalsIgnoreCase("")) {// 说明前台选中了上级资源
				OrgDeptTreeEntity pt = basedaoOrg.get(OrgDeptTreeEntity.class, form.getPid());
				isChildren(entity, pt);// 说明要将当前资源修改到当前资源的子/孙子资源下
				entity.setOrg(pt);
			} else {
				entity.setOrg(null);// 前台没有选中上级资源，所以就置空
			}
		}

	}
	
	/**
	 * 判断是否是将当前节点修改到当前节点的子节点
	 * @param entity 当前节点
	 * @param pt 要修改到的节点
	 * @return
	 */
	private boolean isChildren(OrgDeptTreeEntity entity, OrgDeptTreeEntity pt) {
		if (pt != null && pt.getOrg() != null) {
			if (pt.getOrg().getId().equalsIgnoreCase(entity.getId())) {
				pt.setOrg(null);
				return true;
			} else {
				return isChildren(entity, pt.getOrg());
			}
		}
		return false;
	}


	@Override
	public OrgDeptTreeForm get(String id) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		OrgDeptTreeEntity entity = this.basedaoOrg.get("from OrgDeptTreeEntity t where t.id = :id", params);
		
		OrgDeptTreeForm r = new OrgDeptTreeForm();
		
		if(null != entity) {
			BeanUtils.copyProperties(entity, r);
			if (entity.getOrg() != null) {
				r.setPid(entity.getOrg().getId());
			}
		}
		return r ;
	}

	@Override
	public List<OrgDeptTreeForm> org_treegrid(OrgDeptTreeForm form ,String mode) throws Exception {
		String hql = "select t from OrgDeptTreeEntity t where t.org is null order by created desc" ;
		
		System.out.println(form.getId()+"======================ssssssssssssssssss");
		if(null != form.getId()) {
			hql = "select t from OrgDeptTreeEntity t where t.org.id='"+form.getId()+"' order by created desc" ;
		}
		
		List<OrgDeptTreeEntity> entitys = this.basedaoOrg.find(hql) ;
		
		List<OrgDeptTreeForm> orgsform = new ArrayList<OrgDeptTreeForm>() ;
		
		for (OrgDeptTreeEntity menuEntity : entitys) {
			orgsform.add(recursiveNode(menuEntity ,mode)) ;
		}
		
		return orgsform ;
	}
	
	@Override
	public List<OrgDeptTreeForm> org_treeCompute(OrgDeptTreeForm form ,String mode) throws Exception {
		String hql = "select t from OrgDeptTreeEntity t where t.compute='Y' order by created desc" ;
		
		if(null != form.getId()) {
			hql = "select t from OrgDeptTreeEntity t where t.org.id='"+form.getId()+"' and t.compute='Y' order by created desc" ;
		}
		List<OrgDeptTreeEntity> entitys = this.basedaoOrg.find(hql) ;
		
		List<OrgDeptTreeForm> orgsform = new ArrayList<OrgDeptTreeForm>() ;
		
		for (OrgDeptTreeEntity menuEntity : entitys) {
			orgsform.add(recursiveNode(menuEntity ,mode)) ;
		}
		
		return orgsform ;
	}
	
	public OrgDeptTreeForm recursiveNode(OrgDeptTreeEntity me ,String mode) {
		OrgDeptTreeForm mf = new OrgDeptTreeForm() ;
		BeanUtils.copyProperties(me, mf) ;
		
		//combotree方式显示
		mf.setText(me.getFullname()) ;
		
		if(null != me.getOrgs() && me.getOrgs().size() > 0) {
			mf.setState("closed") ;
			
			Set<OrgDeptTreeEntity> rs = me.getOrgs() ;
			List<OrgDeptTreeForm> children = new ArrayList<OrgDeptTreeForm>();
			for (OrgDeptTreeEntity menuEntity : rs) {
				
				//combotree方式显示
				if("combotree".equalsIgnoreCase(mode)) {
						OrgDeptTreeForm tn = recursiveNode(menuEntity ,mode) ;
						BeanUtils.copyProperties(menuEntity ,tn) ;
						children.add(tn);
				} else {
					OrgDeptTreeForm tn = recursiveNode(menuEntity ,mode) ;
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
