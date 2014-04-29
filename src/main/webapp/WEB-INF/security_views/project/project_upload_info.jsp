<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
var uploader ;
$(function() {
	uploader = new plupload.Uploader({
		runtimes : 'html5,flash,html4',
		flash_swf_url : '${pageContext.request.contextPath}/js/plugins/plupload-2.1.1/js/Moxie.swf',	//Flash支持
		url : '${pageContext.request.contextPath}/plupload?fileFolder=${upload_path}&parent=${isParent}&dateFolder=${isDateFolder}',
		browse_button : 'pickfiles', 
		container: 'container', 
		/*
		filters : {
			max_file_size : '10mb',
			mime_types: [
				{title : "Image files", extensions : "jpg,gif,png"},
				{title : "Zip files", extensions : "zip"}
			]
		},
		*/
		init: {
			PostInit: function() {},
			FilesAdded: function(up, files) {
				$("#filelist").empty();
				plupload.each(files, function(file, index) {
					var fl = '<tr id="' + file.id + '">'+
							 '<td style="width:40px;text-align:center;">'+(index+1)+'</td>'+
							 '<td style="padding-left:5px;">'+file.name+'</td>'+
							 '<td style="width:80px;text-align:center;">'+plupload.formatSize(file.size)+'</td>'+
							 '<td style="width:50px;text-align:center;"><b>0%</b></td>'+
							 '<td id="img_' + file.id + '" style="width:50px;text-align:center;border-right:1px solid #ddd;"></td>'+
							 '</tr>' ;
					$("#filelist").append(fl) ;
				});
				$("#pickfiles").linkbutton({ disabled: true });
				uploader.start();
			},
			FileUploaded: function(up, file, info) {
				var response = $.parseJSON(info.response);
				if (response.status) {
					$.easyui.loading({ msg: "正在导入数据，请稍等..." });
					$("#img_"+file.id).html('<img style="margin-top:4px;" src="${pageContext.request.contextPath}/js/plugins/easyui/icons/icon-ext/Check.png">');
					export_data(response.fileinfo) ;
					$("#pickfiles").linkbutton({ disabled: false });					
				} else {
					$('#filelist').append("<div>错误: " + response.msg+"</div>");
				}
			},
			UploadProgress: function(up, file) {
				$('#' + file.id + " b").html(file.percent + "%");
			},

			Error: function(up, err) {
				$('#filelist').append("<tr><td colspan='5'>错误: " + err.code + ", 消息: " + err.message + (err.file ? ", File: " + err.file.name : "") + "</td></tr>");
				up.refresh(); 
			}
		}
	});

	uploader.init();
});

function export_data(data) {
	$.post(yhq.basePath+"/project/project_main/import_project_info.do", {filepath:data.realPath+data.newName}, function(result) {
		if (result.status) {
			var _infolist = $("#infolist") ;
			_infolist.empty() ;
			
			$.each(result.obj, function(n,p) {
				_infolist.append("<span style='width:100px;display:block;float:left;'>"+p.id+"</span><span style='width:100px;display:block;float:left;'>"+p.truename+"</span><span style='width:100px;display:block;float:left;'>"+(p.status==true?"[<font color='green'>成功</font>]":"[<font color='red'>失败</font>]")+"</span><span style='width:200px;display:block;float:left;'>"+p.msg+"</span><br>") ;
			});
			
			$.easyui.loaded();
			$.easyui.messager.show({ icon: "info", msg: result.msg });
		} else {
			$.easyui.loaded();
			alertify.error(result.msg);
		}
	}, 'json').error(function() {
		$.easyui.loaded();
	});
}
</script>
<style>
#browse_div{
	width:100%;
	height:50px;
	background: #eee;
}
#browse_div .browse{
	height: 30px;
	float:left;
	margin: 12px 10px;
}
#browse_div .info{
	width:450px;
	height: 50px;
	float:left;
	line-height: 50px;
}
#infolist {
	width:100% ;
	height:305px;
	background: #999;
	overflow: scroll;
}
</style>

<div id="container">
	<div id="browse_div">
		<div class="browse">
			<a  id="pickfiles" class="easyui-linkbutton" data-options="plain: false, iconCls: 'ext_edit'">选择文件</a>
		</div>
		<div class="info" id="filelist">
			
		</div>
	</div>
</div>

<div id="infolist">
	
</div>































