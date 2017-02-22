package com.cn.ctbri.dao;

import java.util.List;

import com.cn.ctbri.entity.Serv;
import com.cn.ctbri.entity.ServiceSys;

/**
 * 创 建 人 ： cy 
 * 创建日期： 2017-2-16 
 * 描 述： 系统安全帮数据访问层接口类 
 * 版 本： 1.0
 */

public interface ServiceSysDao {

	/**
	 * 功能描述： 根据id查询系统安全帮
	 * 参数描述： int apiId
	 * 
	 * @time 2017-2-16 返回值 ：ServiceSys
	 */
	ServiceSys findById(int SysId);

	List<ServiceSys> findServiceSys();

	List findSysPriceList();

	int insert(ServiceSys service);

	void updateById(ServiceSys serviceSys);

	void deleteById(int SysId);

}
