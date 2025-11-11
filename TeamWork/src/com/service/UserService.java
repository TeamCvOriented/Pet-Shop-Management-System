package com.service;

import java.util.List;



import com.dao.ServiceDao;
import com.dao.UserDao;
import com.entity.User;
public class UserService {
	
	private UserDao userDao;
	
	public UserService(){
		try {
            userDao = new UserDao();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	//若用户存在，返回用户的id
	//用户不存在，返回-2
	//密码错误，返回-1
	public int Login (User user){
		List<User> users = userDao.findAllUsers();
		int res = -2;
		if(users != null){
			int size = users.size();
			for(int i=0;i<size;i++){
				
				if(users.get(i).getuPassword().equals(user.getuPassword()) && users.get(i).getuName().equals(user.getuName()) && users.get(i).getIsManager() == user.getIsManager()){
					res = users.get(i).getuId();
					break;
				}
				else if(!users.get(i).getuPassword().equals(user.getuPassword()) && users.get(i).getuName().equals(user.getuName()) && users.get(i).getIsManager() == user.getIsManager()){
					res = -1;
					break;
				}
			}
		}
		return res;
		}
	
	//根据uId查找用户信息
	public User findUserByuId(int uId){
		User user = new User();
		List<User> userList = userDao.findUserBYuId(uId);
		
		if(userList != null){
			int size = userList.size();
			for(int i = 0;i<size;i++){
				user.setuID(uId);
				user.setuName(userList.get(i).getuName());
				user.setuPassword(userList.get(i).getuPassword());
				user.setIsManager(userList.get(i).getIsManager());
				user.setuEmail(userList.get(i).getuEmail());
				user.setuPhone(userList.get(i).getuPhone());
				user.setuWallet(userList.get(i).getuWallet());
			}
		}
		
		return user;
	}
	
	
	
	//注册
	public void register(User user){
		userDao.addUser(user);
		
	}
	
	//修改信息
	public void Update(User user){
		userDao.updateUser(user);
	}
	public void UpdateWallet(User user){
		userDao.updatewallet(user);
	}	
		
		
	}

