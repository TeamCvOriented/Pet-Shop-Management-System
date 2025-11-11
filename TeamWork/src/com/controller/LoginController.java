package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Guide;
import com.entity.User;
import com.service.*;


public class LoginController extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取前端信息
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String identity = request.getParameter("identity");
		
		//封装到类
		User user = new User();
		user.setuName(name);
		user.setuPassword(password);
		if(identity.equals("customer")){
			user.setIsManager(0);
		}
		else if(identity.equals("shopOwner")){
			user.setIsManager(1);
		}
		
		//创建service对象
		UserService userService = new UserService();
		
		//创建session
		HttpSession session = request.getSession();
		
		int res = 0;
		res = userService.Login(user);
		
		//根据res跳转页面
		if(res == -2){
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().println("<script>alert('用户尚未注册')</script>");
			
			if(identity.equals("customer")){
				response.getWriter().println("<script>window.location.href='./cLogin.jsp'</script>");
			}
			else if(identity.equals("shopOwner")){
				response.getWriter().println("<script>window.location.href='./sLogin.jsp'</script>");
			}
			
		}
		else if(res == -1){
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().println("<script>alert('密码错误')</script>");
			
			if(identity.equals("customer")){
				response.getWriter().println("<script>window.location.href='./cLogin.jsp'</script>");
			}
			else if(identity.equals("shopOwner")){
				response.getWriter().println("<script>window.location.href='./sLogin.jsp'</script>");
			}
			
		}
		else{
			session.setAttribute("uId", res);
			session.setAttribute("uName", name);
			if(identity.equals("customer")){
				GuideService guideService=new GuideService();
				List<Guide> guides = guideService.findAllGuide();
	            request.setAttribute("guides", guides);
	            
				
				request.getRequestDispatcher("cMain.jsp").forward(request, response);
			}
			else if(identity.equals("shopOwner")){
				request.getRequestDispatcher("sMain.jsp").forward(request, response);
			}
		}
		
		
		
		
		
		
		
		
		
		
		
	}

	


}
