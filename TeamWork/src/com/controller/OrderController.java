package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Guide;
import com.entity.Item;
import com.entity.Order;
import com.entity.Pet;
import com.entity.Service;
import com.service.*;
import com.entity.*;
import com.service.*;
public class OrderController extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 int userId = Integer.parseInt(request.getSession().getAttribute("uId").toString());
		 String action1 = request.getParameter("action");
		 
			if(action1.equals("1")){
				
				OrderService service = new OrderService();
				List<Order> myorderlist =  service.getByuId(userId);
				
				if (myorderlist.isEmpty()) {
				    GuideService guideService = new GuideService();
				    List<Guide> guides = guideService.findAllGuide();
				    request.setAttribute("guides", guides);
				    request.setAttribute("noOrders", true); // 设置标志变量

				    RequestDispatcher dispatcher = request.getRequestDispatcher("./cMain.jsp");
				    dispatcher.forward(request, response);
				}

				else{
					List<String> names=new ArrayList<String>(); 
					List<String> imgs=new ArrayList<String>();
					for (Order order : myorderlist) {
						if(order.getisPet()==1){
							PetService petservice = new PetService();
				 			names.add(petservice.getPetBypId(order.getId()).get(0).getpName());
				 			imgs.add(petservice.getPetBypId(order.getId()).get(0).getpImage());
						}
						else{
							ItemService itemservice = new ItemService();
				 			names.add(itemservice.getItemByiId(order.getId()).get(0).getiName());
				 			imgs.add(itemservice.getItemByiId(order.getId()).get(0).getiImage());
						}
					}
					HttpSession session = request.getSession();
					session.setAttribute("myorderlist",myorderlist);
					session.setAttribute("names",names);
					session.setAttribute("imgs",imgs);
				    request.getRequestDispatcher("myOrder.jsp").forward(request, response);
				}
				
				
				
	}
			if(action1.equals("make")){
				int oId = Integer.parseInt(request.getParameter("oId").toString());
				
				HttpSession session = request.getSession();
				session.setAttribute("oId", oId);
			    request.getRequestDispatcher("cEvaluate.jsp").forward(request, response);
			
	}
			if(action1.equals("evaluate")){
				int oid = Integer.parseInt(request.getParameter("oId").toString());
				String evaluate=request.getParameter("Evaluate");
				
				Order o = new Order();
				o.setoId(oid);
				o.setoEvaluate(evaluate);
				OrderService service = new OrderService();
				service.EvaluateOrder(o);
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().println("<script>alert('评论成功！')</script>");
				OrderService service1 = new OrderService();
				List<Order> myorderlist =  service1.getByuId(userId);
				List<String> names=new ArrayList<String>(); 
				List<String> imgs=new ArrayList<String>();
				for (Order order : myorderlist) {
					if(order.getisPet()==1){
						PetService petservice = new PetService();
			 			names.add(petservice.getPetBypId(order.getId()).get(0).getpName());
			 			imgs.add(petservice.getPetBypId(order.getId()).get(0).getpImage());
					}
					else{
						ItemService itemservice = new ItemService();
			 			names.add(itemservice.getItemByiId(order.getId()).get(0).getiName());
			 			imgs.add(itemservice.getItemByiId(order.getId()).get(0).getiImage());
					}
				}
				HttpSession session = request.getSession();
				session.setAttribute("myorderlist",myorderlist);
				session.setAttribute("names",names);
				session.setAttribute("imgs",imgs);
			    request.getRequestDispatcher("myOrder.jsp").forward(request, response);
	}
			if(action1.equals("buyitem")){
				int iId = Integer.parseInt(request.getParameter("buyiId").toString());
				int num = Integer.parseInt(request.getParameter("itemnum").toString());//这个是客户购买后，存量需要减少的数字
				Timestamp d = new Timestamp(System.currentTimeMillis());
				
	 			Item item = new Item();
	 			
	 			ItemService service1 = new ItemService();
	 			List<Item> i = service1.getItemByiId(iId);
	 			int itemn = i.get(0).getiInventory();//这个是商品原来的存量数字
	 			int itemnum = itemn - num;          //这个是购买后的存量数字
	 			item.setiInventory(itemnum);
	 			item.setiId(i.get(0).getiId());
	 			
	 			
	 			User user=new User();
	 			UserService userservice=new UserService();
	 			user=userservice.findUserByuId(userId);
	 			double wallet_now=user.getuWallet()-num*i.get(0).getiPrice();
	 			if(wallet_now<0){
	 				
	 				
					ItemService service_1 = new ItemService();
				    List<Item> item_1= service_1.getItemByiId(iId);
					HttpSession session = request.getSession();
					session.setAttribute("item", item_1);
	 				response.setContentType("text/html;charset=UTF-8");
		             response.getWriter().println("<script>alert('余额不足，购买失败')</script>");
		             response.getWriter().println("<script>window.location.href='./cItem.jsp'</script>");
	 			}
	 			else{
	 				
	 				Order o = new Order();
		            o.setId(iId);
		            o.setisPet(0);
		            o.setoEvaluate("暂无评价");
		            o.setoState("已完成");
		            o.setoTime(d);
		            o.setuId(userId);
		 			OrderService service = new	OrderService();
		 			service.addOrder(o);
	 				user.setuWallet(wallet_now);
	 				
	 				userservice.UpdateWallet(user);
	 				
		 			service1.updateInventory(item);
		 			response.setContentType("text/html;charset=UTF-8");
		             response.getWriter().println("<script>alert('购买成功')</script>");
		 			ItemService service2 = new ItemService();
					List<Item> Itemlist = service2.getAll();
					HttpSession session = request.getSession();
					session.setAttribute("Itemlist", Itemlist);
					
					 response.getWriter().println("<script>window.location.href='./cItemShop.jsp'</script>");
	 			}
	 			
	 			
	}
			if(action1.equals("buypet")){
				int pId = Integer.parseInt(request.getParameter("buypId").toString());
				Timestamp d = new Timestamp(System.currentTimeMillis());
				//添加新订单
				
	 			PetService service1 = new PetService();
	 			//改变宠物状态
	 			Pet pet = new Pet();
	 			pet.setpState("已售出");
	 			pet.setpId(pId);
	 			
	 			
	 			
	 			User user=new User();
	 			UserService userservice=new UserService();
	 			user=userservice.findUserByuId(userId);
	 			double wallet_now=user.getuWallet()-service1.getPetBypId(pId).get(0).getpPrice();
	 		
	 			if(wallet_now<0){
	 				
	 				
	 				
	 				PetService service_1 = new PetService();
	 			    List<Pet> Pet= service_1.getPetBypId(pId);
	 				HttpSession session = request.getSession();
	 				session.setAttribute("Pet", Pet);
	 				response.setContentType("text/html;charset=UTF-8");
		             response.getWriter().println("<script>alert('余额不足，购买失败')</script>");
		             response.getWriter().println("<script>window.location.href='./cPet.jsp'</script>");
	 			}
	 			else{
	 				Order o = new Order();
		            o.setId(pId);
		            o.setisPet(1);
		            o.setoEvaluate("暂无评价");
		            o.setoState("已完成");
		            o.setoTime(d);
		            o.setuId(userId);
		 			OrderService service = new	OrderService();
		 			service.addOrder(o);
	 				
	 				
	 				user.setuWallet(wallet_now);
	 				
	 				userservice.UpdateWallet(user);
	 				
	 				
	 				service1.updatePetState(pId,userId,"已售出");
		 			 response.setContentType("text/html;charset=UTF-8");
		             response.getWriter().println("<script>alert('购买成功')</script>");
		             PetService service2 = new PetService();
		 			List<Pet> petshoplist = service2.getByuId(0);
		 			HttpSession session = request.getSession();
		 			session.setAttribute("petlist", petshoplist);
		             response.getWriter().println("<script>window.location.href='./cPetShop.jsp'</script>");
	 			}
	 			
	 	
			}
	}
	}
