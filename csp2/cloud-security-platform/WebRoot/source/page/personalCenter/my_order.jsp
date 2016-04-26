<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.sql.*,java.io.*,java.util.*,java.text.*"  %>
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

<title>个人中心-我的订单</title>
<link href="${ctx}/source/css/base.css" type="text/css" rel="stylesheet">
<link href="${ctx}/source/css/popBox.css" type="text/css" rel="stylesheet">	
<link href="${ctx}/source/css/portalindex.css" type="text/css" rel="stylesheet">
<link href="${ctx}/source/css/core.css" type="text/css" rel="stylesheet">
<link href="${ctx}/source/images/chinatelecom.ico" rel="shortcut icon" />
<SCRIPT LANGUAGE="JavaScript" src=http://float2006.tq.cn/floatcard?adminid=9682007&sort=0 ></SCRIPT>
<script type="text/javascript" src="${ctx}/source/scripts/My97DatePicker/WdatePicker.js"></script>
<script src="${ctx}/source/scripts/common/jquery.js"></script>
<script src="${ctx}/source/scripts/common/portalindex.js"></script>
<script src="${ctx}/source/scripts/common/popBox.js"></script>
<script src="${ctx}/source/scripts/common/slidelf.js"></script>
<script src="${ctx}/source/scripts/common/main.js"></script>

<script src="${ctx}/source/scripts/order/divDetail.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var type = $("#typepage").val();
    var servName = $("#servNamepage").val();
    var begin_date = $("#begin_datepage").val();
    var end_date = $("#end_datepage").val();
    //高级搜索显示
    if((type!=null&&type!="")||(servName!=null&&servName!="")||(begin_date!=null&&begin_date!="")||(end_date!=null&&end_date!="")){
    	$('.words').find('.nitial').addClass('initial');
		$('.words').children('em').addClass('add');
		$('.words').children('em').text('高级筛选条件');
			
		$('.coreshow').show();
    }
    //回显
	$("#type").val("${type}");
    $("#servName").val("${servName}");
    $("#state").val("${state}");
    $("#begin_date").val("${begin_date}");
    $("#end_date").val("${end_date}");
    $("#search").val("${search}");
});
</script>
<script type="text/javascript">
$.ajaxSetup({
    cache: false //关闭AJAX相应的缓存
});

    function searchCombine(){
     $("#searchForm").submit();
     
}
function overfind(orderId){
        var obj = {'orderId':orderId};
        $.post("getAssetName.html", obj, function(data){
        	var assetName = data.assetName;
        	$('#'+orderId).attr("title", assetName);//设置title属性的值
        });
}
//删除
function deleteOrder(orderId,begin_date){
    if (window.confirm("确实要删除吗?")==true) {
    	$.ajax({
            type: "POST",
            url: "checkOrderStatus.html",
            data: {"orderId":orderId,"begin_date":begin_date},
            dataType:"json",
            success: function(data){
                if(!data.status){
                    alert("订单正在执行,不可以删订单!");
                }else{
                	window.location.href="deleteOrder.html?orderId="+orderId;
                }
            },
         });
    } else {
        return;
    }
}


//订单操作
function optOrder(orderId,status){
	var meg = "";
	if(status==4){
		meg = "确实要暂停吗?";
	}else{
		meg = "确实要启动吗?";
	}
    if (window.confirm(meg)==true) {
    	var obj = {'orderId':orderId, 'status':status};
        $.post("optOrder.html", obj, function(data){
        	if (!data.status){
				alert("系统异常，暂停或启动失败！");
			}else{
				window.location.href="orderTrackInit.html";
			}
        });
    } else {
        return;
    }
}
</script>

<style>
.mnlist .tablist-head{ border:#e5e5e5 solid 1px; border-bottom:none;}
.mnlist{ border:none;}
.order{ padding:0px;}
.htd{ position:relative}

.order .tl{
	margin-left: -72px;
	padding-top: 23px;
	*position: absolute;
	*top:0;
	*left: 92px;	
}
.order .tr h2{
	height: 100px;
	line-height: 100px;
	font-size: 14px;
	color: #343434;
	text-align: left;
	*width: 208px;
	*text-align: left;
}
.order .listDiv p{
	color: #929292;
	margin-top:44px; 
	font-size:14px; 
	text-align:center;
	
	padding-right: 20px;

}
.order .stylep{
	height: 100px;
	line-height: 100px;
	font-size: 14px;
	color: #343434;
	
}
.order p em{
	color: #929292;
}
.order p a{
	color: #343434;
	font-size: 14px;
}
.tabList table td{ border:#e5e5e5 solid 1px; border-top:none;}
.tabList table .only{ border-top:none;}
.tabList table .onlytwo{border-bottom:none;}
</style>
</head>

<body>
	<div class="safeBox">
		
		<div class="safe01 detalis-head">
			<!--头部-->
			<div class="head">
				<div class="headBox">
					<div class="safeL fl" style="width:260px; margin-right:13%">
						<a href="${ctx}/index.html"><img src="${ctx}/source/images/portal/newlogo-footer.png" alt="" style="position:relative; top:4px;"/></a>
                        <strong style="font-size:20px; color:#fff; padding-left:10px;position:relative; top:-10px; font-weight:normal;">个人中心</strong>
					</div>
					<div class="safem fl">
						<span class="fl"><a href="${ctx}/index.html">首页</a></span>
						<div class="Divlist listJs fl">
							<a href="#" class="this">我的安全帮<i></i></a>
							<ul class="list listl">
								<li><a href="${ctx}/orderTrackInit.html">我的订单</a></li>
								<li><a href="${ctx}/userAssetsUI.html">我的资产</a></li>
								<li style="border: none;"><a href="${ctx}/userDataUI.html">个人信息</a></li>
							</ul>
						</div>
						<span class="fl ask">
							<a href="#" class="hbule">手机APP</a>
							<b style="display:none"><img src="${ctx}/source/images/portal/apk.png" alt=""></b>
						</span>
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
		</div>
		<div class="core clearfix" style="margin-bottom:343px;">
        	<div class="coreLeft fl">
            	<h3><i></i>个人中心</h3>
                <dl>
                	<dt>交易管理</dt>
                    <dd><a href="${ctx}/orderTrackInit.html" class="active">我的订单</a></dd>
                    <dd><a href="my-coupon.html">我的优惠劵</a></dd>
                    <dt>个人信息管理</dt>
                    <dd><a href="personal-data.html">个人资料</a></dd>
                    <dd style="border:none;"><a href="my-assets.html">我的资产</a></dd>
                </dl>
            </div>
            
        	<div class="coreRight my-order fl">
        		<form action="${ctx}/searchCombineOrderTrack1.html" method="post" id="searchForm">
	            	<input type="hidden" id="mark" value="${mark}"/>
				    <input type="hidden" id="typepage" value="${type}"/>
				    <input type="hidden" id="servNamepage" value="${servName}"/>
				    <input type="hidden" id="statepage" value="${state}"/>
				    <input type="hidden" id="begin_datepage" value="${begin_date}"/>
				    <input type="hidden" id="end_datepage" value="${end_date}"/>
				    <input type="hidden" id="searchpage" value="${search}"/>
	            	
	            	<div class="coreList clearfix">
	                	<label class="container con-order fl">
	                    	<input type="text" class="text promptext" value="输入资产名称或订单号进行搜索"  placeholder="" id="search" name="search">
	                        
	                    	<input type="submit" value="搜索" class="sub fr" >
	                    </label>
	                   <div class="container fl contj">
	                   	<span class="words"><em>精简筛选条件</em> <i class="nitial"></i></span>
	                   </div>
	                   
	                </div>
	                <div class="coreList coreshow clearfix" style="display:none;">
	                	<label class="container fl">
	                        <select class="fl" id="type" name="type">
				                <option selected="selected" value="">请选择类型</option>
				                <option value="1" >长期</option>
				                <option value="2" >单次</option>
				            </select>
	                     </label>
	                     <label class="container fl">
	                        <select class="fl" id="servName" name="servName">
					            <option selected="selected " value="">请选择服务</option>
					            <option value="1" >WEB漏洞监测服务</option>
					            <option value="2" >网站挂马监测服务</option>
					            <option value="3" >网页篡改监测服务</option>
					            <option value="4" >网页敏感内容监测服务</option>
					            <option value="5" >网站可用性监测服务</option>
					            <option value="6" >日常流量监测服务</option>
					            <option value="7" >日常攻击防护服务</option>
					            <option value="8" >突发异常流量清洗服务</option>
					        </select>
	                       </label>
	                       <label class="container fl">
	                        <input class="text fl" type="text" value="" id="begin_date" name="begin_datevo" onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
	                        <em class="fl">到</em>
	                        <input class="text fl" type="text" value="" id="end_date" name="end_datevo" onfocus="WdatePicker({skin:'whyGreen',isShowClear:true,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
	                    </label>
	                   
	                </div>
                </form>
                
               
                <div class="my-orderTabBox" id="content_data_div">
                	<div class="TabBoxtitle">
                        <span style=" margin:0 132px 0 124px;">订单信息</span>
                        <span style="margin-right:42px;">订单类型</span>
                         <span style="margin-right:72px;">订单状态</span>
                         <span style="margin-right:94px;">服务起止时间</span>
                         <span style="margin-right:78px;">价格（元）</span>
                         <span style="">操作</span>
                    </div>
                    <div id="orderTab"></div>
                    
                    <!-- 循环订单 orderList -->
                
                 </div>
                </div>
            
            </div>
        </div>
        
		<div class="safe04">
			<div class="imgBox clearfix">
				<div class="footL fl">
					<a href="${ctx}/index.html">
		               <img src="${ctx}/source/images/portal/logo footer.png" alt="">
	                   <i class="" style="height:35px; color:#b3b4b5; width:1px; display:inline-block;">|</i>
		               <img src="${ctx}/source/images/portal/newlogo-footer.png" alt="">
                   </a>
				</div>
				<ol class="footr clearfix fr">
					<li>
                    	<h2>帮助中心</h2>
                        <dl>
                        	<dd><a href="#">购物指南</a></dd>
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
                        	<dd><a href="#">QQ交流群<br>470899318</a></dd>
                            <dd class=""><a href="#">官方微信</a></dd>
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
	</div>
<script>
	$(function(){
		/*$('.listul').each(function(index, element) {
           var h = $(this).height();
		   $(this).children('li').height(h);
        });*/
		/*提示文字效果*/
		$('.promptext').focus(function(){
			if($(this).val()=='输入资产名称或订单号进行搜索'){
				$(this).val('');
				$(this).css('color','#343434');
			}else{
				$(this).css('color','#343434');
			}
		});
		$('.promptext').blur(function(){
			if($(this).val()==''){
				$(this).val('输入资产名称或订单号进行搜索');
				$(this).css('color','#929292');	
			}
				
		})
	})
	
	
</script>
 
</body>


</html>
