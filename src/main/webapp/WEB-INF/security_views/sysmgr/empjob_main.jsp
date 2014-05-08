<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>公司岗位管理</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<script type="text/javascript">
	var treeGrid ;
	$(function() {
		treeGrid = $("#t1").treegrid({
			title: '公司岗位管理',
			method: "get",
			url: yhq.basePath+"/sysmgr/empjob/treegrid.do",
			idField: 'id',
			treeField: 'job_name',
			fit: true,
			border: false,
			fitColumns: true,
			remoteSort: false,
			toolbar: '#buttonbar',
			striped:true,
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'id', title: 'ID(id)', width: 80, sortable: true }
			]],
			columns: [[
			    { field: 'job_name', title: '职位名称', width: 180, sortable: true },
			    { field: 'job_sname', title: '职位简称', width: 180, sortable: true },
			    { field: 'job_level', title: '职位级别', width: 180, sortable: true },
			    { field: 'description', title: '简介', width: 200, sortable: true },
			    { field: 'created', title: '日期(date)', width: 140, sortable: true }
			]],
			enableHeaderClickMenu: false,
			enableHeaderContextMenu: true,
			enableRowContextMenu: true
	    });
	});
	
	function form_edit(form) {
		var form_url = yhq.basePath+"/sysmgr/empjob/empjob_form.do" ;
		if("E" == form) {
			var node = treeGrid.treegrid('getSelected');
			if (node) {
				form_url = yhq.basePath+"/sysmgr/empjob/empjob_form.do?id="+node.id ;
			} else {
				$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
				return ;
			}
		}
		var dialog = $.easyui.showDialog({
            title: "表单",
            href: form_url,
            iniframe: false,
            width: 532, height: 300,
            topMost: true,
            autoVCenter: true,
            autoHCenter: true,
            enableApplyButton: false,
            saveButtonIconCls: "ext_save",
            onSave: function() {
            	return $.easyui.parent.submitForm(dialog, treeGrid);
            }
        });
	}
	
	function del() {
		var node = treeGrid.treegrid('getSelected');
		if(node){
			$.messager.confirm("您确定要进行该操作？<br/>该删除操作会将子菜单一并删除。", function (c) { 
				if(c) {
					$.post(yhq.basePath+"/sysmgr/empjob/delete.do", {id:node.id}, function(result) {
						if (result.status) {
							treeGrid.treegrid('reload') ;
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
			
			<div id="t1">
				<div id="buttonbar">
                    <a id="btn1" onClick="form_edit('A');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_add'">添加</a>
                    <a id="btn2" onClick="form_edit('E');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_edit'">编辑</a>
                    <a id="btn3" onClick="del();" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_remove'">删除</a>
                    <a id="btn4" onclick="treeGrid.treegrid('reload');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_reload'">刷新</a>
                </div>
			</div>
			
		</div>
	</div>	
</body>
</html>