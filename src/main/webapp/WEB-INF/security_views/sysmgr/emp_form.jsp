<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	var form_url = yhq.basePath+"/sysmgr/employee/add.do" ;
	var cg ;
	$(function() {
		$("#select1").combotree({
			url : yhq.basePath+"/sysmgr/org/treegrid.do",
			width:157, idFiled:'pid', textFiled:'fullname', editable: false,
			lines:true, autoShowPanel: true,
			onSelect:function(node){
		 		$("#orgname").val(node.text);
		 	}
	    });
		cg = $("#select2").combogrid({
			url: yhq.basePath+"/sysmgr/empjob/treegrid.do",
			panelWidth: 500, multiple: false,
			idField: 'id', textField: 'job_name', method: 'get',
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'id', title: 'ID(id)', width: 80, sortable: true }
			]],
			columns: [[
			    { field: 'job_name', title: '职位名称', width: 180, sortable: true },
			    { field: 'job_sname', title: '职位简称', width: 180, sortable: true },
			    { field: 'job_level', title: '职位级别', width: 180, sortable: true },
			    { field: 'description', title: '简介', width: 200, sortable: true }
			]]
	    });
		
		//编辑，加载表单数据
		if($('input[name=id]').val().length > 0) {
			form_url = yhq.basePath+"/sysmgr/employee/edit.do" ;
			$.post(yhq.basePath+"/sysmgr/employee/get.do", {id:$('input[name=id]').val()}, function(result) {
				if (result.id != undefined) {
					$('form').form('load', {
						'id' : result.id,
						'account' : result.account,
						'password' : result.password,
						'status' : result.status,
						'truename' : result.truename,
						'japanese' : result.japanese,
						'sex' : result.sex,
						//'email' : result.email,
						'tel' : result.tel,
						'orgid' : result.orgid
					});
					var s = result.jobids.split(",") ;
					var vs = [] ;
					for(var i=0;i<s.length;i++) {vs[i]=s[i];}
					$("#select2").combogrid("setValues", vs);
					$('input[name=id]').attr("readonly","readonly") ;
				}
			}, 'json');
		}
		$("#form input:visible")[0].focus();
	});
	
	//提交表单数据
	var submitNow = function($dialog, $datagrid) {
		var form_data = {} ; form_data = $("#form").form("getData") ; 
		form_data["jobids"]=cg.combogrid("getValues").join(",");
		form_data["empjobsName"]=cg.combogrid("getText");
		
		$.post(form_url, form_data, function(result) {
			if (result.status) {
				$datagrid.datagrid('clearSelections');$datagrid.datagrid('clearChecked');$datagrid.datagrid('reload') ;
				$.easyui.messager.show({ icon: "info", msg: "保存记录成功。" });
				$dialog.dialog("close") ;
			} else {
				$.easyui.messager.show({ icon: "warning", msg: result.msg });
			}
		}, 'json');
	};
	
	//验证表单
	var submitForm = function($dialog, $datagrid) {
		if($('#form').form('validate')) {
			submitNow($dialog, $datagrid) ;
		}
	};
</script>

<form id="form" class="easyui-form">
	<table id="tab_box" style="width:100%">
		<tr>
			<th>工号：</th>
			<td><input name="id" validType="length[4,4]" invalidMessage="工号只能由4个数字组成"  value="${id}" class="easyui-validatebox" type="text" data-options="required:true, prompt: '工号'" /></td>
			<th>账号状态：</th>
			<td>
				<input class="easyui-combobox" style="width:157px;" name="status" data-options="
					valueField: 'label', textField: 'value', editable: false, value : 'Y',
					data: [{ label: 'Y', value: '激活' },{ label: 'N', value: '禁用' }],
					panelHeight:'auto', editable:false" />
			</td>
		</tr>
		<tr>
			<th>姓名：</th>
			<td><input name="truename" class="easyui-validatebox" type="text" data-options="required:true, prompt: '真实姓名'" /></td>
			<th>性别：</th>
			<td>
				<input class="easyui-combobox" style="width:157px;" name="sex" data-options="
					valueField: 'label', textField: 'value', editable: false, value : 'male',
					data: [{ label: 'male', value: '男' },{ label: 'female', value: '女' }],
					panelHeight:'auto', editable:false" />
			</td>
		</tr>
		<tr>
			<th>日语级别：</th>
			<td><input name="japanese" class="easyui-validatebox" type="text" data-options="prompt: '日语级别'" /></td>
			<!-- 
			<th>邮箱：</th>
			<td><input name="email" validType="email" class="easyui-validatebox" type="text" data-options="required:true, prompt: '邮箱地址'" /></td>
			 -->
		 	<th>是否部长：</th>
			<td>
				<input class="easyui-combobox" style="width:157px;" name="isLeader" data-options="
					valueField: 'label', textField: 'value', editable: false, value : 'N',
					data: [{ label: 'N', value: '否' },{ label: 'Y', value: '是' }],
					panelHeight:'auto', editable:false" />
			</td>
		</tr>
		<tr>
			<th>公司部门：</th>
			<td><input id="select1" name="orgid" /></td>
			<th>公司岗位：</th>
			<td><input id="select2" /></td>
		</tr>
	</table>
	
</form>
