package com.infox.project.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.infox.common.util.RandomUtils;

/**
 * 项目开发人员表
 * 类描述： 
 * 创建者： 杨浩泉
 * 项目名称： infos
 * 创建时间： 2014-2-26 上午9:53:39
 * 版本号： v1.0
 */
@Entity
@Table(name = "INFOX_PROJECT_EMP_WORKING")
@DynamicUpdate(true)
@DynamicInsert(true)
public class ProjectEmpWorkingEntity {

	private String id ;
	
	@Id
	public String getId() {
		if (this.id != null) {
			return this.id;
		}
		return RandomUtils.generateNumber(6);
	}
	
	public void setId(String id) {
		this.id = id;
	}
}
