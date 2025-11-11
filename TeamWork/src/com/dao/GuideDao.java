package com.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.entity.*;
public class GuideDao {
public List<Guide> findAllGuide()throws IOException{
	
	String resource = "mybatis-config.xml";           // 
    InputStream inputStream = Resources.getResourceAsStream(resource);
    SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    //  SqlSessionFactory

    SqlSession sqlSession = sqlSessionFactory.openSession();    // SqlSession

    
    List<Guide> guides = sqlSession.selectList("IGuideDao.findAllGuide");
    sqlSession.close();
    return guides;
}
public List<Guide> findGuidebygId(int gId)throws IOException{
	
	String resource = "mybatis-config.xml";           // 
    InputStream inputStream = Resources.getResourceAsStream(resource);
    SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    //  SqlSessionFactory

    SqlSession sqlSession = sqlSessionFactory.openSession();    // SqlSession

    
    List<Guide> guides = sqlSession.selectList("IGuideDao.findGuidebygId",gId);
    sqlSession.close();
    return guides;
}
public void addGuide(Guide guide)throws IOException{
	String resource = "mybatis-config.xml";           // 
    InputStream inputStream = Resources.getResourceAsStream(resource);
    SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    //  SqlSessionFactory

    SqlSession sqlSession = sqlSessionFactory.openSession();    // SqlSession

    
    sqlSession.insert("IGuideDao.addGuide",guide);
    sqlSession.commit(); 
    sqlSession.close();
    
}
public void deleteGuide(int gId)throws IOException{
	String resource = "mybatis-config.xml";           // 
    InputStream inputStream = Resources.getResourceAsStream(resource);
    SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);    //  SqlSessionFactory

    SqlSession sqlSession = sqlSessionFactory.openSession();    // SqlSession

    sqlSession.delete("IGuideDao.deleteGuide", gId);
    sqlSession.commit(); 
    sqlSession.close();
    
}
//public static void main(String argc[]){
//try{
//	Guide guide=new Guide();
//		GuideDao service1 = new GuideDao();
//		
//		guide=service1.findGuidebygId(1).get(0);
//		 System.out.println(guide.getgTitle());
//}
//catch (Exception e) {
//    e.printStackTrace();
//}
//
//}
}
