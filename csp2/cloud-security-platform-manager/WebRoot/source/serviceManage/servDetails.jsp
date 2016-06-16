﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
    <title>网站安全帮-服务详情维护</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<script type="text/javascript" src="${ctx}/source/scripts/common/jquery.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/common/jquery-1.7.1.min.js"></script>
<link href="${ctx}/source/serviceManage/servDetails/styles.css" type="text/css" rel="stylesheet" /><!--
<script type="text/javascript" src="${ctx}/source/serviceManage/servDetails/data.js"></script>
--><link href="${ctx}/source/serviceManage/resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
<link href="${ctx}/source/serviceManage/resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
<link href="${ctx}/source/serviceManage/data/styles.css" type="text/css" rel="stylesheet"/>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/axQuery.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/globals.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axutils.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/annotation.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/axQuery.std.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/doc.js"></script>
<script src="${ctx}/source/serviceManage/data/document.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/messagecenter.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/events.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/action.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/expr.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/geometry.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/flyout.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/ie.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/model.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/repeater.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/sto.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/utils.temp.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/variables.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/drag.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/move.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/visibility.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/style.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/adaptive.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/tree.js"></script><!--
<script src="${ctx}/source/serviceManage/resources/scripts/axure/init.temp.js"></script>
--><script src="${ctx}/source/serviceManage/resources/scripts/axure/legacy.js"></script>
<script src="${ctx}/source/serviceManage/resources/scripts/axure/viewer.js"></script>
<script type="text/javascript">
  $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
  $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
  $axure.utils.getReloadPath = function() { return 'resources/reload.html'; };
</script>
<link href="${ctx}/source/adminCss/backstage.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${ctx}/source/serviceManage/servManage.js"></script>

  </head>
  <body>
    <div id="base" class="">
      <div id="u6" class="ax_paragraph">
        <img id="u6_img" class="img " src="${ctx}/source/serviceManage/resources/images/transparent.gif"/>

        <div id="u7" class="text">
          <p><span>选类型：</span></p>
        </div>
      </div>


      <div id="u8" class="ax_checkbox">
        <label for="u8_input">

          <div id="u9" class="text">
            <p><span>单次</span></p>
          </div>
        </label>
        <input id="u8_input" type="checkbox" name="scanTypeCheck" value="1"/>
      </div>


      <div id="u10" class="ax_checkbox">
        <label for="u10_input">

          <div id="u11" class="text">
            <p><span>长期</span></p>
          </div>
        </label>
        <input id="u10_input" type="checkbox" name="scanTypeCheck" value="2"/>
      </div>

       <!-- Unnamed (Shape) -->
      <div id="u17" class="ax_paragraph">
        <img id="u17_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u18" class="text">
          <p><span>服务频率：</span></p>
        </div>
      </div>

      

      <div id="u21" class="ax_html_button">
        <input id="u21_input" type="button" value="保存" onclick="saveDetails('${serviceId}','${parent}');"/>
      </div>


      <div id="u22" class="ax_html_button">
        <input id="u22_input" type="submit" value="重置"/>
      </div>


      <div id="u23" class="ax_paragraph">
        <img id="u23_img" class="img " src="${ctx}/source/serviceManage/resources/images/transparent.gif"/>

        <div id="u24" class="text">
          <p><span>备注：</span><span>如果当前</span><span>服务只有单次或者长期，详情页面不显示</span><span>这一行</span></p>
        </div>
      </div>
      <div id="test0">
		<div id="test1">
      <div id="u19" class="ax_text_field"  style="position: absolute;left: 130px;width: 200px;height: 25px;">
        <input id="u19_input" type="text" value=""/>
      </div>

      <div id="u20" class="ax_html_button" >
        <input id="u20_input" type="button" class="addRate" value="添加行"/>
      </div>

      <div id="u32" class="ax_html_button" style="left:460px">
        <input id="u32_input" type="button" class="delRate" value="删除行"/>
      </div>
      </div>
		</div>
    </div>
    <script type="text/javascript">
$(function(){
	$('.addRate').click(function(){
		
			$(this).parents('#test0').append($("#test1").clone(true));
			
	});
	$('.delRate').click(function(){

		$(this).parents('#test1').remove();	
		
	});
});

</script>
  </body>
</html>
