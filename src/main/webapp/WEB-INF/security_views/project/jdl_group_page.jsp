<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>项目参与人员邮件列表</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<script type="text/javascript">
	var dg, dept ;
	$(function() {
		
		dept = $("#dept").tree({
			url : yhq.basePath+"/sysmgr/org/doNotNeedAuth_org_treeCompute.do",
			width:157, idFiled:'pid', textFiled:'sname', editable: false,
			lines:true,checkbox:true
	    });
		
		dg = $("#d1").datagrid({
			url:yhq.basePath+"/project/project_report/getMemberInfoList.do?emp_id=${id}",
			idField: 'emp_id', fit: true, fitColumns: false, border: false, method: "post",
			remoteSort: false, striped:true, rownumbers: true,
			frozenColumns: [[
			    { field: 'id', title: '工号', hidden: true, width: 60 }
			]],
			columns:[[
					{ field: 'month1', title: '一月', width: 60 }, 
					{ field: 'month2', title: '二月', width: 60 }, 
					{ field: 'month3', title: '三月', width: 60 }, 
					{ field: 'month4', title: '四月', width: 60 }, 
					{ field: 'month5', title: '五月', width: 60 }, 
					{ field: 'month6', title: '六月', width: 60 }, 
					{ field: 'month7', title: '七月', width: 60 }, 
					{ field: 'month8', title: '八月', width: 60 }, 
					{ field: 'month9', title: '九月', width: 60 }, 
					{ field: 'month10', title: '十月', width: 60 }, 
					{ field: 'month11', title: '十一月', width: 60 }, 
					{ field: 'month12', title: '十二月', width: 60 }
			]],
			onLoadSuccess: function(data) {
		        $.fn.datagrid.extensions.onLoadSuccess.apply(this, arguments);  //这句一定要加上。
		    }
	    });
	});
	
	function groupFunc() {
		console.info(dept.tree("getChecked")) ;
	}
</script>

</head>

<body style="padding: 0px; margin: 0px;">
	<div class="easyui-layout" data-options="fit: true">
	
		<div data-options="region: 'west', border: true" style="overflow: auto;width:220px;border-left:0px;border-bottom:0px;border-top:0px;">
			<div class="easyui-layout" data-options="fit: true">
				<div data-options="region: 'north', border: true" style="overflow: hidden; height:30px;border-left:0px;border-right:0px; border-top:0px;">
					<a onclick="groupFunc()" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-standard-user-suit'">汇总</a>
				</div>
				<div data-options="region: 'center', border: false" style="overflow: auto;border-left:0px;border-right:0px; border-bottom:0px;">
					<div id="dept"></div>
				</div>
			</div>
		</div>
		
		<div data-options="region: 'center', border: true" style="width:480px; border-left:0px;border-right:0px; border-bottom:0px;border-top:0px;">
			<div id="d1"></div>
		</div>
	</div>	
</body>
</html>