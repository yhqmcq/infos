package com.infox.sysmgr.web.form;

import java.util.Date;

import com.infox.common.web.page.PageHelper;

public class TaskForm extends PageHelper {
	
	private String id ;
	
	/** 任务CODE */
	private String task_code ;
	
	/** 任务类型名称 */
	private String task_type_name ;
	
	/** 任务名称 */
	private String task_name ;
	
	/** 任务类型 */
	private String task_type ;
	
	/** Job类路径 */
	private String task_job_class ;
	
	/** cron表达式 */
	private String cron_expression ;
	
	/** 是否启动 */
	private String task_enable ;
	
	/** 任务备注 */
	private String task_remark ;
	
	/** 任务创建者ID */
	private String creater_id ;

	/** 任务创建者Name */
	private String creater_name ;
	
	/** 关联操作，如ID */
	private String relationOperate ;
	
	/** 关联操作,条件查询(模糊查询返回多个实体) */
	private String relationOperates ;
	
	private Date created = new Date() ;

	@Override
	public String toString() {
		return "TaskForm [id=" + id + ", task_code=" + task_code + ", task_type_name=" + task_type_name + ", task_name=" + task_name + ", task_type=" + task_type + ", task_job_class=" + task_job_class + ", cron_expression=" + cron_expression + ", task_enable=" + task_enable + ", task_remark=" + task_remark + ", creater_id=" + creater_id + ", creater_name=" + creater_name + ", relationOperate=" + relationOperate + ", relationOperates=" + relationOperates + ", created=" + created + "]";
	}

	public String getRelationOperates() {
		return relationOperates;
	}

	public void setRelationOperates(String relationOperates) {
		this.relationOperates = relationOperates;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRelationOperate() {
		return relationOperate;
	}

	public void setRelationOperate(String relationOperate) {
		this.relationOperate = relationOperate;
	}

	public String getTask_code() {
		return task_code;
	}

	public void setTask_code(String task_code) {
		this.task_code = task_code;
	}

	public String getTask_name() {
		return task_name;
	}

	public String getTask_type_name() {
		return task_type_name;
	}

	public void setTask_type_name(String task_type_name) {
		this.task_type_name = task_type_name;
	}

	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}

	public String getTask_type() {
		return task_type;
	}

	public void setTask_type(String task_type) {
		this.task_type = task_type;
	}

	public String getTask_job_class() {
		return task_job_class;
	}

	public void setTask_job_class(String task_job_class) {
		this.task_job_class = task_job_class;
	}

	public String getCron_expression() {
		return cron_expression;
	}

	public void setCron_expression(String cron_expression) {
		this.cron_expression = cron_expression;
	}

	public String getTask_enable() {
		return task_enable;
	}

	public void setTask_enable(String task_enable) {
		this.task_enable = task_enable;
	}

	public String getTask_remark() {
		return task_remark;
	}

	public void setTask_remark(String task_remark) {
		this.task_remark = task_remark;
	}

	public String getCreater_id() {
		return creater_id;
	}

	public void setCreater_id(String creater_id) {
		this.creater_id = creater_id;
	}

	public String getCreater_name() {
		return creater_name;
	}

	public void setCreater_name(String creater_name) {
		this.creater_name = creater_name;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

}
