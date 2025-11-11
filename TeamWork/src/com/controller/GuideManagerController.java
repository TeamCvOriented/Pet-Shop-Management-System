package com.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.util.*;

import com.service.*;
import com.entity.*;
public class GuideManagerController extends HttpServlet {
	    private GuideService guideService=new GuideService();

	  
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action").toString();
        if ("add".equals(action)) {
            request.getRequestDispatcher("sAddGuide.jsp").forward(request, response);
        } 
        else if("delete".equals(action)){
        	int gId = Integer.parseInt(request.getParameter("gId"));
        	guideService.manage_deleteGuide(gId);
        	List<Guide> guides = guideService.findAllGuide();
            request.setAttribute("guides", guides);
            request.getRequestDispatcher("sAllGuide.jsp").forward(request, response);
        }
        else if ("read".equals(action)) {
        	int gId = Integer.parseInt(request.getParameter("gId"));
        	Guide guide =new Guide();
        	System.out.println(gId);
        	guide = guideService.findGuidebygId(gId);
            request.setAttribute("guide", guide);
            request.getRequestDispatcher("readGuide.jsp").forward(request, response);
        }
        	else {
            List<Guide> guides = guideService.findAllGuide();
            request.setAttribute("guides", guides);
            request.getRequestDispatcher("sAllGuide.jsp").forward(request, response);
        }
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		 request.setCharacterEncoding("UTF-8");
	        
		 Guide guide = new Guide();
	       

	        DiskFileItemFactory factory = new DiskFileItemFactory();
	        ServletFileUpload upload = new ServletFileUpload(factory);
	        upload.setHeaderEncoding("UTF-8"); 
	        try {
	            List<FileItem> formItems = upload.parseRequest(request);

	            for (FileItem item : formItems) {
	                if (item.isFormField()) {
	                    String fieldName = item.getFieldName();
	                    String fieldValue = item.getString("UTF-8");

	                    if ("gTitle".equals(fieldName)) {
	                    	guide.setgTitle(fieldValue);
	                    }else if ("gContent".equals(fieldName)) {
	                    	guide.setgContent(fieldValue);
	                    }
	                } else {
	                	String savePath = this.getServletContext().getRealPath("/img");
	                  
	                    String filename = item.getName();
	                    System.out.println(filename);
	                    if(filename==null || filename.trim().equals("")){
	                        continue;
	                    }
	                    String randomString = UUID.randomUUID().toString();
	                    filename = randomString + "_" + filename.substring(filename.lastIndexOf("\\") + 1);
	                    
	                    InputStream in = item.getInputStream();
	                    FileOutputStream out = new FileOutputStream(savePath + "\\" + filename);
	                    byte buffer[] = new byte[1024];
	                    int len = 0;
	                    while((len=in.read(buffer))>0){
	                        out.write(buffer, 0, len);
	                    }
	                    in.close();
	                    out.close();
	                    item.delete();
	                     guide.setgImage("./img/"+filename);
	                }
	            }

	            guideService.manage_addGuide(guide);
	            List<Guide> guides = guideService.findAllGuide();
	            request.setAttribute("guides", guides);
	            request.getRequestDispatcher("sAllGuide.jsp").forward(request, response);

	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
      
    }
}
