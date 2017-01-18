$(function(){
  //初始化价格
  changePrice();

  //立即购买
  $("#buyNowsys").click(function(){
    var createDate = getCreateDate();
    //orderType
    var type = 1;
    var scanType = $("#num").val();
    var indexPage = $("#indexPage").val();
    var serviceId = 7;

    $.ajax({
      type:"POST",
      async: false,
      url:"getSession.html",
      dataType:"json",
      success:function(data){
        var tempForm = document.createElement("form");
        tempForm.action = "jiGuangselfHelpOrderOpera.html";
        tempForm.method = "post";
        tempForm.style.display = "none";

        var typeInput = document.createElement("input");
        typeInput.type="hidden"; 
        typeInput.name= "type"; 
        typeInput.value= type; 
        tempForm.appendChild(typeInput);
              
        var scanTypeInput = document.createElement("input");
        scanTypeInput.type="hidden"; 
        scanTypeInput.name= "scanType"; 
        scanTypeInput.value= scanType; 
        tempForm.appendChild(scanTypeInput);
              
        var serviceIdInput = document.createElement("input");
        serviceIdInput.type="hidden"; 
        serviceIdInput.name= "serviceId"; 
        serviceIdInput.value= serviceId; 
        tempForm.appendChild(serviceIdInput);
                           
              
        document.body.appendChild(tempForm);
        tempForm.submit();
        document.body.removeChild(tempForm);

      },
      error:function(data){
        if (data.responseText.indexOf("<!DOCTYPE html>") >= 0) { 
          window.location.href = "loginUI.html"; } 
        else { window.location.href = "loginUI.html"; } 
      }
    });
  });

  
  //结算页提交订单
  $("#settlementSys").click(function(){
  	var createDate = getCreateDate();
  	var orderType = $('#orderType').val();
  	var orderDetailId = $("#orderDetailId").val();	//muji
  	var userName =  $(".test_name").text();
    var userAdd = $(".test_add").text();
    var mobile =  $(".test_iphone").text();
    var userId = $("#userIdHidden").val();
  	$.ajax({
  		type: "POST",
  	    async: false, 
  	    url: "saveOrderSys.html", 
  	    data: {"orderDetailId":orderDetailId,    
  			   "createDate":createDate,
  			   "linkname":userName,
  			   "phone":mobile,
  			   "email":userAdd
     			},  
  	     dataType: "json",
  	     success: function(data) {
   			if(data.error){
   				alert("参数值数据异常!!");
   				window.location.href = "index.html";
  		     	    return;
   			}else if(data.assetsStatus == true){
  					alert("订单资产没有验证,请重新下单!");
  		     	    return;
  				}else if(data.timeCompare == false){
  					alert("订单无效,请重新下单!");
  		     		return;
  				}else if(data.orderStatus == false){
  					alert("订单有异常,请重新下单!");
  		     	    return;
  				}else{
   		    	var orderListId = data.orderListId;
  	    			//window.location.href = "cashierUI.html?orderListId="+orderListId;
  	    			//虚拟表单post提交
  			    	var tempForm = document.createElement("form");
  					tempForm.action = "cashierUI.html";
  					tempForm.method = "post";
  					tempForm.style.display = "none";
  				
  					var orderListIdInput = document.createElement("input");
  					orderListIdInput.type="hidden"; 
  					orderListIdInput.name= "orderListId"; 
  					orderListIdInput.value= orderListId; 
  					tempForm.appendChild(orderListIdInput);
  				
  					document.body.appendChild(tempForm);
  					tempForm.submit();
  					document.body.removeChild(tempForm);
  				}
  	    }, 
  	    error: function(data){ 
  	    	alert("baocuo");
  	    } 
  	});
  });
  
});

function getCreateDate(){
  var now = new Date();
  var createDate = now.getFullYear()+"-"+((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+"-"+(now.getDate()<10?"0":"")+now.getDate()+" "+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
  return createDate;
}
//计算价格
function changePrice(){
  //var serviceId = $('#serviceId').val();
  var serviceId = 7;
  var scanType = $("#num").val();
            
  $.ajax({ type: "POST",
    async: false, 
    url: "syscalPrice.html", 
    //serviceId及scan_type
    data: {"serviceId":serviceId,"scanType":scanType},
    dataType: "json",
    success: function(data) {
      var price = data.price;
      $("#price").html(price);
    }, 
    
    error: function(data){ 
      if (data.responseText.indexOf("<!DOCTYPE html>") >= 0) { 
        window.location.href = "loginUI.html"; } 
      else { window.location.href = "loginUI.html"; } 
      } 
  });
}