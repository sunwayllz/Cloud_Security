$(function(){
	
    //选项卡
$('.tabList li').click(function(){
	var index=$(this).index();
	//alert("tabList"+index);
	$(this).addClass('active').siblings('li').removeClass('active');
	$('.tabCont .tabItem:eq('+index+')').show().siblings().hide();
});
	
	
	
$('.anlist li').click(function(){
	var index=$(this).index();
	//alert("anlist"+index);
	$(this).addClass('active').siblings('li').removeClass('active');
	
	$(this).parent('.anlist').siblings('.analyse_tabCont').children('.analyse_tabItem:eq('+index+')').show().siblings().hide();
	
});



$('.tableBox tbody tr:even').css('background','#fafafa')	

//select切换
$('.user_select').change(function(){
	var val=$(this).val();
	if(val==1)
	{
		$(this).parents('.user_form').siblings('.tableBox').find('.tableUsert').hide();
		$(this).parents('.user_form').siblings('.tableBox').find('.tableUser').show();	
		
	}
	else
	{
		$(this).parents('.user_form').siblings('.tableBox').find('.tableUsert').show();
		$(this).parents('.user_form').siblings('.tableBox').find('.tableUser').hide();		
	}
})

})

//添加省下拉框
function putOption(obj){
	var list = obj;
	for (var i = 0; i < list.length; i++){
		var tmp=list[i].id;
		if(prov!=''){
			if(tmp==prov){
			    $("#prov").append( "<option selected='selected' value="+list[i].id+">"+list[i].name+"</option>" );
			}else{
				$("#prov").append( "<option value="+list[i].id+">"+list[i].name+"</option>" );
			}
		}else{
			$("#prov").append( "<option value="+list[i].id+">"+list[i].name+"</option>" );
		}
		
	}
}

function getCitys(provId){
	//alert("ddddddddddddd");
	//查询省对应的市  
	 $.ajax({
		 	data: {"provId":provId},
	        type: "POST",
	        cache: false,
	        dataType: "json",
	        url: "getCityList.html", 
	        success: function(obj){
	        	putCityOption(obj);
	        	
	     	}
		});
}

//添加市下拉框
function putCityOption(obj){
	//清空城市下拉框
	$("#city").empty();
	var list = obj;
	if(list != null && list.length > 0){
		//alert(city);
		for (var i = 0; i < list.length; i++){
			var tmp=list[i].id;
            if(city!=''){
				if(tmp==city){
					$("#city").append( "<option selected='selected' value="+list[i].id+">"+list[i].name+"</option>" );	
				}else{
					$("#city").append( "<option value="+list[i].id+">"+list[i].name+"</option>" );	
				}	
			}else{
			   $("#city").append( "<option value="+list[i].id+">"+list[i].name+"</option>" );	
		    }		
		}
		$("#city").removeAttr("disabled");
	}
}

$(document).ready(function(){ 
	$('.tabList').children().eq(tablList).addClass('active').siblings('li').removeClass('active');
	$('.tabCont .tabItem:eq('+tablList+')').show().siblings().hide();
    $('.anlist:eq('+tablList+')').children().eq(anList).addClass('active').siblings('li').removeClass('active');
   // alert($('.analyse_tabCont:eq('+tablList+')').children().eq(anList).html());
    $('.analyse_tabCont:eq('+tablList+')').children().eq(anList).show().siblings().hide();
  //查询省
	 $.ajax({
	        type: "POST",
	        cache: false,
	        dataType: "json",
	        url: "getDistrictListAll.html", 
	        success: function(obj){
	        	putOption(obj);
	     	}
		});
	    

    $("#assetType1").val(assetUserType);
   if(tablList==1&&anList==0){
	    $("#assertName1").val(assertName1);
	    $("#serverId1").val(serverId1);
	    $("#begin_date1").val(begin_date1);
	    $("#end_date1").val(end_date1);
	    $("#alarmRank1").val(alarmRank1);
	    $("#orderCode1").val(orderCode1);	   
   }else if(tablList==1&&anList==1){
	    $("#assertName2").val(assertName1);
	    $("#serverId2").val(serverId1);
	    $("#begin_date2").val(begin_date1);
	    $("#end_date2").val(end_date1);
	    $("#alarmName1").val(alarmName1);
	    $("#orderCode2").val(orderCode1);  
   }else if(tablList==1&&anList==2){
		$("#assertName3").val(assertName1);
		$("#serverId3").val(serverId1);
		$("#begin_date3").val(begin_date1);
	   $("#end_date3").val(end_date1);
   }

  
     if(city!=''){
       getCitys(prov);
     }   
    $("#assetType2").val(assetUserType1);
    $("#purpose1").val(purpose);
    $("#assetType3").val(assetUserType2);
    $("#purpose2").val(purpose1);
    $("#begin_date").val(begin_date);
    $("#end_date").val(end_date);  
    
});
