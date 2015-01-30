<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>用户管理</title>
<link href="${ctx}/source/adminCss/mian.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/adminCss/head_bottom.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/adminCss/backstage.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/source/scripts/common/jquery.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/common/backstage.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/common/modelbox.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/common/query.JPlaceholder.js"></script>
</head>

<body>
<!--头部代码-->
<div class="head_bj b_head">
  <div class="head">
    <div class="logo"><img src="${ctx}/source/adminImages/b_logo2.jpg"/></div>
    <div class="list b_list">
      <ul>
        <li class="b_current"><a href="usermanagement.html" class="white">用户管理</a></li>
        <li><a href="service.html" class="white">服务管理</a></li>
        <li><a href="dataanalysis.html" class="white">数据分析</a></li>
        <li style="border-right:1px solid #1f8db4;"><a href="backstage_system.html" class="white">系统管理</a></li>
      </ul>
    </div>
    <div class="lagst">
      <div class="lagst-left b_lagst_left"> <a href="#"><img src="${ctx}/source/adminImages/b_photo.jpg" width="43" height="42"></a> </div>
      <div class="lagst-right">
        <p ><a href="###" class="white">${sessionScope.globle_user.name }</a></p>
        <p> <a href="${ctx}/adminExit.html" class="white">退出</a></p>
      </div>
    </div>
  </div>
</div>
<!--头部代码结束-->
<div class="user_search_box">
    <div class="user_sea_box">
      <input class="user_search" type="text" placeholder="请输入用户名">
    </div>
</div>
<div class="main_wrap">
	<div class="main_center">
    	<div class="add_service">
        	<a href="#" class="add_ser fl" id="add_ser">添加用户</a>
            <a href="jurisdiction.html" class="add_ser fl ml20 b_juris_btn">用户权限</a>
        </div>
        <div class="b_user_table">
        	<div class="b_user_table_box userbox_cur" id="supper">
            	<div class="b_user_table_c">
                	<span class="user_title">超级管理员</span><span class="user_num">4</span>
                </div>
            </div>
            <div class="b_user_table_box" id="system">
            	<div class="b_user_table_c">
                    <span class="user_title">系统管理员 </span><span class="user_num">12</span>
                </div>
            </div>
            <div class="b_user_table_box" id="users">
            	<div class="b_user_table_c" style="border-right:1px solid #e0e0e0;">
                	<span class="user_title">注册用户　</span><span class="user_num">362</span>
                </div>
            </div>
        </div>
        <div class="system_table">
        	<table class="user_table" cellpadding="0" cellspacing="0">
            	<thead>
                	<tr>
                    	<th class="t_username">用户名</th>
                        <th class="t_date">创建日期</th>
                        <th class="t_role">用户角色</th>
                        <th class="t_assets">资产数</th>
                        <th class="t_service">服务数</th>
                        <th class="t_operation">操作</th>
                    </tr>
                </thead>
                <tbody>
                	<tr>
                    	<td class="t_username">admin92t4045iy0</td>
                        <td class="t_date">2014/10/10</td>
                        <td class="t_role">系统管理员</td>
                        <td class="t_assets">34</td>
                        <td class="t_service">5</td>
                        <td class="t_operation"><a href="#" class="ope_a">修改</a><a href="#" class="ope_a ml20">删除</a></td>
                    </tr>
                    <tr>
                    	<td class="t_username">admin92t4045iy0</td>
                        <td class="t_date">2014/10/10</td>
                        <td class="t_role">系统管理员</td>
                        <td class="t_assets">34</td>
                        <td class="t_service">5</td>
                        <td class="t_operation"><a href="#" class="ope_a">修改</a><a href="#" class="ope_a ml20">删除</a></td>
                    </tr>
                    <tr>
                    	<td class="t_username">admin92t4045iy0</td>
                        <td class="t_date">2014/10/10</td>
                        <td class="t_role">系统管理员</td>
                        <td class="t_assets">34</td>
                        <td class="t_service">5</td>
                        <td class="t_operation"><a href="#" class="ope_a">修改</a><a href="#" class="ope_a ml20">删除</a></td>
                    </tr>
                    <tr>
                    	<td class="t_username">admin92t4045iy0</td>
                        <td class="t_date">2014/10/10</td>
                        <td class="t_role">系统管理员</td>
                        <td class="t_assets">34</td>
                        <td class="t_service">5</td>
                        <td class="t_operation"><a href="#" class="ope_a">修改</a><a href="#" class="ope_a ml20">删除</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="users_table">
        	<table class="user_table" cellpadding="0" cellspacing="0">
            	<thead>
                	<tr>
                    	<th class="t_username">用户名</th>
                        <th class="t_date">创建日期</th>
                        <th class="t_role">用户角色</th>
                        <th class="t_assets">资产数</th>
                        <th class="t_service">服务数</th>
                        <th class="t_operation">操作</th>
                    </tr>
                </thead>
                <tbody>
                	<tr>
                    	<td class="t_username">admin92t4045iy0</td>
                        <td class="t_date">2014/10/10</td>
                        <td class="t_role">注册用户</td>
                        <td class="t_assets">34</td>
                        <td class="t_service">5</td>
                        <td class="t_operation"><a href="#" class="ope_a">修改</a><a href="#" class="ope_a ml20">删除</a></td>
                    </tr>
                    <tr>
                    	<td class="t_username">admin92t4045iy0</td>
                        <td class="t_date">2014/10/10</td>
                        <td class="t_role">注册用户</td>
                        <td class="t_assets">34</td>
                        <td class="t_service">5</td>
                        <td class="t_operation"><a href="#" class="ope_a">修改</a><a href="#" class="ope_a ml20">删除</a></td>
                    </tr>
                    <tr>
                    	<td class="t_username">admin92t4045iy0</td>
                        <td class="t_date">2014/10/10</td>
                        <td class="t_role">注册用户</td>
                        <td class="t_assets">34</td>
                        <td class="t_service">5</td>
                        <td class="t_operation"><a href="#" class="ope_a">修改</a><a href="#" class="ope_a ml20">删除</a></td>
                    </tr>
                    <tr>
                    	<td class="t_username">admin92t4045iy0</td>
                        <td class="t_date">2014/10/10</td>
                        <td class="t_role">注册用户</td>
                        <td class="t_assets">34</td>
                        <td class="t_service">5</td>
                        <td class="t_operation"><a href="#" class="ope_a">修改</a><a href="#" class="ope_a ml20">删除</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="supper_table">
        	<table class="user_table" cellpadding="0" cellspacing="0">
            	<thead>
                	<tr>
                    	<th class="t_username">用户名</th>
                        <th class="t_date">创建日期</th>
                        <th class="t_role">用户角色</th>
                        <th class="t_assets">资产数</th>
                        <th class="t_service">服务数</th>
                        <th class="t_operation">操作</th>
                    </tr>
                </thead>
                <tbody>
                	<tr>
                    	<td class="t_username">admin92t4045iy0</td>
                        <td class="t_date">2014/10/10</td>
                        <td class="t_role">超级管理员</td>
                        <td class="t_assets">34</td>
                        <td class="t_service">5</td>
                        <td class="t_operation"><a href="#" class="ope_a">修改</a><a href="#" class="ope_a ml20">删除</a></td>
                    </tr>
                    <tr>
                    	<td class="t_username">admin92t4045iy0</td>
                        <td class="t_date">2014/10/10</td>
                        <td class="t_role">超级管理员</td>
                        <td class="t_assets">34</td>
                        <td class="t_service">5</td>
                        <td class="t_operation"><a href="#" class="ope_a">修改</a><a href="#" class="ope_a ml20">删除</a></td>
                    </tr>
                    <tr>
                    	<td class="t_username">admin92t4045iy0</td>
                        <td class="t_date">2014/10/10</td>
                        <td class="t_role">超级管理员</td>
                        <td class="t_assets">34</td>
                        <td class="t_service">5</td>
                        <td class="t_operation"><a href="#" class="ope_a">修改</a><a href="#" class="ope_a ml20">删除</a></td>
                    </tr>
                    <tr>
                    	<td class="t_username">admin92t4045iy0</td>
                        <td class="t_date">2014/10/10</td>
                        <td class="t_role">超级管理员</td>
                        <td class="t_assets">34</td>
                        <td class="t_service">5</td>
                        <td class="t_operation"><a href="#" class="ope_a">修改</a><a href="#" class="ope_a ml20">删除</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!--尾部部分代码-->
<div class="bottom_bj">
<div class="bottom">
<div class="bottom_main">
  <h3><a href="###">新手入门</a></h3>
  <ul>
    <li><a href="###">新用户注册</a></li>
    <li><a href="###">用户登录</a></li>
    <li><a href="###">找回密码</a></li>
  </ul>
</div>
<div  class="bottom_main">
  <h3><a href="###"> 帮助</a></h3>
  <ul>
    <li><a href="###">常见问题</a></li>
  </ul>
</div>
<div  class="bottom_main">
  <h3><a href="###">厂商合作</a></h3>
  <ul>
    <li><a href="###">华为</a></li>
    <li><a href="###">安恒</a></li>
    <li><a href="###">360</a></li>
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
<li>如未经授权用作他处，将保留追究侵权者法律责任的权利。<br />
  京ICP备11111111号-4 / 京ICP证1111111号<br />
  北京市公安局朝阳分局备案编号:110105000501</li>
</div>
</div>
</div>
<!--尾部部分代码结束-->
<!--模态框-->
<div class="modelbox" id="modelbox"></div>
<div id="box_logoIn" class="box_logoIn user_model">
  <div class="add_ser_top w678">
	<p class="w634">添加用户</p><p id="close"><img src="images/b_exit.jpg" width="25" height="26"></p>
   </div> 
       <div class="regist_form">
      <form  id="form_regist" name="form_regist" method="post">
        <table>
          <tr class="register_tr">
            <td class="regist_title">用户账号</td>
            <td class="regist_input"><input type="text" class="regist_txt"/></td>
            <td class="regist_prompt" style="text-align:left;">4-20位字符，支持中英文，数字，字符组合</td>
          </tr>
          <tr class="register_tr">
            <td class="regist_title">设置密码</td>
            <td class="regist_input"><input type="paddword" class="regist_txt"/></td>
            <td class="regist_prompt" style="text-align:left;">6-20位字符，可使用字母、数字和符号的组合，不建议纯字母、纯数字、纯符号</td>
          </tr>
          <tr class="register_tr">
            <td class="regist_title">确认密码</td>
            <td class="regist_input"><input type="paddword" class="regist_txt"/></td>
            <td class="regist_prompt red_prompt">两次密码输入不一致</td>
          </tr>
          <tr class="register_tr">
            <td class="regist_title">真实姓名</td>
            <td class="regist_input"><input type="text" class="regist_txt"/></td>
            <td class="regist_prompt"></td>
          </tr>
          <tr class="register_tr">
            <td class="regist_title">用户分组</td>
            <td class="regist_input">
                <select class="regist_sel">
                	<option></option>
                </select>
            </td>
            <td class="regist_prompt"></td>
          </tr>
          <tr>
            <td colspan="3"><button class="ser_btn" id="seradd_btn">立即添加</button></td>
          </tr>
        </table>
      </form>
    </div>
</div>
</body>
</html>
