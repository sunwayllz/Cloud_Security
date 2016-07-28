package com.cn.ctbri.service;

import java.util.List;
import java.util.Map;

import com.cn.ctbri.entity.APICount;
import com.cn.ctbri.entity.OrderAPI;


/**
 * 创 建 人  ：  tangxr
 * 创建日期：  2016-3-30
 * 描        述：  订单业务层接口
 * 版        本：  1.0
 */
public interface IOrderAPIService {

	//插入API订单
	void insert(OrderAPI oAPI);

	//插入或更新API数量
	void insertOrUpdateCount(APICount count);

	List<OrderAPI> findByParam(Map<String, Object> paramMap);

}