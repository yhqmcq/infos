<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	var form_url = yhq.basePath+"/sysmgr/org/add.do" ;
	
	$(function() {
		var s1 = $("#select1").combotree({
			url : yhq.basePath+"/sysmgr/org/treegrid.do",
			width:157, idFiled:'pid', textFiled:'fullname', editable: false,
			lines:true, autoShowPanel: true,
			onSelect:function(node){$("#pname").val(node.text);}
	    });
		$("#select3").combobox({
			width: 157, valueField: 'label', textField: 'value', value: 'O', required: false,
			data: [{ label: 'O', value: '公司' },{ label: 'D', value: '部门' }],
			panelHeight:'auto', editable:false, autoShowPanel: true,
			onSelect: function(node){
				if("D" == node.label) {	//是部门，则必填
					s1.combotree({ required:true, autoShowPanel: true, value: s1.combotree("getValue") }) ;
				} else {
					s1.combotree({ required:false }) ;
				}
			}
	    });
		$("#compute").combobox({
			width: 157, valueField: 'label', textField: 'value', value: 'N', required: false,
			data: [{ label: 'N', value: '不计算' },{ label: 'Y', value: '计算' }],
			panelHeight:'auto', editable:false
	    });
		
		
		//编辑，加载表单数据
		if($('input[name=id]').val().length > 0) {
			form_url = yhq.basePath+"/sysmgr/org/edit.do" ;
			$.post(yhq.basePath+"/sysmgr/org/get.do", {id:$('input[name=id]').val()}, function(result) {
				if (result.id != undefined) {
					$('form').form('load', {
						'id' : result.id,
						'fullname' : result.fullname,
						'code' : result.code,
						'ename' : result.ename,
						'sname' : result.sname,
						'tel' : result.tel,
						'fax' : result.fax,
						'description' : result.description,
						'pid' : result.pid,
						'type' : result.type,
						'compute' : result.compute,
						'pname' : result.pname
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
			<th>类型：</th>
			<td><input id="select3" name="type" /></td>
			<th>上级：</th>
			<td><input id="select1" name="pid" /><input name="pname" id="pname"  type="hidden"/></td>
		</tr>
		<tr>
			<th>名称：</th>
			<td><input name="fullname" class="easyui-validatebox" type="text" data-options="required: true,prompt: '名称'" /></td>
			<th>简称：</th>
			<td><input name="sname" class="easyui-validatebox" type="text" data-options="" /></td>
		</tr>
		<tr>
			<th>稼动率：</th>
			<td colspan="3"><input name="compute" id="compute" /></td>
		</tr>
		
		<!-- 
		<tr>
			<th>英文名称：</th>
			<td><input name="ename" class="easyui-validatebox" type="text" data-options="" /></td>
		 	<th>代码：</th>
			<td><input name="code" class="easyui-validatebox" type="text" data-options="prompt: '代码'" /></td>
		</tr>
		<tr>
			<th>电话：</th>
			<td><input name="tel" class="easyui-validatebox" type="text" data-options="" /></td>
			<th>传真：</th>
			<td><input name="fax" class="easyui-validatebox" type="text" data-options="" /></td>
		</tr>
		 -->
		<tr>
			<td colspan="4">
				<textarea class="easyui-validatebox" name="description" style="width:465px;height:100px;"></textarea>
			</td>
		</tr>
	</table>
	
</form>
