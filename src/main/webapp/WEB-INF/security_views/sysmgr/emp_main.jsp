<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>员工管理</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<script type="text/javascript">
	var dataGrid ;
	var s1 ;
	$(function() {
		dataGrid = $("#d1").datagrid({
			title: '员工管理',
			url: yhq.basePath+"/sysmgr/employee/datagrid.do?notInStatus=9999",
			idField: 'id', fit: true, border: false, method: "post", singleSelect: true, rownumbers: true,
			remoteSort: false, toolbar: '#buttonbar', striped:true, pagination: true,pageSize: 20,pageList: [10,20,30,50],
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'id', title: '工号', width: 60, sortable: true },
			    { field: 'truename', title: '姓名', width: 120, sortable: true, formatter:function(value,row){
			    	if(row.isLeader == "Y") {
			    		return "<font color='red'>"+value+"</font>";
			    	} else {
			    		return value;
			    	}
			    }},
			]],
			columns: [[
			    { field: 'orgname', title: '公司部门', width: 100, sortable: true },
			    { field: 'position', title: '公司岗位', width: 150, sortable: true, formatter:function(value,row){
			    	var str = $.string.format("<a href='javascript:;' onclick='showForc(\"{0}\",\"{1}\")'>"+value+"</a>", row.remark, row.position) ;
			    	return str ;
			    }},
			    { field: 'bysj', title: '毕业时间', width: 120, sortable: true, formatter:function(value,row){
			    	return infosUtil.str2date(value).format("YYYY-MM-dd") ;
			    }},
			    { field: 'rzsj', title: '入职时间', width: 120, sortable: true, formatter:function(value,row){
			    	return infosUtil.str2date(value).format("YYYY-MM-dd") ;
			    }},
			    { field: 'japanese', title: '日语级别', width: 120, sortable: true },
			    { field: 'sex', title: '性别', width:55, sortable: true, formatter:function(value,row){
			    	if(value == "male"){return "男";}else{return "女";}
			    }},
			    { field: 'account', title: '账号', width: 120, sortable: true },
			    { field: 'status', title: '账号状态', width: 100, sortable: true, formatter:function(value,row){
			    	if(value == "Y"){return "<font color='green'>激活</font>";}else{return "<font color='red'>禁用</font>";}
			    }},
			    { field: 'email', title: '邮箱地址', width: 180, sortable: true },
			    { field: 'created', title: '日期', width: 140, sortable: true }
			]],
			onLoadSuccess: function(data) {
		        $.fn.datagrid.extensions.onLoadSuccess.apply(this, arguments);  //这句一定要加上。
		        dataGrid.datagrid('clearSelections');dataGrid.datagrid('clearChecked');
		    },
			enableHeaderClickMenu: true,        //此属性开启表头列名称右侧那个箭头形状的鼠标左键点击菜单
	        enableHeaderContextMenu: true,      //此属性开启表头列名称右键点击菜单
	        selectOnRowContextMenu: false,      //此属性开启当右键点击行时自动选择该行的功能
	        pagingMenu: { submenu: false }     	//开启行右键菜单的翻页功能，此属性可丰富配置，详情见 API 文档
	    });
		s1 = $("#select1").combotree({
			url : yhq.basePath+"/sysmgr/org/treegrid.do",
			width:180, idFiled:'pid', textFiled:'fullname', editable: false,
			lines:true, autoShowPanel: true,
			onSelect:function(node){
				dataGrid.datagrid("load",{"orgid": node.id, "notInStatus":9999});
			}
	    });
	});
	
	//显示岗位变更历史
	function showForc(forc,cur) {
		var str = "" ;
		var sp = forc.split(",") ;
		$.each(sp, function(index){
			str += "<br>"+sp[index] +"<br>" ;
		});
		$.easyui.showDialog({
            title: "当前岗位【<font color='red'>"+cur+"</font>】",
            content: str,
            iniframe: false,
            width: 500, height: 440,
            topMost: true,
            autoVCenter: true,
            autoHCenter: true,
            enableApplyButton: false,
            enableCloseButton: true,
            enableSaveButton: false
        });
	}
	
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
		var $dialog = $.easyui.showDialog({
            title: "表单",
            href: form_url,
            iniframe: false,
            width: 550, height: 440,
            topMost: true,
            autoVCenter: true,
            autoHCenter: true,
            enableApplyButton: false,
            enableCloseButton: false,
            enableSaveButton: false,
            buttons : [ 
              { text : '保存', iconCls : 'ext_save', handler : function() { $.easyui.parent.submitForm($dialog, dataGrid) ; } },
              { text : '关闭', iconCls : 'ext_cancel', handler : function() { $dialog.dialog('destroy'); } } 
           	]
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
                    <a onclick="dataGrid.datagrid('load',{});s1.combotree('setValue','')" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-standard-disconnect'">取消筛选</a>
                </div>
			</div>
		</div>
	</div>	
</body>
</html>