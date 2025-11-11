package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;

import com.entity.Guide;
import com.entity.Item;
import com.entity.Order;
import com.entity.Pet;
import com.entity.Service;
import com.entity.User;
import com.service.GuideService;
import com.service.ItemService;
import com.service.OrderService;
import com.service.ServiceService;
import com.service.PetService;
import com.service.UserService;

public class ShopServiceController extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ShopServiceController() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 int userId = Integer.parseInt(request.getSession().getAttribute("uId").toString());
			String action1 = request.getParameter("action").toString();
			
			
				if(action1.equals("1")){
					ServiceService service = new ServiceService();
					List<Service> servicelist = service.getAllService();
					
					
				    
			        List<Service> services = new ArrayList<Service>();
			        for(Service service1:servicelist){
			        	if(service1.getuId()==0){
			        		services.add(service1);
			        	}
			        	
			        }
					
					
					HttpSession session = request.getSession();
					
					session.setAttribute("Servicelist", services);
				    request.getRequestDispatcher("cServiceShop.jsp").forward(request, response);
		 			
				}
				else if(action1.equals("2")){
					ServiceService service = new ServiceService();
					List<Service> servicelist = service.getServiceBYuId(userId);
					if (servicelist.isEmpty()){
				
			             GuideService guideService=new GuideService();
							List<Guide> guides = guideService.findAllGuide();
				            request.setAttribute("guides", guides);
				            
				            request.setAttribute("noServices", true); // 设置标志变量

						    RequestDispatcher dispatcher = request.getRequestDispatcher("./cMain.jsp");
						    dispatcher.forward(request, response);
				            
			           
						
					}
					else{
						Timestamp currentTime = new Timestamp(new Date().getTime());
						for(Service service_changestate:servicelist){
							 Timestamp serviceTime = service_changestate.getsTime();
					            long timeDifference = currentTime.getTime() - serviceTime.getTime();
					            long fiveHoursInMillis = 5 * 60 * 60 * 1000; // 5 hours in milliseconds
					            if (timeDifference > fiveHoursInMillis) {
					                // 改变服务状态
					                service_changestate.setsState("已完成");   
					            }
						
						}
						HttpSession session = request.getSession();
						session.setAttribute("myservice",servicelist);
					    request.getRequestDispatcher("myService.jsp").forward(request, response);
					}
					
					
		 			
				}
				else if(action1.equals("detailed")){
					int sId = Integer.parseInt(request.getParameter("sId").toString());
					ServiceService service = new ServiceService();
					Service ser1 = new Service();
					ser1= service.getServiceBYsId(sId); //这个返回类型是个List吗？
			        HttpSession session = request.getSession();
			         
						 System.out.println(ser1);
					session.setAttribute("service",ser1);
				    request.getRequestDispatcher("cService.jsp").forward(request, response);
		 			
				}
				else if(action1.equals("getservice")){ 
				int sId = Integer.parseInt(request.getParameter("getsId").toString());
	            int pId = Integer.parseInt(request.getParameter("servicepId").toString());
	            String serviceTimeStr = request.getParameter("serviceTime");

	            try {
	                // 解析日期部分并设置时间为当天的24点
	            	  SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	                  String startTimeStr = serviceTimeStr.split(" ")[0] + " " + serviceTimeStr.split(" ")[1].split("-")[0];
	                  Timestamp serviceTime = new Timestamp(dateTimeFormat.parse(startTimeStr).getTime());


	                ServiceService service_find = new ServiceService();
	                Service service1 = service_find.getServiceBYsId(sId);
	                service1.setpId(pId);
	                service1.setuId(userId);
	                service1.setsTime(serviceTime);
	                service1.setsState("已预约");
	                PetService petservice = new PetService();
	                
	                List<Pet> pets=petservice.findAllPet();
	                int max_pId=pets.get(pets.size() - 1).getpId();
	                if(pId>max_pId){
	                	Service ser1 = service_find.getServiceBYsId(sId);
  	                    HttpSession session = request.getSession();
  	                    session.setAttribute("service", ser1);
  	                    response.setContentType("text/html;charset=UTF-8");
  	                    response.getWriter().println("<script>alert('您的宠物Id错误，请重新输入宠物Id')</script>");
  	                    response.getWriter().println("<script>window.location.href='./cService.jsp'</script>");
	                }
	                else{
	                	  int uId = petservice.getPetBypId(pId).get(0).getuId();
	  	                if (uId == userId) {
	  	                	
	  	                	
	  	                	
	  	                	
	  	                	User user=new User();
	  	    	 			UserService userservice=new UserService();
	  	    	 			user=userservice.findUserByuId(userId);
	  	    	 			double wallet_now=user.getuWallet()-service1.getsPrice();
	  	    	 		
	  	    	 			if(wallet_now<0){
	  	    	 				
	  	    	 				
	  	    	 				
	  	    	 				Service ser1 = service_find.getServiceBYsId(sId);
	  		                    HttpSession session = request.getSession();
	  		                    session.setAttribute("service", ser1);
	  		                    response.setContentType("text/html;charset=UTF-8");
	  		                    response.getWriter().println("<script>alert('余额不足，预约失败')</script>");
	  		                    response.getWriter().println("<script>window.location.href='./cService.jsp'</script>");
	  	    	 			}
	  	    	 			else{
	  	    	 				user.setuWallet(wallet_now);
	  	    	 				
	  	    	 				userservice.UpdateWallet(user);
	  	    	 				
	  	    	 				
	  	    	 				 service_find.reservation(service1, userId, pId);

	  	 	                    List<Service> servicelist = service_find.getAllService();
	  	 	                    HttpSession session = request.getSession();
	  	 	                   List<Service> services = new ArrayList<Service>();
	  	 				        for(Service service2:servicelist){
	  	 				        	if(service2.getuId()==0){
	  	 				        		services.add(service2);
	  	 				        	}
	  	 				        	
	  	 				        }
	  	 				       session.setAttribute("Servicelist", services);
	  	 	                    response.setContentType("text/html;charset=UTF-8");
	  	 	                    response.getWriter().println("<script>alert('预约成功')</script>");
	  	 	                    
	  	 	                    response.getWriter().println("<script>window.location.href='./cServiceShop.jsp'</script>");
	  	    	 			}
	  	    	 			
	  	                

	  	                } else {
	  	                    Service ser1 = service_find.getServiceBYsId(sId);
	  	                    HttpSession session = request.getSession();
	  	                    session.setAttribute("service", ser1);
	  	                    response.setContentType("text/html;charset=UTF-8");
	  	                    response.getWriter().println("<script>alert('您的宠物Id错误，请重新输入宠物Id')</script>");
	  	                    response.getWriter().println("<script>window.location.href='./cService.jsp'</script>");
	  	                }
	                }
	                
	                
	                
	              

	            } catch (Exception e) {
	                e.printStackTrace();
	                response.setContentType("text/html;charset=UTF-8");
	                response.getWriter().println("<script>alert('日期解析错误，请重新选择时间')</script>");
	                response.getWriter().println("<script>window.location.href='./cService.jsp'</script>");
	            }
	        }
			}
		


	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
