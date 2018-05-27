<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$().ready(function(){

	var head = document.getElementsByTagName('head')[0];
    var link = document.createElement('link');
    link.type='text/css';
    link.rel = 'stylesheet';
    link.href = 'css/app.css';
    head.appendChild(link);
});

</script>

<script src="/js/jquery.min.js"></script>

<script src="/js/echarts.min.js" type="text/javascript"></script>
<script src="/js/app.js" type="text/javascript"></script>

<div class="tpl-portlet-components">
	
	
	<div class="tpl-portlet-title">
		<div class="tpl-caption font-green ">
			<i class="pe-7s-cloud-download"></i> <span> Cloud 数据统计</span>
		</div>
	</div>
	
	
	<div class="tpl-block">
		<!--此部分数据请在 js文件夹下中的 app.js 中的 “百度图表A” 处修改数据 插件使用的是 百度echarts-->
		
		<div class="portlet-title">
			<div class="caption font-green">
				<span class="pe-7s-paperclip"></span> 自行车库存数据图
			</div>
		</div>
		<div class="tpl-echarts tpl-chart-mb" id="tpl-echarts-C"></div>
		
		<div class="portlet-title">
			<div class="caption font-green">
				<span class="pe-7s-medal"></span> 热卖型号上周出库数据图
			</div>
		</div>
		<div class="tpl-echarts tpl-chart-mb" id="tpl-echarts-A"></div>
		
		
		<div class="portlet-title">
			<div class="caption font-green bold">
				<span class="am-icon-code"></span> 雷达图
			</div>
		</div>
		<div class="tpl-echarts tpl-chart-mb" id="tpl-echarts-B"></div>

		
	</div>

</div>
