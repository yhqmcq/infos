<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>项目详细信息</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>
<style type="text/css">
	dt{margin:0px;padding:0px;display: table;}
	dd{margin:0px;padding:0px;display: table;}
	ul{list-style: none;margin:0px;padding:0px;} ul li{margin:0px;padding:0px;}
	table{border-spacing: 0px;border-collapse: 0px;}
	a{text-decoration: none; color: blue;}
	#main{
		width:980px;
		display: block; 
		margin:0 auto;
	}
	.header{
		height:100px;
		width:100%;
		border-bottom:5px solid red;
		position: relative;
	}
	.header .logo{
		position: absolute;
		left:10px;
		top:35px;
		width:180px;
		height:40px;
		background: url("<%=basePath%>/images/logo.gif") no-repeat;
	}
	.header .title{
		position: relative;
		top:25px;
		margin-left:auto;
		margin-right:auto;
		width:500px;
		height:60px;
		text-align:center ;
		font-size:30px;
		line-height:60px;
		font-weight:bold;
	}
	.content{
		padding: 10px 0px;
	}
	.content table{
		width:100%;
	}
	.content table th{
		text-align: left;
		padding:8px 5px;
	}
	.content table td{
		padding:0px;
		text-align: left;
		border-bottom:1px solid red;
	}
	.footer{
		margin-top:20px;
		border-top:2px solid red;
		text-align:right;
		width:100%;
		display:table;
		height:30px;
		line-height: 30px;
		position: relative;
	}
	.footer .zy{
		position: absolute;
		top:0px;
		left:0px;
		font-size: 12px;
		color:red;
	}
	.lname{
		width:100px;float:left;
	}
	.ltime{
		width:230px;
		*width:220px;
		float:left;text-align: right;
	}
	.devlist{
		width:321px;
		font-weight: normal;
	}
	.devlist ul {
		padding:8px 0px;
	}
</style>

<script type="text/javascript">
$(function() {
	detail() ;
});
function fmoney(s, n)   
{   
   n = n > 0 && n <= 20 ? n : 2;   
   s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";   
   var l = s.split(".")[0].split("").reverse(),   
   r = s.split(".")[1];   
   t = "";   
   for(var i = 0; i < l.length; i ++ )   
   {   
      t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");   
   }   
   return t.split("").reverse().join("") + "." + r;   
} 
function detail() {
	
	$.post(yhq.basePath+"/project/project_main/get_ProjectDetail.do", {id : "${id}"}, function(result) {
		if (result.status) {
			$("#project_name").html(result.name) ;
			$("#project_code").html(result.code) ;
			$("#startDate").html($.date.format($.string.toDate(result.startDate), "yyyy-MM-dd")) ;
			$("#endDate").html($.date.format($.string.toDate(result.endDate), "yyyy-MM-dd")) ;
			$("#team_name").html(result.team_name) ;
			$("#deptname").html(result.deptname) ;
			$("#leader_name").html(result.leader_name) ;
			$("#project_target").html(result.project_target) ;
			$("#project_desc").html(result.project_desc) ;
			
			if (result.project_type == 0) {
				$("#project_type").html("对日短期保守项目");
				} else if (result.project_type == 1) {
					$("#project_type").html("对日长期保守项目");
				} else if (result.project_type == 2) {
					$("#project_type").html("对日新规项目");
				} else if (result.project_type == 3) {
					$("#project_type").html("国内项目");
				} else {
					$("#project_type").html("公司内部项目");
				}
			}
		
			var dlt = $("#devlistTab") ;
			$.each(result.devMemList, function(i, p){
				var _tr = $("<tr>") ;
				
				var _t1 = $("<td>").html(p.emp_name) ;
				var _t2 = $("<td>").html(p.dept_name) ;
				var _t3 = $("<td>").html($.date.format($.string.toDate(p.startDate), "yyyy-MM-dd")) ;
				var _t4 = $("<td>").html($.date.format($.string.toDate(p.endDate), "yyyy-MM-dd")) ;
				var _t5 = $("<td>").html(p.totalTaskTime) ;
				var _t6 = $("<td>").html(p.expendDays) ;
				var _t7 = $("<td>").html(fmoney(p.expendMM,2)) ;
				
				_tr.append(_t1) ;
				_tr.append(_t2) ;
				_tr.append(_t3) ;
				_tr.append(_t4) ;
				_tr.append(_t5) ;
				_tr.append(_t6) ;
				_tr.append(_t7) ;
				
				dlt.append(_tr) ;
			});
			var _trfoot = $("<tr>") ;
			var _tfoot1 = $("<td>").html("") ;
			var _tfoot2 = $("<td>").html("") ;
			var _tfoot3 = $("<td>").html("") ;
			var _tfoot4 = $("<td>").html("") ;
			var _tfoot5 = $("<td>").html("总人月：") ;
			var _tfoot6 = $("<td>").html("总人月：") ;
			var _tfoot7 = $("<td>").html("总人月：") ;
			
			_trfoot.append(_tfoot1) ;
			_trfoot.append(_tfoot2) ;
			_trfoot.append(_tfoot3) ;
			_trfoot.append(_tfoot4) ;
			_trfoot.append(_tfoot5) ;
			_trfoot.append(_tfoot6) ;
			_trfoot.append(_tfoot7) ;
			dlt.append(_trfoot) ;
		
		}, 'json');

	}
</script>

</head>

<body style="padding: 0px; margin: 0px;">
    
    <div id="main">
    	<div class="header">
    		<div class="logo"></div>
    		<div class="title">项目详细信息</div>
    	</div>
    	
    	<div class="content">
    		<table>
    			<tr>
    				<th width="140">项目名称：</th>
    				<td width="320" id="project_name"></td>
    				<th width="140">项目代号：</th>
    				<td width="320" id="project_code"></td>
    			</tr>
    			<tr>
    				<th>起始日期：</th>
    				<td id="startDate"></td>
    				<th>截止日期：</th>
    				<td id="endDate"></td>
    			</tr>
    			<tr>
    				<th>项目类型：</th>
    				<td id="project_type"></td>
    				<th>团队名称：</th>
    				<td id="team_name"></td>
    			</tr>
    			<tr>
    				<th>所属部门：</th>
    				<td id="deptname"></td>
    				<th>项目负责人：</th>
    				<td id="leader_name"></td>
    			</tr>
    			<tr>
    				<th width="140">项目开发人员：</th>
    				<td colspan="4" style="border:0px;">
    					<table width="100%">
    						<thead> 
    							<tr>
    								<th>姓名</th>
    								<th>部门</th>
    								<th>开始日期</th>
    								<th>结束日期</th>
    								<th>总天数</th>
    								<th>已消耗天数</th>
    								<th>已消耗人月</th>
    							</tr>
    						</thead>
    						<tbody id="devlistTab">
    						</tbody>
    					</table>
    				</td>
    			</tr>
    			<tr>
    				<th>项目目标：</th>
    				<td colspan="3" id="project_target"></td>
    			</tr>
    			<tr>
    				<th>项目描述：</th>
    				<td colspan="3" id="project_desc"></td> 
    			</tr>
    		</table>
    	</div>
    	
    	<div class="footer">
    		<div>
	    		<ul>
	    			<li>广州华智科技有限公司&copy;品质保证部</li>
	    			<li>打印日期：2014-05-14</li>
	    		</ul>
    		</div>
    	</div>
    	
    </div>
</body>
</html>