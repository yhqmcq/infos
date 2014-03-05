<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>项目开发人员起止日期提醒</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>
<style type="text/css">
	dt{margin:0px;padding:0px;}
	dd{margin:0px;padding:0px;}
	table{border-spacing: 0px;border-collapse: 0px;}
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
		background: url("logo.gif") no-repeat;
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
		height:30px;
		line-height: 30px;
	}
</style>
</head>

<body style="padding: 0px; margin: 0px;">
    
    <div id="main">
    	<div class="header">
    		<div class="logo"></div>
    		<div class="title">项目开发人员起止日期提醒</div>
    	</div>
    	
    	<div class="content">
    		<table>
    			<tr>
    				<th width="140">项目名称：</th>
    				<td>广州华智CMS内容管理系统</td>
    				<th width="140">项目代号：</th>
    				<td>广州华智CMS内容管理系统</td>
    			</tr>
    			<tr>
    				<th>开始日期：</th>
    				<td>广州华智CMS内容管理系统</td>
    				<th>结束日期：</th>
    				<td>广州华智CMS内容管理系统</td>
    			</tr>
    			<tr>
    				<th>项目类型：</th>
    				<td>广州华智CMS内容管理系统</td>
    				<th>团队名称：</th>
    				<td>广州华智CMS内容管理系统</td>
    			</tr>
    			<tr>
    				<th>所属部门：</th>
    				<td>广州华智CMS内容管理系统</td>
    				<th>项目负责人：</th>
    				<td>广州华智CMS内容管理系统</td>
    			</tr>
    			<tr>
    				<th>项目参与人员：</th>
    				<td height="100">
    					<dl>
							<dt>张三</dt>
							<dt>李四</dt>
							<dt>王八</dt>
							<dt>老六</dt>
							<dd>4（人） </dd>
						</dl>
    				</td>
    				<th colspan="2" style="padding:0px;">
    					<table width="100%" height="100%">
    						<tr>
    							<th width="140">两天后到期人员：</th>
    							<td style="font-weight: normal;">
    								<dl>
										<dt>张三</dt>
										<dt>李四</dt>
										<dt>王八</dt>
										<dt>老六</dt>
										<dd>4（人） </dd>
									</dl>
    							</td>
    						</tr>
    						<tr>
    							<th>开发人员：</th>
    							<td style="font-weight: normal;">
    								<dl>
										<dt>张三</dt>
										<dt>李四</dt>
										<dt>王八</dt>
										<dt>老六</dt>
										<dd>4（人） </dd>
									</dl>
    							</td>
    						</tr>
    					</table>
    				</th>
    			</tr>
    			<tr>
    				<th>项目目标：</th>
    				<td colspan="3">广州华智CMS内容管理系统</td>
    			</tr>
    			<tr>
    				<th>项目描述：</th>
    				<td colspan="3">广州华智CMS内容管理系统</td> 
    			</tr>
    		</table>
    	</div>
    	
    	<div class="footer">
    		广州华智科技有限公司&copy;品质保证部&nbsp;&nbsp;&nbsp;&nbsp;系统日期：2014-05-14
    	</div>
    	
    </div>
	
</body>
</html>