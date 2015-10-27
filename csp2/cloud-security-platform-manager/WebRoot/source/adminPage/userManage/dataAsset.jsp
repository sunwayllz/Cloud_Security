<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>系统管理</title>
<link href="${ctx}/source/adminCss/mian.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/adminCss/head_bottom.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/adminCss/backstage.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/adminCss/jquery-ui.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/adminCss/popBox.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/source/scripts/common/jquery.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/assetJs/backstage.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/assetJs/jquery.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/assetJs/jquery.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/common/zezao.js"></script>
<script>
</script>
</head>
<body>
<!--头部代码-->
<div class="head_bj b_head">
  <div class="head">
    <div class="logo"><img src="${ctx}/source/adminImages/b_logo2.jpg"/></div>
    <div class="list b_list">
      <ul>
        <li class="b_current"><a href="${ctx}/adminUserManageUI.html" class="white">用户管理</a></li><!--
        <li><a href="${ctx}/adminchinas.html" target="_blank" class="white">安全态势</a></li>
        --><li><a href="${ctx}/adminServUI.html" class="white">服务管理</a></li>
        <li><a href="${ctx}/adminDataAssetUI.html" class="white">资产分析</a></li>
        <li><a href="${ctx}/adminUserManageUI.html" class="white">用户分析</a></li>
        <li><a href="${ctx}/adminDataAnalysisUI.html" class="white">订单分析</a></li>
        <li><a href="${ctx}/adminDataAnalysisUI.html" class="white">告警分析</a></li>
        <li><a href="${ctx}/adminDataAnalysisUI.html" class="white">设备资源管理</a></li>
        <li style="border-right:1px solid #1f8db4;"><a href="${ctx}/adminSystemManageUI.html" class="white">系统管理</a></li>
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
    	<ul class="main_nav tabList clearfix">
        	<li class="statistics active">资产统计<i></i></li>
            <li class="analyse">资产历史告警分析<i></i></li>
        </ul>
        <div class="tabBox tabCont">
        	<div class="item tabItem analyseBox" style="display:block">
            		<ul class="analyse_list anlist clearfix">
                        <li class="active">资产地理位置统计分析<b>|</b></li>
                        <li>资产用途统计分析<b>|</b></li>
                        <li>资产服务情况分析<b>|</b></li>
                    </ul>
                	<div class="analyse_tabCont">
                        <div class="analyse_tabItem" style="display:block">
                       
                            <!--资产地理位置统计分析-->
                            <form class="clearfix analysecent" name="assetForm"  id="assetForm" action="${ctx}/adminDataAssetUI.html" method="post">
                                 <div class="analyse_lable fl">
                                    <label>资产所属用户</label>
                                    <select class="text" name="assetUserType">
                                        <option value="0">请选择</option>
                                        <option value="3">企业用户</option>
                                        <option value="2">个人用户</option>
                                    </select>
                                </div>
                                 <div class="analyse_lable fl">
                                    <label>资产所在省</label>
                                    <select class="text" id="prov" name="prov" onchange="getCitys(this.value)">
                                        <option value="" >请选择</option>
                                    </select>
                                </div>
                                <div class="analyse_lable fl">
                                    <label>资产所在市</label>
                                    <select class="text" id="city" name="city" >
                                        <option value="" >请选择</option>
                                    </select>
                                </div>
                                <input type="submit" class="sub" value="">
                            </form>
                            <div class="tableBox">
                            	<style>
                                	.tableBox table th,.tableBox table td{ width:194px;}
									
                                </style>
                                <table cellpadding="0" cellspacing="0" border="1" bordercolor="#e0e0e0">
                                    <thead>
                                        <tr>
                                            <th>资产所属用户</th>
                                            <th>资产所在省</th>
                                            <th>资产所在市</th>
                                            <th>资产数量</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                           
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                           
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                           
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        
                        </div>
                        <div class="analyse_tabItem">
                 			 <!--资产用途统计分析-->
                            <form class="clearfix analysecent">
                                
                                
                                 <div class="analyse_lable fl">
                                    <label>资产所属用户</label>
                                    <select class="text">
                                        <option>aaa</option>
                                    </select>
                                </div>
                                 <div class="analyse_lable fl">
                                    <label>资产用途</label>
                                    <select class="text">
                                        <option>公共服务</option>
                                        <option>信息发布</option>
                                        <option>其他</option>
                                    </select>
                                </div>
                                
                                <input type="submit" class="sub" value="">
                            </form>
                            <div class="tableBox">
                            	<style>
                                	.tableBox table th,.tableBox table td{ width:260px;}
									
                                </style>
                                <table cellpadding="0" cellspacing="0" border="1" bordercolor="#e0e0e0">
                                    <thead>
                                        <tr>
                                            <th>资产所属用户</th>
                                            <th>资产用途</th>
                                            <th>资产数量</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="analyse_tabItem">
                        	 <!--资产服务情况统计-->
                            <form class="clearfix analysecent">
                                
                                
                                 <div class="analyse_lable fl">
                                    <label>资产所属用户</label>
                                    <select class="text">
                                        <option>aaa</option>
                                    </select>
                                </div>
                                 <div class="analyse_lable fl">
                                    <label>资产用途</label>
                                    <select class="text">
                                        <option>aaa</option>
                                    </select>
                                </div>
                                <div class="analyse_lable fl">
                                    <label>统计开始时间</label>
                                    <input type="text" class="text" value="2012-02-02" style="width:133px;">
                                    <label>-结束时间</label>
                                    <input type="text" class="text" value="2012-02-02" style="width:133px;">
                                </div>
                                <input type="submit" class="sub" value="">
                            </form>
                            <div class="tableBox">
                            	<style>
                                	.tableBox table th,.tableBox table td{ width:260px;}
									
                                </style>
                                <table cellpadding="0" cellspacing="0" border="1" bordercolor="#e0e0e0">
                                    <thead>
                                        <tr>
                                            <th>资产所属用户</th>
                                            <th>资产用途</th>
                                            <th>订单数量</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                	</div>
            </div>
            <div class="item tabItem analyseBox">
            		<ul class="analyse_list anlist clearfix">
                	<li class="active">资产告警等级统计分析<b>|</b></li>
                    <li>资产告警类型统计分析<b>|</b></li>
                    <li>资产告警趋势分析<b>|</b></li>
                </ul>
                	<div class="analyse_tabCont">
                        <div class="analyse_tabItem" style="display:block">
                    
                            <!--资产告警等级统计分析-->
                            <form class="clearfix analysecent">
                                <div class="analyse_lable fl">
                                    <label>资产名称</label>
                                    <input type="text" class="text">
                                </div>
                                
                                 <div class="analyse_lable fl">
                                    <label>服务类型</label>
                                    <select class="text">
                                        <option>aaa</option>
                                    </select>
                                </div>
                                 <div class="analyse_lable fl">
                                    <label>订单开始时间</label>
                                    <input type="text" class="text" value="2012-02-02">
                                    <label>-结束时间</label>
                                    <input type="text" class="text" value="2012-02-02">
                                </div>
                                <div class="analyse_lable fl">
                                    <label>订单编号</label>
                                    <input type="text" class="text">
                                </div>
                                
                                 <div class="analyse_lable fl">
                                    <label>告警等级</label>
                                    <select class="text">
                                        <option>aaa</option>
                                    </select>
                                </div>
                                <input type="submit" class="sub" value="">
                            </form>
                            <div class="tableBox">
                                <table cellpadding="0" cellspacing="0" border="1" bordercolor="#e0e0e0">
                                    <thead>
                                        <tr>
                                            <th>资产名称</th>
                                            <th>服务类型</th>
                                            <th>订单开始时间</th>
                                            <th>订单结束时间</th>
                                            <th>订单编号</th>
                                            <th>告警等级</th>
                                            <th>告警数量</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        
                        </div>
                        <div class="analyse_tabItem">
                
                            <!--资产告警类型统计分析-->
                            <form class="clearfix analysecent">
                                <div class="analyse_lable fl">
                                    <label>资产名称</label>
                                    <input type="text" class="text">
                                </div>
                                
                                 <div class="analyse_lable fl">
                                    <label>服务类型</label>
                                    <select class="text">
                                        <option>aaa</option>
                                    </select>
                                </div>
                                 <div class="analyse_lable fl">
                                    <label>订单开始时间</label>
                                    <input type="text" class="text" value="2012-02-02">
                                    <label>-结束时间</label>
                                    <input type="text" class="text" value="2012-02-02">
                                </div>
                                <div class="analyse_lable fl">
                                    <label>订单编号</label>
                                    <input type="text" class="text">
                                </div>
                                
                                 <div class="analyse_lable fl">
                                    <label>告警名称</label>
                                    <input type="text" class="text">
                                </div>
                                <input type="submit" class="sub" value="">
                            </form>
                            <div class="tableBox">
                                <table cellpadding="0" cellspacing="0" border="1" bordercolor="#e0e0e0">
                                    <thead>
                                        <tr>
                                            <th>资产名称</th>
                                            <th>服务类型</th>
                                            <th>订单开始时间</th>
                                            <th>订单结束时间</th>
                                            <th>订单编号</th>
                                            <th>告警名称</th>
                                            <th>告警数量</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        
                        </div>
                    <div class="analyse_tabItem">
                    	<!--资产警告趋势分析-->
                            <form class="clearfix analysecent">
                                <div class="analyse_lable fl">
                                    <label>资产名称</label>
                                    <input type="text" class="text">
                                </div>
                                
                                 <div class="analyse_lable fl">
                                    <label>服务类型</label>
                                    <select class="text">
                                        <option>aaa</option>
                                    </select>
                                </div>
                                 <div class="analyse_lable fl">
                                    <label>订单开始时间</label>
                                    <input type="text" class="text" value="2012-02-02">
                                    <label>-结束时间</label>
                                    <input type="text" class="text" value="2012-02-02">
                                </div>
                                
                                <input type="submit" class="sub" value="">
                            </form>
                            <div class="tableBox">
                                <div class="chart">
                                	<img src="images/chart.jpg" alt="">
                                </div>
                            </div>
                    
                    </div>
                </div>
            </div>
        
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
