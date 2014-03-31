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
			idField: 'emp_id', fit: true, fitColumns: false, border: false, method: "post",
			remoteSort: false, striped:true, pagination: false, rownumbers: true,
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
			    /*{ field: 'otStartDate', title: '加班开始时间', width: 130, formatter: function(value,row){
			    	return infosUtil.str2date(value).format("YYYY-MM-dd hh:ss") ;
			    } },
			    { field: 'otEndDate', title: '加班开始时间', width: 130, formatter: function(value,row){
			    	return infosUtil.str2date(value).format("YYYY-MM-dd hh:ss") ;
			    } },*/
			    { field: 'normalHour', title: '平时加班', width: 90, sortable: true, editor: "text", formatter: function(value,row){
			    	return "<div style='float:left'>"+(undefined != value ? value : "")+"</div><div style='float:right'>小时</div>" ;
			    } }, 
			    { field: 'weekendHour', title: '周末加班', width: 90, sortable: true, editor: "text", formatter: function(value,row){
			    	return "<div style='float:left'>"+(undefined != value ? value : "")+"</div><div style='float:right'>小时</div>" ;
			    } },
			    { field: 'holidaysHour', title: '节假日小时', width: 90, sortable: true, editor: "text", formatter: function(value,row){
			    	return "<div style='float:left'>"+(undefined != value ? value : "")+"</div><div style='float:right'>小时</div>" ;
			    } }, 
			    { field: 'normalHour1', title: '已结算平时加班', width: 90, sortable: true, editor: "text", formatter: function(value,row){
			    	return "<div style='float:left'>"+(undefined != value ? value : "")+"</div><div style='float:right'>小时</div>" ;
			    } }, 
			    { field: 'weekendHour1', title: '已结算周末加班', width: 90, sortable: true, editor: "text", formatter: function(value,row){
			    	return "<div style='float:left'>"+(undefined != value ? value : "")+"</div><div style='float:right'>小时</div>" ;
			    } },
			    { field: 'holidaysHour1', title: '已结算节假日小时', width: 90, sortable: true, editor: "text", formatter: function(value,row){
			    	return "<div style='float:left'>"+(undefined != value ? value : "")+"</div><div style='float:right'>小时</div>" ;
			    } }, 
			    { field: 'sum1', title: '剩余平时小时', width: 90, sortable: true, formatter: function(value,row){
			    	return "<div style='float:left'>"+(undefined != value ? value : "")+"</div><div style='float:right'>小时</div>" ;
			    } }, 
			    { field: 'sum2', title: '剩余周末小时', width: 90, sortable: true, formatter: function(value,row){
			    	return "<div style='float:left'>"+(undefined != value ? value : "")+"</div><div style='float:right'>小时</div>" ;
			    } }, 
			    { field: 'sum3', title: '剩余节假日小时', width: 90, sortable: true, formatter: function(value,row){
			    	return "<div style='float:left'>"+(undefined != value ? value : "")+"</div><div style='float:right'>小时</div>" ;
			    } } 
			]],
			onLoadSuccess: function(data) {
		        $.fn.datagrid.extensions.onLoadSuccess.apply(this, arguments);  //这句一定要加上。
		        dataGrid.datagrid('clearSelections');dataGrid.datagrid('clearChecked');
		    },
		    onAfterEdit: function(data) {
		    	$.fn.datagrid.extensions.onAfterEdit.apply(this, arguments);
		    	var d = dataGrid.datagrid("getRowData", data) ;
		    	var data = {} ;
		    	data["project_id"] = "${project.id}";
		    	data["emp_ids"] = d.emp_id;
		    	data["normalHour"] = d.normalHour ;
		    	data["weekendHour"] = d.weekendHour ;
		    	data["holidaysHour"] = d.holidaysHour ;
		    	data["normalHour1"] = d.normalHour1 ;
		    	data["weekendHour1"] = d.weekendHour1 ;
		    	data["holidaysHour1"] = d.holidaysHour1 ;
		    	
		    	$.post(yhq.basePath+"/project/overtime/add.do", data, function(result) {
					if (result.status) {
						dataGrid.datagrid('clearSelections');dataGrid.datagrid('clearChecked');dataGrid.datagrid('reload') ;
						$.easyui.loaded();
						$.easyui.messager.show({ icon: "info", msg: result.msg });
					} else {
						$.easyui.loaded();
						$.easyui.messager.show({ icon: "info", msg: result.msg });
					}
				}, 'json');
		    },
		    autoEditing: true, extEditing: true, singleEditing: true
	    });
		
		/*
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
	    */
		
	});
	
	function setOT() {
		var rows = dataGrid.datagrid('getSelections');
		var ids = [];
		if (rows.length > 0) {
			$.easyui.loading({ msg: "数据提交中，请稍等..." });
			for ( var i = 0; i < rows.length; i++) {
				ids.push(rows[i].emp_id);
			}
			if($('#dateform').form('validate')) {
				//diffTime() ;
				var data = {} ; data = $("#dateform").form("getData") ;
				//data["startDate"] = data.startDate+":00";
				//data["endDate"] = data.endDate+":00";
				data["project_id"] = "${project.id}";
				data["emp_ids"] = ids.join(",");
				
				$.post(yhq.basePath+"/project/overtime/add.do", data, function(result) {
					if (result.status) {
						dataGrid.datagrid('clearSelections');dataGrid.datagrid('clearChecked');dataGrid.datagrid('reload') ;
						$.easyui.loaded();
						$.easyui.messager.show({ icon: "info", msg: result.msg });
					} else {
						$.easyui.loaded();
						$.easyui.messager.show({ icon: "info", msg: result.msg });
					}
				}, 'json');
			} else {$.easyui.loaded();}
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
		}
	}
	
	function diffTime() {
		var sd = $("#startDate").datetimebox("getValue")+":00".format("YYYY-MM-dd hh:mm:ss") ;
		var ed = $("#endDate").datetimebox("getValue")+":00".format("YYYY-MM-dd hh:mm:ss") ;
		if(undefined != sd && sd.length == 19 && undefined != ed && ed.length == 19) {
			var flag = infosUtil.compareCalendar(sd, ed) ;
			if(flag) {
				var hour = 0 ;
				var minutes = 0 ;
				
				var o = infosUtil.difference(sd, ed) ;
				hour = o.hours ;
				minutes = o.minutes ;
				if(o.days > 0) {
					hour += o.days*24 ;
				}
				$("input[name=hour]").val(infosUtil.numberf(parseFloat(hour + (minutes/600)), 2)) ;
			} else {
				$.easyui.messager.show({ icon: "info", msg: "结束时间必须大于开始时间！" });
			}
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请设置开始和结束时间！" });
		}
	}
	
	function removeOT() {
		var rows = dataGrid.datagrid('getSelections');
		var ids = [];
		if (rows.length > 0) {
			$.easyui.loading({ msg: "数据提交中，请稍等..." });
			for ( var i = 0; i < rows.length; i++) {
				ids.push(rows[i].emp_id);
			}
			var data = {} ; data = $("#dateform").form("getData") ;
			data["project_id"] = "${project.id}";
			data["emp_ids"] = ids.join(",");
			$.post(yhq.basePath+"/project/overtime/delete.do", data, function(result) {
				if (result.status) {
					dataGrid.datagrid('clearSelections');dataGrid.datagrid('clearChecked');dataGrid.datagrid('reload') ;
					$.easyui.loaded();
					$.easyui.messager.show({ icon: "info", msg: result.msg });
				} else {
					$.easyui.loaded();
					$.easyui.messager.show({ icon: "info", msg: result.msg });
				}
			}, 'json');
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
		}
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
		
		<!-- 
		<div data-options="region: 'south', border: true" style="height:95px;">
			<form id="dateform" class="easyui-form">
				<table style="margin:0px;width:100%;padding:5px;">
					<tr>
						<td align="center" style="padding:5px 5px;">
							<b>加班开始时间:</b><input id="startDate" name="startDate" />
							&nbsp;&nbsp;&nbsp;
							<b>加班结束时间:</b><input id="endDate" validType="TimeCheckLT['startDate']" invalidMessage="开始时间必须大于结束时间" name="endDate" />
							<b>平时加班：</b><input type="text" name="normalHour" class="easyui-validatebox" style="width:60px;" />小时&nbsp;&nbsp;
							<b>周末加班：</b><input type="text" name="weekendHour" class="easyui-validatebox" style="width:60px;" />小时&nbsp;&nbsp;
							<b>节假日加班：</b><input type="text" name="holidaysHour" class="easyui-validatebox" style="width:60px;" />小时&nbsp;&nbsp;
							<a onclick="diffTime();" class="easyui-linkbutton" data-options="plain: false, iconCls: 'icon-standard-sum'">计算时间</a>
							<a onclick="setOT();" class="easyui-linkbutton" data-options="plain: false, iconCls: 'icon-standard-time-add'">加班时间</a>
							<a onclick="removeOT();" class="easyui-linkbutton" data-options="plain: false, iconCls: 'icon-standard-time-delete'">清除时间</a>
						</td>
					</tr>
					<tr>
						<td align="center" style="padding:5px 5px;">
							<b>结算平时加班：</b><input type="text" name="normalHour1" class="easyui-validatebox" style="width:60px;" />小时&nbsp;&nbsp;
							<b>结算周末加班：</b><input type="text" name="weekendHour1" class="easyui-validatebox" style="width:60px;" />小时&nbsp;&nbsp;
							<b>结算节假日加班：</b><input type="text" name="holidaysHour1" class="easyui-validatebox" style="width:60px;" />小时&nbsp;&nbsp;
							<a onclick="setOT();" class="easyui-linkbutton" data-options="plain: false, iconCls: 'icon-standard-time-add'">结算时间</a>
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
		 -->
	</div>	
</body>
</html>