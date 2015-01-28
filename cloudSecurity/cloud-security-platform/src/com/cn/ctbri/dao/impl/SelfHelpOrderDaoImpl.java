package com.cn.ctbri.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.cn.ctbri.dao.SelfHelpOrderDao;
import com.cn.ctbri.dao.UserDao;
import com.cn.ctbri.entity.Asset;
import com.cn.ctbri.entity.Factory;
import com.cn.ctbri.entity.Linkman;
import com.cn.ctbri.entity.Order;
import com.cn.ctbri.entity.Serv;
import com.cn.ctbri.entity.ServiceType;
import com.cn.ctbri.entity.User;
/**
 * 创 建 人  ：  txr
 * 创建日期：  2015-1-14
 * 描        述：   自助下单数据访问层实现类
 * 版        本：  1.0
 */
@Repository
public class SelfHelpOrderDaoImpl extends SqlSessionDaoSupport implements SelfHelpOrderDao{

	@Resource
	public final void setSessionFactoryRegister(SqlSessionFactory sessionFactory) {
		this.setSqlSessionFactory(sessionFactory);
	}  
	
	/**
	 * 功        能：SelfHelpOrderMapper命名空间
	 */
	private String ns = "com.cn.ctbri.entity.SelfHelpOrderMapper.";
	/**
     * 功        能：ServMapper命名空间
     */
	private String nv = "com.cn.ctbri.entity.ServMapper.";
	
	/**
     * 功能描述：查询服务配置类型
     *       @time 2015-1-14
     * 返回值    ：  List<ServiceType>
     */
	public List<ServiceType> getServiceType() {
		return this.getSqlSession().selectList(ns + "findServiceType");
	}

	/**
     * 功能描述：查询厂商
     *       @time 2015-1-15
     * 返回值    ：  List<Factory>
     */
    public List<Factory> getFactory() {
        return this.getSqlSession().selectList(ns + "findFactory");
    }

    /**
     * 功能描述：查询服务资产
     *       @time 2015-1-15
     * 返回值    ：  List<ServiceAsset>
     */
    public List<Asset> getServiceAsset(int userId ) {
        return this.getSqlSession().selectList(ns + "findServiceAsset",userId);
    }

    /**
     * 功能描述：保存订单
     *       @time 2015-1-16
     */
    public void save(Order order) {
        this.getSqlSession().insert(ns + "insert", order);
    }

    /**
     * 功能描述：查询服务
     *       @time 2015-1-19
     * 返回值    ：  List<Serv>
     */
    public List<Serv> getService() {
        return this.getSqlSession().selectList(nv + "list");
    }

    /**
     * 功能描述：保存联系人
     *       @time 2015-1-19
     */
    public void saveLinkman(Linkman linkObj) {
        this.getSqlSession().insert(ns + "insertLinkman", linkObj);
    }


	
}
