<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>项目参与人员邮件列表</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<script type="text/javascript">
	var dataGrid1 ;
	$(function() {
		dataGrid1 = $("#d1").datagrid({
			url:yhq.basePath+"/project/project_report/getMemberInfoList.do?emp_id=${id}",
			idField: 'emp_id', fit: true, fitColumns: false, border: false, method: "post",
			remoteSort: false, striped:true, 
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'emp_id', title: '工号', width: 60, sortable: true },
			    { field: 'emp_name', title: '姓名', width: 70, sortable: true }
			]],
			columns:[[
				{ field: 'project_name', title: '项目名称', width: 200, sortable: true },
				{ field: 'position_sname', title: '公司岗位', width: 80, sortable: true },
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
			    { field: 'totalTaskTime', title: '天数', width: 80, sortable: true },
			    { field: 'mm', title: '人月', width: 80, sortable: true, formatter: function(value,row){
			    	return infosUtil.numberf(value, 2) ;
			    }},
			    { field: 'expendDays', title: '已消耗天数', width: 80, sortable: true},
			    { field: 'expendMM', title: '已消耗人月', width: 80, sortable: true, formatter: function(value,row){
			    	return infosUtil.numberf(value, 2) ;
			    }},
			    { field: 'normalHour', title: '平时加班', width: 100, sortable: true, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>小时</div>" ;
			    	}
			    } },
			    { field: 'weekendHour', title: '周末加班', width: 100, sortable: true, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>小时</div>" ;
			    	}
			    } },
			    { field: 'holidaysHour', title: '节假日加班', width: 100, sortable: true, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>小时</div>" ;
			    	}
			    } },
			    { field: 'totalHour', title: '累计加班小时', width: 100, sortable: true, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>小时</div>" ;
			    	}
			    } },
			    { field: 'status', title: '状态', width: 80, sortable: true, formatter: function(value,row){
			    	if(value == 1) {return "<font color='green'>在项目中</font>";} else if(value == 4) {return "<font color='red'>已退出项目</font>";} 
			    }}
			]],
			onLoadSuccess: function(data) {
		        $.fn.datagrid.extensions.onLoadSuccess.apply(this, arguments);  //这句一定要加上。
		        dataGrid1.datagrid('clearSelections');dataGrid1.datagrid('clearChecked');
		    }
	    });
	});
</script>

</head>

<body style="padding: 0px; margin: 0px;">
	<div class="easyui-layout" data-options="fit: true">
		<div data-options="region: 'north', border: false" style="overflow: hidden;width:100%;height:55px;padding:10px;">
			1、员工稼动率详细列表。<br>
		</div>
		<div data-options="region: 'center', border: true" style="overflow: hidden;width:480px; border-left:0px;border-left:0px; border-bottom:0px;">
			<div id="d1">
			</div>
		</div>
	</div>	
</body>
</html>