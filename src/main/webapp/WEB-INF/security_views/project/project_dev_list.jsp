<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>项目参与人员邮件列表</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<script type="text/javascript">
	var dataGrid1 ;
	var dataGrid2 ;
	$(function() {
		dataGrid1 = $("#d1").datagrid({
			title: '员工列表',
			url: yhq.basePath+"/project/project_main/get_ProjectDevList.do?id=${id}",
			idField: 'emp_id', fit: true, border: false, method: "post",pageSize: 15, pageList: [15,20,30,40,100],
			remoteSort: false, striped:true, pagination: true,showFooter: true,
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'emp_id', title: '工号', width: 60, sortable: true },
			    { field: 'emp_name', title: '姓名', width: 70, sortable: true }
			]],
			columns: [[
			    { field: 'dept_name', title: '部门', width: 100, sortable: true },
			    { field: 'sd', title: '开始时间', width: 80, sortable: true },
			    { field: 'ed', title: '结束时间', width: 80, sortable: true },
			    { field: 'totalTaskTime', title: '天数', width: 80, sortable: true },
			    { field: 'mm', title: '人月', width: 80, sortable: true, formatter: function(value,row){
			    	return fmoney(value, 2) ;
			    }},
			    { field: 'expendDays', title: '已消耗天数', width: 80, sortable: true},
			    { field: 'expendMM', title: '已消耗人月', width: 80, sortable: true, formatter: function(value,row){
			    	return fmoney(value, 2) ;
			    }},
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
	function fmoney(s, n)   
	{   
	   n = n > 0 && n <= 20 ? n : 2;   
	   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";   
	   var l = s.split(".")[0].split("").reverse(),   
	   r = s.split(".")[1];   
	   t = "";   
	   for(var i = 0; i < l.length; i ++ )   
	   {   
	      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");   
	   }   
	   return t.split("").reverse().join("") + "." + r;   
	} 
</script>

</head>

<body style="padding: 0px; margin: 0px;">
	<div class="easyui-layout" data-options="fit: true">
		<div data-options="region: 'north', border: false" style="overflow: hidden;width:100%;height:55px;padding:10px;">
			1、在这里可以设置项目参与人员的邮件列表，项目的相关变更系统都会自动发送邮件到邮件列表中。<br>
		</div>
		<div data-options="region: 'center', border: true" style="overflow: hidden;width:480px; border-left:0px;border-left:0px; border-bottom:0px;">
			<div id="d1">
			</div>
		</div>
	</div>	
</body>
</html>