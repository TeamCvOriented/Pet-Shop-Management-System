package com.controller;

import com.entity.*;
import com.service.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class sReservationController extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int action = Integer.parseInt(request.getParameter("action").toString());
		
		ServiceService serviceService = new ServiceService();
		
	
		if(action == 1){
//			List<Service> services = serviceService.getAllService();
//			session5.setAttribute("services", services);
//			request.getRequestDispatcher("sAllService.jsp").forward(request, response);
			
			
			request.setCharacterEncoding("UTF-8");
	        HttpSession session = request.getSession();
	        List<Service> services1 = serviceService.getAllService();
	    
	        List<Service> services = new ArrayList<Service>();
	        for(Service service:services1){
	        	if(service.getuId()!=0){
	        		services.add(service);
	        	}
	        	
	        }
	        
	        
	        if (services.isEmpty()){
				response.setContentType("text/html;charset=UTF-8");
	             response.getWriter().println("<script>alert('暂时还没有买家预约服务')</script>");
	             response.getWriter().println("<script>window.location.href='./sMain.jsp'</script>");
				
			}
	        else{
	        	Timestamp currentTime = new Timestamp(new Date().getTime());
	            for(Service service_changestate:services){
	                 Timestamp serviceTime = service_changestate.getsTime();
	                    long timeDifference = currentTime.getTime() - serviceTime.getTime();
	                    long fiveHoursInMillis = 5 * 60 * 60 * 1000; // 5 hours in milliseconds
	                    if (timeDifference > fiveHoursInMillis) {
	                        // 改变服务状态
	                        service_changestate.setsState("已完成");   
	                    }
	            
	            }
	          
	        	request.setAttribute("services", services);
		        request.getRequestDispatcher("sAllService.jsp").forward(request, response);
	        }
	        
	        
	        
		}
		
	}

}
