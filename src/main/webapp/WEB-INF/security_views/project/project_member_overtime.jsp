<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>项目参与人员邮件列表</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<script type="text/javascript">
	var dataGrid ;
	$(function() {
		dataGrid = $("#d1").datagrid({
			title: '员工列表', height:378,
			url: yhq.basePath+"/project/project_main/get_ProjectAllDevMember.do?id=${project.id}",
			idField: 'emp_id', fit: false, fitColumns: true, border: false, method: "post",
			remoteSort: false, striped:true, pagination: false,showFooter: true,
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'emp_id', title: '工号', width: 60, sortable: true },
			    { field: 'emp_name', title: '姓名', width: 70, sortable: true }
			]],
			columns: [[
			    { field: 'dept_name', title: '部门', width: 90, sortable: true },
			    { field: 'position_sname', title: '公司岗位', width: 100, sortable: true },
			    { field: 'project_role', title: '担任角色', width: 80, sortable: true, formatter: function(value,row){
			    	if(value == 0) {
			    		return "未设置角色" ;
			    	} else if(value == 1) {
			    		return "PM" ;
			    	} else if(value == 2) {
			    		return "PL" ;
			    	} else if(value == 3) {
			    		return "SE" ;
			    	} else if(value == 4) {
			    		return "PG" ;
			    	} else if(value == 5) {
			    		return "初级PG1" ;
			    	}else if(value == 6) {
			    		return "初级PG2" ;
			    	}else if(value == 7) {
			    		return "初级PG3" ;
			    	}
			    }},
			    { field: 'sd', title: '开始时间', width: 80, sortable: true },
			    { field: 'ed', title: '结束时间', width: 80, sortable: true },
			    { field: 'status', title: '状态', width: 80, sortable: true, formatter: function(value,row){
			    	if(value == 1) {return "<font color='green'>在项目中</font>";} else if(value == 4) {return "<font color='red'>已退出项目</font>";} 
			    }},
			    { field: 'otStartDate', title: '加班开始时间', width: 130, formatter: function(value,row){
			    	return "2014-03-27 23:45";
			    }},
			    { field: 'otEndDate', title: '加班开始时间', width: 130, formatter: function(value,row){
			    	return "2014-03-27 23:45";
			    }},
			    { field: 'totalHour', title: '累计小时', width: 90, sortable: true, formatter: function(value,row){
			    	if(value == 1) {return "<font color='green'>在项目中</font>";} else if(value == 4) {return "<font color='red'>已退出项目</font>";} 
			    }}
			]],
			onLoadSuccess: function(data) {
		        $.fn.datagrid.extensions.onLoadSuccess.apply(this, arguments);  //这句一定要加上。
		        dataGrid.datagrid('clearSelections');dataGrid.datagrid('clearChecked');
		    }
	    });
		
		
	    $("#startDate").datetimebox({
	    	showSeconds:false,required: true,
	    	formatter: function(date){
	    		return date.format("YYYY-MM-dd hh:mm");
	    	}
	    });  
	    $("#endDate").datetimebox({
	    	showSeconds:false,required: true,
	    	formatter: function(date){
	    		return date.format("YYYY-MM-dd hh:mm");
	    	}
	    });  
		
	});
	
	function setOT() {
		var rows = dataGrid.datagrid('getSelections');
		var ids = [];
		if (rows.length > 0) {
			for ( var i = 0; i < rows.length; i++) {
				ids.push(rows[i].id);
			}
			if($('#dateform').form('validate')) {
				var data = {} ; data = $("#dateform").form("getData") ;
				data["ids"] = ids.join(",");
				
				/*
				$.post(yhq.basePath+"/project/pwe_emp_working/set_projectRole.do", data, function(result) {
					if (result.status) {
						dataGrid.datagrid('clearSelections');dataGrid.datagrid('clearChecked');dataGrid.datagrid('reload') ;
						$.easyui.messager.show({ icon: "info", msg: "设置项目角色成功。" });
					} else {
						$.easyui.messager.show({ icon: "info", msg: "设置项目角色失败。" });
					}
				}, 'json');
				*/
			}
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
		}
	}
	
	function removeOT() {
		
	}
</script>

</head>

<body style="padding: 0px; margin: 0px;">
	<div class="easyui-layout" data-options="fit: true">
		<div data-options="region: 'north', border: false" style="overflow: hidden;width:100%;height:55px;padding:10px;">
			1、设置项目开发人员加班时间。<br>
		</div>
		<div data-options="region: 'center', border: true" style="overflow: hidden;">
			<div id="d1" style="border:1px solid red;"></div>
		</div>
		<div data-options="region: 'south', border: true" style="height:95px;">
			<form id="dateform" class="easyui-form">
				<table style="margin:0px;width:100%;padding:5px;">
					<tr>
						<td align="center" style="padding:5px;">
							<b>加班开始时间:</b><input id="startDate" name="startDate" />
							&nbsp;&nbsp;&nbsp;
							<b>加班结束时间:</b><input id="endDate" validType="TimeCheck['startDate']" invalidMessage="开始时间必须大于结束时间" name="endDate" />
						</td>
					</tr>
					<tr>
						<td align="center" style="padding:5px;">
							<a onclick="removeOT();" class="easyui-linkbutton" data-options="plain: false, iconCls: 'icon-standard-time-delete'">清除时间</a>
							<a onclick="setOT();" class="easyui-linkbutton" data-options="plain: false, iconCls: 'icon-standard-time-add'">设置时间</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>	
</body>
</html>