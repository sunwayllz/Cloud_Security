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
<script type="text/javascript" src="${ctx}/source/scripts/common/jquery.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/common/jquery.form.js"></script>
<!--  <link href="${ctx}/source/serviceManage/servDetails/styles.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/serviceManage/resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
<link href="${ctx}/source/serviceManage/data/styles.css" type="text/css" rel="stylesheet"/>
-->
<link href="${ctx}/source/adminCss/mian.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/adminCss/head_bottom.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/adminCss/backstage.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/source/adminCss/fileupload.css" type="text/css" rel="stylesheet"/>
<link href="${ctx}/source/images/chinatelecom.ico" rel="shortcut icon" />
<script type="text/javascript" src="${ctx}/source/serviceManage/zxxFile.js"></script>
<script type="text/javascript" src="${ctx}/source/scripts/adminJs/servManage.js"></script>
<style type="text/css">
.regist_input {
    width: 300px;
}
.regist_prompt{
	width: 450px;
	color:red;
}
.checkbox_lable{
	padding-right: 50px;
	padding-left: 20px;
}
</style>
<script type="text/javascript">
$(function(){
//保存上传图片的名字
$("#servDetailHidden").val('');
//编辑详情时，编辑前存的图片
$("#resServDetailHidden").val('');
$("#preview").empty();
var iconList = new Array();
var parent = '${parent}';
if(parent == 'API'){
	$("#u12").hide();
	$("#u15").hide();
	//$("#u16").hide();
	//$("#u27").hide();
	//$("#u30").hide();
	//$("#u26").hide();
} else {
	$("#u12").show();
	$("#u15").show();
	//$("#u16").show();
	//$("#u27").show();
	//$("#u30").show();
	//$("#u26").show();
}
//添加行按钮
$("#u27_input").click(function(){
	var html = '<div id="u31" class="ax_text_field positionr">'
	        +'<input class="regist_txt"  id="u31_input" name="scanType" type="text" value=""/>'
	        +'</div>';
	$("#u17").append(html);
});
//删除行按钮
$("#u30_input").click(function(){
	$("input[name='scanType']:last").parent().remove();
});

//重置按钮
$(".u22_input").click(function(){
	$("#u2_input").val('');
	$("#u5_input").val('');
	$("input[name='servType']").each(function(){
	if($(this).attr('checked')){
		$(this).removeAttr('checked');
	}
	});
	$("#u14_input").val('');
	$("input[name='scanType']").each(function(){
		$(this).val('');
	});
	$("#u39_input").val('');
});

//上传详情图片/填写API信息
$("#u34_input").bind('change',function(){
	if($(this).val() == '0'){
		$("#u39").hide();
		$("#u19").show();
		$("#u28").show();
		$("#u29").show();
	} else {
		$("#u39").show();
		$("#u19").hide();
		$("#u28").hide();
		$("#u29").hide();
	}
});

var serviceDetail = '${serviceDetail}';
if(serviceDetail != null && serviceDetail != ''){
	var detailFlag = '${serviceDetail.detailFlag}';
	if(detailFlag != null && detailFlag != '' && detailFlag == '0'){
			var detailIcon = '${detailIcon}';
		if(detailIcon != null && detailIcon != ''){
			var detailIconArray = detailIcon.split(";");
			for(var i=0; i<detailIconArray.length; i++){
				var imgsrc = 'http://219.141.189.186:60080/cloud-security-platform/source/images/portal/' + detailIconArray[i];
				var html = '';
				html = html + '<div id="resUploadList_'+ i +'" class="upload_append_list"><p><strong>' + detailIconArray[i] + '</strong>'+ 
					'<a href="javascript:" class="upload_delete" title="删除" data-index="'+ i +'">删除</a><br />' +
					'<img id="resUploadImage_' + i + '" src="' + imgsrc + '" class="upload_image" /></p>'+ 
					'<span id="resUploadProgress_' + i + '" class="upload_progress"></span>' +
				'</div>';
				$("#preview").append(html);
				iconList.push(detailIconArray[i]);
				$("#resServDetailHidden").val(iconList.join(";"));
			}
			$("#uploadHtml").val($('#preview').html());
		}
	}
}

//点击图片上的删除
$(".upload_delete").click(function(){
	var currentIcon = $(this).siblings().eq(0).text();
	iconList.splice($.inArray(currentIcon,iconList),1);
	$("#resServDetailHidden").val(iconList.join(";"));
	$(this).parent().remove();
	$("#uploadHtml").val($('#preview').html());
});

});
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
		        <li class="b_current"><a href="${ctx}/adminServUI.html" class="white">服务管理</a></li>
		        <li><a href="${ctx}/adminDataAssetUI.html" class="white">资产分析</a></li>
		        <li><a href="${ctx}/adminUserAnalysisUI.html" class="white">用户分析</a></li>
		        <!-- <li><a href="${ctx}/adminDataAnalysisUI.html" class="white">订单分析</a></li>-->
		        <li><a href="${ctx}/orderformanalyse.html" class="white">订单分析</a></li>
		        <li><a href="${ctx}/adminWarnAnalysisUI.html" class="white">告警分析</a></li>
		        <li><a href="${ctx}/equResourceUI.html" class="white">设备资源管理</a></li>
		        <li><a href="${ctx}/adminSystemManageUI.html" class="white">系统管理</a></li>
		        <li><a href="${ctx}/adminAPIAnalysisUI.html" class="white">API分析</a></li>
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
    <div id="base" class="main_center" style="padding-top: 30px;padding-bottom: 20px;">
	  <input type="hidden" id="uploadHtml" value=""/>
	  <input type="hidden" id="servDetailHidden" value=""/>
	  <input type="hidden" id="resServDetailHidden" value=""/>
	  <table>
	  		<tr class="register_tr">
	  			<td class="regist_title" id="u1">价格标题：</td>
	  			<td class="regist_input" id="u2">
	  				<input class="regist_txt"  id="u2_input" type="text" value="${serviceDetail.priceTitle}"/>
	  			</td>
	  		</tr>
	  		<tr class="register_tr">
	  			<td class="regist_title" id="u4">选类型标题：</td>
	  			<td class="regist_input" id="u5">
	  				<input class="regist_txt" id="u5_input" type="text" value="${serviceDetail.typeTitle }"/>
	  			</td>
	  		</tr>
	  		<tr class="register_tr">
	  			<td class="regist_title" id="u7">选类型：</td>
	  			<td class="regist_input" id="u8">
		  			<label for="u8_input" class="checkbox_lable" >
			          	<c:choose>
				          	<c:when test="${serviceDetail.servType == 0 or serviceDetail.servType ==1}">
				          		<input id="u8_input" type="checkbox" name="servType" value="1" checked/>  
				          	</c:when>
				          	<c:otherwise>
				          		<input id="u8_input" type="checkbox" name="servType" value="1"/> 
				          	</c:otherwise>
			          	</c:choose>         
			            <span>单次</span>      
			        </label>
			        
			        <label for="u10_input" class="checkbox_lable" >
			            <c:choose>
				          	<c:when test="${serviceDetail.servType == 0 or serviceDetail.servType ==2}">
				          		<input id="u10_input" type="checkbox" name="servType" value="2" checked/>  
				          	</c:when>
				          	<c:otherwise>
				          		<input id="u10_input" type="checkbox" name="servType" value="2"/>
				          	</c:otherwise>
			          	</c:choose>    
			            
			            <span>长期</span>           
        			</label>
	  			</td>
	  			<td class="regist_prompt">
	  				<span>备注：如果当前服务只有单次或者长期，详情页面不显示这一行</span>
	  			</td>
	  		</tr>
	  		<tr class="register_tr" id="u12">
	  			<td class="regist_title" id="u13">服务频率标题：</td>
	  			<td id="u14">
	  				<input class="regist_txt" id="u14_input" type="text" value="${serviceDetail.ratesTitle }"/>
	  			</td>
	  			<td></td>
	  		</tr>
	  		<tr class="register_tr" id="u15">
	  			<td class="regist_title" id="u16" style="vertical-align:top;">服务频率：</td>
	  			<td class="regist_input" id="u17">
	  				<c:choose>
			          	<c:when test="${scanTypeList==null or scanTypeList.size() == 0}">
			          		<div id="u31" class="ax_text_field positionr">
						        <input class="regist_txt" id="u31_input" name="scanType" type="text" value=""/>
						    </div>
			          	</c:when>
			          	<c:otherwise>
				          <c:forEach var="scanType" items="${scanTypeList }">
						      <div id="u31" class="ax_text_field positionr">
						        <input class="regist_txt" id="u31_input" name="scanType" type="text" value="${scanType.scan_name }"/>
						      </div>
					      </c:forEach>
			          	</c:otherwise>
			        </c:choose>
	  			</td>
	  			<td class="regist_prompt" style="vertical-align:top;">
		  			<div id="u27" class="ax_html_button positionr" style="float:left;">
			        	<input id="u27_input" type="submit" value="添加行"/>
			        </div>
			        <div id="u30" class="ax_html_button positionr" style="float:left;padding-left:10px;">
			        	<input id="u30_input" type="submit" value="删除行"/>
			      	</div>
			      	<div id="u26" class="text positionr" style="float:left;padding-left:10px;">
			          <p><span>备注：根据配置服务频率功能显示</span></p>
			        </div>
	  			</td>
	  		</tr>
	  		<tr class="register_tr">
	  			<td class="regist_title" id="u33">详细信息选项：</td>
	  			<td class="regist_input" id="u34">
	  				<c:choose>
			        	<c:when test="${serviceDetail.detailFlag == '1' }">
			        		<select class="regist_sel" id="u34_input" >
				        		<option value="0">上传详情图片</option>
				        		<option value="1" selected>填写API信息</option>
				        	</select>
			        	</c:when>
			        	<c:otherwise>
				        	<select class="regist_sel" id="u34_input" >
				        		<option value="0" selected>上传详情图片</option>
				        		<option value="1">填写API信息</option>
				        	</select>
			        	</c:otherwise>
        			</c:choose>
	  			</td>
	  			<td></td>
	  		</tr>
	  		<tr class="register_tr">
	  			<td class="regist_title" id="u18" style="vertical-align:top;">服务详细信息：</td>
	  			<td class="regist_input" colspan="2">
	  				<c:choose>
					      <c:when test="${serviceDetail.detailFlag == '1' }">
					     	<div id="u19" class="ax_text_field positionr" style="display:none;">
						        <form id="uploadForm" action="uploadDetail.html" method="post" enctype="multipart/form-data">
						              <div class="upload_box">
						                  <div class="upload_main">
						                      <div class="upload_choose">
						                          <input id="fileImage" type="file" size="30" name="fileselect" multiple />
						                          <span id="fileDragArea" class="upload_drag_area">或者将图片拖到此处</span>
						                      </div>
						                      <div id="preview" class="upload_preview">
						                      </div>
						                  </div>
						                  <div class="upload_submit">
						                      <button type="button" id="fileSubmit" class="upload_submit_btn">确认上传图片</button>
						                  </div>
						              </div>
						         </form>
					      	</div>
					      	<div id="u39" class="ax_text_field positionr">
	      	    			<textarea class="regist_txt" id="u39_input">${serviceDetail.detailIcon }</textarea>
	      	    		  </div>
					      </c:when>
					      <c:otherwise>
					      <div id="u19" class="ax_text_field positionr">
					        <form id="uploadForm" action="uploadDetail.html" method="post" enctype="multipart/form-data">
					              <div class="upload_box">
					                  <div class="upload_main">
					                      <div class="upload_choose">
					                          <input id="fileImage" type="file" size="30" name="fileselect" multiple />
					                          <span id="fileDragArea" class="upload_drag_area">或者将图片拖到此处</span>
					                      </div>
					                      <div id="preview" class="upload_preview">
					                      </div>
					                  </div>
					                  <div class="upload_submit">
					                      <button type="button" id="fileSubmit" class="upload_submit_btn">确认上传图片</button>
					                  </div>
					              </div>
					         </form>
					      </div>
						  <div id="u39" class="ax_text_field positionr" style="display:none;">
	      	    			<textarea class="regist_txt" id="u39_input">${serviceDetail.detailIcon }</textarea>
	      	    		  </div>
					      </c:otherwise>
					      </c:choose>
	  			</td>
	  			<c:if test="${serviceDetail.detailFlag == '1' }">
	  				<td class="regist_prompt" id="u29" style="width:120px;display:none;">上传多张图片</td>
	  			</c:if>
	  			<c:if test="${serviceDetail.detailFlag != '1' }">
	  				<td class="regist_prompt" id="u29" style="width:120px;" >上传多张图片</td>
	  			</c:if>
	  		</tr>
	  </table>
	  <div id="uploadInf" class="upload_inf" style="text-align: center;">
		<c:choose>
			<c:when test="${serviceDetail == null or serviceDetail == ''}">
				<input class="ser_btn" id="u21_input" type="button" value="保存" onclick="saveDetails('${serviceId}','${parent}',true);"/>
			</c:when>
			<c:otherwise>
				<input class="ser_btn" id="u21_input" type="button" value="保存" onclick="saveDetails('${serviceId}','${parent}',false);"/>
			</c:otherwise>
		</c:choose>     	
		<input class="ser_btn u22_input" type="reset" value="重置"/>
	</div>
    </div>
    </div>
    <script>
var params = {
	fileInput: $("#fileImage").get(0),
	dragDrop: $("#fileDragArea").get(0),
	upButton: $("#fileSubmit").get(0),
	url: $("#uploadForm").attr("action"),
	filter: function(files) {
		var arrFiles = [];
		for (var i = 0, file; file = files[i]; i++) {
			if (file.type.indexOf("image") == 0) {
				if (file.size >= 512000) {
					alert('您这张"'+ file.name +'"图片大小过大，应小于500k');	
				} else {
					arrFiles.push(file);	
				}			
			} else {
				alert('文件"' + file.name + '"不是图片。');	
			}
		}
		return arrFiles;
	},
	onSelect: function(files) {
		var html = '', i = 0;
		html = $("#uploadHtml").val();
		$("#preview").html('<div class="upload_loading"></div>');
		var funAppendImage = function() {
			file = files[i];
			if (file) {
				var reader = new FileReader();
				reader.onload = function(e) {
					html = html + '<div id="uploadList_'+ i +'" class="upload_append_list"><p><strong>' + file.name + '</strong>'+ 
						'<a href="javascript:" class="upload_delete" title="删除" data-index="'+ i +'">删除</a><br />' +
						'<img id="uploadImage_' + i + '" src="' + e.target.result + '" class="upload_image" /></p>'+ 
						'<span id="uploadProgress_' + i + '" class="upload_progress"></span>' +
					'</div>';	
					i++;
					funAppendImage();
				}
				reader.readAsDataURL(file);
			} else {
				$("#preview").html(html);
				if (html) {
					//删除方法
					$(".upload_delete").click(function() {
						ZXXFILE.funDeleteFile(files[parseInt($(this).attr("data-index"))]);
						return false;	
					});
					//提交按钮显示
					$("#fileSubmit").show();	
				} else {
					//提交按钮隐藏
					$("#fileSubmit").hide();	
				}
			}
		};
		funAppendImage();		
	},
	onDelete: function(file) {
		$("#uploadList_" + file.index).fadeOut();
	},
	onDragOver: function() {
		$(this).addClass("upload_drag_hover");
	},
	onDragLeave: function() {
		$(this).removeClass("upload_drag_hover");
	},
	onProgress: function(file) {
	$("#uploadProgress_" + file.index).show();
	},
	onSuccess: function(file, response) {
		alert("图片" + file.name +"上传成功!");
	},
	onFailure: function(file) {
		alert("图片" + file.name + "上传失败！");	
		$("#uploadImage_" + file.index).css("opacity", 0.2);
	},
	onComplete: function() {
		//提交按钮隐藏
		/* $("#fileSubmit").hide(); */
		//file控件value置空
		$("#fileImage").val("");
		$("#uploadInf").append("<p>当前图片全部上传完毕，可继续添加上传。</p>");
	}
};
ZXXFILE = $.extend(ZXXFILE, params);
ZXXFILE.init();
</script>
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