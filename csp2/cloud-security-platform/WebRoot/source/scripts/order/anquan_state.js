var lastdayArray = [];
$(function(){
	//最近一小时漏洞
	var myChart1 = echarts.init(document.getElementById('vulnscanAlarmOneHour'));
	   $.ajax({
	    	type : "post",
	    	url:"getVulnscanAlarmOneHour.html",
	        dataType:"json",
	        success:function(obj){
		   		var option1 = {
		   			title : {
		   	        text: '最近一小时内漏洞跟踪',
		   	        x:'center'
		   	    },

		   	    tooltip : {
		   	        trigger: 'item',
		   	        formatter: "{b} : {c} ({d}%)"
		   	    },

		   	    calculable : true,
		   	    series : [
		   	        
		   	        {
		   	            name:'攻击类型',
		   	            type:'pie',
		   	            radius : [20, 180],
		   	            center : ['50%', '50%'],
		   	            roseType : 'area',
		   	         label: {
		   	                normal: {
		   	                    show: true,
		   	                 formatter: function(params){
	                        	 // alert(params.name.length);
	                        	  var res=params.name;
	                        	  if(params.name.length>4){
	                        		  var temp = res.substring(0,4);
	                        		  var temp2 = res.substr(4);
	                        		  res= temp + "\n" + temp2;
	                        	  }
	                          return res;
	                         }
		   	                },
		   	                emphasis: {
		   	                    show: true
		   	                }
		   	            },
		   	            lableLine: {
		   	                normal: {
		   	                    show: true
		   	                },
		   	                emphasis: {
		   	                    show: true
		   	                }
		   	            },
		   	            data:obj.dataArray
		   	        }
		   	    ]
		   	};
		   		myChart1.setOption(option1);
	     },

	});
	//最近一小时内waf
	var myChart0 = echarts.init(document.getElementById('wafOneHour'));
	   $.ajax({
	    	type : "post",
	    	url:"getWafOneHour.html",
	        dataType:"json",
	        success:function(obj){
		   		var option0 = {
		   		 title : {
		   	        text: '最近一小时内攻击',
		   	        x:'center'
		   	    },
		   	    tooltip : {
		   	        trigger: 'item',
		   	        formatter: "{b} : {c} ({d}%)"
		   	    },
		   	  
		   	    calculable : true,
		   	    series : [
		   	        
		   	        {
		   	            name:'漏洞类型',
		   	            type:'pie',
		   	            radius : [20, 180],
		   	            center : ['50%', '50%'],
		   	            roseType : 'area',
		   	         label: {
		   	                normal: {
		   	                    show: true,
		   	                 formatter: function(params){
	                        	  //alert(params.name.length);
	                        	  var res=params.name;
	                        	  if(params.name.length>4){
	                        		  var temp = res.substring(0,4);
	                        		  var temp2 = res.substr(4);
	                        		  res= temp + "\n" + temp2;
	                        	  }
	                          return res;
	                         }
		   	                },
		   	                emphasis: {
		   	                    show: true
		   	                }
		   	            },
		   	            lableLine: {
		   	                normal: {
		   	                    show: true
		   	                },
		   	                emphasis: {
		   	                    show: true
		   	                }
		   	            },
		   	            data:obj.dataArray
		   	        }
		   	    ]
		   	};
		   		myChart0.setOption(option0);
	     },

	});

	  
	   //最近六个月等级漏洞分布
	   var myChart3 = echarts.init(document.getElementById('vulnscanAlarmByLevelMonth6'));
	   $.ajax({
	    	type : "post",
	    	url:"getVulnscanAlarmByLevelMonth6.html",
	        dataType:"json",
	        success:function(obj){
		   		var option3 = {
		   			 title : {
		   		        //text: '最\n近\n六\n个\n月\n漏\n洞\n等\n级\n分\n布\n',
		   				 text:'近六个月漏洞等级分布',
		   		         x:'left'
		   		    },
		   			 tooltip : {
		   	        trigger: 'axis',
		   	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		   	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		   	        }
		   	    },
		   	    legend: {
		   	        data:obj.levelList,
		   	        x:'right'
		   	    },
		   	    grid: {
		   	        left: '5%',
		   	        right: '5%',
		 
		   	        bottom: '1%',
		   	        containLabel: true
		   	    },
		   	    xAxis : [
		   	        {
		   	            type : 'category',
		   	            data : obj.monthList
		   	        }
		   	    ],
		   	    yAxis : [
		   	        {
		   	            type : 'value'
		   	           
		   	        }
		   	    ],
		   	    series : obj.dataArray
		   	};
		   		myChart3.setOption(option3);
	     },

	});
	   
		var myChart6 = echarts.init(document.getElementById('orderServiceTimes'));
		   $.ajax({
		    	type : "post",
		    	url:"getOrderServiceTimes.html",
		        dataType:"json",
		        success:function(obj){
			   lastdayArray = obj.lastdayList;
			   		var option6 = {
			   				title: {
			   	        text: '历史订单（一年内）',
			   	        x:'left'
			   	    },
			   	    tooltip : {
			   	        trigger: 'axis'
			   	    },
			   	    legend: {
			   	        data:obj.servNameList
			   	    },
			   	  
			   	    grid: {
			   	        left: '1%',
			   	       right: '3%',
			   	        bottom: '3%',
			   	    	//width:500,
			   	    	//height:300,
			   	        containLabel: true
			   	    },
			   	    xAxis : [
			   	        {
			   	            type : 'category',
			   	            boundaryGap : false,
			   	            nameGap:20,
			   	            axisLabel:{
			   		                         interval:0,
			   		                         //rotate:45,
			   		                         margin:4,
			   		                         textStyle:{
			   		                             color:"#222"
			   		                         },

			   		                      formatter: function (value, index) {
			   		                          // 格式化成月/日，只在第一个刻度显示年份
			   		                         // var date = new Date(value);
			   		                          //if(date.getDate()==30||date.getDate()==31){
			   		                        	//var texts = [date.getYear(),(date.getMonth() + 1), date.getDate()];
			   		                        	//var res = texts.join('-');
			   		                        	if(lastdayArray.indexOf(value)!=-1){
			   		                        		return value.substring(0,7);
			   		                        	}
			   		                        	//return texts.join('/');
			   		                          //}
			   		                         /* var texts = [(date.getMonth() + 1), date.getDate()];
			   		                          if (index === 0) {
			   		                              texts.unshift(date.getYear());
			   		                          }
			   		                          return texts.join('/');
			   		                        	if(value.substring(8,10)=='30'||value.substring(8,10)=='31'){
			   		                        		 return value; 
			   		                        	 }*/
			   		                         }
			   		                     },
			   	           data : obj.dayList
			   	        }
			   	    ],
			   	    yAxis : [
			   	        {
			   	            type : 'value'
			   	        }
			   	    ],
			   	    series : obj.seriesList
			   	};
			   		myChart6.setOption(option6);
		     },

		});
		   
		   //订单类型分布
		   var myChart4 = echarts.init(document.getElementById('serviceUseInfoMonth6'));
		   $.ajax({
		    	type : "post",
		    	url:"getServiceUseInfoMonth6.html",
		        dataType:"json",
		        success:function(obj){
			   		var monthList = obj.monthList;
			   		var indicatorList = obj.indicatorList;
			   		var dataArray = obj.dataArray;
			   		var option4 = {
			   			 title: {
			   	        text: '订单类型分布',
			   	        x:'left'
			   	    },
			   	    tooltip: {
			   	        trigger: 'item',
			   	        backgroundColor : 'rgba(0,0,250,0.2)'
			   	    },
			   	   
			   	    radar: {
			   	       indicator : indicatorList
			   	    },
			   	    series : (function (){
			   	        var series = [];
			   	        for (var i = 1; i <= 24; i++) {
			   	        	var list = [];
			   	        	list.push(dataArray[i]);
			   	            series.push({
			   	                name:'浏览器（数据纯属虚构）',
			   	                type: 'radar',
			   	                symbol: 'none',
			   	                itemStyle: {
			   	                    normal: {
			   	                        lineStyle: {
			   	                          width:1
			   	                        }
			   	                    },
			   	                    emphasis : {
			   	                        areaStyle: {color:'rgba(0,250,0,0.3)'}
			   	                    }
			   	                },
			   	                data:list
			   	            });
			   	        }
			   	        return series;
			   	    })()
			   	};
			   		myChart4.setOption(option4);
		     },

		});
		   
		   //用户行业分布
			var myChart5 = echarts.init(document.getElementById('userIndustry'));
			   $.ajax({
			    	type : "post",
			    	url:"getIndustryStatistics.html",
			        dataType:"json",
			        success:function(obj){
				   		var option5 = {
			   			 title : {
				   		        text: '用户行业分布',
				   		        x:'left'
				   		},
				   	    tooltip : {
				   	        trigger: 'axis'
				   	    },
				   	    legend: {
				   	        data:['各行业注册用户数','已下订单数']
				   	    },
				   	    xAxis : [
				   	        {
				   	            type : 'category',
				   	            offset:5,
				   	            axisLabel:{
			                         interval:0,
			                         rotate:40,
			                         margin:8,
			                       
			                         textStyle:{
			                             color:"#222"
			                         },
			                         formatter: function(value,index){
			                        	//alert(value.length);
/*			                        	  if(typeof(value)=='undefined'){
			                        		  return '';
			                        	  }else{
			                        		  if(value.length>7){
				                        		  var temp = value.substring(0,4);
				                        		  var temp2 = value.substr(4);
				                        		  value= temp + "\n" + temp2;
						                          return value;
				                        	  }
			                        	  }*/
			                        	 return value;
			                         }
			                     },
				   	            data : obj.industryList
				   	        }
				   	    ],
				   	    grid: { // 控制图的大小，调整下面这些值就可以，
				             x: 35,
				             x2: 30,
				             y2: 150,// y2可以控制 X轴跟Zoom控件之间的间隔，避免以为倾斜后造成 label重叠到zoom上
				        },
				   	    yAxis : [
				   	        {
				   	            type : 'value'
				   	        }
				   	    ],
				   	    series : [
				   	        {
				   	            name:'各行业注册用户数',
				   	            type:'bar',
				   	            data:obj.userList,
				   	            markPoint : {
				   	                data : [
				   	                    {type : 'max', name: '最大值'},
				   	                    {type : 'min', name: '最小值'}
				   	                ]
				   	            }
				   	        },
				   	        {
				   	            name:'已下订单数',
				   	            type:'bar',
				   	            data:obj.orderList,
				   	            markPoint : {
				   	        		data : [
				   	                    {type : 'max', name: '最大值'},
				   	                    {type : 'min', name: '最小值'}
				   	                ]
				   	            }
				   	        }
				   	    ]
				   	};
				   		myChart5.setOption(option5);
			     },

			});
			   
				 //同一网站三次结果中同一漏洞的重复率：左图为所有网站中出现过连续三次结果中有同一漏洞告警的网站占比情况
				var myChart7 = echarts.init(document.getElementById('assetPercent'));
				   $.ajax({
				    	type : "post",
				    	url:"getAssetPercent.html",
				        dataType:"json",
				        success:function(obj){
					   		var option7 = {
					   				title : {
					   			        text: '网站漏洞重复率',
					   			        //subtext: '纯属虚构',
					   			        x:'center'
					   			    },
					   			    tooltip : {
					   			        trigger: 'item',
					   			        formatter: "{a} <br/>{b} : {c} ({d}%)"
					   			    },
					   			   /* legend: {
					   			        orient: 'vertical',
					   			        left: 'left',
					   			        data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
					   			    },*/
					   			    series : [
					   			        {
					   			            name: '访问来源',
					   			            type: 'pie',
					   			            radius : '55%',
					   			            center: ['50%', '60%'],
					   			            data:obj.jsonList,
					   			            itemStyle: {
					   			                emphasis: {
					   			                    shadowBlur: 10,
					   			                    shadowOffsetX: 0,
					   			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
					   			                }
					   			            }
					   			        }
					   			    ]
					   	};
					   		myChart7.setOption(option7);
				     },

				}); 
});