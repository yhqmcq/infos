<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	var form_url = yhq.basePath+"/project/project_main/add.do" ;
	$(function() {
		$("#t").tabs({ width:738, lineHeight: 0 });
		$("#s1").datebox({ required: true, readonly: true, value: $.date.format(new Date(), "yyyy-MM-dd") });
		$("#e1").datebox({ required:true, readonly: true, onSelect : function(date) {
			var t = $.date.compare($.date.format(date,"yyyy-MM-dd"), $("#s1").datebox('getValue')) ;
			if(t<0) { $("#e1").datebox('setValue','') ; $.easyui.messager.show({ icon: "warning", msg: "项目结束日期不能小于项目开始日期！" }); }
		} });
		$("#project_type").combobox({
			width: 157, valueField: 'label', textField: 'value', value: '0',
			data: [{ label: '0', value: '短期迭代' },{ label: '1', value: '长期项目' },{ label: '2', value: '运维项目' }],
			panelHeight:'auto', editable:false, autoShowPanel: true
	    });
		$("#deptid").combotree({
			url : yhq.basePath+"/sysmgr/org/treegrid.do",
			width:157, idFiled:'pid', textFiled:'fullname', editable: false,
			lines:true, autoShowPanel: true,
			onSelect:function(node){$("#deptname").val(node.text);}
	    });
		$("#select2").combogrid({
			url: yhq.basePath+"/sysmgr/employee/datagrid.do",
			method: "get", idField: 'id', textField: 'truename', pagination: true,
			panelWidth: 500, panelHeight: 200, multiple: false, mode:'remote',
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'id', title: '工号', width: 60, sortable: true }
			]],
			columns: [[
			    { field: 'truename', title: '姓名', width: 100, sortable: true },
			    { field: 'orgname', title: '机构部门', width: 120, sortable: true },
			    { field: 'empjobsName', title: '职位', width: 100, sortable: true },
			    { field: 'created', title: '日期', width: 140, sortable: true }
			]]
	    });
		
		//编辑，加载表单数据
		if($('input[name=id]').val().length > 0) {
			form_url = yhq.basePath+"/project/project_main/edit.do" ;
			$.post(yhq.basePath+"/project/project_main/get.do", {id:$('input[name=id]').val()}, function(result) {
				if (result.id != undefined) {
					$('form').form('load', {
						'id' : result.id,
						'name' : result.name,
						'code' : result.code,
						'project_type' : result.project_type,
						'team_name' : result.team_name,
						'deptid' : result.deptid,
						'project_leader_id' : result.project_leader_id,
						'project_leader' : result.project_leader
					});
					$("#s1").datebox('setValue',$.date.format($.string.toDate(result.startDate), "yyyy-MM-dd")) ;
					$("#e1").datebox('setValue',$.date.format($.string.toDate(result.endDate), "yyyy-MM-dd")) ;
					
					$("#form input:visible")[0].focus();
				}
			}, 'json');
		}
	});
	
	//提交表单数据
	var submitNow = function($dialog, $datagrid) {
		$("#project_leader").val($("#select2").combogrid("getText"));
		var form_data = {} ; form_data = $("#form").form("getData") ; 
		$.post(form_url, form_data, function(result) {
			if (result.status) {
				$datagrid.datagrid('reload') ;
				$.easyui.messager.show({ icon: "info", msg: "保存记录成功。" });
			} else {
				$.easyui.messager.show({ icon: "warning", msg: result.msg });
				return false ;
			}
		}, 'json');
	};
	
	//验证表单
	var submitForm = function($dialog, $datagrid) {
		if($('#form').form('validate')) {
			return submitNow($dialog, $datagrid) ;
		} else{
			return false ;
		}
	};
</script>

<form id="form" class="easyui-form">
	<input type="hidden" name="id" value="${id}" />
	<input type="hidden" name="createrId" value="${_LOGIN_EMP_KEY.emp.id}" />
	<input type="hidden" name="createrName" value="${_LOGIN_EMP_KEY.emp.truename}" />
	<div class="form_base">
		<table class="formtable">
			<tr>
				<th>项目名称：</th>
				<td><input type="text" name="name" class="easyui-validatebox" ></td>
				<th>项目代号：</th>
				<td><input type="text" name="code" class="easyui-validatebox" ></td>
			</tr>
			<tr>
				<th>开始日期：</th>
				<td><input id="s1" type="text" name="startDate" /></td>
				<th>结束日期：</th>
				<td><input id="e1" type="text" name="endDate" /></td>
			</tr>
			<tr>
				<th>项目类型：</th>
				<td><input id="project_type" name="project_type" /></td>
				<th>团队名称：</th>
				<td><input type="text" name="team_name" class="easyui-validatebox" ></td>
			</tr>
			<tr>
				<th>项目所属部门：</th>
				<td><input id="deptid" name="deptid" /><input id="deptname" name="deptname" type="hidden"></td>
				<th>项目负责人：</th>
				 <td>
				 	<input id="select2" name="project_leader_id" /><input id="project_leader" name="project_leader" type="hidden">
				 </td>
			</tr>
		</table>
	</div>
</form>

