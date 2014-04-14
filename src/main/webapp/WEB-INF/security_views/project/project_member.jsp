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
			title: '待机员工列表', 
			url: yhq.basePath+"/sysmgr/employee/datagrid.do?notInStatus=9999,1,3",
			idField: 'id', fit: true, border: false, method: "post",pageSize: 15, pageList: [15,20,30,40,100],
			remoteSort: false, toolbar: '#buttonbar1', striped:true, pagination: true,rownumbers: true,
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'id', title: '工号', width: 60, sortable: true },
			    { field: 'truename', title: '姓名', width: 80, sortable: true }
			]],
			columns: [[
			    { field: 'orgname', title: '公司部门', width: 100, sortable: true },
			    { field: 'position_sname', title: '公司岗位', width: 80, sortable: true, formatter:function(value,row){
			    	var str = $.string.format("<a href='javascript:;' onclick='showForc(\"{0}\",\"{1}\")'>"+(undefined != value?value:"")+"</a>", row.remark, row.position) ;
			    	return str ;
			    }},
			    { field: 'positionDate', title: '岗位变更实施日期', width: 110, sortable: true },
			    { field: 'bysj', title: '毕业时间', width: 100, sortable: true, formatter:function(value,row){
			    	return infosUtil.str2date(value).format("YYYY-MM-dd") ;
			    }},
			    { field: 'rzsj', title: '入职时间', width: 100, sortable: true, formatter:function(value,row){
			    	return infosUtil.str2date(value).format("YYYY-MM-dd") ;
			    }},
			    { field: 'dbmType', title: '到部门类型', width: 100, sortable: true, formatter:function(value,row){
			    	if(value == "1"){return "新增";}else if(value == "2"){return "转入";}else if(value == "3"){return "在职";}else if(value == "4"){return "新人培训";}else if(value == "5"){return "停薪留职返回";}
			    }},
			    { field: 'dbmDate', title: '到部门日期', width: 100, sortable: true, formatter:function(value,row){
			    	return infosUtil.str2date(value).format("YYYY-MM-dd") ;
			    }},
			    { field: 'lbmType', title: '离部门类型', width: 100, sortable: true, formatter:function(value,row){
			    	if(value == "1"){return "转出（到开发部）";}else if(value == "2"){return "转出（到非开发部）";}else if(value == "3"){return "<font color='red'>离职</font>";}else if(value == "4"){return "停薪留职";}
			    }},
			    { field: 'lbmDate', title: '离部门日期', width: 100, sortable: true, formatter:function(value,row){
			    	return infosUtil.str2date(value).format("YYYY-MM-dd") ;
			    }},
			    { field: 'japanese', title: '日语级别', width: 100, sortable: true },
			    { field: 'sex', title: '性别', width:55, sortable: true, formatter:function(value,row){
			    	if(value == "male"){return "男";}else{return "女";}
			    }},
			    { field: 'account', title: '账号', width: 120, sortable: true },
			    { field: 'email', title: '邮箱地址', width: 180, sortable: true },
			    { field: 'created', title: '日期', width: 140, sortable: true }
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
				dataGrid1.datagrid("load",{"orgid": node.id, "inStatus": 0});
			}
	    });
		dataGrid2 = $("#d2").datagrid({
			title: '项目人员',
			url: yhq.basePath+"/project/pwe_emp_working/datagrid.do?project_id=${project.id}&inStatus=0,1",
			idField: 'id', fit: true, toolbar: '#buttonbar2', border: false, method: "post",
			remoteSort: false, striped:true,rownumbers: true,
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'empId', title: '工号', width: 60, sortable: true }
			]],
			columns: [[
			    { field: 'truename', title: '姓名', width: 70, sortable: true },
			    { field: 'orgname', title: '部门', width: 80, sortable: true },
			    { field: 'project_role', title: '项目角色', width: 80, sortable: true, formatter:function(value,row){
			    	if(value == 0) {
			    		return "未设置角色" ;
			    	} else if(value == 1) {
			    		return "PM" ;
			    	} else if(value == 2) {
			    		return "PL" ;
			    	} else if(value == 3) {
			    		return "SE" ;
			    	} else if(value == 4) {
			    		return "PG" ;
			    	} else if(value == 5) {
			    		return "初级PG1" ;
			    	}else if(value == 6) {
			    		return "初级PG2" ;
			    	}else if(value == 7) {
			    		return "初级PG3" ;
			    	}
			    }},
			    { field: 'startDate', title: '起始日期', width:110, sortable: true, formatter:function(value,row){
			    	if(undefined == value || "" == value) { return "未设置"; } else { return $.date.format($.string.toDate(value), "yyyy-MM-dd"); }
			    }},
			    { field: 'endDate', title: '结束日期', width:110, sortable: true, formatter:function(value,row){
			    	if(undefined == value || "" == value) { return "未设置"; } else { return $.date.format($.string.toDate(value), "yyyy-MM-dd"); }
			    }}
			]]
	    });
		$("input[name=projectStartDate]").val(infosUtil.str2date("${project.startDate}").format("YYYY-MM-dd"));
		
		$("<a data-options=\"plain: true, iconCls: 'pagination-last'\" style=\"cursor: pointer;position: absolute;left:5px; top:110px;\"></a>").linkbutton().tooltip({ content: "选择全部" }).appendTo($("#aaa")).click(function () {addAllMember();}) ;
		$("<a data-options=\"plain: true, iconCls: 'pagination-next'\" style=\"cursor: pointer;position: absolute;left:5px; top:140px;\"></a>").linkbutton().tooltip({ content: "选择勾选部分" }).appendTo($("#aaa")).click(function () {addMember();}) ;
		$("<a data-options=\"plain: true, iconCls: 'pagination-prev'\" style=\"cursor: pointer;position: absolute;left:5px; top:170px;\"></a>").linkbutton().tooltip({ content: "取消勾选部分" }).appendTo($("#aaa")).click(function () {revertMember();}) ;
		$("<a data-options=\"plain: true, iconCls: 'pagination-first'\" style=\"cursor: pointer;position: absolute;left:5px; top:200px;\"></a>").linkbutton().tooltip({ content: "取消全部" }).appendTo($("#aaa")).click(function () {revertAllMember();}) ;
		
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
	
	function addAllMember() {
		$.messager.confirm("您确定要进行该操作？", function (c) { 
			if(c) {
				dataGrid1.datagrid("checkAll");
				var rows = dataGrid1.datagrid("getSelections");
				if(rows.length > 0) {
					addMember() ;
				}
			}
		});
	}
	function addMember() {
		var rows = dataGrid1.datagrid("getSelections");
		var empIds = [] ;
		if (rows.length > 0) {
			$.easyui.loading({ msg: "数据提交中，请稍等..." });
			for ( var i = 0; i < rows.length; i++) {
				for ( var i = 0; i < rows.length; i++) {
					empIds.push(rows[i].id);
					addIds.push(rows[i].id);
				}
				var workdata = {} ;
				workdata["empId"] = empIds.join(',');
				workdata["project_id"] = "${project.id}";
				workdata["project_name"] = "${project.name}";
				$.post(yhq.basePath+"/project/pwe_emp_working/add.do", workdata, function(result) {
					if (result.status) {
						$.easyui.loaded();
						dataGrid1.datagrid('clearSelections');dataGrid1.datagrid('clearChecked');dataGrid1.datagrid('reload') ;
						dataGrid2.datagrid('clearSelections');dataGrid2.datagrid('clearChecked');dataGrid2.datagrid('reload') ;
					} else {
						$.easyui.loaded();
					}
				}, 'json');
			}
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
		}
	}
	function revertAllMember() {
		$.messager.confirm("您确定要进行该操作？", function (c) { 
			if(c) {
				dataGrid2.datagrid("checkAll");
				var rows = dataGrid2.datagrid("getSelections");
				if(rows.length > 0) {
					revertMember() ;
				}
			}
		});	
	}
	function revertMember() {
		var rows = dataGrid2.datagrid("getSelections");
		var ids = [];
		if (rows.length > 0) {
			$.easyui.loading({ msg: "数据提交中，请稍等..." });
			for ( var i = 0; i < rows.length; i++) {
				ids.push(rows[i].id);
			}
			$.post(yhq.basePath+"/project/pwe_emp_working/revert.do", {ids : ids.join(','), project_id: "${project.id}"}, function(result) {
				if (result.status) {
					$.easyui.loaded();
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
				$.easyui.loading({ msg: "数据提交中，请稍等..." });
				
				var data = {} ; data = $("#dateform").form("getData") ;
				data["ids"] = ids.join(",");
				var sd = infosUtil.str2date(data.startDate).format("YYYY") ;
				var ed = infosUtil.str2date(data.endDate).format("YYYY") ;
				if(sd == ed) {
					$.post(yhq.basePath+"/project/pwe_emp_working/set_workdate.do", data, function(result) {
						if (result.status) {
							dataGrid2.datagrid('clearSelections');dataGrid2.datagrid('clearChecked');dataGrid2.datagrid('reload') ;
							$.easyui.loaded();
							$.easyui.messager.show({ icon: "info", msg: "设置开发人员起止日期成功。" });
						} else {
							$.easyui.loaded();
							$.easyui.messager.show({ icon: "info", msg: "设置开发人员起止日期失败。" });
						}
					}, 'json');
				} else {
					$.messager.alert("开始日期和结束日期的取值范围<br>必须是在[<font color='red'>"+sd+"</font>]年内"); 
				}
			} else {$.easyui.loaded();}
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
		}
	}
	
	function setMemberRole() {
		var rows = dataGrid2.datagrid('getChecked');
		var ids = [];
		if (rows.length > 0) {
			$.easyui.loading({ msg: "数据提交中，请稍等..." });
			for ( var i = 0; i < rows.length; i++) {
				ids.push(rows[i].id);
			}
			var data = {} ; data = $("#dateform").form("getData") ;
			data["ids"] = ids.join(",");
			
			$.post(yhq.basePath+"/project/pwe_emp_working/set_projectRole.do", data, function(result) {
				if (result.status) {
					$.easyui.loaded();
					dataGrid2.datagrid('clearSelections');dataGrid2.datagrid('clearChecked');dataGrid2.datagrid('reload') ;
					$.easyui.messager.show({ icon: "info", msg: "设置项目角色成功。" });
				} else {
					$.easyui.loaded();
					$.easyui.messager.show({ icon: "info", msg: "设置项目角色失败。" });
				}
			}, 'json');
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
					if(c) { sd() ; }
				});
			}
		} else {
			$.messager.alert("未添加开发人员", "warning");
		}
	}
	function sd() {
		$.easyui.loading({ msg: "数据提交中，请稍等..." });
		$.post(yhq.basePath+"/project/pwe_emp_working/saveAndSendMail.do", {project_id: "${project.id}"}, function(result) {
			if (result.status) {
				$.easyui.loaded();
				$.easyui.messager.show({ icon: "info", msg: "操作成功。" });
				$.easyui.parent.memberClose() ;
			} else {
				$.easyui.loaded();
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
				if(rows[i].empId == value && "${project.status}" != 0) {
					delIds.push(rows[i].id);
				} 
				//如果项目的状态为未开始状态，并且未设置人员起止日期的。按关闭按钮则将这些人员清除
				if(rows[i].empId == value && "${project.status}" == 0 && rows[i].startDate == undefined) {
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
			1、在这里可以设置项目组开发人员，并设置开发人员在项目的工作起止日期及项目角色。<br>
			2、<font color="red">如果项目的状态为（已开始），再追加人员，并设置好起止日期后，需点击邮件通知按钮，如点击关闭或取消，则本次操作视为无效。</font>
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
						<div id="aaa" data-options="region: 'west', border: true" style="position: relative;overflow: hidden;background:#e3e3e3; border-bottom:0px;width:40px;height:220px;">
							<!-- 
							<a onclick="addMember()" class='imgIcon icon-hamburg-right' style="cursor: pointer;position: absolute;left:5px; top:110px;"></a>							
							<a onclick="revertMember()" class='imgIcon icon-hamburg-left' style="cursor: pointer;position: absolute;left:5px; top:160px;"></a>							
							 -->
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
									<td>
										<!-- 项目开始日期，用于判断人员的开始日期是否小于项目的开始日期 -->
										<input name="projectStartDate" type="hidden" />
										
										<input name="startDate" class="easyui-datebox" required="true" validType="TimeCheck['projectStartDate']" invalidMessage="开始日期必须大于项目的开始日期" editable="false" />
									</td>
								</tr>
								<tr>
									<th>结束日期：</th>
									<td>
										<input name="endDate" class="easyui-datebox" required="true" validType="TimeCheck['startDate']" invalidMessage="开始日期必须大于结束日期" editable="false">
										<a onclick="setMemberDate()" class="easyui-linkbutton" data-options="plain: false, iconCls: 'icon-cologne-date'">设置日期</a>
									</td>
								</tr>
								<tr>
									<th>项目角色：</th>
									<td>
									<input class="easyui-combobox" style="width:157px;" name="project_role" data-options="
										valueField: 'label', textField: 'value', editable: false, value : '0',
										data: [
										{ label: '0', value: '无' },
										{ label: '1', value: 'PM' },
										{ label: '2', value: 'PL' },
										{ label: '3', value: 'SE' },
										{ label: '4', value: 'PG' },
										{ label: '5', value: '初级PG1' },
										{ label: '6', value: '初级PG2' },
										{ label: '7', value: '初级PG3' }
										],
										panelHeight:'auto', editable:false" />
									<a onclick="setMemberRole()" class="easyui-linkbutton" data-options="plain: false, iconCls: 'icon-standard-user-gray'">设置角色</a>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<a id="sendmail" onclick="sendmail()" class="easyui-linkbutton" data-options="plain: false, iconCls: 'icon-standard-email'">邮件通知</a>
										<a onclick="cancel()" class="easyui-linkbutton" data-options="plain: false, iconCls: 'ext_cancel'">关闭或取消</a>
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