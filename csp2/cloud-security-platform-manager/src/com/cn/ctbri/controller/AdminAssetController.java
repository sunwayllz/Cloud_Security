package com.cn.ctbri.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import se.akerfeldt.com.google.gson.Gson;

import com.cn.ctbri.common.Constants;
import com.cn.ctbri.constant.WarnType;
import com.cn.ctbri.entity.Alarm;
import com.cn.ctbri.entity.AlarmDDOS;
import com.cn.ctbri.entity.Asset;
import com.cn.ctbri.entity.DataAnalysis;
import com.cn.ctbri.entity.Order;
import com.cn.ctbri.entity.OrderAsset;
import com.cn.ctbri.entity.Task;
import com.cn.ctbri.entity.TaskWarn;
import com.cn.ctbri.entity.User;
import com.cn.ctbri.service.IAlarmDDOSService;
import com.cn.ctbri.service.IAlarmService;
import com.cn.ctbri.service.IAssetService;
import com.cn.ctbri.service.IOrderAssetService;
import com.cn.ctbri.service.IOrderService;
import com.cn.ctbri.service.ISelfHelpOrderService;
import com.cn.ctbri.service.ITaskService;
import com.cn.ctbri.service.ITaskWarnService;
import com.cn.ctbri.service.IUserService;
import com.cn.ctbri.util.CommonUtil;
import com.cn.ctbri.util.DateUtils;


/**
 * 创 建 人  ：  zx
 * 创建日期：  2015-10-26
 * 描        述： 资产数据分析
 * 版        本：  1.0
 */
@Controller
public class AdminAssetController {
	

	@Autowired
	IAssetService assetService;
	/**
	 * 功能描述：资产地理位置统计分析
	 *		 @time 2015-10-26
	 */
	@RequestMapping("/adminDataAssetUI.html")
	public String dataAnalysisUI(HttpServletRequest request,HttpServletResponse response){
		
		String assetUserType = request.getParameter("assetUserType");
		String prov = request.getParameter("prov");
		String city = request.getParameter("city");
		Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("assetUserType", assetUserType);
        paramMap.put("province", prov);
        paramMap.put("city", city);
       
        if(assetUserType!=null&&!"".equals(assetUserType)){
        	 List<Asset> list=assetService.findByAssetProAndCity(paramMap);
        	 request.setAttribute("list", list);
        }
       
		return "/source/adminPage/userManage/dataAsset";
	}
	
}
