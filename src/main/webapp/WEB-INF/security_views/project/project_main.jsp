<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>项目管理</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<script type="text/javascript">
	var dataGrid ;
	$(function() {
		dataGrid = $("#d1").datagrid({
			title: '项目管理',
			method: "post",
			url: yhq.basePath+"/project/project_main/datagrid.do",
			idField: 'id',
			fit: true,
			border: false,
			remoteSort: false,
			toolbar: '#buttonbar',
			singleSelect: true,
			striped:true,
			pagination: true,
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'id', title: 'ID', width: 80, sortable: true },
			    { field: 'name', title: '项目名称', width: 180, sortable: true, formatter:function(value,row,index){
		    	var opa = $.string.format("<a href='javascript:;' onclick='project_detail(\"{0}\")'>{1}</a>", index, value);
		    	return opa ;
		    }} ]],
			columns: [[
			    { field: 'code', title: '项目代号', width: 180, sortable: true },
			    { field: 'sedate', title: '项目起止日期', width: 180, sortable: true, formatter:function(value,row){
			    	var sed = $.date.format($.string.toDate(row.startDate), "yyyy-MM-dd") + "&nbsp;&harr;&nbsp;" + $.date.format($.string.toDate(row.endDate), "yyyy-MM-dd")
			    	return sed ;
			    } },
			    { field: 'dateDiff', title: '总天数', width: 80, sortable: true, formatter:function(value,row){return value+"&nbsp;天";} },
			    { field: 'lastdateDiff', title: '剩余天数', width: 80, sortable: true, formatter:function(value,row){return value+"&nbsp;天";} },
			    { field: 'project_type', title: '项目类型', width: 100, sortable: true, formatter:function(value,row){
			    	if(value == 0){ return "短期迭代" ; } else  if(value == 1) { return "长期项目" ; } else { return "运维项目" ; }
			    } },
			    { field: 'deptname', title: '所属部门', width: 100, sortable: true },
			    { field: 'status', title: '状态', width: 100, sortable: true, formatter:function(value,row){
			    	if(value == 0){ return "未开始" ; } else  if(value == 1) { return "<font color='green'>进行中</font>" ; } else  if(value == 2) { return "<font color='green'>已挂起</font>" ; } else  if(value == 3) { return "已完成" ; } else { return "激活" ; }
			    } },
			    { field: 'team_name', title: '团队名称', width: 100, sortable: true },
			    { field: 'operate', title: '操作(operate)', width: 150, formatter:function(value,row,index){
			    	var str = "" +
			    		"<a href='javascript:;' onclick='engine(\"{0}\")'>[{1}]</a>" +
			    		"<a href='javascript:;' onclick='engine(\"{0}\")'>[{1}]</a>" +
			    		"<a href='javascript:;' onclick='engine(\"{0}\")'>[{1}]</a>" +
			    		"<a href='javascript:;' onclick='engine(\"{0}\")'>[{1}]</a>" ;
			    	var opa = $.string.format(str, index, (row.task_enable=="N"?"启动":"停止"));
			    	return opa ;
			    }},
			    { field: 'created', title: '创建日期', width: 140, sortable: true }
			]],
			enableHeaderClickMenu: true,        //此属性开启表头列名称右侧那个箭头形状的鼠标左键点击菜单
	        enableHeaderContextMenu: true,      //此属性开启表头列名称右键点击菜单
	        selectOnRowContextMenu: false,      //此属性开启当右键点击行时自动选择该行的功能
	        pagingMenu: { submenu: false }     	//开启行右键菜单的翻页功能，此属性可丰富配置，详情见 API 文档
	    });
	});
	
	function form_edit(form) {
		var form_url = yhq.basePath+"/project/project_main/project_form.do" ;
		if("E" == form) {
			var node = dataGrid.datagrid('getSelected');
			if (node) {
				form_url = yhq.basePath+"/project/project_main/project_form.do?id="+node.id ;
			} else {
				$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
				return ;
			}
		}
		var dialog = $.easyui.showDialog({
            title: "表单",
            href: form_url,
            iniframe: false,
            width: 760, height: 530,
            topMost: true,
            autoVCenter: true,
            autoHCenter: true,
            enableApplyButton: false,
            saveButtonIconCls: "ext_save",
            onSave: function() {
            	return $.easyui.parent.submitForm(dialog, dataGrid);
            }
        });
	}
	
	function del() {
		var rows = dataGrid.datagrid('getChecked');
		var ids = [];
		alert(rows.length) ;
		if (rows.length > 0) {
			$.messager.confirm("您确定要进行该操作？", function (c) { 
				if(c) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].id);
					}
					$.post(yhq.basePath+"/project/project_main/delete.do", {ids : ids.join(',')}, function(result) {
						if (result.status) {
							dataGrid.datagrid('clearSelections');dataGrid.datagrid('clearChecked');dataGrid.datagrid('reload') ;
							$.easyui.messager.show({ icon: "info", msg: "删除记录成功。" });
						} else {
							$.easyui.messager.show({ icon: "info", msg: "删除记录失败。" });
						}
					}, 'json');
				}
			});
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
		}
	}
	
	
</script>

</head>

<body style="padding: 0px; margin: 0px;">
	<div class="easyui-layout" data-options="fit: true">
		<div data-options="region: 'center', border: false" style="overflow: hidden;">
			<div id="d1">
				<div id="buttonbar">
                    <a id="btn1" onClick="form_edit('A');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_add'">添加</a>
                    <a id="btn2" onClick="form_edit('E');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_edit'">编辑</a>
                    <a id="btn3" onClick="del();" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_remove'">删除</a>
                    <a id="btn4" onclick="dataGrid.datagrid('reload');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_reload'">刷新</a>
                    <a id="btn4" onclick="dataGrid.datagrid('selectAll');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_reload'">全选</a>
                    <a id="btn4" onclick="dataGrid.datagrid('unselectAll');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_reload'">反选</a>
                    <a href="javascript:;" class="easyui-menubutton" data-options="menu:'#navMenu_toggleMenu',iconCls:'ext_settings'">功能操作</a>
                    <div id="navMenu_toggleMenu" class="easyui-menu">
	                    <div data-options="iconCls: 'icon-metro-contract'">
	                    	<span>状态设置</span>
	                    	<div>
		                    	<div data-options="iconCls: 'icon-metro-expand'">开始</div>
		                    	<div data-options="iconCls: 'icon-metro-expand'">挂起</div>
		                    	<div data-options="iconCls: 'icon-metro-expand'">激活</div>
		                    	<div data-options="iconCls: 'icon-metro-expand'">结束</div>
	                    	</div>
	                    </div>
	                    <div class="menu-sep"></div>
	                    <div data-options="iconCls: 'icon-metro-contract2'">延期</div>
	                    <div class="menu-sep"></div>
	                    <div data-options="iconCls: 'icon-metro-contract'">
	                    	<span>人员设置</span>
	                    	<div>
		                    	<div data-options="iconCls: 'icon-metro-expand'">项目参与人员</div>
		                    	<div data-options="iconCls: 'icon-metro-expand'">项目开发人员</div>
	                    	</div>
	                    </div>
                	</div>
                </div>
			</div>
		</div>
	</div>	
</body>
</html>