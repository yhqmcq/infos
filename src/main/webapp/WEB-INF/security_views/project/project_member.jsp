<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>设置项目开发人员</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>
<script type="text/javascript">
	var dataGrid1 ;
	var dataGrid2 ;
	var flag ;
	var addIds = [] ;
	$(function() {
		dataGrid1 = $("#d1").datagrid({
			title: '空闲员工列表', 
			url: yhq.basePath+"/sysmgr/employee/datagrid.do?inStatus=0",
			idField: 'id', fit: true, border: false, method: "post",pageSize: 15, pageList: [15,20,30,40,100],
			remoteSort: false, toolbar: '#buttonbar1', striped:true, pagination: true,
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'id', title: '工号', width: 60, sortable: true },
			    { field: 'truename', title: '姓名', width: 100, sortable: true }
			]],
			columns: [[
			    { field: 'orgname', title: '机构部门', width: 100, sortable: true },
			    { field: 'empjobsName', title: '职位', width: 100, sortable: true },
			    { field: 'sex', title: '性别', width:55, sortable: true, formatter:function(value,row){
			    	if(value == "male"){return "男";}else{return "女";}
			    }},
			    { field: 'email', title: '邮箱地址', width: 180, sortable: true },
			    { field: 'tel', title: '联系电话', width: 100, sortable: true }
			]],
			onLoadSuccess: function(data) {
		        $.fn.datagrid.extensions.onLoadSuccess.apply(this, arguments);  //这句一定要加上。
		        dataGrid1.datagrid('clearSelections');dataGrid1.datagrid('clearChecked');
		    }
	    });
		$("#select1").combotree({
			url : yhq.basePath+"/sysmgr/org/treegrid.do",
			width:157, idFiled:'pid', textFiled:'fullname', editable: false,
			lines:true, autoShowPanel: true,
			onSelect:function(node){
				dataGrid1.datagrid("load",{"orgid": node.id});
			}
	    });
		dataGrid2 = $("#d2").datagrid({
			title: '项目人员',
			url: yhq.basePath+"/project/pwe_emp_working/datagrid.do?project_id=${project.id}&inStatus=0,1",
			idField: 'id', fit: true, toolbar: '#buttonbar2', border: false, method: "post",
			remoteSort: false, striped:true,
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'empIds', title: '工号', width: 60, sortable: true },
			    { field: 'emp_name', title: '姓名', width: 100, sortable: true },
			    { field: 'dept_name', title: '部门', width: 100, sortable: true }
			]],
			columns: [[
			    { field: 'startDate', title: '起始日期', width:110, sortable: true, formatter:function(value,row){
			    	if(undefined == value || "" == value) { return "未设置"; } else { return $.date.format($.string.toDate(value), "yyyy-MM-dd"); }
			    }},
			    { field: 'endDate', title: '结束日期', width:110, sortable: true, formatter:function(value,row){
			    	if(undefined == value || "" == value) { return "未设置"; } else { return $.date.format($.string.toDate(value), "yyyy-MM-dd"); }
			    }},
			]]
	    });
		
		$("#s1").datebox({ required: true, value: $.date.format(new Date(), "yyyy-MM-dd") });
		$("#e1").datebox({ required:true, onSelect : function(date) {
			var t = $.date.compare($.date.format(date,"yyyy-MM-dd"), $("#s1").datebox('getValue')) ;
			if(t<0) { $("#e1").datebox('setValue','') ; $.easyui.messager.show({ icon: "warning", msg: "项目结束日期不能小于项目开始日期！" }); }
		} });
		
	    $('#gridSearchbox').searchbox({
	    	searcher:function(value, name) {
	    		var data = {} ; data[name] = value ;
	    		dataGrid1.datagrid("load", data) ;
	    	}
	    });
	    
	    flag = "${project.status}" == 0 ;
	    if(flag) {
	    	$("#sendmail").hide() ;
	    }
	});
	
	function clearSeacher() {
		$("#select1").combotree("setValue", "");
		dataGrid1.datagrid("load", {}) ;
	}
	
	function addMember() {
		var rows = dataGrid1.datagrid('getChecked');
		var empIds = [] ;
		if (rows.length > 0) {
			for ( var i = 0; i < rows.length; i++) {
				for ( var i = 0; i < rows.length; i++) {
					empIds.push(rows[i].id);
					addIds.push(rows[i].id);
				}
				var workdata = {} ;
				workdata["empIds"] = empIds.join(',');
				workdata["project_id"] = "${project.id}";
				workdata["project_name"] = "${project.name}";
				$.post(yhq.basePath+"/project/pwe_emp_working/add.do", workdata, function(result) {
					if (result.status) {
						dataGrid1.datagrid('clearSelections');dataGrid1.datagrid('clearChecked');dataGrid1.datagrid('reload') ;
						dataGrid2.datagrid('clearSelections');dataGrid2.datagrid('clearChecked');dataGrid2.datagrid('reload') ;
					}
				}, 'json');
			}
			
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
		}
	}
	
	function revertMember() {
		var rows = dataGrid2.datagrid('getChecked');
		var ids = [];
		if (rows.length > 0) {
			for ( var i = 0; i < rows.length; i++) {
				ids.push(rows[i].id);
			}
			$.post(yhq.basePath+"/project/pwe_emp_working/revert.do", {ids : ids.join(','), project_id: "${project.id}"}, function(result) {
				if (result.status) {
					dataGrid2.datagrid('clearSelections');dataGrid2.datagrid('clearChecked');dataGrid2.datagrid('reload') ;
					dataGrid1.datagrid('clearSelections');dataGrid1.datagrid('clearChecked');dataGrid1.datagrid('reload') ;
				}
			}, 'json');
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
		}
	}
	
	function setMemberDate() {
		var rows = dataGrid2.datagrid('getChecked');
		var ids = [];
		if (rows.length > 0) {
			for ( var i = 0; i < rows.length; i++) {
				ids.push(rows[i].id);
			}
			if($('#dateform').form('validate')) {
				var data = {} ; data = $("#dateform").form("getData") ;
				data["ids"] = ids.join(",");
				
				$.post(yhq.basePath+"/project/pwe_emp_working/set_workdate.do", data, function(result) {
					if (result.status) {
						dataGrid2.datagrid('clearSelections');dataGrid2.datagrid('clearChecked');dataGrid2.datagrid('reload') ;
						$.easyui.messager.show({ icon: "info", msg: "设置开发人员起止日期成功。" });
					} else {
						$.easyui.messager.show({ icon: "info", msg: "设置开发人员起止日期失败。" });
					}
				}, 'json');
			}
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
		}
	}
	
	function sendmail() {
		var flag = true ;
		var rows = dataGrid2.datagrid('getRows');
		if (rows.length > 0) {
			for ( var i = 0; i < rows.length; i++) {
				if(undefined == rows[i].startDate) {
					flag = false ;
					break ;
				}
			}
			if(flag) {
				sd() ;
			} else {
				$.messager.confirm("未设置起止日期的开发人员将恢复空闲状态，是否继续发送邮件？", function (c) {
					if(c) {
						sd() ;
					}
				});
			}
		} else {
			$.messager.alert("未添加开发人员", "warning");
		}
	}
	function sd() {
		$.post(yhq.basePath+"/project/pwe_emp_working/saveAndSendMail.do", {project_id: "${project.id}"}, function(result) {
			if (result.status) {
				$.easyui.messager.show({ icon: "info", msg: "操作成功。" });
				
				$.easyui.parent.memberClose() ;
			} else {
				$.easyui.messager.show({ icon: "info", msg: "操作失败。" });
			}
		}, 'json');
	}
	function cancel() {
		var delIds = [] ;
		$.each(addIds, function(index, value) {
			var rows = dataGrid2.datagrid('getRows');
			for ( var i = 0; i < rows.length; i++) {
				//如果项目的状态为开始状态，将刚加入项目组的人员清除
				if(rows[i].empIds == value && "${project.status}" != 0) {
					delIds.push(rows[i].id);
				} 
				//如果项目的状态为未开始状态，并且未设置人员起止日期的。按关闭按钮则将这些人员清除
				if(rows[i].empIds == value && "${project.status}" == 0 && rows[i].startDate == undefined) {
					delIds.push(rows[i].id);
				}
			}
		});
		if(delIds.length > 0) {
			$.post(yhq.basePath+"/project/pwe_emp_working/delTempRow.do", {project_id: "${project.id}", ids: delIds.join(",")}, function(result) {
				if (result.status) {
					$.easyui.messager.show({ icon: "info", msg: "操作成功。" });
					$.easyui.parent.memberClose() ;
				} else {
					$.easyui.messager.show({ icon: "info", msg: "操作失败。" });
				}
			}, 'json');
		} else {$.easyui.parent.memberClose() ;}
	}
</script>

</head>

<body style="padding: 0px; margin: 0px;">
	<div class="easyui-layout" data-options="fit: true">
		<div data-options="region: 'north', border: false" style="overflow: hidden;width:100%;height:55px;padding:10px;">
			1、在这里可以设置项目组开发人员，并设置开发人员在项目的工作起止日期。<br>
		</div>
		<div data-options="region: 'west', border: true" style="overflow: hidden;width:480px; border-left:0px;border-left:0px; border-bottom:0px;">
			<div id="d1">
				<div id="buttonbar1">
					<input id="gridSearchbox" class="easyui-searchbox" data-options="width: 200, prompt: '请输入您要查找的内容关键词', menu: '#gridSearchboxMenu'" />
                    <div id="gridSearchboxMenu">
                        <div data-options="name:'id', iconCls: 'icon-hamburg-zoom'">工号</div>
                        <div data-options="name:'truename', iconCls: 'icon-hamburg-zoom'">姓名</div>
                    </div>
                    
					部门：<input id="select1" name="pid" />
                    <a onclick="clearSeacher();" class="easyui-linkbutton easyui-tooltip" title="取消筛选" data-options="plain: true, iconCls: 'icon-standard-cross'"></a>
                    <a onclick="dataGrid1.datagrid('reload');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_reload'"></a>
                </div>
			</div>
		</div>
		<div data-options="region: 'center', border: false" style="overflow: hidden;">
			<div class="easyui-layout" data-options="fit: true">
				<div data-options="region: 'north', border: false" style="overflow: hidden;width:200px;height:370px;">
					<div class="easyui-layout" data-options="fit: true">
						<div data-options="region: 'west', border: true" style="position: relative;overflow: hidden;background:#e3e3e3; border-bottom:0px;width:40px;height:220px;">
							<a onclick="addMember()" class='imgIcon icon-hamburg-right' style="cursor: pointer;position: absolute;left:5px; top:110px;"></a>							
							<a onclick="revertMember()" class='imgIcon icon-hamburg-left' style="cursor: pointer;position: absolute;left:5px; top:160px;"></a>							
						</div>
						
						<div data-options="region: 'center', border: true" style="overflow: hidden;width:100px;height:200px; border-right:0px; border-bottom:0px;">
							<div id="d2">
								<div id="buttonbar2">
				                    <a onclick="dataGrid2.datagrid('reload');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_reload'">刷新</a>
				                </div>
							</div>
						</div>
					</div>
				</div>
				<div data-options="region: 'center', border: false" style="overflow: hidden;width:200px;height:300px;">
					<form id="dateform" class="easyui-form">
						<div class="form_base" style="width:100%;">
							<table style="margin:0px;">
								<tr rowspan="2">
									<th>起始日期：</th>
									<td><input id="s1" type="text" name="startDate" /></td>
								</tr>
								<tr>
									<th>结束日期：</th>
									<td><input id="e1" type="text" name="endDate" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<a onclick="setMemberDate()" class="easyui-linkbutton" data-options="plain: false, iconCls: 'icon-cologne-date'">设置日期</a>
										<a id="sendmail" onclick="sendmail()" class="easyui-linkbutton" data-options="plain: false, iconCls: 'icon-cologne-date'">邮件通知</a>
										<a onclick="cancel()" class="easyui-linkbutton" data-options="plain: false, iconCls: 'icon-cologne-date'">关闭或取消</a>
									</td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			
			</div>
		</div>
	</div>	
</body>
</html>