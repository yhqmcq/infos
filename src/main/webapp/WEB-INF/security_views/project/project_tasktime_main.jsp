<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>用户管理</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<script type="text/javascript">
	var dataGrid ;
	var s1 ;
	$(function() {
		dataGrid = $("#d1").datagrid({
			title: '用户管理',
			url: yhq.basePath+"/sysmgr/employee/datagrid.do?notInStatus=9999",
			idField: 'id', fit: true, border: false, method: "post", singleSelect: true,
			remoteSort: false, toolbar: '#buttonbar', striped:true, pagination: true,
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'id', title: '工号', width: 80, sortable: true },
			    { field: 'truename', title: '姓名', width: 120, sortable: true }
			]],
			columns: [[
			    { field: 'orgname', title: '机构部门', width: 150, sortable: true },
			    { field: 'empjobsName', title: '职位', width: 120, sortable: true },
			    { field: 'sex', title: '性别', width:55, sortable: true, formatter:function(value,row){
			    	if(value == "male"){return "男";}else{return "女";}
			    }},
			    { field: 'account', title: '账号', width: 120, sortable: true },
			    { field: 'email', title: '邮箱地址', width: 180, sortable: true },
			    { field: 'onlineState', title: '在线状态', width: 100, sortable: true, formatter:function(value,row){
			    	if(undefined != value && "" != value && value == 1) {
			    		return $.string.format("<a href='javascript:;'>{0}</a>", "<font color='green'>在线</font>");
			    	} else {
			    		return "下线";
			    	}
			    }},
			    { field: 'status', title: '账号状态', width: 100, sortable: true, formatter:function(value,row){
			    	if(value == "Y"){return "<font color='green'>激活</font>";}else{return "<font color='red'>禁用</font>";}
			    }},
			    { field: 'tel', title: '联系电话', width: 180, sortable: true },
			    { field: 'created', title: '日期', width: 140, sortable: true }
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
				dataGrid.datagrid("load",{"orgid": node.id});
			}
	    });
	});
	
	function form_edit(form) {
		var form_url = yhq.basePath+"/sysmgr/employee/emp_form.do" ;
		if("E" == form) {
			var node = dataGrid.datagrid('getSelected');
			if (node) {
				form_url = yhq.basePath+"/sysmgr/employee/emp_form.do?id="+node.id ;
			} else {
				$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
				return ;
			}
		}
		var dialog = $.easyui.showDialog({
            title: "表单",
            href: form_url,
            iniframe: false,
            width: 500, height: 240,
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
		if (rows.length > 0) {
			$.messager.confirm("您确定要进行该操作？", function (c) { 
				if(c) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].id);
					}
					$.post(yhq.basePath+"/sysmgr/employee/delete.do", {ids : ids.join(',')}, function(result) {
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
                    <a onClick="form_edit('A');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_add'">添加</a>
                    <a onClick="form_edit('E');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_edit'">编辑</a>
                    <a onClick="del();" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_remove'">删除</a>
                    <a onclick="dataGrid.datagrid('reload');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_reload'">刷新</a>
					部门：<input id="select1" name="pid" />
                    <a onclick="dataGrid.datagrid('load',{});s1.combotree('setValue','')" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_reload'">取消筛选</a>
                </div>
			</div>
		</div>
	</div>	
</body>
</html>