<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>人员稼动率管理</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<script type="text/javascript">
	var dataGrid ;
	var s1 ;
	$(function() {
		dataGrid = $("#d1").datagrid({
			title: '人员稼动率管理', view: detailview, fitColumns: false,
			url: yhq.basePath+"/project/project_report/employeeTaskTimeReport.do?notInStatus=9999",
			idField: 'emp_id', fit: true, border: false, method: "post", singleSelect: true,
			remoteSort: false, toolbar: '#buttonbar', striped:true, pagination: true,pageSize: 20,pageList: [10,20,30,50],
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'emp_id', title: '工号', width: 60, sortable: true },
			    { field: 'emp_name', title: '姓名', width: 70, sortable: true }
			]],
			columns: [[
			    { field: 'dept_name', title: '部门', width: 80, sortable: true },
			    { field: 'totalTaskYear', title: '总月数', width: 80, sortable: true, formatter: function(value, row){
			    	return "<div style='float:left'>"+value+"</div><div style='float:right'>月</div>" ;
			    } },
			    { field: 'totalTaskTime', title: '总天数', width: 80, sortable: true, formatter: function(value, row){
			    	return "<div style='float:left'>"+value+"</div><div style='float:right'>天</div>" ;
			    } },
			    { field: 'totalHour', title: '加班小时', width: 100, sortable: true, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>小时</div>" ;
			    	}
			    } },
			    { field: 'month1', title: '一月', width: 60, sortable: true, formatter: function(value, row){return infosUtil.numberf(value, 2);} },
			    { field: 'month2', title: '二月', width: 60, sortable: true, formatter: function(value, row){return infosUtil.numberf(value, 2);} },
			    { field: 'month3', title: '三月', width: 60, sortable: true, formatter: function(value, row){return infosUtil.numberf(value, 2);} },
			    { field: 'month4', title: '四月', width: 60, sortable: true, formatter: function(value, row){return infosUtil.numberf(value, 2);} },
			    { field: 'month5', title: '五月', width: 60, sortable: true, formatter: function(value, row){return infosUtil.numberf(value, 2);} },
			    { field: 'month6', title: '六月', width: 60, sortable: true, formatter: function(value, row){return infosUtil.numberf(value, 2);} },
			    { field: 'month7', title: '七月', width: 60, sortable: true, formatter: function(value, row){return infosUtil.numberf(value, 2);} },
			    { field: 'month8', title: '八月', width: 60, sortable: true, formatter: function(value, row){return infosUtil.numberf(value, 2);} },
			    { field: 'month9', title: '九月', width: 60, sortable: true, formatter: function(value, row){return infosUtil.numberf(value, 2);} },
			    { field: 'month10', title: '十月', width: 60, sortable: true, formatter: function(value, row){return infosUtil.numberf(value, 2);} },
			    { field: 'month11', title: '十一月', width: 60, sortable: true, formatter: function(value, row){return infosUtil.numberf(value, 2);} },
			    { field: 'month12', title: '十二月', width: 60, sortable: true, formatter: function(value, row){return infosUtil.numberf(value, 2);} }
			]],
			detailFormatter:function(index,row){
			 	return '<div class="ddv" style="padding:5px 0"></div>';
		 	},
		 	onExpandRow: function(index,row){
			 	var ddv = $(this).datagrid('getRowDetail',index).find('div.ddv');
			 	ddv.datagrid({
				url:yhq.basePath+"/project/project_report/getMemberInfoList.do?emp_id="+row.emp_id,
				singleSelect:true,
				fitColumns: true,
				rownumbers:true,
				height:'auto',
				columns:[[
					{ field: 'project_name', title: '项目名称', width: 200, sortable: true },
					{ field: 'position_sname', title: '公司岗位', width: 80, sortable: true },
					{ field: 'project_role', title: '担任角色', width: 80, sortable: true, formatter: function(value,row){
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
					{ field: 'sd', title: '开始时间', width: 80, sortable: true },
				    { field: 'ed', title: '结束时间', width: 80, sortable: true }, 
				    { field: 'totalTaskTime', title: '天数', width: 80, sortable: true },
				    { field: 'mm', title: '人月', width: 80, sortable: true, formatter: function(value,row){
				    	return infosUtil.numberf(value, 2) ;
				    }},
				    { field: 'expendDays', title: '已消耗天数', width: 80, sortable: true},
				    { field: 'expendMM', title: '已消耗人月', width: 80, sortable: true, formatter: function(value,row){
				    	return value ;
				    }},
				    { field: 'totalHour', title: '加班小时', width: 100, sortable: true, formatter: function(value, row){
				    	if(undefined != value) {
					    	return "<div style='float:left'>"+value+"</div><div style='float:right'>小时</div>" ;
				    	}
				    } },
				    { field: 'status', title: '状态', width: 80, sortable: true, formatter: function(value,row){
				    	if(value == 1) {return "<font color='green'>在项目中</font>";} else if(value == 4) {return "<font color='red'>已退出项目</font>";} 
				    }}
				]],
				onResize:function(){
					dataGrid.datagrid('fixDetailRowHeight',index);
				},
				onLoadSuccess:function(){
					//parent.$("#mainLayout").layout("collapse", "east");
					setTimeout(function(){
						dataGrid.datagrid('fixDetailRowHeight',index);
					},0);
				}
		 	});
 				dataGrid.datagrid('fixDetailRowHeight',index);
		 	},
		 	onDblClickRow : function(rowIndex, rowData) {
		 		getMemberInfoList(rowData.emp_id, rowData.emp_name) ;
		 	},
			enableHeaderClickMenu: true,        //此属性开启表头列名称右侧那个箭头形状的鼠标左键点击菜单
	        enableHeaderContextMenu: true,      //此属性开启表头列名称右键点击菜单
	        selectOnRowContextMenu: false,      //此属性开启当右键点击行时自动选择该行的功能
	        pagingMenu: { submenu: false }     	//开启行右键菜单的翻页功能，此属性可丰富配置，详情见 API 文档
	    });
		s1 = $("#select1").combotree({
			url : yhq.basePath+"/sysmgr/org/treegrid.do",
			width:157, idFiled:'pid', textFiled:'fullname', editable: false,
			lines:true, autoShowPanel: true,
			onSelect:function(node){
				if("D" == node.type) {
					dataGrid.datagrid("load",{"dept_id": node.id});
				}
			}
	    });
	});
	
	function getMemberInfoList(id,name) {
		var dialog = $.easyui.showDialog({
            title: "员工稼动率详细列表&nbsp;&nbsp;[<font color='red'>"+name+"</font>]",
            href: yhq.basePath+"/project/project_report/getMemberInfoListDialog.do?id="+id,
            iniframe: true, width: 1000, height: 600, topMost: true,  maximizable: true, autoRestore: true,
            enableApplyButton: false, enableSaveButton: false, enableCloseButton: true, saveButtonIconCls: "ext_cancel",
            onSave: function() {
            	return $.easyui.parent.submitForm(dialog, dataGrid);
            }
        });
	}
</script>

</head>

<body style="padding: 0px; margin: 0px;">
	<div class="easyui-layout" data-options="fit: true">
		<div data-options="region: 'center', border: false" style="overflow: hidden;">
			<div id="d1">
				<div id="buttonbar">
                    <a onclick="dataGrid.datagrid('reload');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_reload'">刷新</a>
					部门：<input id="select1" name="pid" />
                    <a onclick="dataGrid.datagrid('load',{});s1.combotree('setValue','')" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_cancel'">取消筛选</a>
                </div>
			</div>
		</div>
	</div>	
</body>
</html>