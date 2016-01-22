<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>服务管理</title>
<link href="${ctx}/source/adminCss/mian.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/adminCss/head_bottom.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/adminCss/backstage.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/source/scripts/common/jquery.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/common/backstage.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/common/modelbox.js"></script>
<link href="${ctx}/source/images/chinatelecom.ico" rel="shortcut icon" />
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
        <li class="b_current"><a href="${ctx}/adminServUI.html" class="white">服务管理</a></li>
        <li><a href="${ctx}/adminDataAnalysisUI.html" class="white">数据分析</a></li>
        <li><a href="${ctx}/adminSystemManageUI.html" class="white">系统管理</a></li>
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
	<div class="main_center">
    	<div class="add_service">
        	<a href="#" class="add_ser" id="add_ser">添加服务</a>
        </div>
        <div class="b_choose">
        	<ul>
            	<li>类型：</li>
                <li class="choose_a twoword">全部</li>
                <li class="choose_a twoword">最新</li>
            </ul>
            <ul>
            	<li>厂商：</li>
                <li class="choose_a twoword">电信</li>
                <li class="choose_a twoword">360</li>
                <li class="choose_a twoword">华为</li>
                <li class="choose_a twoword">绿盟</li>
                <li class="choose_a twoword">其他</li>
            </ul>
            <ul>
            	<li>服务：</li>
                <li class="choose_a">扫描类</li>
                <li class="choose_a">监控类</li>
                <li class="choose_a">防护类</li>
                <li class="choose_a twoword">其他</li>
            </ul>
        </div>
        <div class="ser_list">
        	<ul>          
                
              <c:forEach var="list" items="${servList}" varStatus="status">
                <li class="nomr">
                   	<dl>
                       <dt></dt>
                         <dd>
                            <p class="ser_type">${list.name }</p>
                            <p>厂商：
                            <c:if test="${list.factory==1}">安恒</c:if>
                            <c:if test="${list.factory==2}">华为</c:if>
                            </p>
                            <p>
							<c:if test="${list.type==1}">扫描类</c:if>
							<c:if test="${list.type==2}">监控类</c:if>
							<c:if test="${list.type==3}">防护类</c:if>
							<c:if test="${list.type==4}">其他</c:if>
							</p>
                         </dd>
                     </dl>
                    <div class="ser_change"><a href="#">修改</a><a href="#">删除</a></div>
                </li>
              </c:forEach>  
            </ul>
        </div>
    </div>
</div>
<!--尾部部分代码-->
<div class="bottom_bj">
<div class="bottom">
<div class="bottom_main">
  <h3><a href="###">新手入门</a></h3>
  <ul>
    <li><a href="${ctx}/registUI.html">新用户注册</a></li>
    <li><a href="${ctx}/loginUI.html">用户登录</a></li>
    <li><a href="${ctx}/forgetPass.html">找回密码</a></li>
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
    <li><a href="###">绿盟</a></li>
    <li><a href="###">安恒</a></li>
    <li><a href="###">华为</a></li>
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
<!--模态框-->
<div class="modelbox" id="modelbox"></div>
<div id="box_logoIn" class="box_logoIn">
  <div class="add_ser_top">
	<p>添加服务</p><p id="close"><img src="${ctx}/source/adminImages/b_exit.jpg" width="25" height="26"></p>
   </div> 
   <form method="post">
        <div class="ser_div">
        <p>服务名称</p>
          <input type="text" class="ser_input"/>
        </div>
        <div class="ser_div">
        <p>服务类型</p>
          <select class="ser_input">
          	<option>扫描类</option>
          </select>
        </div>
        <div class="ser_div">
        <p>厂商类型</p>
          <select class="ser_input">
          	<option>电信</option>
            <option>360</option>
          </select>
        </div>
        <button class="ser_btn" id="seradd_btn">立即添加</button>
      </form>
</div>
</body>
</html>
