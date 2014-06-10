<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>项目状态统计</title>
<%@ include file="/common/base/meta.jsp"%>
<%@ include file="/common/base/script.jsp"%>

<%-- 引入Highcharts --%>
<script src="<%=basePath%>/js/plugins/Highcharts-3.0.9/js/highcharts.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>/js/plugins/Highcharts-3.0.9/js/modules/exporting.js" type="text/javascript" charset="utf-8"></script>
<%-- 引入Highcharts扩展 --%>
<script src="<%=basePath%>/js/plugins/Highcharts-3.0.9/ExtHighcharts.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
$(function () {
	/*
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
        	type: 'pie'
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
	*/
	$('#container').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: '华智项目状态统计'
        },
        tooltip: {
    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
        series: [{
            type: 'pie',
            name: '率',
            data: [] 
        }]
    });
	
	$.post(yhq.basePath+"/project/project_charts/doNotNeedSession_chart_projectST.do", null, function(result) {
		var j = $.parseJSON(result) ;
		var chart = $('#container').highcharts();
		chart.series[0].setData(j);
		$("#info").html("<font color='green'>进行中：</font>"+j[0].y+"个<br><font color='red'>已结束：</font>"+j[1].y+"个");
	}, 'json');
});
</script>

</head>

<body style="padding: 0px; margin: 0px;">
	<div id="container" style="position:relative;pomin-width: 310px; height: 270px; margin: 0 auto"></div>
	<div id="info" style="position:absolute;left:40px;top:150px;border:0px solid red;width:200px;display: block;"></div>
</body>
</html>