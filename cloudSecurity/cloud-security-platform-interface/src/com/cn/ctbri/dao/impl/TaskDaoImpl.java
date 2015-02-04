package com.cn.ctbri.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cn.ctbri.dao.DaoCommon;
import com.cn.ctbri.dao.TaskDao;
import com.cn.ctbri.entity.Task;
/**
 * 任务信息dao实现类
 * @author googe
 *
 */
@Repository
@Transactional
public class TaskDaoImpl extends DaoCommon implements TaskDao {
	
	/**
	 * 功        能： UserMapper命名空间
	 */
	private String ns = "com.cn.ctbri.entity.TaskMapper.";		
	
	@Resource
	public final void setSessionFactoryRegister(SqlSessionFactory sessionFactory) {
		this.setSqlSessionFactory(sessionFactory);
	}  
	
	public List<Task> findTask(Map<String, Object> map) {
		String taskpage = String.valueOf(map.get("page"));
		if(taskpage == null || "".equals(taskpage)){
			taskpage = "20";
		}
		return getSqlSession().selectList(ns+"findTask", map);
	}
	
	public int insert(Task task) {
		return getSqlSession().insert(ns+"insert", task);
	}

	public void update(Task task) {
		getSqlSession().update(ns+"update", task);
	}
	
	

}
