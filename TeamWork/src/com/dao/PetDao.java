package com.dao;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.util.ArrayList;
import java.util.List;

import com.entity.Pet;
import com.entity.User;
import java.util.HashMap;
import java.util.Map;

public class PetDao {

	private SqlSessionFactory sqlSessionFactory;
	private String configPath = "mybatis-config.xml";
	
	public PetDao() throws IOException {
		InputStream inputStream = Resources.getResourceAsStream(configPath);
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	
public List<Pet> findAllPet() {
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	List<Pet> PetList = new ArrayList<Pet>();
			
	PetList = sqlSession.selectList("IPetDao.findAllPet");
	
	sqlSession.close();
	
	return PetList;
	}
	
	
	
	//查找所有店家宠物
	public List<Pet> findPetByuId(int uId){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		List<Pet> PetList = new ArrayList<Pet>();
				
		PetList = sqlSession.selectList("IPetDao.findPetByuId",uId);
		
		sqlSession.close();
		
		return PetList;
	}
	
	//根据品种查找
	public List<Pet> findBypBreed(String  pBreed){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		List<Pet> PetList = sqlSession.selectList("IPetDao.findBypBreed",pBreed);
		
		sqlSession.close();
		
		return PetList;
	}
	
	//根据id查找
	public List<Pet> findBypId(int  pId){
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		List<Pet> PetList = sqlSession.selectList("IPetDao.findBypId",pId);
		
		sqlSession.close();
		
		return PetList;
	}
	
	//更新宠物信息
	public void update(Pet pet){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("IPetDao.update",pet);
        sqlSession.commit();
        sqlSession.close();
	}
	
	//更新宠物状态
	public void updatestate(int pId,int uId,String newState){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		Map<String, Object> params = new HashMap<String, Object>();
        params.put("pId", pId);
        params.put("uId", uId);
        params.put("newState",newState);
        
        
		sqlSession.update("IPetDao.updatestate",params);
        sqlSession.commit();
        sqlSession.close();
	}
	
	//添加新宠物
	public void add(Pet pet,int uId){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String, Object> params = new HashMap<String, Object>();
//		pName,pPrice,pBreed,pAge,pSex,pState,pIntroduce
        params.put("pName",pet.getpName());
        params.put("pPrice",pet.getpPrice());
        params.put("pBreed",pet.getpBreed());
        params.put("pAge",pet.getpAge());
        params.put("pSex",pet.getpSex());
        params.put("pState",pet.getpState());
        params.put("pIntroduce",pet.getpIntroduce());
        params.put("uId", uId);
        params.put("pImage", pet.getpImage());
		sqlSession.insert("IPetDao.add",params);
        sqlSession.commit();
        sqlSession.close();
	}






	





	
	
}
