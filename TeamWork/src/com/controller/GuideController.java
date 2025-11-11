package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Guide;
import com.service.GuideService;

public class GuideController extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        
        if ("read".equals(action)) {
        	int gId = Integer.parseInt(request.getParameter("gId").toString());
        	GuideService guideService=new GuideService();
        	Guide guide =new Guide();
        	System.out.println(gId);
        	guide = guideService.findGuidebygId(gId);
            request.setAttribute("guide", guide);
            request.getRequestDispatcher("readGuide.jsp").forward(request, response);
        }
        if ("cMain".equals(action)) {
        	GuideService guideService=new GuideService();
			List<Guide> guides = guideService.findAllGuide();
            request.setAttribute("guides", guides);
            
			
			request.getRequestDispatcher("cMain.jsp").forward(request, response);
        }
		
	}

}
