<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>系统管理</title>
<link href="${ctx}/source/adminCss/mian.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/adminCss/dateSlider.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/adminCss/head_bottom.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/adminCss/backstage.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/source/scripts/common/jquery.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/common/jquery.ui.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/common/backstage.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/common/raphael.2.1.0.min.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/common/justgage.1.0.1.min.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/echarts/esl.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/echarts/echarts.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/adminJs/apiAnalysis.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/adminJs/DateSlider.js"></script>
<link href="${ctx}/source/images/chinatelecom.ico" rel="shortcut icon" />
<style type="text/css">
.clearfix:after {content: " "; display: block; clear: both; height: 0; visibility: hidden; line-height: 0;font-size:0; }
.clearfix{ zoom:1;}
.text{margin-bottom: 30px;}
.text span{display: inline-block; width: 23%; }
.text span, .text span i{font-size: 18px; color: #009393; font-weight: 700;}
.text span i{ font-style: normal; padding: 0 10px; }
#dateSlider{width:970px; height:40px; padding-top: 20px;}
.info-33{ float: left; width:33%; }
.info-50{ float: left; width:50%; }
.infos{ margin-top: 30px; }
.infos dt{padding: 10px 0; text-align: center; font-size: 24px}
.infos .cont{ padding: 5px 10px; min-height: 200px; overflow: scroll;  border: 1px solid #ccc; } 
.myCustomClass > span{ display: none; }
.ui-rangeSlider-label-value, .ui-ruler-tick-label{ font-size: 16px; }
</style>
 <script type="text/javascript">
   	var Months = ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"];
   	$(function(){
		createDemos();		
	});
	
	function createDemos(){		
		
		
		var	date1 = $("<div id='date' />").appendTo($("#dateSlider"));//渲染日期组件
		var dateSilderObj=date1.dateRangeSlider({
			arrows:false,//是否显示左右箭头
			bounds: {min: new Date(new Date().getFullYear(), 0, 1), max: new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 12, 59, 59)},//最大 最少日期
			defaultValues: {min: new Date(new Date().getFullYear(), 0, 1), max: new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate())},//默认选中区域
			scales:[{
					first: function(value){return value; },
					end: function(value) {return value; },
					next: function(val){
						var next = new Date(val);
						return new Date(next.setMonth(next.getMonth() + 1));
					 },
					label: function(val){
						return Months[val.getMonth()];
					},
					format: function(tickContainer, tickStart, tickEnd){
						tickContainer.addClass("myCustomClass");
					}
			}]
			
					
		});//日期控件
		
		//重新赋值（整个时间轴）
		/*dateSilderObj.dateRangeSlider("bounds", new Date(new Date().getFullYear(), 0, 1), new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 12, 59, 59));*/

		//重新赋值（选中区域）
		/*dateSilderObj.dateRangeSlider("values", new Date(new Date().getFullYear(), 0, 1), new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate()));*/

		
		//拖动完毕后的事件 获取到拖动后的起始时间stime 和 结束时间etime
		dateSilderObj.bind("valuesChanged", function(e, data){
			var val=data.values;
			var stime=val.min.getFullYear()+"-"+(val.min.getMonth()+1)+"-"+val.min.getDate();
			var etime=val.max.getFullYear()+"-"+(val.max.getMonth()+1)+"-"+val.max.getDate();
		  	console.log("起止时间："+stime+" 至 "+etime);
		  	//拖动后显示操作

			alert("dddd");
		  	setTimeout(function(){
		  		//8秒恢复默认选中区域
		  		dateSilderObj.dateRangeSlider("values", new Date(new Date().getFullYear(), 0, 1), new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate()));
		  	}, 5000)

		});

		
	}
	
   </script> 
</head>

<body>
<!--头部代码-->
<div class="head_bj b_head">
  <div class="head">
    <div class="logo"><img src="${ctx}/source/adminImages/b_logo2.jpg"/></div>
    <div class="list b_list">
      <ul>
      	<li><a href="${ctx}/adminUserManageUI.html" class="white">用户管理</a></li>
		<li><a href="${ctx}/adminchinas.html" target="_blank" class="white">安全态势</a></li>
        <li><a href="${ctx}/adminServUI.html" class="white">服务管理</a></li>
        <li><a href="${ctx}/adminDataAssetUI.html" class="white">资产分析</a></li>
        <li><a href="${ctx}/adminUserAnalysisUI.html" class="white">用户分析</a></li>
        <li><a href="${ctx}/orderformanalyse.html" class="white">订单分析</a></li>
        <li><a href="${ctx}/adminWarnAnalysisUI.html" class="white">告警分析</a></li>
        <li><a href="${ctx}/equResourceUI.html" class="white">设备资源管理</a></li>
        <li><a href="${ctx}/adminSystemManageUI.html" class="white">系统管理</a></li>
        <li class="b_current"><a href="${ctx}/adminAPIAnalysisUI.html" class="white">API分析</a></li>
        <li style="border-right:1px solid #1f8db4;"><a href="${ctx}/adminNoticeManageUI.html" class="white">公告管理</a></li>
      </ul>
    </div>
    <div class="lagst">
      <div class="lagst-left b_lagst_left"> <a href="#"><img src="${ctx}/source/adminImages/b_photo.jpg" width="43" height="42"></a> </div>
      <div class="lagst-right">
        <p ><a href="###" class="white">${sessionScope.admin_user.name }</a></p>
        <p> <a href="${ctx}/adminExit.html" class="white">退出</a></p>
      </div>
    </div>
  </div>
</div>
<!--头部代码结束-->
<div class="main_wrap">
	<div class="text">
		<span>API累计调用数<i>123782</i></span>
		<span>扫描网站数<i>782</i></span>
		<span>接入APIKEY数<i>1282</i></span>
		<span>接入任务数<i>1782</i></span>
	</div>
	<!-- 时间轴 -->
	<div class="dateSlider" id="dateSlider"></div>
	<!-- 时间轴 -->
	<div class="infos clearfix">
		<dl class="info-33">
			<dt>web漏洞扫描API</dt>
			<dd class="cont" id="api1"></dd>
		</dl>
		<dl class="info-33">
			<dt>木马检测API</dt>
			<dd class="cont" id="api2"></dd>
		</dl>
		<dl class="info-33">
			<dt>网页篡改监测API</dt>
			<dd class="cont" id="api3"></dd>
		</dl>
		<dl class="info-33">
			<dt>网页敏感内容监测API</dt>
			<dd class="cont" id="api4"></dd>
		</dl>
		<dl class="info-33">
			<dt>网站可用性监测API</dt>
			<dd class="cont" id="api5"></dd>
		</dl>
		<dl class="info-33">
			<dt>会话管理API</dt>
			<dd class="cont" id="api6"></dd>
		</dl>
		<dl class="info-50">
			<dt>服务类型百分比</dt>
			<dd class="cont"></dd>
		</dl>
		<dl class="info-50">
			<dt>接口类型百分比</dt>
			<dd class="cont"></dd>
		</dl>
	</div><!--
	
	<div class="main_center">
        <div class="dd_data_box">
        	<div class="system_zy">
                <div class="zy_top1" style="width:100%;height:300px">
                   	<div class="zy_top_l fl" id="api1" style="width:500px">
                    	<img src="${ctx}/source/adminImages/system1.jpg" width="249" height="164">  
                    </div>
                    <div class="zy_top_r fl" id="api2" style="width:500px">
                    	 <img src="${ctx}/source/adminImages/system2.jpg"> 
                    </div>
                    <div class="zy_top_l fl" id="api3" style="width:500px">
                    	<img src="${ctx}/source/adminImages/system1.jpg" width="249" height="164">  
                    </div>
                 </div>
                 <div class="zy_top1" style="width:100%;height:300px;padding:0px">
                    	<div class="zy_top_l fl" id="api4" style="width:500px">
                    	<img src="${ctx}/source/adminImages/system1.jpg" width="249" height="164">  
                    	</div>
                    	<div class="zy_top_r fl" id="api5" style="width:500px">
                    	<img src="${ctx}/source/adminImages/system1.jpg" width="249" height="164">  
                    	</div>
                    	<div class="zy_top_r fl" id="api6" style="width:500px">
                    	<img src="${ctx}/source/adminImages/system1.jpg" width="249" height="164">  
                    	</div>
                 </div>
                   
             </div>
        </div>
    </div>
--></div>
<!--尾部部分代码-->
<div class="bottom_bj">
<div class="bottom">
<div class="bottom_main">
  <h3><a href="###">新手入门</a></h3>
  <ul>
      <li><a href="${ctx}/registUI.html">新用户注册</a></li>
    <li><a href="${ctx}/loginUI.html">用户登录</a></li>
    <li><a href="###">找回密码</a></li>
  </ul>
</div>
<div  class="bottom_main">
 <h3><a href="###"> 帮助</a></h3>
  <ul>
  <li><a href="${ctx}/aider.html">常见问题</a></li>
  </ul>
</div>
<div  class="bottom_main">
  <h3><a href="###">厂商合作</a></h3>
  <ul>
    <li><a href="###">华为</a></li>
    <li><a href="###">安恒</a></li>
    <li><a href="###">知道创宇</a></li>
  </ul>
</div>
<div  class="bottom_main">
<h3><a href="###">联系我们</a></h3>
<ul>
<li><a href="###">客户电话</a></li>
</div>
<div  class="bottom_main" style="width:380px;">
<h3><a href="###">版权信息</a></h3>
 <ul>
 <li>Copyright&nbsp;©&nbsp;2015 中国电信股份有限公司北京研究院<br />
京ICP备12019458号－10</li>
</div>
</div>
</div>
<!--尾部部分代码结束-->
</body>
</html>