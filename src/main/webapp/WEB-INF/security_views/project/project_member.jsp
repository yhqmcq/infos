<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>项目管理</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<script type="text/javascript">
	var dataGrid1 ;
	var dataGrid2 ;
	$(function() {
		dataGrid1 = $("#d1").datagrid({
			title: '用户管理',
			url: yhq.basePath+"/sysmgr/employee/datagrid.do",
			idField: 'id', fit: true, border: false, method: "post",
			remoteSort: false, toolbar: '#buttonbar', striped:true, pagination: true,
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'id', title: '工号', width: 60, sortable: true },
			    { field: 'truename', title: '姓名', width: 80, sortable: true }
			]],
			columns: [[
			    { field: 'orgname', title: '机构部门', width: 100, sortable: true },
			    { field: 'empjobsName', title: '职位', width: 100, sortable: true },
			    { field: 'sex', title: '性别', width:55, sortable: true, formatter:function(value,row){
			    	if(value == "male"){return "男";}else{return "女";}
			    }},
			    { field: 'email', title: '邮箱地址', width: 180, sortable: true },
			    { field: 'tel', title: '联系电话', width: 100, sortable: true }
			]]
	    });
		var s1 = $("#select1").combotree({
			url : yhq.basePath+"/sysmgr/org/treegrid.do",
			width:157, idFiled:'pid', textFiled:'fullname', editable: false,
			lines:true, autoShowPanel: true,
			onSelect:function(node){
				dataGrid1.datagrid("load",{"orgid": node.id});
			}
	    });
		dataGrid2 = $("#d2").datagrid({
			title: '用户管理',
			url: yhq.basePath+"/sysmgr/employee/datagrid.do",
			idField: 'id', fit: true, border: false, method: "post",
			remoteSort: false, striped:true,
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'id', title: '工号', width: 60, sortable: true },
			    { field: 'truename', title: '姓名', width: 80, sortable: true }
			]],
			columns: [[
			    { field: 'orgname', title: '机构部门', width: 100, sortable: true },
			    { field: 'empjobsName', title: '职位', width: 100, sortable: true },
			    { field: 'sex', title: '性别', width:55, sortable: true, formatter:function(value,row){
			    	if(value == "male"){return "男";}else{return "女";}
			    }},
			    { field: 'email', title: '邮箱地址', width: 180, sortable: true },
			    { field: 'tel', title: '联系电话', width: 100, sortable: true }
			]]
	    });
	});
</script>

</head>

<body style="padding: 0px; margin: 0px;">
	<div class="easyui-layout" data-options="fit: true">
		<div data-options="region: 'west', border: false" style="overflow: hidden;width:450px;border-right:1px solid #333;">
			<div id="d1">
				<div id="buttonbar">
                    <a onclick="dataGrid1.datagrid('reload');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_reload'">刷新</a>
                    <input id="select1" name="pid" />
                </div>
			</div>
		</div>
		<div data-options="region: 'center', border: false" style="overflow: hidden;">
			<div class="easyui-layout" data-options="fit: true">
				<div data-options="region: 'north', border: false" style="overflow: hidden;width:200px;height:300px;">
					<div class="easyui-layout" data-options="fit: true">
						<div data-options="region: 'west', border: false" style="overflow: hidden;background:#e3e3e3;border-top:1px solid #333;border-bottom:1px solid #333;width:40px;height:220px;">
							
						</div>
						
						<div data-options="region: 'center', border: false" style="overflow: hidden;border-left:1px solid #333;border-bottom:1px solid #333;width:100px;height:200px;">
							<div id="d2"></div>
						</div>
					</div>
				</div>
				<div data-options="region: 'center', border: false" style="overflow: hidden;border-right:1px solid #333;border-bottom:1px solid #333;width:200px;height:300px;">
					
				</div>
			
			</div>
		</div>
	</div>	
</body>
</html>