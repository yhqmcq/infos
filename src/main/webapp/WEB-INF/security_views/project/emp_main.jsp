<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>员工管理</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<script type="text/javascript">
	var dataGrid ;
	var s1 ;
	$(function() {
		dataGrid = $("#d1").datagrid({
			title: '员工管理',
			url: yhq.basePath+"/sysmgr/employee/datagrid.do?notInStatus=9999",
			idField: 'id', fit: true, border: false, method: "post", singleSelect: true, rownumbers: true,
			remoteSort: false, toolbar: '#buttonbar', striped:true, pagination: true,pageSize: 20,pageList: [10,20,30,50],
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'id', title: '工号', width: 60, sortable: true },
			    { field: 'truename', title: '姓名', width: 120, sortable: true, formatter:function(value,row){
			    	if(row.isLeader == "Y") {
			    		return "<font color='red'>"+value+"</font>";
			    	} else {
			    		return value;
			    	}
			    }},
			]],
			columns: [[
				{ field: 'sex', title: '性别', width:55, sortable: true},
				{ field: 'email', title: '邮箱地址', width: 180, sortable: true },
				{ field: 'orgname', title: '公司部门', width: 100, sortable: true },
				{ field: 'position_sname', title: '公司岗位', width: 80, sortable: true, formatter:function(value,row){
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
		        dataGrid.datagrid('clearSelections');dataGrid.datagrid('clearChecked');
		    },
			enableHeaderClickMenu: true,        //此属性开启表头列名称右侧那个箭头形状的鼠标左键点击菜单
	        enableHeaderContextMenu: true,      //此属性开启表头列名称右键点击菜单
	        selectOnRowContextMenu: false,      //此属性开启当右键点击行时自动选择该行的功能
	        pagingMenu: { submenu: false }     	//开启行右键菜单的翻页功能，此属性可丰富配置，详情见 API 文档
	    });
		s1 = $("#select1").combotree({
			url : yhq.basePath+"/sysmgr/org/treegrid.do",
			width:180, idFiled:'pid', textFiled:'fullname', editable: false,
			lines:true, autoShowPanel: true,
			onSelect:function(node){
				dataGrid.datagrid("load",{"orgid": node.id, "notInStatus": "9999"});
			}
	    });
		
		s2 = $("#select2").combobox({
			valueField: 'label', textField: 'value',
			data: [{ label: '1', value: '待机人员' },{ label: '3', value: '离职人员' },{ label: '2', value: '在项目人员' }],
			panelHeight:'auto', editable:false, autoShowPanel: true,
			onSelect: function(node) {
				var data = {} ;
				if(node.label == 1) { data["notInStatus"] = "9999,1,3" ; }
				if(node.label == 2) { data["notInStatus"] = "9999,0,3" ; }
				if(node.label == 3) { data["notInStatus"] = "9999,0,1" ; }
				dataGrid.datagrid("load",data);
			}
	    });
		
		var searchOpts = $("#topSearchbox").searchbox("options"), searcher = searchOpts.searcher;
        searchOpts.searcher = function (value, name) {
            if ($.isFunction(searcher)) { searcher.apply(this, arguments); }
            var o = {} ;
            o[name] = value ;
            console.info(o) ;
            dataGrid.datagrid("load",o);
        };
	});
	
</script>

</head>

<body style="padding: 0px; margin: 0px;">
	<div class="easyui-layout" data-options="fit: true">
		<div data-options="region: 'center', border: false" style="overflow: hidden;">
			<div id="d1">
				<div id="buttonbar">
                    <a onclick="dataGrid.datagrid('reload');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_reload'">刷新</a>
					状态：<input id="select2" name="state" /> 
					部门：<input id="select1" name="pid" /> 
					<input id="topSearchbox" class="easyui-searchbox" data-options="width: 250, height: 26, prompt: '请输入您要查找的内容关键词', menu: '#topSearchboxMenu'" />
                    <div id="topSearchboxMenu" style="width: 85px;">
                        <div data-options="name:'id', iconCls: 'icon-hamburg-zoom'">工号查询</div>
                        <div data-options="name:'truename', iconCls: 'icon-hamburg-zoom'">姓名查询</div>
                        <div data-options="name:'email', iconCls: 'icon-hamburg-zoom'">邮件查询</div>
                    </div>
                    <a onclick="dataGrid.datagrid('load',{});s1.combotree('setValue','')" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-standard-disconnect'">取消筛选</a>
                </div>
			</div>
		</div>
	</div>	
</body>
</html>