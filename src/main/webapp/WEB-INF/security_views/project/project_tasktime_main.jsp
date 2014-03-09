<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>人员稼动率管理</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<script type="text/javascript">
	var dataGrid ;
	var s1 ;
	$(function() {
		dataGrid = $("#d1").datagrid({
			title: '人员稼动率管理',
			url: yhq.basePath+"/project/project_report/employeeTaskTimeReport.do?notInStatus=9999",
			idField: 'emp_id', fit: true, border: false, method: "post", singleSelect: true,
			remoteSort: false, toolbar: '#buttonbar', striped:true, pagination: true,
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'emp_id', title: '工号', width: 80, sortable: true },
			    { field: 'emp_name', title: '姓名', width: 120, sortable: true }
			]],
			columns: [[
			    { field: 'dept_name', title: '部门', width: 150, sortable: true },
			    { field: 'position_name', title: '岗位', width: 120, sortable: true },
			    { field: 'totalTaskYear', title: '总月数', width: 80, sortable: true, formatter: function(value, row){
			    	return (row.totalTaskTime / 20) +"&nbsp;月" ;
			    } },
			    { field: 'totalTaskTime', title: '总天数', width: 80, sortable: true }
			]],
			enableHeaderClickMenu: true,        //此属性开启表头列名称右侧那个箭头形状的鼠标左键点击菜单
	        enableHeaderContextMenu: true,      //此属性开启表头列名称右键点击菜单
	        selectOnRowContextMenu: false,      //此属性开启当右键点击行时自动选择该行的功能
	        pagingMenu: { submenu: false }     	//开启行右键菜单的翻页功能，此属性可丰富配置，详情见 API 文档
	    });
		s1 = $("#select1").combotree({
			url : yhq.basePath+"/sysmgr/org/treegrid.do",
			width:157, idFiled:'pid', textFiled:'fullname', editable: false,
			lines:true, autoShowPanel: true,
			onSelect:function(node){
				if("D" == node.type) {
					dataGrid.datagrid("load",{"dept_id": node.id});
				}
			}
	    });
	});
	
</script>

</head>

<body style="padding: 0px; margin: 0px;">
	<div class="easyui-layout" data-options="fit: true">
		<div data-options="region: 'center', border: false" style="overflow: hidden;">
			<div id="d1">
				<div id="buttonbar">
                    <a onclick="dataGrid.datagrid('reload');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_reload'">刷新</a>
					部门：<input id="select1" name="pid" />
                    <a onclick="dataGrid.datagrid('load',{});s1.combotree('setValue','')" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_cancel'">取消筛选</a>
                </div>
			</div>
		</div>
	</div>	
</body>
</html>