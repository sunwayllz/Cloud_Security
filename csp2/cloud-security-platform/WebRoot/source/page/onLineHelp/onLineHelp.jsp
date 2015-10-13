<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>在线帮助</title>
<link href="${ctx}/source/css/mian.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/css/user.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/css/head_bottom.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/css/chinatelecom.css" type="text/css" rel="stylesheet" />
<link rel="shortcut icon" href="${ctx}/source/images/chinatelecom.ico" />
<link href="${ctx}/source/css/blue.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/source/scripts/common/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$("#f5").hide();
	$('.user_left ul li').click(function (){
		$(".dd").show();
	    $("#f5").hide();
		var index = $(".user_left ul li").index(this); //获取当前点击按钮
		if(index==5){
			$(".user_left ul li").removeClass('active');
            $(".user_left ul li").eq(index).addClass('active');
            $(".dd").hide();
            $("#f5").show();
		}else if(index==0){
			$(".user_left ul li").removeClass('active');
			$(".user_left ul li").eq(1).addClass('active');
		}else{
			$(".user_left ul li").removeClass('active');
            $(".user_left ul li").eq(index).addClass('active');
		}
		
	});
	

});

function view(){
    $(".user_left ul li").removeClass('active');
    $(".dd").hide();
    $("#f5").show();
}
</script>
</head>
<body>
<div>
<!--头部代码-->
    <div class="head_bj">
        <div class="head">
           <div class="logo"><img src="${ctx}/source/images/logo.png" /></div>
           <div class="lagst">
               <div class="lagst-left">
                <c:if test="${sessionScope.globle_user!=null }">
                   <a href="${ctx}/userDataUI.html"><img src="${ctx}/source/images/ren.png" /></a>
                </c:if>
                 <c:if test="${sessionScope.globle_user==null }">
                    <a href="${ctx}/toLoginUI.html"><img src="${ctx}/source/images/ren.png" /></a>
                 </c:if>
               </div>
               <div class="lagst-right">
               <!-- 如果已经登录则显示用户名，否则需要登录 -->
               <c:if test="${sessionScope.globle_user!=null }">
                <p><a href="${ctx}/userDataUI.html" style="color: #fff">${sessionScope.globle_user.name }</a></p>
                <p><a href="${ctx}/exit.html">退出</a></p>
               </c:if>
               <c:if test="${sessionScope.globle_user==null }">
                     <p><a href="${pageContext.request.contextPath}/loginUI.html">登录</a></p>
                     <p><a href="${pageContext.request.contextPath}/registUI.html">注册</a></p>
               </c:if>
               </div>
           </div>
            <div class="list">
               <ul>
                   <li><a href="${ctx}/index.html">首页</a></li>
                   <li><a href="${ctx}/chinas.html">安全态势</a></li>
                   <li><a href="${ctx}/orderTrackInit.html">我的订单</a></li>
                   <li class="list_active"><a href="${ctx}/aider.html">在线帮助</a></li>
                   <li style="border-right:1px solid #1369C0;"><a href="${ctx}/userCenterUI.html">用户中心</a></li>
               </ul>
           </div>
        </div>
    </div>
<!-- 头部代码结束-->
<div class="user_center clear">
  <div class="user_left" style="width:160px;">
    <ul class="user_1">
      <li style="font-size:16px; font-weight:500; line-height:28px; text-align:center; width:160px;"><a  style="color:#4593fd; " href="#1F">用户使用说明</a></li>
      <li  class="active"  style="width:160px;"><a href="#1F" >用户注册</a></li>
      <li style="width:160px;"><a href="#2F" >用户登录</a></li>
      <li style="width:160px;"><a href="#3F" >用户中心</a></li>
      <li  style="width:160px;"><a href="#4F" >订购中心</a></li>
      <li style="font-size:16px; font-weight:500; line-height:28px; text-align:center; width:160px;"><a  style="color:#4593fd; " href="#" >网站安全帮常见问题</a></li>
      <!-- <h2><a href="#5F" onclick="view()">网站安全帮常见问题</a></h2> -->
    </ul>
  </div>
  <!-- 用户注册-->
  <div class="user_right" style="width: 942px;">
  	  <a name="1F">
	  <div id="f1" class="dd">
	    <h3 class="helph">1 引言</h3>
	    <p class="help_detail">中国电信网站安全帮助是为用户提供“购买、服务、售后”一站式WEB安全服务的自助电子交易平台，免费注册成为安全帮用户后即可享受专家级服务</p>
	    <h3 class="helph">2 用户使用说明</h3>
	    <h4 class="helph">2.1.1 用户注册</h4>
	    <p class="help_detail">点击首页“注册”，进入用户注册界面，如图1-1；</p>
	   	<div class="help_right"><img src="${ctx}/source/images/help01.png" /></div>
	   	 <p class="help_detail">用户账号需通过手机号码或者邮箱地址激活。</p>
	   	<div class="help_right"><img src="${ctx}/source/images/help02.png"/></div>
	  </div>
	  </a>
	  <a name="2F">
	  <div id="f2" class="dd" >
	    <h4 class="helph">2.1.2 用户登录</h4>
	    <p class="help_detail">用户注册成功后即可使用已注册的用户名密码登录网站安全帮。</p>
	    <div class="help_right"><img src="${ctx}/source/images/help03.jpg" /></div>
      </div>
      </a>
      
      <a name="3F">
      <div id="f3" class="dd" >
	    <h4 class="helph">2.1.3 用户中心</h4>
	    <p class="help_detail">用户登录成功后定位到用户中心界面。用户在用户中心可进行基本资料管理，账单查看并管理用户资产。</p>
	    <div class="help_right"><img src="${ctx}/source/images/help04.jpg" /></div>
	  
	       <!--基本资料-->
    <h4 class="helph">2.1.3.1 基本资料</h4>
    <p class="help_detail">用户修改绑定手机号码或邮箱地址后需重新激活使用。</p>
    <div class="help_right"><img src="${ctx}/source/images/help05.jpg" /></div>
    
    <!--我的账单-->
    <h4 class="helph">2.1.3.2 我的账单</h4>
    <p class="help_detail">“我的账单”提供用户所有已订单服务情况汇总，包括订单服务类型、订单服务时长、订单服务次数内容。</p>
    <div class="help_right"><img src="${ctx}/source/images/help06.jpg" /></div>
    
    <!--我的资产-->
        
        <h4 class="helph">2.1.3.3 我的资产</h4>
        <p class="help_detail">出于服务安全性及规范性的要求，用户需将欲购买WEB安全服务所针对的网站对象作为资产提前添加，并进行资产归属验证。</p>
        <div class="help_right"><img src="${ctx}/source/images/help07.jpg" /></div>
         <p class="help_detail">新增资产</p>
        <div class="help_right"><img src="${ctx}/source/images/help08.jpg" /></div>
         <p class="help_detail">修改资产</p>
        <div class="help_right"><img src="${ctx}/source/images/help09.jpg" /></div>
        <p class="help_detail">资产验证</p>
        <div class="help_right"><img src="${ctx}/source/images/help10.jpg" width=""/></div>
      </div>
      </a>
	  
	  <a name="4F">
	  <div id="f4" class="dd">
	    <h3 class="helph">2.1.4 订购中心</h3>
	    <p class="help_detail">用户订购服务及后续订单跟踪都在订购中心来完成。</p>
	    <h4 class="helph">2.1.4.1 自助下单</h4>
	    <p class="help_detail">用户点击“自助下单”开始订购服务，可根据需要设备服务时长及相关服务参数，并在提交订单前填写告警联系人信息用于实时告警发送。    
	选择单次还是长期类型
	</p>
	    <div class="help_right"><img src="${ctx}/source/images/help18.jpg" /></div>
	    <div class="help_right"><img src="${ctx}/source/images/help19.jpg" /></div>
	    <p class="help_detail">选择服务内容并勾选资产对象</p>
	    <div class="help_right"><img src="${ctx}/source/images/help20.jpg" /></div>
	        <p class="help_detail">填写联系人信息</p>
	      <div class="help_right"><img src="${ctx}/source/images/help21.jpg" /></div>
	        <div class="help_right"><img src="${ctx}/source/images/help22.jpg" /></div>
	        <p class="help_detail"> 确认订单</p>
	    <div class="help_right"><img src="${ctx}/source/images/help23.jpg" /></div>
	        <div class="help_right"><img src="${ctx}/source/images/help24.jpg" /></div>
  
	    <h4 class="helph">2.1.4.2 订单跟踪</h4>
	    <p class="help_detail">订单下单成功后，用户可在“订单跟踪”中查看订单详情及服务进度。</p>
	    <div class="help_right"><img src="${ctx}/source/images/help11.jpg" /></div>
	    <div class="help_right"><img src="${ctx}/source/images/help12.jpg" /></div>
	    <p class="help_detail">订单详情</p>
	    <div class="help_right"><img src="${ctx}/source/images/help13.jpg" /></div>
	    <p class="help_detail">告警详情</p>
	    <div class="help_right"><img src="${ctx}/source/images/help14.jpg" /></div>
	    <div class="help_right"><img src="${ctx}/source/images/help15.jpg" /></div>
	    <div class="help_right"><img src="${ctx}/source/images/help16.jpg" /></div>
	    <div class="help_right"><img src="${ctx}/source/images/help17.jpg" /></div>
	  </div>
	  </a>
  
  	  <a name="5F">
      <div id="f5" class="dd" >
        <h3 class="helph"> 1、网站安全帮能为网站提供什么帮助？</h3>
	    <p class="help_detail">网站安全帮是中国电信打造的自助式网站安全体检中心，集漏洞扫描、恶意代码监测、页面篡改监测、关键字监测与可用性监测能力于一身，7*24的贴身管家服务让您第一时间洞察网站安全态势。</p>
	    <h3 class="helph">2、网站安全帮收费吗？</h3>
	    <p class="help_detail">网站安全帮是全免费的服务平台。</p>
	   
	   <h3 class="helph"> 3、网站安全帮为什么要进行资产验证？</h3>
	    <p class="help_detail">在进行网站安全监测前，需要对检测网站进行资产归属验证，确认用户的网站管理员身份，网站安全帮不会在未得到许可的情况下对网站进行监测。</p>
	    <h3 class="helph">4、上传验证文件或代码会不会有危害？</h3>
	    <p class="help_detail">网站安全帮提供的验证文件或代码绝不会对用户网站进行任何有危险性的操作，绝不影响网站的线上服务。</p>
	    
	    <h3 class="helph"> 5、如何进行网站安全监测？</h3>
	    <p class="help_detail">1)首先登录网站安全帮，如没有账号需先注册账号；
	   2)进入用户中心“我的资产”添加需监测的网站，并选择一种方式进行资产归属验证，上传验证文件或代码后网站安全帮会确认验证结果；
	   3)进入“订购中心”自助下单，下单成功后网站安全帮将为您的网站提供远程安全监测服务；
	   </p>
	    <h3 class="helph">6、网站安全帮通过什么途径进行告警</h3>
	    <p class="help_detail">网站安全帮会在安全风险发生的第一时间将告警信息通知到用户预留的手机号码或电子邮箱。</p>
      </div>
      </a>
  
  
  </div>
</div>
<!-- 尾部代码开始-->
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
<li><a href="###">QQ交流群470899318</a></li>
</div>
<div  class="bottom_main" style="width:380px;">
<h3><a href="###">版权信息</a></h3>
 <ul>
 <li>Copyright&nbsp;©&nbsp;2015 中国电信股份有限公司北京研究院<br />
京ICP备12019458号－10</li>

</div>
</div>
</div>
</div>
</body>
</html>
