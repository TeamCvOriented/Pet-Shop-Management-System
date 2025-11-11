package com.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import com.dao.*;
import com.entity.Item;
import com.entity.Order;
import com.entity.Pet;
import com.entity.User;
public class PetService {
private PetDao petDao;
	
	public PetService(){
		try {
            petDao = new PetDao();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	
	public List<Pet> findAllPet(){
		List<Pet> pet = petDao.findAllPet();
		return pet;
	}
	//查看宠物详情
	public List<Pet> getPetBypId(int pId){
		List<Pet> pet = petDao.findBypId(pId);
		return pet;
	}
	//查找店家或者某个用户所有宠物
	public List<Pet> getByuId(int uId){
		List<Pet> pet = petDao.findPetByuId(uId);
		return pet;
	}
	
	//根据品种查询，只查商家的
	public List<Pet>  getBypBreed(String pBreed){
		List<Pet> pet = petDao.findBypBreed(pBreed);
		return pet;
	}
	
	//店家修改宠物信息
	public void updatePet(Pet pet) {
		petDao.update(pet);
	}
	
	public void updatePetState(int pId,int uId,String newState) {
		petDao.updatestate(pId,uId,newState);
	}
	//上架宠物或用户关联宠物
	public void addPet(Pet pet,int uId){
		
		petDao.add(pet,uId);
	}
	
	//购买宠物
	public void buyPet(Pet pet,User user){
		int pId = pet.getpId();
		int uId = user.getuId();
		String newState = "已下架";
		petDao.updatestate(pId,uId,newState);
		
		//新建订单
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		
		try{
			Order order = new Order("", 1,pet.getpId(), user.getuId(),"进行中", currentTime);
	        OrderDao orderDao = new OrderDao();
	        orderDao.add(order);
		}catch(IOException e){
			e.printStackTrace();
		}
        
	}


	
}

