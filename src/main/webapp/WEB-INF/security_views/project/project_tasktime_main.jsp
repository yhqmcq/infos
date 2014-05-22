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
			title: '人员稼动率管理', fitColumns: false, //view: detailview,
			url: yhq.basePath+"/project/project_report/employeeTaskTimeReport.do?notInStatus=9999",
			idField: 'emp_id', fit: true, border: false, method: "post",showFooter: false, singleSelect: true,
			remoteSort: false, toolbar: '#buttonbar', striped:true, pagination: true,pageSize: 20,pageList: [10,20,30,50],
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'emp_id', title: '工号', width: 60 },
			    { field: 'emp_name', title: '姓名', width: 70 }
			]],
			columns: [[
			    { field: 'dept_name', title: '部门', width: 80, sortable: true },
			    /* { field: 'totalTaskYear', title: '总月数', width: 80, formatter: function(value, row){
			    	if(undefined == value) {
			    		return "" ;
			    	}else {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>月</div>" ;
			    	}
			    } }, */
			    { field: 'totalTaskTime', title: '总天数', width: 80, formatter: function(value, row){
			    	if(undefined == value) {
			    		return "" ;
			    	} else if(value=="汇总"){
			    		return "汇总：" ;
			    	} else {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>天</div>" ;
			    	}
			    } },
			    /*
			    { field: 'normalHour', title: '平时加班', width: 100, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>小时</div>" ;
			    	}
			    } },
			    { field: 'weekendHour', title: '周末加班', width: 100, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>小时</div>" ;
			    	}
			    } },
			    { field: 'holidaysHour', title: '节假日加班', width: 100, formatter: function(value, row){
			    	if(undefined != value) {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>小时</div>" ;
			    	}
			    } },
			    */
			    { field: 'month1', title: '一月', width: 60 },
			    { field: 'month2', title: '二月', width: 60 },
			    { field: 'month3', title: '三月', width: 60 },
			    { field: 'month4', title: '四月', width: 60 },
			    { field: 'month5', title: '五月', width: 60 },
			    { field: 'month6', title: '六月', width: 60 },
			    { field: 'month7', title: '七月', width: 60 },
			    { field: 'month8', title: '八月', width: 60 },
			    { field: 'month9', title: '九月', width: 60 },
			    { field: 'month10', title: '十月', width: 60 },
			    { field: 'month11', title: '十一月', width: 60 },
			    { field: 'month12', title: '十二月', width: 60 },
			    { field: 'dbmType', title: '到部门类型', width: 100, formatter:function(value,row){
			    	if(value != undefined) {
				    	if(value == "1"){return "新增";}else if(value == "2"){return "转入";}else if(value == "3"){return "在职";}else if(value == "4"){return "试用";}else if(value == "5"){return "停薪留职返回";}else if(value == "6"){return "返聘";}
			    	} else {return "" ;}  
			    }},
			    { field: 'dbmDate', title: '到部门日期', width: 100, formatter:function(value,row){
			    	return infosUtil.str2date(value).format("YYYY-MM-dd") ;
			    }},
			    { field: 'lbmType', title: '离部门类型', width: 110, formatter:function(value,row){
			    	if(value != undefined) {
				    	if(value == "1"){return "转出（到开发部）";}else if(value == "2"){return "转出（到非开发部）";}else if(value == "3"){return "<font color='red'>离职</font>";}else if(value == "4"){return "停薪留职";}
			    	} else {return "" ;}  
			    }},
			    { field: 'lbmDate', title: '离部门日期', width: 100, formatter:function(value,row){
			    	return infosUtil.str2date(value).format("YYYY-MM-dd") ;
			    }}
			]],
		 	onLoadSuccess: function(data) {
		        $.fn.datagrid.extensions.onLoadSuccess.apply(this, arguments);  //这句一定要加上。
		        
		        $(dataGrid.datagrid('getColumnDom',"month"+(new Date().getMonth()+1))).css("background","#55BF3B");
		        
		        for(var i=1;i<=(new Date().getMonth()+1)-1;i++){
			        $(dataGrid.datagrid('getColumnDom',"month"+i)).css("background","#ddd");
		        }
		        for(var i=(new Date().getMonth()+1)+1;i<=12;i++){
			        $(dataGrid.datagrid('getColumnDom',"month"+i)).css("background","#DF5353");
		        }
		        
		        if(data.rows.length < 1) {
		        	$.messager.alert("你如果已获得授权！<br><br>可以点击【总裁专用】按钮试试。"); 
		        }
		    },
		 	onDblClickRow : function(rowIndex, rowData) { getMemberInfoList(rowData.emp_id, rowData.emp_name) ; },
			enableHeaderClickMenu: true, enableHeaderContextMenu: true, selectOnRowContextMenu: false, pagingMenu: { submenu: false }     	
	    });
		s1 = $("#select1").combotree({
			url : yhq.basePath+"/sysmgr/org/treegrid.do",
			width:157, idFiled:'pid', textFiled:'sname', editable: false,
			lines:true, autoShowPanel: true,
			onSelect:function(node){
				if("D" == node.type) {
					dataGrid.datagrid("load",{"dept_id": node.id});
				}
			}
	    });
	    
		var searchOpts = $("#topSearchbox").searchbox("options"), searcher = searchOpts.searcher;
        searchOpts.searcher = function (value, name) {
            if ($.isFunction(searcher)) { searcher.apply(this, arguments); }
            var o = {} ;
            o[name] = value ;
            dataGrid.datagrid("load",o);
        };
        //如果是部长或个人的级别进行查询，将不可以进行部门或工号查询
    	$("#jl_bar").hide() ;
	});
	
	
	function getMemberInfoList(id,name) {
		var dialog = $.easyui.showDialog({
            title: "员工稼动率详细列表&nbsp;&nbsp;[<font color='red'>"+name+"</font>]",
            href: yhq.basePath+"/project/project_report/getMemberInfoListDialog.do?id="+id,
            iniframe: true, width: 1000, height: 600, topMost: true, maximizable: true, autoRestore: true,
            enableApplyButton: false, enableSaveButton: false, enableCloseButton: true, saveButtonIconCls: "ext_cancel",
            onSave: function() {
            	return $.easyui.parent.submitForm(dialog, dataGrid);
            }
        });
	}
	
	function leader() {
		$("#d1").datagrid({
			url:yhq.basePath+"/project/project_report/employeeTaskTimeReport_leader.do?notInStatus=9999"+("${ViewType}" != ""?"&viewType=Y":""),
			onLoadSuccess: function(data) {
		        $.fn.datagrid.extensions.onLoadSuccess.apply(this, arguments);  //这句一定要加上。
				$("#jl_bar").show();
				$(dataGrid.datagrid('getColumnDom',"month"+(new Date().getMonth()+1))).css("background","#55BF3B");
		        
		        for(var i=1;i<=(new Date().getMonth()+1)-1;i++){
			        $(dataGrid.datagrid('getColumnDom',"month"+i)).css("background","#ddd");
		        }
		        for(var i=(new Date().getMonth()+1)+1;i<=12;i++){
			        $(dataGrid.datagrid('getColumnDom',"month"+i)).css("background","#DF5353");
		        }
			},
			onLoadError: function() {
				alertify.error("您的权限不足！") ;
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
                    <a onclick="leader()" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-standard-user-suit'">总裁专用</a>
                    <span id="jl_bar">
					部门：<input id="select1" name="pid" />
                    <input id="topSearchbox" class="easyui-searchbox" data-options="width: 280, height: 26, prompt: '请输入您要查找的内容关键词', menu: '#topSearchboxMenu'" />
                    <div id="topSearchboxMenu" style="width: 85px;"> 
                        <div data-options="name:'emp_id', iconCls: 'icon-hamburg-zoom'">工号查询</div>
                        <div data-options="name:'truename', iconCls: 'icon-hamburg-zoom'">姓名查询</div>
                        <div data-options="name:'email', iconCls: 'icon-hamburg-zoom'">邮件查询</div>
                    </div>
                    <a onclick="dataGrid.datagrid('load',{});s1.combotree('setValue','');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_cancel'">取消筛选</a>
                    </span>
                </div>
			</div>
		</div>
	</div>	
</body>
</html>