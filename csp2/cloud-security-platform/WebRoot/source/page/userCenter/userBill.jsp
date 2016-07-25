<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%
    response.setHeader("Pragma","No-cache"); 
    response.setHeader("Cache-Control","no-cache"); 
    response.setDateHeader("Expires", -10); 
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>用户中心-我的账单</title>
<link href="${ctx}/source/css/mian.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/css/user.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/css/head_bottom.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/source/scripts/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/common/jquery.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/common/user.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/order/billDetail.js"></script>
<SCRIPT LANGUAGE="JavaScript" src=http://float2006.tq.cn/floatcard?adminid=9682007&sort=0 ></SCRIPT>
<link href="${ctx}/source/css/blue.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/images/chinatelecom.ico" rel="shortcut icon" />
<!-- add by 2016-02 -->
<link href="${ctx}/source/css/portalindex.css" type="text/css" rel="stylesheet">
<link href="${ctx}/source/css/base.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/source/scripts/common/portalindex.js"></script>
<script src="${ctx}/source/scripts/common/popBox.js"></script>
<link href="${ctx}/source/css/popBox.css" type="text/css" rel="stylesheet">	
<script src="${ctx}/source/scripts/common/slidelf.js"></script>
<!-- end -->
<script type="text/javascript" src="${ctx}/source/scripts/common/main.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/order/order.js"></script>
<script type="text/javascript">
$.ajaxSetup({
    cache: false //关闭AJAX相应的缓存
});
$(document).ready(function(){
	$("#type").val("${type}");
	$("#servName").val("${servName}");
	$("#begin_date").val("${begin_date}");
	$("#end_date").val("${end_date}");
});

function searchCombine(){
     $("#searchForm").submit();
}
</script>
</head>

<body>

<!--头部-->
<div class="safe01 detalis-head">
	<!--头部-->
	<div class="head" style="width:100%">
		<div class="headBox">
			<div class="safeL fl" style="width:260px; margin-right:13%">
				<a href="${ctx}/index.html"><img src="${ctx}/source/images/anquanbang_white_logo.png" alt="" style="position:relative; top:4px;"/></a>
			</div>
			<div class="safem fl">
				<span class="fl"><a href="${ctx}/index.html">首页</a></span>
				
				<!-- 商品分类 start -->
				<c:import url="/category.html"></c:import>
				<!-- 商品分类 end -->
				
				<span class="fl"><a href="${ctx}/knowUs.html">关于我们</a></span>
				<span class="fl shopping" style="margin-right:0">
					<a href="${ctx}/showShopCar.html"><i></i>购物车</a>
				</span>
			</div>
			<div class="safer fr" style="margin-left:0px;">
			<!-- 如果已经登录则显示用户名，否则需要登录 -->
				<c:if test="${sessionScope.globle_user!=null }">
				<div class="login clearfix">
					<a href="${ctx}/userCenterUI.html"  class="fl loginname">${sessionScope.globle_user.name }</a>
					<em class="fl">|</em>
					<a href="${ctx}/exit.html" class="fl" >退出</a>
				</div>
				</c:if>
		         <c:if test="${sessionScope.globle_user==null }">
		            <a href="${ctx}/loginUI.html">登录</a>
					<em>|</em>
					<a href="${ctx}/registUI.html">注册</a>
		         </c:if>
			</div>
		</div>
	</div>
	

</div>
<!-- 头部代码结束-->
<div class="user_center clear">
  <div class="user_left">
    <ul class="user_1">
      <li style="font-size:16px; font-weight:500; line-height:28px; text-align:center;"><a  style="color:#4593fd; " href="${ctx}/userCenterUI.html">用户中心</a></li>
      <li><a href="${ctx}/userDataUI.html">基本资料</a></li>
      <li class="active"><a href="${ctx}/userBillUI.html">我的账单</a></li>
      <li><a href="${ctx}/userAssetsUI.html">我的资产</a></li>
      <h2>订购中心</h2>
      <!-- <li><a onclick="tasknum_verification()" href="javascript:void(0)">自助下单</a></li>-->
      <li><a href="${ctx}/orderTrackInit.html">订单跟踪</a></li>
    </ul>
  </div>
  
  <!-- <jsp:include page="left.jsp"/> -->
  
  <!--我的账单-->
  <div class="user_right" >
  <form action="${ctx}/searchCombine.html" method="post" id="searchForm">
    <input type="hidden" id="mark" value="${mark}"/>
    <input type="hidden" id="typepage" value="${type}"/>
    <input type="hidden" id="servNamepage" value="${servName}"/>
    <input type="hidden" id="begin_datepage" value="${begin_date}"/>
    <input type="hidden" id="end_datepage" value="${end_date}"/>
    <div class="user_top">
      <div class="user_sec_cont">
         	<select id="type" name="type" class="user_secta spiclesel">
         		<option selected="selected" value="">请选择类型</option>
         		<option value="1" >长期</option>
         		<option value="2" >单次</option>
    		</select>
      </div>
      <div class="user_sec_cont" style=" left:196px; ">
         <select id="servName" name="servName" class="user_secta spiclesel">
        	<option selected="selected" value="">请选择服务</option>
      		<option value="1" >漏洞扫描服务</option>
      		<option value="2" >恶意代码监测服务</option>
      		<option value="3" >网页篡改监测服务</option>
      		<option value="4" >关键字监测服务</option>
      		<option value="5" >可用性监测服务</option>
      		<option value="6" >日常流量监测服务</option>
      		<option value="7" >日常攻击防护服务</option>
      		<option value="8" >突发异常流量清洗服务</option>
    	</select>
      </div>
      <div class="dan_3 user_sectime1" style="left:344px;">
          <input type="text" value="" id="begin_date" name="begin_datevo" onclick="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
      </div>
        <div style="left:520px; position:absolute;">--</div>
        <div class="dan_4 user_sectime1" style="left:552px;">
          <input type="text" value="" id="end_date" name="end_datevo"  onclick="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
        </div>
      <div class="user_soucuo" style="left:764px;"><img src="${ctx}/source/images/user_submit_2.jpg" onclick="searchCombine()"/></div>
    </div>
   </form>
    <div class="zhangd_table" id="content_data_div">
      <table id="billTab">
        <tbody>
	          <tr style="background:#e0e0e0; height:30px; line-height:30px;">
	            <td style="width:16%;">订单编号</td>
	            <td  style="width:7%;">订单类型</td>
	            <td  style="width:13%;">订单服务</td>
	            <td  style="width:36%;">服务起止时间</td>
	            <td  style="width:15%;">下单时间</td>
	            <td  style="width:10%;"></td>
	          </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>
<!-- 尾部代码开始-->
<div class="safeBox">
		<div class="safe04">
			<div class="imgBox clearfix">
				<div class="footL fl">
					<a href="${ctx}/index.html">
	               <img src="${ctx}/source/images/portal/new-footer-logo.png" alt="" />
                   </a>
				</div>
				<ol class="footr clearfix fr">
					<li>
                    	<h2>帮助中心</h2>
                        <dl>
                        	<dd>购物指南</dd>
                            <dd>在线帮助</dd>
                            <dd>常见问题</dd>
                       </dl>
                    </li>
                    <li>
                    	<h2>关于安全帮</h2>
                        <dl>
                            <dd><a href="${ctx}/knowUs.html">了解安全帮</a></dd>
                            <dd><a href="${ctx}/joinUs.html">加入安全帮</a></dd>
                            <dd>联系我们</dd>
                       </dl>
                    </li>
                    <li>
                    	<h2>关注我们</h2>
                        <dl>
                        	<dd>QQ交流群<br>470899318</dd>
                            <dd class="weixin"><a href="#">官方微信</a></dd>
                       </dl>
                    </li>
                     <li>
                    	<h2>特色服务</h2>
                        <dl>
                        	<dd>优惠劵通道</dd>
                            <dd>专家服务通道</dd>
                       </dl>
                    </li>
					
				</ol>
				
			</div>
		</div>
		<!-- 底部 start -->
		<c:import url="/foot.jsp"></c:import>
		<!-- 底部 end -->
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
           	<img src="${ctx}/source/images/portal/weixin.jpg" alt="">
           </div> 
    </div>

</div>
	
<div class="shade"></div>
</div>
<!-- 尾部代码结束 -->

</body>
</html>
