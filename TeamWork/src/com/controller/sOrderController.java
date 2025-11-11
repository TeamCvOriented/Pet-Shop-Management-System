package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Order;
import com.service.*;

public class sOrderController extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		OrderService orderService = new OrderService();
		request.setCharacterEncoding("UTF-8");
		List<Order> orders = orderService.getAllOrder();
		if (orders.isEmpty()){
			response.setContentType("text/html;charset=UTF-8");
             response.getWriter().println("<script>alert('暂时还没有买家订单')</script>");
             response.getWriter().println("<script>window.location.href='./sMain.jsp'</script>");
			
		}
		else{
			List<String> names=new ArrayList<String>(); 
			List<String> imgs=new ArrayList<String>();
			for (Order order : orders) {
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
			
			session.setAttribute("orders",orders);
			session.setAttribute("names",names);
			session.setAttribute("imgs",imgs);
			 request.getRequestDispatcher("sAllOrder.jsp").forward(request, response);
			
		}
		
		
       
	}

}
