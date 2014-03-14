<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>项目管理</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<script type="text/javascript">
	var dataGrid ;
	$(function() {
		dataGrid = $("#d1").datagrid({
			title: '项目管理',//view: detailview,
			url: yhq.basePath+"/project/project_main/datagrid.do?notInStatus=5",
			idField: 'id', fit: true, method: "post", border: false, remoteSort: false, rownumbers :true,
			toolbar: '#buttonbar', singleSelect: true, striped:true, pagination: true,pageSize: 15,pageList: [15,25,35,50],
			frozenColumns: [[
			    { field: 'ck', checkbox: true }
		    ]],
			columns: [[
			    { field: 'id', title: 'ID', width: 80, sortable: true, hidden: true },
			    { field: 'projectNum', title: '项目编号', width: 80, sortable: true }, 
			    { field: 'name', title: '项目名称', width: 250, sortable: true, tooltip: true, formatter:function(value,row,index){
		    		//var opa = $.string.format("<p><a href='javascript:;' onclick='project_detail(\"{0}\")'>{1}</a><p/>", row.id, value);
		    		var opa = $.string.format("<p><a href='javascript:;' onclick='getDevList(\"{0}\",\"{1}\")'>{1}</a><p/>", row.id, value, value);
		    		return opa ;
		    	}},
			    { field: 'deptname', title: '所属部门', width: 100, sortable: true },
			    { field: 'deptname', title: '所属部长', width: 100, sortable: true },
			    { field: 'leader_name', title: '项目负责人', width: 100, sortable: true },
			    { field: 'code', title: '项目简称', width: 110, sortable: true },
			    { field: 'status', title: '状态', width: 60, sortable: true, formatter:function(value,row){
			    	if(value == 0){ 
			    		return "<font color='blue'>未开始</font>" ; 
			    	} else  if(value == 1) {
			    		return "<font color='green'>进行中</font>" ;
			    	} else  if(value == 2) {
			    		return "<font color='orange'>已挂起</font>" ;
			    	} else  if(value == 3) { 
			    		return "<font color='red'>已结束</font>" ; 
			    	} else { 
			    		return "历史" ; 
			    	}
			    } },
			    { field: 'sedate', title: '项目起止日期', width: 180, sortable: true, formatter:function(value,row){
			    	var sed = $.date.format($.string.toDate(row.startDate), "yyyy-MM-dd") + "&nbsp;&harr;&nbsp;" + $.date.format($.string.toDate(row.endDate), "yyyy-MM-dd") ;
			    	return sed ;
			    } },
			    { field: 'month', title: '月数', width: 60, sortable: true, formatter:function(value,row){return infosUtil.numberf(row.dateDiff/21,2)+"&nbsp;月";} },
			    //{ field: 'mm', title: '人月', width: 70, sortable: true, formatter:function(value,row){return infosUtil.numberf(value,2)+"&nbsp;人月";} },
			    { field: 'dateDiff', title: '总天数', width: 60, sortable: true, formatter:function(value,row){return value+"&nbsp;天";} },
			    { field: 'lastdateDiff', title: '剩余天数', width: 60, sortable: true, formatter:function(value,row){return value+"&nbsp;天";} },
			    { field: 'project_type', title: '项目类型', width: 120, sortable: true, formatter:function(value,row){
			    	if(value == 0){ return "对日短期保守项目" ; } else  if(value == 1) { return "对日长期保守项目" ; } else  if(value == 2) { return "对日新规项目" ; } else  if(value == 3) { return "国内项目" ; } else { return "公司内部项目" ; }
			    } },
			    //{ field: 'team_name', title: '团队名称', width: 100, sortable: true },
			    { field: 'taskScope', title: '作业范围', width: 100, sortable: true, tooltip: true },
			    { field: 'project_target', title: '项目目标', width: 200, sortable: true, tooltip: true },
			    { field: 'created', title: '创建日期', width: 140, sortable: true }
			]],
			/*
			detailFormatter:function(index,row){
			 	return '<div class="ddv" style="padding:5px 0"></div>';
		 	},
		 	onExpandRow: function(index,row){
			 	var ddv = $(this).datagrid('getRowDetail',index).find('div.ddv');
			 	ddv.datagrid({
				url:yhq.basePath+"/project/project_main/datagrid.do?pid="+row.id,
				singleSelect:true,
				rownumbers:true,
				height:'auto',
				pagination: true,
				columns:[[
					{ field: 'name', title: '项目名称', width: 180, sortable: true, formatter:function(value,row,index){
						return $.string.format("<a href='javascript:;' onclick='project_detail(\"{0}\")'>{1}</a>", index, value);
					}},
					{ field: 'code', title: '项目代号', width: 180, sortable: true },
					{ field: 'sedate', title: '项目起止日期', width: 180, sortable: true, formatter:function(value,row){
						var sed = $.date.format($.string.toDate(row.startDate), "yyyy-MM-dd") + "&nbsp;&harr;&nbsp;" + $.date.format($.string.toDate(row.endDate), "yyyy-MM-dd");
						return sed ;
					} },
					{ field: 'dateDiff', title: '总天数', width: 80, sortable: true, formatter:function(value,row){return value+"&nbsp;天";} },
					{ field: 'lastdateDiff', title: '剩余天数', width: 80, sortable: true, formatter:function(value,row){return value+"&nbsp;天";} },
					{ field: 'project_type', title: '项目类型', width: 100, sortable: true, formatter:function(value,row){
						if(value == 0){ return "短期迭代" ; } else  if(value == 1) { return "长期项目" ; } else { return "运维项目" ; }
					} },
					{ field: 'deptname', title: '所属部门', width: 100, sortable: true },
					{ field: 'project_leader', title: '项目负责人', width: 100, sortable: true },
					{ field: 'status', title: '状态', width: 100, sortable: true, formatter:function(value,row){
						if(value == 0){ return "未开始" ; } else  if(value == 1) { return "<font color='green'>进行中</font>" ; } else  if(value == 2) { return "<font color='green'>已挂起</font>" ; } else  if(value == 3) { return "已完成" ; } else { return "历史" ; }
					} },
					{ field: 'team_name', title: '团队名称', width: 100, sortable: true }
				]],
				onResize:function(){
					dataGrid.datagrid('fixDetailRowHeight',index);
				},
				onLoadSuccess:function(){
					setTimeout(function(){
						dataGrid.datagrid('fixDetailRowHeight',index);
					},0);
				}
					 });
	 			dataGrid.datagrid('fixDetailRowHeight',index);
		 	},
		 	*/
		 	onDblClickRow : function(rowIndex, rowData) {
		 		getDevList(rowData.id, rowData.name) ;
		 	},
		 	onLoadSuccess: function(data) {
		        $.fn.datagrid.extensions.onLoadSuccess.apply(this, arguments);  //这句一定要加上。
		        dataGrid.datagrid('clearSelections');dataGrid.datagrid('clearChecked');
		    },
			enableHeaderClickMenu: true,        //此属性开启表头列名称右侧那个箭头形状的鼠标左键点击菜单
	        enableHeaderContextMenu: true,      //此属性开启表头列名称右键点击菜单
	        selectOnRowContextMenu: false,      //此属性开启当右键点击行时自动选择该行的功能
	        pagingMenu: { submenu: false }     	//开启行右键菜单的翻页功能，此属性可丰富配置，详情见 API 文档
	    });
	});
	
	function form_edit(form) {
		var form_url = yhq.basePath+"/project/project_main/project_form.do" ;
		if("E" == form) {
			var node = dataGrid.datagrid('getSelected');
			if (node) {
				form_url = yhq.basePath+"/project/project_main/project_form.do?id="+node.id ;
			} else {
				$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
				return ;
			}
		}
		var $dialog = $.easyui.showDialog({
            title: "表单",
            href: form_url,
            iniframe: false,
            width: 760, height: 530,
            topMost: true,
            autoVCenter: false,
            autoHCenter: false,
            enableApplyButton: false,
            enableCloseButton: false,
            enableSaveButton: false,
            buttons : [ 
              { text : '保存', iconCls : 'ext_save', handler : function() { $.easyui.parent.submitForm($dialog, dataGrid) ; } },
              { text : '关闭', iconCls : 'ext_cancel', handler : function() { $dialog.dialog('destroy'); } } 
           	]
        });
	}
	
	function del() {
		var rows = dataGrid.datagrid('getChecked');
		var ids = [];
		if (rows.length > 0) {
			$.messager.confirm("您确定要进行该操作？", function (c) { 
				if(c) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].id);
					}
					$.post(yhq.basePath+"/project/project_main/delete.do", {ids : ids.join(',')}, function(result) {
						if (result.status) {
							dataGrid.datagrid('clearSelections');dataGrid.datagrid('clearChecked');dataGrid.datagrid('reload') ;
							$.easyui.messager.show({ icon: "info", msg: "删除记录成功。" });
						} else {
							$.easyui.messager.show({ icon: "info", msg: "删除记录失败。" });
						}
					}, 'json');
				}
			});
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
		}
	}
	
	function project_detail(type) {
		if(undefined != type && type === 'S') {
			var rows = dataGrid.datagrid('getChecked');
			var ids = [] ;
			if (rows.length > 0) {
				for ( var i = 0; i < rows.length; i++) {
					ids.push(rows[i].id);
				}
				window.open(yhq.basePath+"/project/project_main/project_detail.do?id="+ids.join(","), "_blank");
			} else {
				$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
			}
		} else {
			var project_id = type ;
			window.open(yhq.basePath+"/project/project_main/project_detail.do?id="+project_id, "_blank");
		}
	}
	
	var dialog ;
	function devMember() {
		var rows = dataGrid.datagrid('getChecked');
		if (rows.length > 0) {
			dialog = $.easyui.showDialog({
	            title: "设置开发团队人员&nbsp;&nbsp;[<font color='red'>"+rows[0].name+"</font>]",
	            href: yhq.basePath+"/project/project_main/project_member.do?id="+rows[0].id,
	            iniframe: true, closable : false,
	            width: 1024, height: 600,
	            topMost: true,
	            autoVCenter: true,
	            autoHCenter: true,
	            enableApplyButton: false,
	            enableSaveButton: false,
	            enableCloseButton: false
	        });
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
		}
	}
	function memberClose() {
		dialog.dialog('close') ;
	}
	
	function getDevList(id,name) {
		var dialog = $.easyui.showDialog({
            title: "开发人员详细列表&nbsp;&nbsp;[<font color='red'>"+name+"</font>]",
            href: yhq.basePath+"/project/project_main/project_Devdetail.do?id="+id,
            iniframe: true,
            width: 950, height: 600,
            topMost: true,
            autoVCenter: true,
            autoHCenter: true,
            enableApplyButton: false,
            enableSaveButton: false,
            enableCloseButton: true,
            saveButtonIconCls: "ext_cancel"
        });
	}
	
	function mailList() {
		var rows = dataGrid.datagrid('getChecked');
		if (rows.length > 0) {
			var dialog = $.easyui.showDialog({
	            title: "设置项目参与人员邮件列表&nbsp;&nbsp;[<font color='red'>"+rows[0].name+"</font>]",
	            href: yhq.basePath+"/project/project_main/project_maillist.do?id="+rows[0].id,
	            iniframe: true,
	            width: 950, height: 600,
	            topMost: true,
	            autoVCenter: true,
	            autoHCenter: true,
	            enableApplyButton: false,
	            enableSaveButton: false,
	            enableCloseButton: false,
	            saveButtonIconCls: "ext_save",
	            onSave: function() {
	            	return $.easyui.parent.submitForm(dialog, dataGrid);
	            }
	        });
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
		}
	}
	
	function statusChange(v) {
		var rows = dataGrid.datagrid('getChecked');
		if (rows.length > 0) {
			var data = {}; data["status"]=v; data["id"]=rows[0].id ;
			
			$.post(yhq.basePath+"/project/project_main/statusChange.do", data, function(result) {
				if (result.status) {
					dataGrid.datagrid('clearSelections');dataGrid.datagrid('clearChecked');dataGrid.datagrid('reload') ;
					$.easyui.messager.show({ icon: "info", msg: result.msg });
				} else {
					$.easyui.messager.show({ icon: "info", msg: result.msg });
				}
			}, 'json');
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
		}
	}
	
	function project_member_overtime() {
		var node = dataGrid.datagrid('getSelected');
		if (node) {
			var $dialog = $.easyui.showDialog({
	            title: "员工加班状况&nbsp;&nbsp;[<font color='red'>"+node.name+"</font>]",
	            href: yhq.basePath+"/project/project_main/project_member_overtime.do?id="+node.id,
	            iniframe: true, width: 1000, height: 600,
	            topMost: true, autoVCenter: false,  autoHCenter: false,
	            enableApplyButton: false,  enableCloseButton: false, enableSaveButton: false,
	            buttons : [ 
	              { text : '关闭', iconCls : 'ext_cancel', handler : function() { $dialog.dialog('destroy'); } } 
	           	]
	        });
		} else {
			$.easyui.messager.show({ icon: "info", msg: "请选择一条记录！" });
			return ;
		}
	}
	
</script>

</head>

<body style="padding: 0px; margin: 0px;">
	<div class="easyui-layout" data-options="fit: true">
		<div data-options="region: 'center', border: false" style="overflow: hidden;">
			<div id="d1">
				<div id="buttonbar">
                    <a id="btn1" onClick="form_edit('A');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_add'">添加</a>
                    <a id="btn2" onClick="form_edit('E');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_edit'">编辑</a>
                    <a id="btn3" onClick="del();" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_remove'">删除</a>
                    <a id="btn4" onclick="dataGrid.datagrid('reload');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_reload'">刷新</a>
                    <a id="btn4" onclick="dataGrid.datagrid('selectAll');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-standard-layout-header'">全选</a>
                    <a id="btn4" onclick="dataGrid.datagrid('unselectAll');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-standard-layout-sidebar'">反选</a>
                    <a href="javascript:;" class="easyui-menubutton" data-options="menu:'#navMenu_toggleMenu',iconCls:'ext_settings'">功能操作</a>
                    <div id="navMenu_toggleMenu" class="easyui-menu">
	                    <div data-options="iconCls: 'icon-metro-contract'">
	                    	<span>状态设置</span>
	                    	<div>
		                    	<div onclick="statusChange('1')" data-options="iconCls: 'icon-metro-expand'">开始</div>
		                    	<div onclick="statusChange('2')" data-options="iconCls: 'icon-metro-expand'">挂起</div>
		                    	<div onclick="statusChange('4')" data-options="iconCls: 'icon-metro-expand'">激活</div>
		                    	<div onclick="statusChange('3')" data-options="iconCls: 'icon-metro-expand'">结束</div>
	                    	</div>
	                    </div>
	                    <div class="menu-sep"></div>
	                    <div data-options="iconCls: 'icon-metro-contract'">
	                    	<span>人员设置</span>
	                    	<div>
		                    	<div onclick="mailList()" data-options="iconCls: 'icon-metro-expand'">项目参与人员</div>
		                    	<div onclick="devMember()" data-options="iconCls: 'icon-metro-expand'">项目开发人员</div>
	                    	</div>
	                    </div>
	                    <!-- 
	                    <div class="menu-sep"></div>
	                    <div data-options="iconCls: 'icon-metro-contract'">
	                    	<span>浏览项目详情</span>
	                    	<div>
		                    	<div onclick="project_detail('S')" data-options="iconCls: 'icon-metro-expand'">浏览所选</div>
		                    	<div onclick="project_detail('A')" data-options="iconCls: 'icon-metro-expand'">浏览全部</div>
	                    	</div>
	                    </div>
	                     -->
                	</div>
                    <a id="btn2" onClick="project_member_overtime();" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_edit'">加班状况</a>
                </div>
			</div>
		</div>
	</div>	
</body>
</html>