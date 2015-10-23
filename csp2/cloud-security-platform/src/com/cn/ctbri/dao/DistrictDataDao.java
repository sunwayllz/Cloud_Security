package com.cn.ctbri.dao;

import java.util.List;
import java.util.Map;

import com.cn.ctbri.entity.City;
import com.cn.ctbri.entity.Alarm;
import com.cn.ctbri.entity.District;


/**
 * 创 建 人  ：  txr
 * 创建日期：  2015-08-20
 * 描        述： 数据展示 数据访问层接口类
 * 版        本：  1.0
 */
public interface DistrictDataDao {

    List<District> getDistrictByAll(Map<String, Object> paramMap);

    List getDistrictDataById(Map<String, Object> paramMap);

    List getDistrictAlarmTop5(Map<String, Object> paramMap);

    List getServiceAlarmTop5(Map<String, Object> paramMap);

    List getServiceAlarmMonth5(Map<String, Object> paramMap);

    int getMax(Map<String, Object> paramMap);
    
    List<District> getDistrictList();

    public List<City> getCityListByProv(Map<String, Object> paramMap);
    	
	String getProvNameById(Map<String, Object> paramMap);

	String getMonth(int i);

	Alarm getServiceAlarmByMonth(Map<String, Object> paramMap);

}
