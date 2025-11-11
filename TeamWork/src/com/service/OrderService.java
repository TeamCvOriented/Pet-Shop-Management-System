package com.service;
import java.util.ArrayList;
import java.util.List;

import com.entity.*;
import com.dao.*;
public class OrderService {
	
public List<Order> getByuId(int uId){
	OrderDao orderDao=new OrderDao();
	List<Order> list=new ArrayList<Order>();
	try {
		 list =orderDao.findByuId(uId);
    } catch (Exception e) {
        e.printStackTrace();
    }
	return list;
}
public List<Order> getAllOrder() {
    try {
    	OrderDao orderDao=new OrderDao();
        return orderDao.findAllOrder();
    } catch (Exception e) {
        e.printStackTrace();
        throw new RuntimeException("Error getting all orders", e);
    }
}

public void updateState(Order order,String newState){
	try{
		OrderDao orderDao=new OrderDao();
		orderDao.updateState(order,newState);
	}catch(Exception e){
		e.printStackTrace();
	}
}

public void EvaluateOrder(Order order){
	try{
		System.out.println(order.getoId());
		System.out.println(order.getoEvaluate());
		OrderDao orderDao=new OrderDao();
		orderDao.EvaluateOrder(order);
	}catch(Exception e){
		e.printStackTrace();
	}
}
public void addOrder(Order o) {
	try{
		// TODO Auto-generated method stub
		OrderDao orderDao=new OrderDao();
		orderDao.add(o);
	}catch(Exception e){
		e.printStackTrace();
	}

}
//public static void main(String argc[]){
//
//		Order order=new Order();
//		OrderService service1 = new OrderService();
//		order.setoId(16);
//		order.setoEvaluate("okokokok");
//		service1.EvaluateOrder(order);;
//		 
//		
//			
//		
//		
//
//}
}
