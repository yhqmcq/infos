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
			//url : yhq.basePath+"/sysmgr/org/doNotNeedAuth_org_treeCompute.do",
			width:157, idFiled:'pid', textFiled:'sname', editable: false,
			lines:true,checkbox:true
	    });
		if("${_LOGIN_EMP_KEY.emp.isLeader}" == "YY") {
        	dept.tree("load", yhq.basePath+"/sysmgr/org/doNotNeedAuth_org_treeCompute.do?id=${_LOGIN_EMP_KEY.emp.orgid}") ;
        } else {
        	dept.tree("load", yhq.basePath+"/sysmgr/org/doNotNeedAuth_org_treeCompute.do") ;
        }
		
		
		dg = $("#d1").datagrid({
			url:yhq.basePath+"/project/jdl/doNotNeedAuth_jdl_group.do",
			idField: 'emp_id', fit: true, fitColumns: false, border: false, method: "post",
			remoteSort: false, striped:true, rownumbers: true,
			frozenColumns: [[
			    { field: 'id', title: '工号', hidden: true, width: 60 }
			]],
			columns:[[
					{ field: 'dept_name', title: '部门', width: 110 }, 
					{ field: 'smonth1', title: '一月', width: 60 }, 
					{ field: 'smonth2', title: '二月', width: 60 }, 
					{ field: 'smonth3', title: '三月', width: 60 }, 
					{ field: 'smonth4', title: '四月', width: 60 }, 
					{ field: 'smonth5', title: '五月', width: 60 }, 
					{ field: 'smonth6', title: '六月', width: 60 }, 
					{ field: 'smonth7', title: '七月', width: 60 }, 
					{ field: 'smonth8', title: '八月', width: 60 }, 
					{ field: 'smonth9', title: '九月', width: 60 }, 
					{ field: 'smonth10', title: '十月', width: 60 }, 
					{ field: 'smonth11', title: '十一月', width: 60 }, 
					{ field: 'smonth12', title: '十二月', width: 60 }
			]],
			onLoadSuccess: function(data) {
		        $.fn.datagrid.extensions.onLoadSuccess.apply(this, arguments);  //这句一定要加上。
		        
				$(dg.datagrid('getColumnDom',"smonth"+(new Date().getMonth()+1))).css("background","#55BF3B");
		        
		        for(var i=1;i<=(new Date().getMonth()+1)-1;i++){
			        $(dg.datagrid('getColumnDom',"smonth"+i)).css("background","#ddd");
		        }
		        for(var i=(new Date().getMonth()+1)+1;i<=12;i++){
			        $(dg.datagrid('getColumnDom',"smonth"+i)).css("background","#DF5353");
		        }
		    }
	    });
	});
	
	function groupFunc() {
		var t = dept.tree("getChecked") ;
		var ids = [] ;
		if(t.length > 0) {
			$.each(t, function(i, p) {
				ids.push(p.id) ;
			});
			dg.datagrid("load", {ids: ids.join(",")}) ;
		} else {
			alert("请选中要筛选的部门！") ;
		}
		
		
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