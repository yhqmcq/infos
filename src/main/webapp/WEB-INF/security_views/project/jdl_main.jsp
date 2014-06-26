<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>部门稼动率</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<script type="text/javascript">
	var dataGrid ;
	var s1 ;
	$(function() {
		dataGrid = $("#d1").datagrid({
			title: '部门稼动率', fitColumns: false, //view: detailview,
			url: yhq.basePath+"/project/jdl/employeeTaskTimeReport.do?notInStatus=9999", rownumbers :true,
			idField: 'emp_id', fit: true, border: false, method: "post",showFooter: true, singleSelect: true,
			remoteSort: false, toolbar: '#buttonbar', striped:true, pagination: true,pageSize: 200,pageList: [10,20,30,50,100,200,500],
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'emp_id', title: '工号', width: 60 },
			    { field: 'emp_name', title: '姓名', width: 70 }
			]],
			columns: [[
			    { field: 'dept_name', title: '部门', width: 80, sortable: true },
			    { field: 'totalTaskTime', title: '总天数', width: 80, formatter: function(value, row){
			    	if(undefined == value) {
			    		return "" ;
			    	} else if(value=="汇总"){
			    		return "汇总：" ;
			    	} else {
				    	return "<div style='float:left'>"+value+"</div><div style='float:right'>天</div>" ;
			    	}
			    } },
			    { field: 'month1', title: '一月', width: 60, formatter: function(value, row){
			    	return pad(value+"") ;
 			    } },
			    { field: 'month2', title: '二月', width: 60, formatter: function(value, row){
			    	return pad(value+"") ;
 			    } },
			    { field: 'month3', title: '三月', width: 60, formatter: function(value, row){
			    	return pad(value+"") ;
 			    } },
			    { field: 'month4', title: '四月', width: 60, formatter: function(value, row){
			    	return pad(value+"") ;
 			    } },
			    { field: 'month5', title: '五月', width: 60, formatter: function(value, row){
			    	return pad(value+"") ;
 			    } },
			    { field: 'month6', title: '六月', width: 60, formatter: function(value, row){
			    	return pad(value+"") ;
 			    } },
			    { field: 'month7', title: '七月', width: 60, formatter: function(value, row){
			    	return pad(value+"") ;
 			    } },
			    { field: 'month8', title: '八月', width: 60, formatter: function(value, row){
			    	return pad(value+"") ;
 			    } },
			    { field: 'month9', title: '九月', width: 60, formatter: function(value, row){
			    	return pad(value+"") ;
 			    } },
			    { field: 'month10', title: '十月', width: 60, formatter: function(value, row){
			    	return pad(value+"") ;
 			    } },
			    { field: 'month11', title: '十一月', width: 60, formatter: function(value, row){
			    	return pad(value+"") ;
 			    } },
			    { field: 'month12', title: '十二月', width: 60, formatter: function(value, row){
			    	return pad(value+"") ;
 			    } },
			    
			    
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
			//url : yhq.basePath+"/sysmgr/org/treegrid.do",
			width:250, idFiled:'pid', textFiled:'sname', editable: false,
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
        
        //如果是本部长将显示该部门下的所以部门
        if("${_LOGIN_EMP_KEY.emp.isLeader}" == "YY") {
        	s1.combotree("reload", yhq.basePath+"/sysmgr/org/treegrid.do?id=${_LOGIN_EMP_KEY.emp.orgid}") ;
        } else {
        	s1.combotree("reload", yhq.basePath+"/sysmgr/org/treegrid.do") ;
        	//如果是部长或个人的级别进行查询，将不可以进行部门或工号查询
	    	$("#jl_bar").hide() ;
        }
	});
	
	
	function getMemberInfoList(id,name) {
		var dialog = $.easyui.showDialog({
            title: "员工稼动率详细列表&nbsp;&nbsp;[<font color='red'>"+name+"</font>]",
            href: yhq.basePath+"/project/jdl/getMemberInfoListDialog.do?id="+id,
            iniframe: true, width: 1000, height: 600, topMost: true, maximizable: true, autoRestore: true,
            enableApplyButton: false, enableSaveButton: false, enableCloseButton: true, saveButtonIconCls: "ext_cancel",
            onSave: function() {
            	return $.easyui.parent.submitForm(dialog, dataGrid);
            }
        });
	}
	
	function leader() { 
		$("#d1").datagrid({
			url:yhq.basePath+"/project/jdl/employeeTaskTimeReport_leader.do?notInStatus=9999"+("${ViewType}" != ""?"&viewType=Y":""),
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
	
	function groupReport() {
		$.easyui.showDialog({
            title: "多部门汇总",modal: false,
            href: yhq.basePath+"/project/jdl/jdl_group_page.do",
            iniframe: true, width: 1120, height: 600, topMost: true, maximizable: true, autoRestore: true,
            enableApplyButton: false, enableSaveButton: false, enableCloseButton: true, saveButtonIconCls: "ext_cancel"
        });
	}
	
	function pad(num) {
		if(num.indexOf(".") != -1) {
			var s = num.substring(num.indexOf(".")+1).length ;
			if(s==1) {
				return num+"0" ;
			} else {
				return num ;
			}
		} else {
			return num ;
		}
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
                    <a onclick="groupReport()" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-standard-user-suit'">多部门汇总</a>
                    <span id="jl_bar">
					部门：<input id="select1" name="pid" />
                    <input id="topSearchbox" class="easyui-searchbox" data-options="width: 200, height: 26, prompt: '请输入您要查找的内容关键词', menu: '#topSearchboxMenu'" />
                    <div id="topSearchboxMenu" style="width: 85px;"> 
                        <div data-options="name:'emp_id', iconCls: 'icon-hamburg-zoom'">工号查询</div>
                    </div>
                    <a onclick="dataGrid.datagrid('load',{});s1.combotree('setValue','');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_cancel'">取消筛选</a>
                    </span>
                </div>
			</div>
		</div>
	</div>	
</body>
</html>