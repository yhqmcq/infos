<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	var form_url = yhq.basePath+"/sysmgr/employee/doNotNeedAuth_editMyUserPwd.do" ;
	
	//提交表单数据
	var submitNow = function($dialog) {
		$.post(form_url, $("#form").form("getData"), function(result) {
			if (result.status) {
				$.easyui.messager.show({ icon: "info", msg: result.msg });
				$dialog.dialog("close") ;
			} else {
				$.easyui.messager.show({ icon: "warning", msg: result.msg });
			}
		}, 'json');
	};
	
	//验证表单
	var submitForm = function($dialog) {
		if($('#form').form('validate')) {
			submitNow($dialog) ;
		}
	};
</script>

<form id="form" class="easyui-form">
	<table id="tab_box" style="width:100%">
		<input type="hidden" value="${_LOGIN_EMP_KEY.emp.id}" name="id">
		<tr>
			<th>旧密码：</th>
			<td><input name="oldPwd" validType="password" class="easyui-validatebox" type="password" data-options="required:true, prompt: '旧密码'" /></td>
		</tr>
		<tr>
			<th>新密码：</th>
			<td><input id="password" name="password" validType="password" class="easyui-validatebox" type="password" data-options="required:true, prompt: '新密码'" /></td>
		</tr>
		<tr>
			<th>确认密码：</th>
			<td><input validType="equals[$('#password').val()]" invalidMessage="两次输入密码不匹配" class="easyui-validatebox" type="password" data-options="required:true, prompt: '确认密码'" /></td>
		</tr>
	</table>
	
</form>
