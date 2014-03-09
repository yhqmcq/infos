<!DOCTYPE html>
<html>
<head>
<title>华智迷你OA系统-登录账号密码</title>
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
    		<div class="title">华智迷你OA系统的登录账号和密码</div>
    	</div>
    	
    	<div class="content">
    		你好：${name}，如下是你在华智迷你OA系统的登录账号和密码。 <br>
    		
    		登录账号：${account} <br>
    		登录密码：${password} <br>
    		
    	</div>
    	
    	<div class="footer">
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
