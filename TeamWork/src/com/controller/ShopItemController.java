package com.controller;

import java.io.IOException;

import com.entity.*;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Pet;
import com.service.*;
public class ShopItemController extends HttpServlet {

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
			String action1 = request.getParameter("action");
			if(action1.equals("1")){
				ItemService service = new ItemService();
				List<Item> Itemlist = service.getAll();
				HttpSession session = request.getSession();
				session.setAttribute("Itemlist", Itemlist);
			    request.getRequestDispatcher("cItemShop.jsp").forward(request, response);
	 			
			}
			if(action1.equals("detailed")){
				int iId = Integer.parseInt(request.getParameter("iId").toString());
				ItemService service = new ItemService();
			    List<Item> item= service.getItemByiId(iId);
				HttpSession session = request.getSession();
				session.setAttribute("item", item);
			    request.getRequestDispatcher("cItem.jsp").forward(request, response);
	 			
			}if(action1.equals("search")) {
				String name = request.getParameter("name");
	            ItemService service = new ItemService();
	            System.out.println(name);
	            List<Item> Itemlist = service.getByName(name);
	            
	            if (Itemlist.isEmpty()){
					response.setContentType("text/html;charset=UTF-8");
		             response.getWriter().println("<script>alert('没有搜索到该用品，换个词再搜搜看吧')</script>");
		             ItemService service1 = new ItemService();
						List<Item> Itemlist1 = service1.getAll();
						HttpSession session = request.getSession();
						session.setAttribute("Itemlist", Itemlist1);
		             response.getWriter().println("<script>window.location.href='./cItemShop.jsp'</script>");
					
				}
				
				else{
					HttpSession session = request.getSession();
		            session.setAttribute("Itemlist", Itemlist);
		            request.getRequestDispatcher("cItemShop.jsp").forward(request, response);
				}
	            
	            
	        }
			
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
