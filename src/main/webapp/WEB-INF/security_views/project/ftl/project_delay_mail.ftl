<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>项目管理</title>
</head>

<body>
	
	你好：
	<#list projectMailList as pml>
		${pml.empname}
	</#list>

</body>

</html>
