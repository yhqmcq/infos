<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>EasyUI Administrator</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>
<script type="text/javascript">
	var editor ;
	$(function() {
		window.setTimeout(function(){
			//实例化编辑器
			editor = new UE.ui.Editor();
			editor.render('editor');
			
		},100);
	}) ;
</script>
</head>

<body style="padding: 0px; margin: 0px;">
    
    <textarea id="editor" name="description" style="height:300px;"></textarea>
	
</body>
</html>