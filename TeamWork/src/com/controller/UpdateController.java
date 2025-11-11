package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.OrderService;
import com.service.UserService;
import com.entity.*;

public class UpdateController extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		//获取前端参数
		
				
		String uId1 = request.getSession().getAttribute("uId").toString();	
		int uId = Integer.parseInt(uId1);
		
		//建立service对象
		UserService userService = new UserService();
		User user = new User();
		user = userService.findUserByuId(uId);
		
        HttpSession session2 = request.getSession();
        session2.setAttribute("UserInfo", user);
		
        //获取更新页面的信息
        String update = request.getParameter("update");
        String newName = request.getParameter("newName");
		String newEmail = request.getParameter("newEmail");
		String newPhone = request.getParameter("newPhone");
        
		//创建新对象
		User newUser = new User();
		newUser.setIsManager(user.getIsManager());
		newUser.setuPassword(user.getuPassword());
		newUser.setuName(newName);
		newUser.setuEmail(newEmail);
		newUser.setuPhone(newPhone);
		newUser.setuID(uId);
        System.out.print("uName：");
        System.out.print(newUser);
        if(update == null){
        	String action1 = request.getParameter("action").toString();
    		int action = Integer.parseInt(action1);
        	
        	if(action == 1){
            	request.getRequestDispatcher("cInfo.jsp").forward(request, response);
            }
            else if(action == 2){
            	request.getRequestDispatcher("sInfo.jsp").forward(request, response);   	
    		} 
        }
        else if(update.equals("cUpdate")){
        	userService.Update(newUser);
        	response.setContentType("text/html;charset=UTF-8");
    		response.getWriter().println("<script>alert('信息修改成功')</script>");
    		UserService userService1 = new UserService();
    		User user1 = new User();
    		user1 = userService1.findUserByuId(uId);
    		
            HttpSession session3 = request.getSession();
            session3.setAttribute("UserInfo", user1);
    		response.getWriter().println("<script>window.location.href='./cInfo.jsp'</script>");
        }
        else if(update.equals("sUpdate")){
        	userService.Update(newUser);
        	response.setContentType("text/html;charset=UTF-8");
    		response.getWriter().println("<script>alert('信息修改成功')</script>");
    		UserService userService1 = new UserService();
    		User user1 = new User();
    		user1 = userService1.findUserByuId(uId);
    		
            HttpSession session3 = request.getSession();
            session3.setAttribute("UserInfo", user1);
    		response.getWriter().println("<script>window.location.href='./sInfo.jsp'</script>");
        }
	}

}
