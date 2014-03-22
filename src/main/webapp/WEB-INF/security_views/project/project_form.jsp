<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	var editor1,editor2;
	var form_url = yhq.basePath+"/project/project_main/add.do" ;
	$(function() {
		$("#t").tabs({ width:738, lineHeight: 0 });
		$("#project_type").combobox({
			width: 258, valueField: 'label', textField: 'value', value: '0',
			data: [{ label: '0', value: '对日短期保守项目' },{ label: '1', value: '对日长期保守项目' },{ label: '2', value: '对日新规项目' },{ label: '3', value: '国内项目' },{ label: '4', value: '公司内部项目' }],
			panelHeight:'auto', editable:false, autoShowPanel: true
	    });
		$("#deptid").combotree({
			url : yhq.basePath+"/sysmgr/org/treegrid.do",
			width:258, idFiled:'pid', textFiled:'fullname', editable: false,
			lines:true, autoShowPanel: true
	    });
		$("#select2").combogrid({
			url: yhq.basePath+"/sysmgr/employee/datagrid.do",
			method: "get", idField: 'id', textField: 'truename', pagination: true,
			panelWidth: 500, panelHeight: 200, multiple: false, mode:'remote',required:true,
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
						'projectNum' : result.projectNum,
						'name' : result.name,
						//'code' : result.code,
						'project_type' : result.project_type,
						'startDate' : $.date.format($.string.toDate(result.startDate), "yyyy-MM-dd"),
						'endDate' : $.date.format($.string.toDate(result.endDate), "yyyy-MM-dd"),
						'deptid' : result.deptid,
						'leader_id' : result.leader_id,
						'taskScope' : result.taskScope,
						'contractNum' : result.contractNum,
						'project_buglv' : result.project_buglv,
						'project_bjzry' : result.project_bjzry,
						'project_yjtrzry' : result.project_yjtrzry,
						'project_bjscx' : result.project_bjscx,
						'project_ydscx' : result.project_ydscx,
						'project_clrl' : result.project_clrl,
						'leader_name' : result.leader_name
					});
					$("input[name=projectNum]").attr("readonly","readonly") ;
					$("input[name=contractNum]").attr("readonly","readonly") ;
					$("#form input:visible")[0].focus();
				}
			}, 'json');
		}
		
		window.setTimeout(function(){
			editor = new UE.ui.Editor({
				toolbars : [ [ "source", "bold", "forecolor", "fontsize","inserttable", "insertimage", "scrawl", "attachment","insertvideo", "map", "wordimage" ] ]
			});
			editor.render('editor1');
			
			editor = new UE.ui.Editor({
				toolbars : [ [ "source", "bold", "forecolor", "fontsize","inserttable", "insertimage", "scrawl", "attachment","insertvideo", "map", "wordimage" ] ]
			});
			editor.render('editor2');
			
			editor = new UE.ui.Editor({
				toolbars : [ [ "source", "bold", "forecolor", "fontsize","inserttable", "insertimage", "scrawl", "attachment","insertvideo", "map", "wordimage" ] ]
			});
			editor.render('editor3');
			editor = new UE.ui.Editor({
				toolbars : [ [ "source", "bold", "forecolor", "fontsize","inserttable", "insertimage", "scrawl", "attachment","insertvideo", "map", "wordimage" ] ]
			});
			editor.render('editor4');
			
			editor = new UE.ui.Editor({
				toolbars : [ [ "source", "bold", "forecolor", "fontsize","inserttable", "insertimage", "scrawl", "attachment","insertvideo", "map", "wordimage" ] ]
			});
			editor.render('editor5');
			
			editor = new UE.ui.Editor({
				toolbars : [ [ "source", "bold", "forecolor", "fontsize","inserttable", "insertimage", "scrawl", "attachment","insertvideo", "map", "wordimage" ] ]
			});
			editor.render('editor6');
			
		},500);
	});
	
	//提交表单数据
	var submitNow = function($dialog, $datagrid) {
		$("#project_leader").val($("#select2").combogrid("getText"));
		var form_data = {} ; form_data = $("#form").form("getData") ; 
		$.post(form_url, form_data, function(result) {
			if (result.status) {
				$datagrid.datagrid('clearSelections');$datagrid.datagrid('clearChecked');$datagrid.datagrid('reload') ;
				$.easyui.messager.show({ icon: "info", msg: "保存记录成功。" });
				$.easyui.loaded();
				$dialog.dialog("close") ;
			} else {
				$.easyui.loaded();
				$.easyui.messager.show({ icon: "warning", msg: result.msg });
			}
		}, 'json');
	};
	
	//验证表单
	var submitForm = function($dialog, $datagrid) {
		if($('#form').form('validate')) {
			$.easyui.loading({ msg: "数据提交中，请稍等..." });
			submitNow($dialog, $datagrid) ;
		}
	};
</script>

<form id="form" class="easyui-form">
	<input type="hidden" name="id" value="${id}" />
	<input type="hidden" name="createrId" value="${_LOGIN_EMP_KEY.emp.id}" />
	<input type="hidden" name="createrName" value="${_LOGIN_EMP_KEY.emp.truename}" />
	<div class="form_base">
		<table>
			<tr>
				<th>项目编号：</th>
				<td><input type="text" name="projectNum" style="width:250px;" class="easyui-validatebox"  data-options="required:true, prompt: '项目编号'" ></td>
				<th>合同编号：</th>
				<td><input type="text" name="contractNum" style="width:250px;" class="easyui-validatebox"  data-options="required:true, prompt: '合同编号'" ></td>
			</tr>
			<tr> 
				<th>项目名称：</th>
				<td><input type="text" name="name" style="width:250px;" class="easyui-validatebox" ></td>
				<th>开始日期：</th>
				<td><input name="startDate" class="easyui-datebox" required="true" missingMessage="日期必须填写" editable="false" /></td>
			</tr>
			<tr>
				<!-- 
				<th>项目简称：</th>
				<td><input type="text" style="width:250px;" name="code" class="easyui-validatebox" ></td>
				 -->
				<th>结束日期：</th>
				<td><input name="endDate" class="easyui-datebox" required="true" validType="TimeCheck['startDate']" invalidMessage="开始日期必须大于结束日期" editable="false" /></td>
			</tr>
			<tr>
				<th>项目所属部门：</th>
				<td><input id="deptid" name="deptid" /></td>
				<th>项目负责人：</th>
			 	<td><input id="select2" style="width:250px;" name="leader_id" /><input id="leader_name" name="project_leader" type="hidden"></td>
			</tr>
			<tr>
				<th>项目类型：</th>
				<td colspan="3"><input id="project_type" name="project_type" /></td>
			</tr>
			<tr>
				<th>作业范围：</th>
				<td colspan="3"><input id="taskScope" class="easyui-validatebox" name="taskScope" style="width:610px;" /></td>
			</tr>
		</table>
	</div>
	
	<div class="form_base">
		<div id="t">
		    <div data-options="title: '顾客反馈BUG率目标', refreshable: false, selected: true">
		    	<textarea id="editor1" name="project_buglv" style="margin-top:5px;height:130px;width:99.7%;"></textarea>
		    </div>
		    <div data-options="title: '报价总人月', refreshable: false, selected: true">
		    	<textarea id="editor2" name="project_bjzry" style="margin-top:5px;height:130px;width:99.7%;"></textarea>
		    </div>
		    <div data-options="title: '预计投入总人月数', refreshable: false, selected: true">
		    	<textarea id="editor3" name="project_yjtrzry" style="margin-top:5px;height:130px;width:99.7%;"></textarea>
		    </div>
		    <div data-options="title: '报价生产性', refreshable: false, selected: true">
		    	<textarea id="editor4" name="project_bjscx" style="margin-top:5px;height:130px;width:99.7%;"></textarea>
		    </div>
		    <div data-options="title: '预定生产性', refreshable: false, selected: true">
		    	<textarea id="editor5" name="project_ydscx" style="margin-top:5px;height:130px;width:99.7%;"></textarea>
		    </div>
		    <div data-options="title: '粗利润率', refreshable: false, selected: true">
		    	<textarea id="editor6" name="project_clrl" style="margin-top:5px;height:130px;width:99.7%;"></textarea>
		    </div>
		    <!-- 
		    <div data-options="title: '项目目标', refreshable: false, selected: true">
		    	<textarea id="editor1" name="project_target" style="margin-top:5px;height:130px;width:99.7%;"></textarea>
		    </div>
		    <div data-options="title: '项目描述', refreshable: false">
		    	<textarea id="editor2" name="project_desc" style="margin-top:5px;height:130px;width:99.7%;"></textarea>
		    </div>
		     -->
		</div>
	</div>
</form>

