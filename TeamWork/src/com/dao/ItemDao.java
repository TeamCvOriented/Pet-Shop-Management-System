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
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.entity.*;


public class ItemDao {
public ItemDao() {
		// TODO Auto-generated constructor stub
	}

//		private SqlSessionFactory sqlSessionFactory;
//	
//	public ItemDao(String configPath) throws IOException {
//		InputStream inputStream = Resources.getResourceAsStream(configPath);
//		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//	}
	public List<Item> findAll() throws IOException
	{
		String resource = "mybatis-config.xml";           // 定位核心配置文件
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    // 创建 SqlSessionFactory

        SqlSession sqlSession = sqlSessionFactory.openSession();    // 获取到 SqlSession
//        System.out.println("1111111111111");
        // 调用 mapper 中的方法：命名空间 + id
        List<Item> items = sqlSession.selectList("IItemDao.findAll");
        return items;
	}
	public List<Item> findByiId(int iId) throws IOException{
		
		String resource = "mybatis-config.xml";           // 定位核心配置文件
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    // 创建 SqlSessionFactory

        SqlSession sqlSession = sqlSessionFactory.openSession();  
		
		List<Item> ItemList = sqlSession.selectList("IItemDao.findByiId",iId);
		
		sqlSession.close();
		
		return ItemList;
	}

	public List<Item> findByName(String iName) throws IOException
	{
		String resource = "mybatis-config.xml";           // 定位核心配置文件
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    // 创建 SqlSessionFactory

        SqlSession sqlSession = sqlSessionFactory.openSession();    // 获取到 SqlSession

        // 调用 mapper 中的方法：命名空间 + id
        List<Item> items = sqlSession.selectList("IItemDao.findByName",iName);
        return items;
	}
	
	public void update(Item item) throws IOException
	{
		String resource = "mybatis-config.xml";           // 定位核心配置文件
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    // 创建 SqlSessionFactory

        SqlSession sqlSession = sqlSessionFactory.openSession();    // 获取到 SqlSession

        sqlSession.update("IItemDao.update",item);
        sqlSession.commit(); 
	}
	
	public void add(Item item) throws IOException
	{
		String resource = "mybatis-config.xml";           // 定位核心配置文件
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    // 创建 SqlSessionFactory

        SqlSession sqlSession = sqlSessionFactory.openSession();    // 获取到 SqlSession

        sqlSession.insert("IItemDao.add",item);
        sqlSession.commit();
	}
	public void updateInventory(Item item) throws IOException
	{
		String resource = "mybatis-config.xml";           //定位核心配置文件
		 InputStream inputStream = Resources.getResourceAsStream(resource);
	     SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    // 创建 SqlSessionFactory

	     SqlSession sqlSession = sqlSessionFactory.openSession();           // 获取到 SqlSession

	     sqlSession.update("IItemDao.updateInventory",item);
	     sqlSession.commit();
	}
//	public static void main(String argc[]){
//		try{
//			 String configPath = "mybatis-config.xml";
//				ItemDao itemDao = new ItemDao(configPath);
//				List<Item> itemList = itemDao.findAll();
//			
//		}catch(IOException e){
//			e.printStackTrace();
//		}
//	}
	
}
