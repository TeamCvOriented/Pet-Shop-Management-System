package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.User;
import com.service.UserService;

public class RegisterController extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//获取前端信息
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String identity = request.getParameter("identity");
		
		int isManager = -1;
		
		//根据identity跳转页面确定isManager
		if(identity.equals("customer")){
			isManager = 0;
		}
		else if(identity.equals("shopOwner")){
			isManager = 1;
		}
		
		//封装到类
		User user = new User();
		user.setuName(name);
		user.setuPassword(password);
		user.setIsManager(isManager);
		user.setuEmail(email);
		user.setuPhone(phone);
		user.setuWallet(3000);
		
		//创建service对象
		UserService userService = new UserService();
		userService.register(user);
		
		//前端提示注册成功
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println("<script>alert('注册成功，点击确定跳转到登录页面')</script>");
		
		//根据identity跳转到对应的登录页面
		if(identity.equals("customer")){
			response.getWriter().println("<script>window.location.href='./cLogin.jsp'</script>");
		}
		else if(identity.equals("shopOwner")){
			response.getWriter().println("<script>window.location.href='./sLogin.jsp'</script>");
		}
		
		
		
	}

	

}
