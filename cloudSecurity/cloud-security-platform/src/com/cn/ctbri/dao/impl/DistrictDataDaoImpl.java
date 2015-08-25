package com.cn.ctbri.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cn.ctbri.dao.DaoCommon;
import com.cn.ctbri.dao.DistrictDataDao;
import com.cn.ctbri.dao.TaskDao;
import com.cn.ctbri.entity.District;
import com.cn.ctbri.entity.Task;
/**
 * 创 建 人  ：  txr
 * 创建日期：  2015-08-20
 * 描        述：   数据展示数据访问层实现类
 * 版        本：  1.0
 */
@Repository
@Transactional
public class DistrictDataDaoImpl extends DaoCommon implements DistrictDataDao {
	
	/**
	 * 功        能： DistrictDataMapper命名空间
	 */
	private String ns = "com.cn.ctbri.entity.DistrictDataMapper.";

    public List<District> getDistrictByAll(Map<String, Object> paramMap) {
        return getSqlSession().selectList(ns + "findDistrictList",paramMap);
    }

    public List getDistrictDataById(String districtId) {
        return getSqlSession().selectList(ns + "getDistrictDataById",districtId);
    }

    public List getDistrictAlarmTop5(Map<String, Object> paramMap) {
    	District d = new District();
        d.setLimit("true");
        paramMap.put("limit", "true");
        return getSqlSession().selectList(ns + "findDistrictList",paramMap);
    }

    public List getServiceAlarmTop5(String serviceId) {
        return getSqlSession().selectList(ns + "getServiceAlarmTop5", serviceId);
    }

    public List getServiceAlarmMonth5(String serviceId) {
        return getSqlSession().selectList(ns + "getServiceAlarmMonth5", serviceId);
    }		
	
	
}
