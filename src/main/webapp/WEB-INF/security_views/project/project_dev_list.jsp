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
			title: '员工列表',
			url: yhq.basePath+"/project/project_main/get_ProjectDevList.do?id=${id}",
			idField: 'emp_id', fit: true, fitColumns: false, border: false, method: "post",
			remoteSort: false, striped:true, pagination: false,showFooter: true, rownumbers: true,
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'emp_id', title: '工号', width: 60, sortable: true },
			    { field: 'emp_name', title: '姓名', width: 70, sortable: true }
			]],
			columns: [[
			    { field: 'dept_name', title: '部门', width: 120, sortable: true },
			    { field: 'position_sname', title: '公司岗位', width: 120, sortable: true },
			    { field: 'dbmType', title: '到部门类型', width: 100, sortable: true, formatter:function(value,row){
			    	if(value != undefined) {
				    	if(value == "1"){return "新增";}else if(value == "2"){return "转入";}else if(value == "3"){return "在职";}else if(value == "4"){return "新人培训";}else if(value == "5"){return "停薪留职返回";}
			    	} else {return "" ;}  
			    }},
			    { field: 'dbmDate', title: '到部门日期', width: 100, sortable: true, formatter:function(value,row){
			    	return infosUtil.str2date(value).format("YYYY-MM-dd") ;
			    }},
			    { field: 'lbmType', title: '离部门类型', width: 100, sortable: true, formatter:function(value,row){
			    	if(value != undefined) {
				    	if(value == "1"){return "转出（到开发部）";}else if(value == "2"){return "转出（到非开发部）";}else if(value == "3"){return "<font color='red'>离职</font>";}else if(value == "4"){return "停薪留职";}
			    	} else {return "" ;}  
			    }},
			    { field: 'lbmDate', title: '离部门日期', width: 100, sortable: true, formatter:function(value,row){
			    	return infosUtil.str2date(value).format("YYYY-MM-dd") ;
			    }},
			    { field: 'positionDate', title: '岗位变更实施日期', width: 120, sortable: true },
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
			    { field: 'normalHour1', title: '已结算平时加班', width: 100, sortable: true, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>小时</div>" ;
			    	}
			    } },
			    { field: 'weekendHour1', title: '已结算周末加班', width: 100, sortable: true, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>小时</div>" ;
			    	}
			    } },
			    { field: 'holidaysHour1', title: '已结算节假日加班', width: 100, sortable: true, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>小时</div>" ;
			    	}
			    } },
			    { field: 'sum1', title: '剩余平时加班', width: 100, sortable: true, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>小时</div>" ;
			    	}
			    } },
			    { field: 'sum2', title: '剩余周末加班', width: 100, sortable: true, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>小时</div>" ;
			    	}
			    } },
			    { field: 'sum3', title: '剩余节假日加班', width: 100, sortable: true, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>小时</div>" ;
			    	}
			    } },
			    { field: 'totalHour', title: '累计加班小时', width: 100, sortable: true, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>小时</div>" ;
			    	}
			    } },
			    { field: 'totalAllHourLV', title: '总加班率', width: 100, sortable: true, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'></div>" ;
			    	}
			    } },
			    { field: 'totalCurrentHourLV', title: '当前班率', width: 100, sortable: true, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'></div>" ;
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
			1、项目开发人员详细列表。<br>
		</div>
		<div data-options="region: 'center', border: true" style="overflow: hidden;width:480px; border-left:0px;border-right:0px; border-bottom:0px;">
			<div id="d1">
			</div>
		</div>
	</div>	
</body>
</html>