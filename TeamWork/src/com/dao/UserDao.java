package com.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.entity.User;


public class UserDao {
	
	private SqlSessionFactory sqlSessionFactory;
	private String configPath = "mybatis-config.xml";
	
	public UserDao() throws IOException {
		InputStream inputStream = Resources.getResourceAsStream(configPath);
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}


	public List<User> findAllUsers(){
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		List<User> UserList = new ArrayList<User>();
				
		UserList = sqlSession.selectList("IUserDao.findAllUsers");
		
		sqlSession.close();
		
		return UserList; 
	}
          
	public List<User> findUserBYuId(int uId){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<User> UserList = new ArrayList<User>();
		UserList = sqlSession.selectList("findUserBYuId",uId);
		sqlSession.close();
		return UserList;
	}
	
	
	public void addUser(User user) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		 int res = sqlSession.insert("IUserDao.addUser", user);
		sqlSession.commit();
		sqlSession.close();
		
	}

	public void updateUser(User user){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int res = sqlSession.update("IUserDao.updateUser",user);
        sqlSession.commit();
        sqlSession.close();
	}


	public void updatewallet(User user) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("IUserDao.updatewallet",user);
        sqlSession.commit();
        sqlSession.close();
	}
	
	
}
