<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>项目开发人员起止日期提醒</title>
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
    				<td width="320">广州华智CMS内容管理系统</td>
    				<th width="140">项目代号：</th>
    				<td width="320">广州华智CMS内容管理系统</td>
    			</tr>
    			<tr>
    				<th>起始日期：</th>
    				<td>广州华智CMS内容管理系统</td>
    				<th>截止日期：</th>
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
    				<th width="140">项目参与人员：</th>
    				<td>
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
    							<th style="width:140px;">当天退出人员：</th>
    							<td class="devlist">
    								<ul>
    									<li><div class="lname">努尔哈赤</div><div class="ltime">2013-01-02 - 2013-01-02</div></li>
    									<li><div class="lname">努尔哈赤</div><div class="ltime">2013-01-02 - 2013-01-02</div></li>
    									<li><div class="lname">努尔哈赤</div><div class="ltime">2013-01-02 - 2013-01-02</div></li>
    									<li><div class="lname">努尔哈赤</div><div class="ltime">2013-01-02 - 2013-01-02</div></li>
    									<li>4（人）</li>
    								</ul>
    							</td>
    						</tr>
    						<tr>
    							<th width="140">即将到期人员：</th>
    							<td class="devlist">
    								<ul>
    									<li><div class="lname">努尔哈赤</div><div class="ltime">2013-01-02 - 2013-01-02</div></li>
    									<li><div class="lname">努尔哈赤</div><div class="ltime">2013-01-02 - 2013-01-02</div></li>
    									<li><div class="lname">努尔哈赤</div><div class="ltime">2013-01-02 - 2013-01-02</div></li>
    									<li><div class="lname">努尔哈赤</div><div class="ltime">2013-01-02 - 2013-01-02</div></li>
    									<li>4（人）</li>
    								</ul>
    							</td>
    						</tr>
    						<tr>
    							<th>目前开发人员：</th>
    							<td class="devlist">
    								<ul>
    									<li><div class="lname">努尔哈赤</div><div class="ltime">2013-01-02 - 2013-01-02</div></li>
    									<li><div class="lname">努尔哈赤</div><div class="ltime">2013-01-02 - 2013-01-02</div></li>
    									<li><div class="lname">努尔哈赤</div><div class="ltime">2013-01-02 - 2013-01-02</div></li>
    									<li><div class="lname">努尔哈赤</div><div class="ltime">2013-01-02 - 2013-01-02</div></li>
    									<li>4（人）</li>
    								</ul>
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
    		<div class="zy">
    			如无法正常显示，请猛砸<a href="">&nbsp;这里&nbsp;</a>（仅华智内部使用）
    		</div>
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