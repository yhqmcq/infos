<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>项目参与人员邮件列表</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<script type="text/javascript">
	var dataGrid1 ;
	var dataGrid2 ;
	$(function() {
		dataGrid1 = $("#d1").datagrid({
			title: '员工列表',
			url: yhq.basePath+"/sysmgr/employee/datagrid.do?inStatus=0,1",
			idField: 'id', fit: true, border: false, method: "post",pageSize: 15, pageList: [15,20,30,40,100],
			remoteSort: false, toolbar: '#buttonbar1', striped:true, pagination: true,rownumbers: true,
			frozenColumns: [[
 			    { field: 'ck', checkbox: true },
 			    { field: 'id', title: '工号', width: 60, sortable: true },
 			    { field: 'truename', title: '姓名', width: 80, sortable: true }
 			]],
 			columns: [[
				{ field: 'sex', title: '性别', width:55, sortable: true},
				{ field: 'email', title: '邮箱地址', width: 180, sortable: true },
				{ field: 'orgname', title: '公司部门', width: 100, sortable: true },
				{ field: 'position', title: '公司岗位', width: 100, sortable: true, formatter:function(value,row){
					var str = $.string.format("<a href='javascript:;' onclick='showForc(\"{0}\",\"{1}\")'>"+(undefined != value?value:"")+"</a>", row.remark, row.position) ;
					return str ;
				}},
				{ field: 'japanese', title: '日语级别', width: 100, sortable: true }, 
				{ field: 'rzsj', title: '入职时间', width: 100, sortable: true, formatter:function(value,row){
					return infosUtil.str2date(value).format("YYYY-MM-dd") ;
				}},
				{ field: 'bysj', title: '毕业时间', width: 100, sortable: true, formatter:function(value,row){
					return infosUtil.str2date(value).format("YYYY-MM-dd") ;
				}},
				{ field: 'positionDate', title: '岗位变更实施日期', width: 110, sortable: true },
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
				{ field: 'account', title: '账号', width: 120, sortable: true },
				{ field: 'status', title: '账号状态', width: 80, sortable: true, formatter:function(value,row){
					if(value == "Y"){return "<font color='green'>激活</font>";}else{return "<font color='red'>禁用</font>";}
				}},
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
				dataGrid1.datagrid("load",{"orgid": node.id, "inStatus":"0,1"});
			}
	    });
		dataGrid2 = $("#d2").datagrid({
			title: '参与人员邮件列表',
			url: yhq.basePath+"/project/project_main/datagrid_MailList.do?projectid=${project.id}",
			idField: 'id', fit: true, toolbar: '#buttonbar2', border: false, method: "post",
			remoteSort: false, striped:true,rownumbers: true,
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'empid', title: '工号', width: 60, sortable: true },
			    { field: 'empname', title: '姓名', width: 100, sortable: true }
			]],
			columns: [[ 
			    { field: 'empjobname', title: '职位', width: 100, sortable: true },
			    { field: 'email', title: '邮件地址', width: 150, sortable: true },
			    { field: 'deptname', title: '部门名称', width: 100, sortable: true },
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
				}
				var workdata = {} ;
				workdata["ids"] = empIds.join(',');
				workdata["projectid"] = "${project.id}";
				workdata["project_name"] = "${project.name}";
				$.post(yhq.basePath+"/project/project_main/addMailList.do", workdata, function(result) {
					if (result.status) {
						dataGrid1.datagrid('clearSelections');dataGrid1.datagrid('clearChecked') ;
						dataGrid2.datagrid('clearSelections');dataGrid2.datagrid('clearChecked');dataGrid2.datagrid('reload') ;
					}
				}, 'json');
			}
			
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
		}
	}
	
	function deleteMaillist() {
		var rows = dataGrid2.datagrid('getChecked');
		var ids = [];
		if (rows.length > 0) {
			for ( var i = 0; i < rows.length; i++) {
				ids.push(rows[i].id);
			}
			$.post(yhq.basePath+"/project/project_main/deleteMailList.do", {ids : ids.join(',')}, function(result) {
				if (result.status) {
					dataGrid1.datagrid('clearSelections');dataGrid1.datagrid('clearChecked') ;
					dataGrid2.datagrid('clearSelections');dataGrid2.datagrid('clearChecked');dataGrid2.datagrid('reload') ;
				}
			}, 'json');
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
		}
	}
	
</script>

</head>

<body style="padding: 0px; margin: 0px;">
	<div class="easyui-layout" data-options="fit: true">
		<div data-options="region: 'north', border: false" style="overflow: hidden;width:100%;height:55px;padding:10px;">
			1、在这里可以设置项目参与人员的邮件列表，项目的相关变更系统都会自动发送邮件到邮件列表中。<br>
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
				<div data-options="region: 'center', border: false" style="overflow: hidden;width:200px;height:370px;">
					<div class="easyui-layout" data-options="fit: true">
						<div data-options="region: 'west', border: true" style="position: relative;overflow: hidden;background:#e3e3e3; border-bottom:0px;width:40px;height:220px;">
							<a onclick="addMember()" class='imgIcon icon-hamburg-right' style="cursor: pointer;position: absolute;left:5px; top:200px;"></a>							
						</div>
						
						<div data-options="region: 'center', border: true" style="overflow: hidden;width:100px;height:200px; border-right:0px; border-bottom:0px;">
							<div id="d2">
								<div id="buttonbar2">
				                    <a onclick="deleteMaillist();" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_remove'">删除</a>
				                    <a onclick="dataGrid2.datagrid('reload');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_reload'">刷新</a>
				                </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>