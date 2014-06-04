<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>部门稼动率（独立）</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<script type="text/javascript">
	var dg ;
	$(function() {
		dg = $("#t1").datagrid({
			title: '部门稼动率（独立）',
			method: "post",
			url: yhq.basePath+"/project/dept_jdl/datagrid.do",
			idField: 'id',
			treeField: 'fullname',
			fit: true,
			border: false,
			remoteSort: false,
			toolbar: '#buttonbar',
			striped:true,
			frozenColumns: [[
			    { field: 'ck', checkbox: true },
			    { field: 'id', title: 'ID(id)', width: 80, sortable: true }
			]],
			columns: [[
			    { field: 'type', title: '类型', width: 50, formatter:function(value,row){
			    	if(value == "O"){return "<font color='red'>公司</font>";}else{return "<font color='green'>部门</font>";}
			    }},
			    { field: 'fullname', title: '名称', width: 250, sortable: true },
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
			]],
			enableHeaderClickMenu: false, enableHeaderContextMenu: true, enableRowContextMenu: true,
		 	onLoadSuccess: function(data) {
		        $.fn.datagrid.extensions.onLoadSuccess.apply(this, arguments);  //这句一定要加上。
		        $(dg.datagrid('getColumnDom',"month"+(new Date().getMonth()+1))).css("background","#55BF3B");
		        for(var i=1;i<=(new Date().getMonth()+1)-1;i++){
			        $(dg.datagrid('getColumnDom',"month"+i)).css("background","#ddd");
		        }
		        for(var i=(new Date().getMonth()+1)+1;i<=12;i++){
			        $(dg.datagrid('getColumnDom',"month"+i)).css("background","#DF5353");
		        }
		    },
	    });
		
		var searchOpts = $("#topSearchbox").searchbox("options"), searcher = searchOpts.searcher;
        searchOpts.searcher = function (value, name) {
            if ($.isFunction(searcher)) { searcher.apply(this, arguments); }
            var o = {} ;
            o[name] = value ;
            dg.datagrid("load",o);
        };
	});
	
</script>

</head>

<body style="padding: 0px; margin: 0px;">
	<div class="easyui-layout" data-options="fit: true">
		<div data-options="region: 'center', border: false" style="overflow: hidden;">
			
			<div id="t1">
				<div id="buttonbar">
                    <a id="btn4" onclick="dg.datagrid('reload');" class="easyui-linkbutton" data-options="plain: true, iconCls: 'ext_reload'">刷新</a>
					<input id="topSearchbox" class="easyui-searchbox" data-options="width: 250, height: 26, prompt: '请输入您要查找的内容关键词', menu: '#topSearchboxMenu'" />
                    <div id="topSearchboxMenu" style="width: 85px;">
                        <div data-options="name:'fullname', iconCls: 'icon-hamburg-zoom'">部门全称</div>
                        <div data-options="name:'sname', iconCls: 'icon-hamburg-zoom'">部门简称</div>
                    </div>
                </div>
			</div>
			
		</div>
	</div>	
</body>
</html>