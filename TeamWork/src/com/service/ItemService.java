package com.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import com.dao.ItemDao;
import com.dao.OrderDao;
import com.entity.Pet;
import com.entity.User;
import com.entity.Item;
import com.entity.Order;
public class ItemService{
	
	private ItemDao itemdao = new ItemDao();
	private OrderDao orderdao = new OrderDao();
	public void buyItem(Item item,User user) throws IOException{
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        Order order = new Order("",0,item.getiId(), user.getuId(),"进行中", currentTime);
        orderdao.add(order);
        
	}
	public List<Item> getAll() throws IOException{
		return itemdao.findAll();
	}
	public List<Item> getByName(String iName) throws IOException{
		return itemdao.findByName(iName);
	}
	public void updateItem(Item item) throws IOException{
		itemdao.update(item);
	}
	public void updateInventory(Item item) throws IOException{
		itemdao.updateInventory(item);;
	}
	public void addItem(Item item) throws IOException{
			itemdao.add(item);
	}
	public List<Item> getItemByiId(int iId) throws IOException{
		List<Item> item = itemdao.findByiId(iId);
		return item;
	}

}
