package com.dao;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.entity.*;

import java.util.List;
public class ServiceDao {
	
    public List<Service> findAllService() throws IOException
	{
		String resource = "mybatis-config.xml";           // 定位核心配置文件
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    // 创建 SqlSessionFactory

        SqlSession sqlSession = sqlSessionFactory.openSession();    // 获取到 SqlSession

        // 调用 mapper 中的方法：命名空间 + id
        List<Service> services = new ArrayList<Service>();
        services = sqlSession.selectList("IServiceDao.findAllService");
        
        return services;
	}
    
    public List<Service> findServiceBYsId(int sId){
    	String resource = "mybatis-config.xml";     
    	List<Service> services = new ArrayList<Service>();
    	// 定位核心配置文件
    	try{
    		InputStream inputStream = Resources.getResourceAsStream(resource);
    		 SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    // 创建 SqlSessionFactory

    	        SqlSession sqlSession = sqlSessionFactory.openSession();    // 获取到 SqlSession
    	        services = sqlSession.selectList("IServiceDao.findServiceBYsId",sId);
    	        
    	}catch (Exception e) {
            e.printStackTrace();
        }
    	return services;
       

        // 调用 mapper 中的方法：命名空间 + id
       
       
    }
	public List<Service> findServiceBYuId(int uId) {
		String resource = "mybatis-config.xml";     
    	List<Service> services = new ArrayList<Service>();
    	// 定位核心配置文件
    	try{
    		InputStream inputStream = Resources.getResourceAsStream(resource);
    		 SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    // 创建 SqlSessionFactory

    	        SqlSession sqlSession = sqlSessionFactory.openSession();    // 获取到 SqlSession
    	        services = sqlSession.selectList("IServiceDao.findServiceBYuId",uId);
    	        
    	}catch (Exception e) {
            e.printStackTrace();
        }
    	return services;
	}
    
	public void updateState(Service service,String newState) throws IOException
	{
		String resource = "mybatis-config.xml";           // 定位核心配置文件
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    // 创建 SqlSessionFactory
        
        SqlSession sqlSession = sqlSessionFactory.openSession();    // 获取到 SqlSession
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("pId", service.getsId());
        params.put("newState", newState);
        sqlSession.update("IServiceDao.updateState",params);
        sqlSession.commit(); 
	}
	public void add(Service service,int uId,int pId) throws IOException
	{
		String resource = "mybatis-config.xml";           // 定位核心配置文件
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    // 创建 SqlSessionFactory

        SqlSession sqlSession = sqlSessionFactory.openSession();    // 获取到 SqlSession
     System.out.println("111111111111");
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("pId", pId);
        params.put("uId", uId);
        params.put("sName", service.getsName());
        params.put("sPrice", service.getsPrice());
        params.put("sState", service.getsState());
        params.put("sIntroduce", service.getsIntroduce());
        params.put("sTime", service.getsTime());
        params.put("sImage", service.getsImage());
        sqlSession.update("IServiceDao.add",params);
        sqlSession.commit(); 
        
	}
//	public static void main(String argc[]){
//	
//
//			ServiceDao serviceDao = new ServiceDao();
//			List<Service> serviceList = serviceDao.add();
//			 for (Service service : serviceList) 
//				 System.out.println(service);
//			
//			
//	
//}


}
