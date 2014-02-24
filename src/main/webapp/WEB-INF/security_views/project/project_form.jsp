<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	var form_url = yhq.basePath+"/project/project_main/add.do" ;
	var cg ;
	$(function() {
		//编辑，加载表单数据
		if($('input[name=id]').val().length > 0) {
			form_url = yhq.basePath+"/project/project_main/edit.do" ;
			$.post(yhq.basePath+"/project/project_main/get.do", {id:$('input[name=id]').val()}, function(result) {
				if (result.id != undefined) {
					$('form').form('load', {
						'id' : result.id,
						'account' : result.account,
						'password' : result.password,
						'status' : result.status,
						'truename' : result.truename,
						'sex' : result.sex,
						'email' : result.email,
						'tel' : result.tel,
						'orgname' : result.orgname
					});
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

<style>
	.form_base{
		border:1px solid red;
		width:99%;
		margin:0 auto;
	}
	.form_base table{
		background-color: #B8CCE2;
    	width: 100%;
    	border-spacing: 1px;
	}
	.form_base table tr{
		background-color: #F2F7FE;
	}
	.form_base table th{
		text-align:right ;
		height:30px;
	}
	.form_base table td{
		background-color: #FFFFFF;
    	padding: 5px;
	}
</style>

<form id="form" class="easyui-form">
	<div class="form_base">
		<table class="formtable" cellpadding="0">
			<tr>
				<th>项目名称：</th>
				<td><input type="text" name="" class="easyui-validatebox" ></td>
				<th>项目名称：</th>
				<td><input type="text" name="" class="easyui-validatebox" ></td>
			</tr>
			<tr>
				<th>项目名称：</th>
				<td><input type="text" name="" class="easyui-validatebox" ></td>
				<th>项目名称：</th>
				<td><input type="text" name="" class="easyui-validatebox" ></td>
			</tr>
		</table>
	</div>
	<div class="form_base">
	
	</div>
	
</form>
