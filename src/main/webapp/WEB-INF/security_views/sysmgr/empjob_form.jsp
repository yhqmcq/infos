<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	var form_url = yhq.basePath+"/sysmgr/empjob/add.do" ;
	
	$(function() {
		$("#select1").combotree({
			url : yhq.basePath+"/sysmgr/empjob/treegrid.do",
			width:157, idFiled:'pid', textFiled:'job_name', editable: false,
			lines:true, autoShowPanel: true
	    });
		
		//编辑，加载表单数据
		if($('input[name=id]').val().length > 0) {
			form_url = yhq.basePath+"/sysmgr/empjob/edit.do" ;
			$.post(yhq.basePath+"/sysmgr/empjob/get.do", {id:$('input[name=id]').val()}, function(result) {
				if (result.id != undefined) {
					$('form').form('load', {
						'id' : result.id,
						'job_name' : result.job_name,
						'job_sname' : result.job_sname,
						'job_level' : result.job_level,
						'description' : result.description,
						'pid' : result.pid,
					});
				}
			}, 'json');
		}
		$("#form input:visible")[0].focus();
	});
	
	//提交表单数据
	var submitNow = function($dialog, $tree) {
		
		$.post(form_url, $("#form").form("getData"), function(result) {
			if (result.status) {
				$tree.treegrid('reload') ;
				$.easyui.messager.show({ icon: "info", msg: "保存记录成功。" });
			} else {
				$.easyui.messager.show({ icon: "info", msg: "保存记录失败。" });
				return false ;
			}
		}, 'json');
	};
	
	//验证表单
	var submitForm = function($dialog, $tree) {
		if($('#form').form('validate')) {
			return submitNow($dialog, $tree) ; ;
		} else{
			return false ;
		}
	};
	
	
</script>

<form id="form" class="easyui-form">
	<input type="hidden" name="id" value="${id}" />
	<table id="tab_box">
		<tr>
			<th>名称：</th>
			<td><input name="job_name" class="easyui-validatebox" type="text" data-options="required: true" /></td>
			<th>简称：</th>
			<td><input name="job_sname" class="easyui-validatebox" type="text" data-options="required: true" /></td>
		</tr>
		<tr>
			<th>级别：</th>
			<td><input name="job_level" class="easyui-validatebox" type="text" data-options="required: true" /></td>
			<th>上级：</th>
			<td><input id="select1" name="pid" /><input name="pname" id="pname"  type="hidden"/></td>
		</tr>
		<tr>
			<td colspan="6">
				<textarea class="easyui-validatebox" name="description" style="width:500px;height:120px;"></textarea>
			</td>
		</tr>
	</table>
	
</form>
