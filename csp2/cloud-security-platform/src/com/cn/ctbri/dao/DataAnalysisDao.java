package com.cn.ctbri.dao;

import java.util.List;
import java.util.Map;

import com.cn.ctbri.entity.AlarmSum;
import com.cn.ctbri.entity.District;
import com.cn.ctbri.entity.UserDistribution;

public interface DataAnalysisDao {
	
	//以省为单位，累加所有漏洞、木马、关键字、篡改、可用性告警数据总和超过100的网站数
//	public List findHighRiskSite();
	
	//查询每个省份的用户数量
	public List<UserDistribution> findUserCountByDistrict();
	
	//根据省份查询经纬度
	public District findlDistrictDataByProName(String proName);
	
	//以网站资产为单位，累加所有漏洞、木马、关键字、篡改、可用性告警数据总和
	public List<AlarmSum> findAlarmSum();

	//根据waf防护目标的ip查询网站名、所在省份
	public Map<String, String> findAssetInfoByIp(String ip);
}
