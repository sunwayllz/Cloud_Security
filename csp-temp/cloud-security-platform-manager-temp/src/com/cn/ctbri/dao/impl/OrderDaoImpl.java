package com.cn.ctbri.dao.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cn.ctbri.dao.DaoCommon;
import com.cn.ctbri.dao.OrderDao;
import com.cn.ctbri.entity.DataAnalysis;
import com.cn.ctbri.entity.Order;
/**
 * 创 建 人  ：  邓元元
 * 创建日期：  2015-1-14
 * 描        述：   用户数据访问层实现类
 * 版        本：  1.0
 */
@Repository
public class OrderDaoImpl extends DaoCommon implements OrderDao{

	/**
	 * 功        能： OrderMapper命名空间
	 */
	private String ns = "com.cn.ctbri.entity.OrderMapper.";
	/**
	 * 功能描述：查询所有订单
	 * 参数描述：int id
	 *		 @time 2015-1-15
	 * 返回值    ：  List<Order>
	 */
	public List findByUserId(int id) {
		List list = this.getSqlSession().selectList(ns + "list",id);
		return list;
	}
	
	public List findByCombine(Map<String, Object> paramMap) {
		List list = this.getSqlSession().selectList(ns + "findByCombine",paramMap);
		return list;
	}

	/**
     * 功能描述：根据用户查询所有记录
     * 参数描述：int userId
     *       @time 2015-1-21
     * 返回值    ：  List
     */
    public List<Order> getOrderByUserId(int userId) {
        return this.getSqlSession().selectList(ns + "findOrderByUserId",userId);
    }

    /**
     * 功能描述：组合查询订单追踪
     *       @time 2015-1-15
     * 返回值    ：  List<Order>
     */
    public List findByCombineOrderTrack(Map<String, Object> paramMap) {
        List list = this.getSqlSession().selectList(ns + "findByCombineOrderTrack",paramMap);
        return list;
    }

    /**
     * 功能描述： 根据订单Id查询记录
     *       @time 2015-2-2
     * 返回值    ：  Order
     */
    public List findByOrderId(String orderId) {
        List order = this.getSqlSession().selectList(ns + "findOrderByOrderId",orderId);
        return order;
    }

	/**
     * 功能描述：根据orderid查询IP名称
     *       @time 2015-2-2
     */
    public List findIPByOrderId(String orderId) {
        List list = this.getSqlSession().selectList(ns+"findIPByOrderId",orderId);
        return list;
    }
    /**
     * 功能描述： 根据pageIndex和用户id查询记录
     *       @time 2015-3-4
     * 返回值    ：  Order
     */
    public List findByUserIdAndPage(int id, int pageIndex,String state,String type) {
        Map<String,Object> paramMap = new HashMap<String,Object>();
        //当前页
        int pageSize = 10;
        int pageNow = pageIndex*pageSize;
        paramMap.put("userId", id);
        paramMap.put("pageNow", pageNow);
        paramMap.put("pageSize", pageSize);
        paramMap.put("type", type);
        if("2".equals(state)){
        	 paramMap.put("state", Integer.parseInt(state)+1);
        }else{
        	 paramMap.put("state", state);
        }
        List list = this.getSqlSession().selectList(ns + "getOderByPage",paramMap);
        return list;
    }

    /**
     * 功能描述：组合查询订单追踪-分页
     *       @time 2015-1-15
     * 返回值    ：  List<Order>
     */
    public List findByCombineOrderTrackByPage(Map<String, Object> paramMap) {
        List list = this.getSqlSession().selectList(ns + "findByCombineOrderTrackByPage",paramMap);
        return list;
    }  
    /**
     * 功能描述： 数据分析--订单统计分析
     *       @time 2015-3-10
     */
	public List<DataAnalysis> findByCombineDataAnalysis(Map<String, Object> paramMap) {
		return this.getSqlSession().selectList(ns + "findByCombineDataAnalysis",paramMap);
	}

	/**
     * 功能描述：分页组合查询订单
     * 参数描述：String name
     *       @time 2015-3-13
     * 返回值    ：  List<Order>
     */
    public List findByCombineByPage(Map<String, Object> paramMap) {
        List list = this.getSqlSession().selectList(ns + "findByCombineByPage",paramMap);
        return list;
    }
	/**
     * 功能描述：根据订单id查询扫描次数
     * 参数描述：String orderId
     *       @time 2015-3-24
     * 返回值    ：  List<DataAnalysis>
     */
	public int findScanCountByOrderId(String orderId) {
		return this.getSqlSession().selectOne(ns + "findScanCountByOrderId",orderId);
	} 
	
	/**
     * 功能描述：根据order_ip_Id查询订单
     * 参数描述：int order_ip_Id
     * 返回值    ：  List
     */
    public List<Order> findOrder(int order_ip_Id) {
    	List<Order> list =this.getSqlSession().selectList(ns + "findOrder",order_ip_Id);
        return list;
        
    }
	/**
     * 功能描述：更新有告警的订单
     */
    public void update(Order order) {
		this.getSqlSession().update(ns + "update",order);
	}

    /**
     * 功能描述：根据orderId查询正在执行的任务
     * 参数描述：String orderId
     */
    public List findTaskRunning(String orderId) {
        List list =this.getSqlSession().selectList(ns + "findTaskRunning",orderId);
        return list;
        
    }

	public String getOrderById(String orderId, String type, int userId) {
		BigDecimal bd = new BigDecimal(orderId);
		Map map = new HashMap();
		map.put("orderId", bd.toPlainString());
		map.put("type", type);
		map.put("userId", userId);
		// TODO Auto-generated method stub
	   String id = this.getSqlSession().selectOne(ns +"getOrderById",map);
	   System.out.println("aa=="+id);
		return String.valueOf(id);
	}

	//删除订单
    public void deleteOrderById(String orderId) {
        this.getSqlSession().delete(ns + "deleteOrderById",orderId);
    }

    public Order findOrderById(String orderId) {
        return this.getSqlSession().selectOne(ns + "findOrderById",orderId);
    }

	public List findOrderTimesTop5(Map<String, Object> paramMap) {
		return this.getSqlSession().selectList(ns+"findOrderTimesTop5", paramMap);
	}

	public List findUserCountByIndus(Map<String, Object> paramMap) {
		return this.getSqlSession().selectList(ns+"findUserCountByIndus", paramMap);
	}
	public List findOrderTimesLine(Map<String, Object> paramMap) {
		return this.getSqlSession().selectList(ns+"findOrderTimesLine", paramMap);
	}

	public List findOrderTimesPie(Map<String, Object> paramMap) {
		return this.getSqlSession().selectList(ns+"findOrderTimesPie", paramMap);
	}

	public List findOrderWithServiceId(Map<String, Object> paramMap) {
		return this.getSqlSession().selectList(ns+"findOrderWithServiceId",paramMap);
	}

	public List<Map> findOrderWithServiceIdReBuy(Map<String, Object> paramMap) {
		return this.getSqlSession().selectList(ns+"findOrderWithServiceIdReBuy",paramMap);
	}

	public List<Map> findOrderWithServiceIdBuy(Map<String, Object> paramMap) {
		return this.getSqlSession().selectList(ns+"findOrderWithServiceIdBuy",paramMap);
	}
	
	/**
     * 功能描述：根据订单号查询订单(模糊匹配)
     * 参数描述：int orderId
     *       @time 2016-9-5
     * 返回值    ：  List
     */
    public List<Order> findOrderByOrderIdMatch(Map<String, Object> paramMap) {
        return this.getSqlSession().selectList(ns + "findOrderByOrderIdMatch",paramMap);
    }

	public List findAPIInfoByOrderId(String orderId) {
		return this.getSqlSession().selectList(ns+"findAPIInfoByOrderId",orderId);
	}

	public int findAPICountByParam(Map<String, Object> paramMap) {
		return this.getSqlSession().selectOne(ns+"findAPICountByParam", paramMap);
	}
	
	public List<Map<String,Object>> getServiceUserCount() {
		return this.getSqlSession().selectList(ns+"getServiceUserCount");
	}

	public List<Map<String, Object>> getServiceCount() {
		return this.getSqlSession().selectList(ns+"getServiceCount");
	}

	public List<Order> getOrder() {
		return this.getSqlSession().selectList(ns+"getOrder");
	}

}
