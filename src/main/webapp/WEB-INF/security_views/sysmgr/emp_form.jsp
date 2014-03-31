<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	var form_url = yhq.basePath+"/sysmgr/employee/add.do" ;
	var cg ;
	var old_position ;
	var old_positionDate ;
	$(function() {
		$("#select1").combotree({
			url : yhq.basePath+"/sysmgr/org/treegrid.do",
			idFiled:'pid', textFiled:'fullname', editable: false,
			lines:true, autoShowPanel: true,
			onSelect:function(node){
		 		$("#orgname").val(node.text);
		 	}
	    });
		$("#dbmType").combobox({
			valueField: 'label', textField: 'value', required: true,
			data: [{ label: '1', value: '新增' },{ label: '2', value: '转入' },{ label: '3', value: '在职' },{ label: '4', value: '新人培训' }],
			panelHeight:'auto', editable:false, autoShowPanel: true,
			onSelect: function(node) {
				//新增
				if(node.label == 1) {
					$("#dbmDate").datebox({"required": true, "disabled": false});
					$("#dbmDate").datebox("setValue", new Date().format("YYYY-MM-dd"));
				}
				//转入
				if(node.label == 2) {
					$("#dbmDate").datebox({"required": true, "disabled": false});
					$("#dbmDate").datebox("setValue", "");
				}
			}
	    });
		$("#lbmType").combobox({
			valueField: 'label', textField: 'value',
			data: [{ label: '1', value: '转出——开发部' },{ label: '2', value: '转出——非开发部' },{ label: '3', value: '离职' }],
			panelHeight:'auto', editable:false, autoShowPanel: true,
			onSelect: function(node) {
				$("#lbmDate").datebox({"required": true, "disabled": false});
				$("#lbmDate").datebox("setValue", "");
			}
	    });
		if($('input[name=id]').val().length > 0) {
			$("#lbmType").combobox({"disabled": false});
		}
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
			    { field: 'job_sname', title: '职位简称', width: 180, sortable: true }
			]],
			onClickRow: function(rowIndex, rowDate) {
				if(rowDate.id == old_position) {
					$("#positionDate").datebox({"required": false, "disabled": true});
					$("#positionDate").datebox("setValue", old_positionDate) ;
				} else {
					$("#positionDate").datebox({"required": true, "disabled": false});
					$("#positionDate").datebox("setValue", new Date().format("YYYY-MM-dd")) ;
				}
			}
	    });
		
		//编辑，加载表单数据
		if($('input[name=id]').val().length > 0) {
			form_url = yhq.basePath+"/sysmgr/employee/edit.do" ;
			$.post(yhq.basePath+"/sysmgr/employee/get.do", {id:$('input[name=id]').val()}, function(result) {
				if (result.id != undefined) {
					$('form').form('load', {
						'id' : result.id,
						'account' : result.account,
						'status' : result.status,
						'truename' : result.truename,
						'japanese' : result.japanese,
						'dbmType' : result.dbmType,
						'dbmDate' : result.dbmDate,
						'lbmType' : result.lbmType,
						'lbmDate' : result.lbmDate,
						'positionDate' : result.positionDate,
						'isLeader' : result.isLeader,
						'bysj' : infosUtil.str2date(result.bysj).format("YYYY-MM-dd"),
						'rzsj' : infosUtil.str2date(result.rzsj).format("YYYY-MM-dd"),
						'sex' : result.sex,
						'tel' : result.tel,
						'orgid' : result.orgid
					});
					var s = result.jobids.split(",") ;
					var vs = [] ;
					for(var i=0;i<s.length;i++) {vs[i]=s[i]; old_position = s[i];}
					$("#select2").combogrid("setValues", vs);
					$('input[name=id]').attr("readonly","readonly") ;
					if(result.dbmDate != undefined || result.dbmDate != '') {
						$("#dbmDate").datebox({"required": true, "disabled": false});
						$("#dbmDate").datebox("setValue", result.dbmDate.format("YYYY-MM-dd")) ;
					}
					if(result.lbmDate != undefined || result.lbmDate != '') {
						$("#lbmDate").datebox({"required": true, "disabled": false});
						$("#lbmDate").datebox("setValue", result.lbmDate.format("YYYY-MM-dd")) ;
					}
					old_positionDate = result.positionDate ;
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
				$.easyui.messager.show({ icon: "info", msg: result.msg });
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
	<div class="form_base">
		<table>
		<tr>
			<th>工号：</th>
			<td><input name="id" style="width:190px;" validType="length[4,4]" invalidMessage="工号只能由4个数字组成"  value="${id}" class="easyui-validatebox" type="text" data-options="required:true, prompt: '工号'" /></td>
			<th>账号状态：</th>
			<td>
				<input class="easyui-combobox" style="width:198px;" name="status" data-options="
					valueField: 'label', textField: 'value', editable: false, value : 'Y',
					data: [{ label: 'Y', value: '激活' },{ label: 'N', value: '禁用' }],
					panelHeight:'auto', editable:false" />
			</td>
		</tr>
		<tr>
			<th>姓名：</th>
			<td><input name="truename" style="width:190px;" class="easyui-validatebox" type="text" data-options="required:true, prompt: '真实姓名'" /></td>
			<th>性别：</th>
			<td>
				<input class="easyui-combobox" style="width:198px;" name="sex" data-options="
					valueField: 'label', textField: 'value', editable: false, value : 'male',
					data: [{ label: 'male', value: '男' },{ label: 'female', value: '女' }],
					panelHeight:'auto', editable:false" />
			</td>
		</tr>
		<tr>
			<th>日语级别：</th>
			<td><input name="japanese" style="width:190px;" class="easyui-validatebox" type="text" data-options="prompt: '日语级别'" /></td>
		 	<th>是否部长：</th>
			<td>
				<input class="easyui-combobox" style="width:198px;" name="isLeader" data-options="
					valueField: 'label', textField: 'value', editable: false, value : 'N',
					data: [{ label: 'N', value: '否' },{ label: 'Y', value: '是' }],
					panelHeight:'auto', editable:false" />
			</td>
		</tr>
		<tr>
			<th>毕业时间：</th>
			<td><input name="bysj" style="width:198px;" class="easyui-datebox" editable="false" /></td>
		 	<th>入职时间：</th>
			<td><input name="rzsj" style="width:198px;" class="easyui-datebox" editable="false" /></td>
		</tr>
		<tr>
			<th>公司部门：</th>
			<td colspan="3"><input id="select1" style="width:198px;" name="orgid" /></td>
		</tr>
		<tr>
			<th>公司岗位：</th>
			<td><input id="select2" style="width:198px;" /></td>
			<th>岗位变更实施日期：</th>
			<td><input id="positionDate" name="positionDate" style="width:198px;" class="easyui-datebox" disabled="disabled" editable="false" /></td>
		</tr>
		<tr>
		 	<th>到部门类型：</th>
			<td>
				<input id="dbmType" name="dbmType" style="width:198px;" />
			</td>
			<th>到部门日期：</th>
			<td><input id="dbmDate" name="dbmDate" style="width:198px;" class="easyui-datebox" disabled="disabled" editable="false" /></td>
		</tr>
		<tr>
		 	<th>离部门类型：</th>
			<td>
				<input id="lbmType" name="lbmType" style="width:198px;" disabled="disabled" />
			</td>
			<th>离部门日期：</th>
			<td><input id="lbmDate" name="lbmDate" style="width:198px;" class="easyui-datebox" disabled="disabled" editable="false" /></td>
		</tr>
	</table>
	</div>
</form>
