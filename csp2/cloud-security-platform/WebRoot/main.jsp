<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>安全帮，云安全服务在线商城</title>
<link href="${ctx}/source/css/base.css" type="text/css" rel="stylesheet">
<link href="${ctx}/source/css/popBox.css" type="text/css" rel="stylesheet">	
<link href="${ctx}/source/css/portalindex.css" type="text/css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript" src=http://float2006.tq.cn/floatcard?adminid=9682007&sort=0 ></SCRIPT>
<script src="${ctx}/source/scripts/common/jquery.js"></script>
<script src="${ctx}/source/scripts/common/portalindex.js"></script>
<script src="${ctx}/source/scripts/common/popBox.js"></script>
<script src="${ctx}/source/scripts/common/slidelf.js"></script>
<script src="${ctx}/source/scripts/common/main.js"></script>
<link href="${ctx}/source/images/chinatelecom.ico" rel="shortcut icon" />
</head>

<body>
	<div class="safeBox">
		
		<div class="safe01">
			<!--头部-->
			<div class="head">
				<div class="headBox">
					<div class="safeL fl">
						<img src="${ctx}/source/images/portal/logo.png" alt=""/>
					</div>
					<div class="safem fl">
						<span class="fl"><a href="${ctx}/index.html">首页</a></span>
						<div class="Divlist listJs fl">
							<a href="#">我的安全帮<i></i></a>
							<ul class="list listl">
								<li><a href="${ctx}/orderTrackInit.html">我的订单</a></li>
								<li><a href="${ctx}/userAssetsUI.html">我的资产</a></li>
								<li style="border: none;"><a href="${ctx}/userDataUI.html">个人信息</a></li>
							</ul>
						</div>
						<span class="fl"><a href="#">手机APP</a></span>
						<span class="fl"><a href="${ctx}/aider.html">帮助</a></span>
						
					</div>
					<div class="safer fr">
						<!-- 如果已经登录则显示用户名，否则需要登录 -->
				         <c:if test="${sessionScope.globle_user!=null }">
					        <a href="${ctx}/userDataUI.html">${sessionScope.globle_user.name }</a>
					        <em>|</em>
					        <a href="${ctx}/exit.html">退出</a>
				         </c:if>
				         <c:if test="${sessionScope.globle_user==null }">
				            <a href="${ctx}/loginUI.html">登录</a>
							<em>|</em>
							<a href="${ctx}/registUI.html">注册</a>
				         </c:if>
					</div>
				</div>
			</div>
			<div class="bannerBox vBox">
	            <div class="v_show">
					<div class="bannerB v_cont">
						<ul class="bannerHeight banner_img clearfix">
							<li style="background-color: #0f2f50; display: list-item;"><div class="vb"><a href="#"><img src="${ctx}/source/images/portal/bigpic.png" alt=""></a></div></li>
							<li style="background-color: #0f2f50;"><div class="vb"><a href="#"><img src="${ctx}/source/images/portal/bigpic.png" alt=""></a></div></li>
							<li style="background-color: #0f2f50;"><div class="vb"><a href="#"><img src="${ctx}/source/images/portal/bigpic.png" alt=""></a></div></li>
						</ul>
					</div>
		         </div>
				<ol class="bannerbtn circle clearfix">
                    <li class="active"></li>
                    <li></li>
                    <li></li>
				</ol>
			</div>

		</div>
		<div class="safe02">
			
			<div class="imgBox">
				<h2><i></i>热门服务<i></i></h2>
				<ul class="imgBoxList clearfix">
					<li>
						<a href="${ctx}/web_anquanbang.html">
							<span>
								<img src="${ctx}/source/images/portal/ico04.png" alt="" />
							</span>
							<h3>网站安全帮</h3>
						</a>
					</li>
					<li>
						<a href="#">
							<span>
								<img src="${ctx}/source/images/portal/ico01.png" alt="" />
							</span>
							<h3>数据库安全帮</h3>
						</a>
					</li>
					<li>
						<a href="#">
							<span>
								<img src="${ctx}/source/images/portal/ico05.png" alt="" />
							</span>
							<h3>系统安全帮</h3>
						</a>
					</li>
					<li>
						<a href="#">
							<span>
								<img src="${ctx}/source/images/portal/ico03.png" alt="" />
							</span>
							<h3>网络安全帮</h3>
						</a>
					</li>
					<li>
						<a href="#">
							<span>
								<img src="${ctx}/source/images/portal/ico06.png" alt="" />
							</span>
							<h3>移动安全帮</h3>
						</a>
					</li>
					<li>
						<a href="#">
							<span>
								<img src="${ctx}/source/images/portal/API.png" alt="" />
							</span>
							<h3>安全能力API</h3>
						</a>
					</li>
					<li>
						<a href="${ctx}/sa_anquanbang.html" target="_blank">
							<span>
								<img src="${ctx}/source/images/portal/ico02.png" alt="" />
							</span>
							<h3>安全态势感知</h3>
						</a>
					</li>
					<li>
						<a href="#">
							<span>
								<img src="${ctx}/source/images/portal/X.png" alt="" />
							</span>
							<h3>X专区</h3>
						</a>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="safe03">
			<div class="imgBox" id="carrousel" style="width: 1190px;">
				<h2><i></i>合作伙伴<i></i></h2>
                
                <div class="friend-Link ">
                    <div class="left-arrow"><a href="javascript:;"><img src="${ctx}/source/images/portal/left.png"></a></div>
                    <div class="fl-pic">
                      <ul class="imgist clearfix">
                        <li><a href="#"><img src="${ctx}/source/images/portal/ico14.png" alt=""></a></li>
                        <li><a href="#"><img src="${ctx}/source/images/portal/ico12.png" alt=""></a></li>
                        <li><a href="#"><img src="${ctx}/source/images/portal/ico11.png" alt=""></a></li>
                        <li><a href="#"><img src="${ctx}/source/images/portal/ico15.png" alt=""></a></li>
                        <li><a href="#"><img src="${ctx}/source/images/portal/ico13.png" alt=""></a></li>
                        <!--<li><a href="#"><img src="imges/ico13.png" alt=""></a></li>
                        <li><a href="#"><img src="imges/ico14.png" alt=""></a></li>
                        <li><a href="#"><img src="imges/ico15.png" alt=""></a></li>-->
                      </ul>
                    </div>
                    <div class="right-arrow"><a href="javascript:;"><img src="${ctx}/source/images/portal/right.png"></a></div>
                  </div>
        
			</div>
		</div>
		<div class="safe04">
			<div class="imgBox clearfix">
				<div class="footL fl">
					<a href="#"><img src="${ctx}/source/images/portal/footlogo.png" alt=""></a>
				</div>
				<ol class="footr clearfix fr">
					<li>
                    	<h2>帮助中心</h2>
                        <dl>
                        	<dd><a href="#">购买指南</a></dd>
                            <dd><a href="#">在线帮助</a></dd>
                            <dd><a href="#">常见问题</a></dd>
                       </dl>
                    </li>
                    <li>
                    	<h2>关于安全帮</h2>
                        <dl>
                        	<dd><a href="${ctx}/knowUs.html">了解安全帮</a></dd>
                            <dd><a href="${ctx}/joinUs.html">加入安全帮</a></dd>
                            <dd><a href="#">联系我们</a></dd>
                       </dl>
                    </li>
                    <li>
                    	<h2>关注我们</h2>
                        <dl>
                        	<dd><a href="#">QQ交流群</br>470899318</a></dd>
                            <dd class="weixin"><a href="#">官方微信</a></dd>
                       </dl>
                    </li>
                     <li>
                    	<h2>特色服务</h2>
                        <dl>
                        	<dd><a href="#">优惠劵通道</a></dd>
                            <dd><a href="#">专家服务通道</a></dd>
                       </dl>
                    </li>
					
				</ol>
				
			</div>
		</div>
		<div class="foot">
			<p>版权所有Copyright © 2015 中国电信股份有限公司北京研究院京ICP备12019458号-10</p>
		</div>
		<!---执行效果-->
<div class="weixinshow popBoxhide" id="weixin">
	<i class="close chide"></i>
    <div class="Pophead">
    	<h1 class="heaf">安全帮微信二维码</h1>
    </div>
	<div class="popBox">
    	 <p>打开微信，点击右上角的“+”，选择“扫一扫”功能，<br>
对准下方二维码即可。
		</p>
           <div class="weinImg" style="text-align:center;">
           	<img src="${ctx}/source/images/portal/weixin.png" alt="">
           </div> 
    </div>

</div>
	
<div class="shade"></div>
	</div>

</body>
<script>
$(function(){	
	$('#carrousel').hover(function(){
			$('.left-arrow').fadeIn();
			$('.right-arrow').fadeIn();
		},function(){
			$('.right-arrow').fadeOut();
			$('.left-arrow').fadeOut();
		})
	
	$(".fl-pic").slidelf({
			"prev":"left-arrow",
			"next":"right-arrow",
			"speed":300 //时间可以任意调动  以毫秒为单位
		});
		
	})
	
</script>

</html>
