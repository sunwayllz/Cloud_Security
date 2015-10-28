function saveAsset() {
	var assetName =$("#assetName").val();
	var assetAddr = $("#assetAddr").val();
     var addrType = $('input:radio[name="addrType"]:checked').val();
     var purpose = $("#purpose").val();
     var prov = $("#districtId").val();
     var patrn=/[`~@#$%^&*()+<>"{},\\;'[\]]/im;  
     if(patrn.test(assetAddr)){  
         alert("提示信息：您输入的数据含有非法字符！");  
         return false;     
     }
	//获取选中的radio的值
	if(assetName == null || assetName == ""){
		$("#assetName_msg").html("请输入资产名称");
	}
	else if(assetName.length>25){
			$("#assetName_msg").html("资产名称长度不能超过25个字符！");
	}else if(assetAddr==null || assetAddr == ""){
			$("#assetName_msg").html("");
			$("#assetAddr_msg").html("请输入资产地址");
	}else if(assetAddr.length>50){
			 $("#assetName_msg").html("");
			 $("#assetAddr_msg").html("资产地址长度不能超过50个字符！");
	}else if(assetAddr.indexOf("gov.cn")!=-1){
		   $("#assetName_msg").html("");
		   $("#assetAddr_msg").html("输入资产地址不能包含'gov.cn'！");
	}else if((addrType.length==4 && assetAddr.substring(0,5)=='https') || (addrType.length==5 && assetAddr.substring(0,5)=='http:')){
		$("#assetName_msg").html("");
		$("#assetAddr_msg").html("资产类型与资产地址填写不一致!");
	}else if(prov == -1){
		$("#assetName_msg").html("");
		$("#assetAddr_msg").html("");
		$("#location_msg").html("请选择资产所在物理地址！");
	}else if(purpose==-1){
		$("#assetName_msg").html("");
		$("#assetAddr_msg").html("");
		$("#location_msg").html("");
		$("#assetUsage_msg").html("请选择资产用途！");
	}else{
		$("#assetName_msg").html("");
		$("#assetAddr_msg").html("");
		$("#location_msg").html("");
		$("#assetUsage_msg").html("");
			//验证资产是否重复
			$.ajax({
		        type: "POST",
		        url: "asset_addrIsExist.html",
		        data: {"addr":assetAddr,"name": encodeURI(assetName),"addrType":addrType},
		        dataType:"json",
		        success: function(data){
		            if(data.msg){
		            	$("#assetAddr_msg").html("资产名称或地址重复!");
		            }else{
		            	$("#assetAddr_msg").html("");
		            	//资产数验证
		            	$.ajax({
		    		        type: "POST",
		    		        url: "asset_CountOver.html",
		    		        data: {},
		    		        dataType:"json",
		    		        success: function(data){
		    		            if(data.msg){
		    		            	alert("管理的资产数不能大于" + data.allowCount);
		    		            }else{
		    		            	$("#saveAsset").submit();
		    		            }
		    		        },
		    		     }); 
		            }
		        },
		     }); 
		}
	
}
function searchAssetCombine(){
	$("#searchAssetForm").submit();
}
//修改资产
function editAsset(){
		var assetName =$("#editAssetName").val();
	var assetAddr = $("#editAssetAddr").val();
     var addrType = $('input:radio[name="addrType"]:checked').val();
    
//     var patrn=/[`~!@#$%^&*()_+<>?:"{},.\/;'[\]]/im; 
     var patrn=/[`~@#$%^&*()+<>"{},\\;'[\]]/im;  
     if(patrn.test(assetAddr)){  
         alert("提示信息：您输入的数据含有非法字符！");  
         return false;     
     }     
     
	//获取选中的radio的值
	if(assetName == null || assetName == ""){
		$("#editAssetName_msg").html("请输入资产名称");
	}
	else if(assetName.length>25){
			$("#editAssetName_msg").html("资产名称长度不能超过25个字符！");
	}
	else if(assetAddr==null || assetAddr == ""){
		$("#editAssetAddr_msg").html("请输入资产地址");
	}else if(assetAddr.length>50){
		 $("#editAssetAddr_msg").html("资产地址长度不能超过50个字符！");
	}else if(assetAddr.indexOf("gov.cn")!=-1){
	   $("#editAssetAddr_msg").html("输入资产地址不能包含'gov.cn'！");
	}else if((addrType.length==4 && assetAddr.substring(0,5)=='https') || (addrType.length==5 && assetAddr.substring(0,5)=='http:')){
		$("#editAssetAddr_msg").html("资产类型与资产地址填写不一致!");
	}else{
		$("#editAssetAddr_msg").html("");
		$("#editAsset").submit();
	}
	
}
//删除资产
function deleteAsset(id){
	var assetId = id;
	//检查订单资产表里是否有此项记录，若有：则提示不能删除，若无：则可以删除
	$.post("/cloud-security-platform/checkdelete.html", {"id" : assetId}, function(data, textStatus) {
		if (data.count>0){
			alert("您的订单中包含此资产，不能删除！");
			return false;
		}else{
			if (window.confirm("确实要删除吗?")==true) {
				window.location.href="/cloud-security-platform/deleteAsset.html?id="+assetId;
			} else {
				return;
			}
		}
	});
}
//隐藏显示div
function showAndHiddenRadio(){
	var codeStyle = "";
	var zt = document.getElementsByName("verification_msg");
	for(var i=0;i<zt.length;i++){ 
			if(zt[i].checked) { 
				codeStyle = zt[i].value;
			} 
		}
	//隐藏div
	if(codeStyle==="codeVerification"){
		 document.getElementById("fileVerificationID").style.display="none";
		 document.getElementById("codeVerificationID").style.display="block";
	}
	if(codeStyle==="fileVerification"){
		document.getElementById("codeVerificationID").style.display="none";
		document.getElementById("fileVerificationID").style.display="block";
	}
}
//资产验证
function verificationAsset(){
	var id = $("#hiddenId").val();
	var codeStyle = "";
	var zt = document.getElementsByName("verification_msg");
	for(var i=0;i<zt.length;i++){ 
			if(zt[i].checked) { 
				codeStyle = zt[i].value;
			} 
		}
//	var code1 = document.getElementById('code').innerHTML;
	var code1 = $("#code").val();
	$.ajax({
        type: "POST",
        url: "/cloud-security-platform/asset_verification.html",
        data: {"code1":code1,"id":id,"codeStyle":codeStyle},
        dataType:"json",
        success: function(data){
            if(data.msg=="1"&&data.status=="0"){
            	alert("验证成功");
            	$("#verificationAssetForm").submit();
            }else{
            	alert("验证失败");
            	return;
            }
        },
     }); 
}
//复制文本
function copyToClipBoard(){ 
//	var clipBoardContent=''; 
//	clipBoardContent+=document.getElementById('code').innerHTML; 
//	alert(clipBoardContent);
//	window.clipboardData.setData("Text",clipBoardContent); 
//	$("#copyToClipBoard").html("已复制");
    var clipBoardContent="";
    clipBoardContent+=document.getElementById('code').innerHTML;
    if(window.clipboardData){ 
           window.clipboardData.clearData(); 
           window.clipboardData.setData("Text", clipBoardContent);
    }else if(navigator.userAgent.indexOf("Opera") != -1){ 
           window.location = clipBoardContent; 
    }else if (window.netscape){ 
           try{ 
                  netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
           }catch (e){ 
                  alert("您的当前浏览器设置已关闭此功能！请按以下步骤开启此功能！\n新开一个浏览器，在浏览器地址栏输入'about:config'并回车。\n然后找到'signed.applets.codebase_principal_support'项，双击后设置为'true'。\n声明：本功能不会危极您计算机或数据的安全！"); 
           } 
           var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard); 
           if (!clip) return; 
           var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable); 
           if (!trans) return; 
           trans.addDataFlavor('text/unicode'); 
           var str = new Object(); 
           var len = new Object(); 
           var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString); 
           var copytext = clipBoardContent; 
           str.data = copytext; 
           trans.setTransferData("text/unicode",str,copytext.length*2); 
           var clipid = Components.interfaces.nsIClipboard; 
           if (!clip) return false; 
           clip.setData(trans,null,clipid.kGlobalClipboard); 
    }
    alert("已成功复制！");
    return true;
	} 