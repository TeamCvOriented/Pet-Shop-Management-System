package com.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.entity.*;
import com.service.*;
public class ShopPetController extends HttpServlet {

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
			PetService service = new PetService();
			List<Pet> petshoplist = service.getByuId(0);
			HttpSession session = request.getSession();
			session.setAttribute("petlist", petshoplist);
		    request.getRequestDispatcher("cPetShop.jsp").forward(request, response);
 			
		}
		if(action1.equals("detailed")){
			int pId = Integer.parseInt(request.getParameter("pId").toString());
			PetService service = new PetService();
		    List<Pet> Pet= service.getPetBypId(pId);
			HttpSession session = request.getSession();
			session.setAttribute("Pet", Pet);
		    request.getRequestDispatcher("cPet.jsp").forward(request, response);
 			
		}
		if(action1.equals("2")){
			PetService service = new PetService();
			List<Pet> petshoplist = service.getByuId(userId);
			if (petshoplist.isEmpty()){
				response.setContentType("text/html;charset=UTF-8");
	             response.getWriter().println("<script>alert('您还没有与自己关联的宠物，先添加宠物吧')</script>");
	             response.getWriter().println("<script>window.location.href='./cAddPet.jsp'</script>");
				
			}
			
			else{
				HttpSession session = request.getSession();
				session.setAttribute("petlist", petshoplist);
			    request.getRequestDispatcher("myPet.jsp").forward(request, response);
			}
			
			
 			
		}
		if(action1.equals("add")){
			
		    request.getRequestDispatcher("cAddPet.jsp").forward(request, response);
 			
		}
		if(action1.equals("search")) {
			String breed = request.getParameter("breed");
            PetService service = new PetService();
            System.out.println(breed);
            List<Pet> petshoplist = service.getBypBreed(breed);
            if (petshoplist.isEmpty()){
				response.setContentType("text/html;charset=UTF-8");
	             response.getWriter().println("<script>alert('没有搜索到该品种，换个词再搜搜看吧')</script>");
	             PetService service1 = new PetService();
	 			List<Pet> petshoplist1 = service1.getByuId(0);
	 			HttpSession session = request.getSession();
	 			session.setAttribute("petlist", petshoplist1);
	             response.getWriter().println("<script>window.location.href='./cPetShop.jsp'</script>");
				
			}
			
			else{
				HttpSession session = request.getSession();
	            session.setAttribute("petlist", petshoplist);
	            request.getRequestDispatcher("cPetShop.jsp").forward(request, response);
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
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getSession().getAttribute("uId").toString());
		String action1 = request.getParameter("action");
		if(action1.equals("insertPet")){
			  request.setCharacterEncoding("UTF-8");
		        PetService petservice=new PetService();
		        Pet pet = new Pet();
		       pet.setuId(userId);

		        DiskFileItemFactory factory = new DiskFileItemFactory();
		        ServletFileUpload upload = new ServletFileUpload(factory);
		        upload.setHeaderEncoding("UTF-8"); 
		        try {
		            List<FileItem> formItems = upload.parseRequest(request);

		            for (FileItem item : formItems) {
		                if (item.isFormField()) {
		                    String fieldName = item.getFieldName();
		                    String fieldValue = item.getString("UTF-8");

		                    if ("pName".equals(fieldName)) {
		                        pet.setpName(fieldValue);
		                    }else if ("pBreed".equals(fieldName)) {
		                        pet.setpBreed(fieldValue);
		                    } else if ("pAge".equals(fieldName)) {
		                        pet.setpAge(fieldValue);
		                    } else if ("pSex".equals(fieldName)) {
		                        pet.setpSex(fieldValue);
		                    } else if ("pIntroduce".equals(fieldName)) {
		                        pet.setpIntroduce(fieldValue);
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
		                     pet.setpImage("./img/"+filename);
		                }
		            }

		            petservice.addPet(pet, userId);
		            List<Pet> petshoplist = petservice.getByuId(userId);
					HttpSession session = request.getSession();
					session.setAttribute("petlist", petshoplist);
		            response.setContentType("text/html;charset=UTF-8");
		            response.getWriter().println("<script>alert('添加成功')</script>");
		            response.getWriter().println("<script>window.location.href='./myPet.jsp'</script>");

		        } catch (Exception ex) {
		            ex.printStackTrace();
		        }
			
		}
    }
}
