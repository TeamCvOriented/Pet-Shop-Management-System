package com.dao;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.entity.*;
public class OrderDao {
	public List<Order> findByuId(int uId) throws IOException
	{
		String resource = "mybatis-config.xml"; 
	    InputStream inputStream = Resources.getResourceAsStream(resource);
	    SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    //  SqlSessionFactory
	
	    SqlSession sqlSession = sqlSessionFactory.openSession();    
	
	    
	    List<Order> orders = sqlSession.selectList("IOrderDao.findByuId",uId);
	    
	    sqlSession.close();
	    return orders;
	}
    public List<Order> findAllOrder() throws IOException
	{
		String resource = "mybatis-config.xml";           // 定位核心配置文件
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    // 创建 SqlSessionFactory

        SqlSession sqlSession = sqlSessionFactory.openSession();    // 获取到 SqlSession

        // 调用 mapper 中的方法：命名空间 + id
        List<Order> orders = sqlSession.selectList("IOrderDao.findAllOrder");
        
        return orders;
	}
	public void updateState(Order order,String newState) throws IOException
	{
		String resource = "mybatis-config.xml";      
	    InputStream inputStream = Resources.getResourceAsStream(resource);
	    SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);   
	
	    SqlSession sqlSession = sqlSessionFactory.openSession();  
	    Map<String, Object> params = new HashMap<String, Object>();
        params.put("oId", order.getoId());
        params.put("newState", newState);
	    sqlSession.update("IOrderDao.updateState",params);
	    sqlSession.commit(); 
	    sqlSession.close();
	}
	public void EvaluateOrder(Order order) throws IOException
	{
		String resource = "mybatis-config.xml";      
	    InputStream inputStream = Resources.getResourceAsStream(resource);
	    SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream); 
	    SqlSession sqlSession = sqlSessionFactory.openSession();   
	    Map<String, Object> params = new HashMap<String, Object>();
        params.put("oId", order.getoId());
        params.put("oEvaluate", order.getoEvaluate());
	    sqlSession.update("IOrderDao.EvaluateOrder",params);
	    sqlSession.commit(); 
	    sqlSession.close();
	}
	public void add(Order order) throws IOException
	{
		String resource = "mybatis-config.xml";           // 定位核心配置文件
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    // 创建 SqlSessionFactory

        SqlSession sqlSession = sqlSessionFactory.openSession();    // 获取到 SqlSession

        sqlSession.insert("IOrderDao.add",order);
        sqlSession.commit();
	}

	}

