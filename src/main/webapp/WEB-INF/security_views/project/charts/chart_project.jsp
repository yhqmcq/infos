<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>EasyUI Administrator</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<%-- 引入Highcharts --%>
<script src="<%=basePath%>/js/plugins/Highcharts-3.0.9/js/highcharts.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>/js/plugins/Highcharts-3.0.9/js/modules/exporting.js" type="text/javascript" charset="utf-8"></script>
<%-- 引入Highcharts扩展 --%>
<script src="<%=basePath%>/js/plugins/Highcharts-3.0.9/ExtHighcharts.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
$(function () {
	$('#container').highcharts({
	 	series: [{
	 		name: '进行中',
	 		data : []
	 	},{
	 		name: '已关闭',
	 		data : []
	 	}],
	 	colors: ["#55BF3B", "#DF5353"], 
       	xAxis: {
              categories: [ '一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月' ]
        },
        chart: { 
        	backgroundColor: {
    			linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
    			stops: [
    				[0, 'rgb(255, 255, 255)'],
    				[1, 'rgb(240, 240, 255)']
    			]
    		},
    		borderWidth: 2,
    		plotBackgroundColor: 'rgba(255, 255, 255, .9)',
    		plotShadow: true,
    		plotBorderWidth: 1
        	//type: 'column'
        },
        title: { text: '项目状态统计' },
        yAxis: {
            allowDecimals: false,
            title: { text: '单位(个)' }
        },
        tooltip: {
            formatter: function() {
            	return '<b>'+this.series.name+'项目</b><br/>数量【'+this.y+'】';
            }
        }
    });
	
	$.post(yhq.basePath+"/project/project_charts/doNotNeedSession_chart_projectST.do", null, function(result) {
		var j = $.parseJSON(result) ;
		var chart = $('#container').highcharts();
		chart.series[0].setData(j[0].data);
		chart.series[1].setData(j[1].data);
	}, 'json');
});
</script>

</head>

<body style="padding: 0px; margin: 0px;">
	<div id="container" style="min-width: 310px; height: 270px; margin: 0 auto"></div>
</body>
</html>