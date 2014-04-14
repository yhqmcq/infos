<!DOCTYPE html>
<html>
<head>
<title>项目参数发送变更</title>
<meta charset="utf-8" />
<meta name="keywords" content="">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
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
		background: url("${context_path}/images/logo.gif") no-repeat;
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
    		<div class="title">项目参数发送变更</div>
    	</div>
    	
    	<div class="content">
    		<table>
    			<tr>
    				<th width="140">项目编号：</th>
    				<td width="320">${project.projectNum}</td>
    				<th width="140">案件编号：</th>
    				<td width="320">${project.contractNum}</td>
    			</tr>
    			<tr>
    				<th width="140">项目名称：</th>
    				<td width="320">${project.name}</td>
    				<th width="140">项目系数：</th>
    				<td width="320">${project.quot}</td>
    			</tr>
    			<tr>
    				<th>起始日期：</th>
    				<td>${project.startDate?string("yyyy-MM-dd")}</td>
    				<th>截止日期：</th>
    				<td>${project.endDate?string("yyyy-MM-dd")}</td>
    			</tr>
    			<tr>
    				<th>项目类型：</th>
    				<td>${project.project_type}</td>
    				<th>合同受注状况：</th>
    				<td>
    					<#if project.shouzhu == 0>
    						未受注
    					<#elseif project.shouzhu == 1>
    						已受注
    					<#else>
    						未知
    					</#if>
    				</td>
    			</tr>
    			<tr>
    				<th>所属部门：</th>
    				<td>${project.deptname}</td>
    				<th>项目负责人：</th>
    				<td>${project.leader_name}</td>
    			</tr>
    			<tr>
    				<th>作业范围：</th>
    				<td>${project.taskScope}</td>
    				<th>项目规模：</th>
    				<td>${project.project_gm} Ks</td>
    			</tr>
    			<tr>
    				<th>顾客返回BUG率目标：</th>
    				<td>${project.project_buglv}&nbsp;</td>
    				<th>报价总人月：</th>
    				<td>${project.project_bjzry}</td>
    			</tr>
    			<tr>
    				<th>预计投入总人月数：</th>
    				<td>${project.project_yjtrzry}</td>
    				<th>报价生产性：</th>
    				<td>${project.project_bjscx}&nbsp;Ks/人月</td>
    			</tr>
    			<tr>
    				<th>初始粗利润率：</th>
    				<td>${project.project_clrl}&nbsp;%</td>
    				<th>预定生产性：</th>
    				<td>${project.project_ydscx}&nbsp;Ks/人月</td>
    			</tr>
    			<tr>
    				<th>项目状态：</th>
    				<td>
    					<#if project.status == 0>
    						<font color='blue'>未开始</font>
    					<#elseif project.status == 1>
    						<font color='green'>进行中</font>
    					<#elseif project.status == 2>
    						<font color='orange'>已挂起</font>
    					<#else>
    						<font color='red'>已结束</font>
    					</#if>
    				</td>
    				<th>项目创建者：</th>
    				<td>${project.createrName}</td>
    			</tr>
    			<tr>
    				<th width="140px">项目参与人员：</th>
    				<td class="devlist">
    					<ul>
							<#list projectmails as c>
								<li>${c.empname}</li>
								<#if !c_has_next >
	    							<li>${projectmails?size}（人） </li>
	    						</#if>
							</#list>
							<#if (projectmails?size lt 1) >
								<li>项目暂无参与人员</li>
							</#if>
						</ul>
    				</td>
    				<th colspan="2" style="padding:0px;">
    					<table width="100%" height="100%">
    						<tr>
    							<th width="140">开发人员：</th>
    							<td class="devlist">
    								<ul>
    									<#list currentMembers as c>
    										<li><div class="lname">${c.truename}</div><div class="ltime">${c.startDate?string("yyyy-MM-dd")} - ${c.endDate?string("yyyy-MM-dd")}</div></li>
			    							<#if !c_has_next >
				    							<li>${currentMembers?size}（人） </li>
				    						</#if>
			    						</#list>
			    						<#if (currentMembers?size lt 1) >
			    							<li>目前暂无开发人员</li>
			    						</#if>
    								</ul>
    							</td>
    						</tr>
    					</table>
    				</th>
    			</tr>
    		</table>
    	</div>
    	
    	<div class="footer">
    		<div class="zy">
    			如无法正常显示，请猛砸<a href="${reportURL}">&nbsp;这里&nbsp;</a>（仅华智内部使用）
    		</div>
    		<div>
	    		<ul>
	    			<li>广州华智科技有限公司&copy;品质保证部</li>
	    			<li>打印日期：${currentdate?string("yyyy-MM-dd")}</li>
	    		</ul>
    		</div>
    	</div>
    	
    </div>
	
</body>
</html>
