package com.controller;

import com.entity.*;
import com.service.ItemService;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.*;

public class ItemManagerController extends HttpServlet {
    private ItemService itemService;

    public void init() throws ServletException {
    	itemService = new ItemService();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("list".equals(action)) {
            listItems(request, response);
        } else if ("add".equals(action)) {
            request.getRequestDispatcher("sAddItem.jsp").forward(request, response);
        } else if ("edit".equals(action)) {
            int iId = Integer.parseInt(request.getParameter("iId"));
            Item item = itemService.getItemByiId(iId).get(0);
            request.setAttribute("item", item);
            request.getRequestDispatcher("sUpdateItem.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("insertItem".equals(action)) {
            addItem(request, response);
        } else if ("updateItem".equals(action)) {
            updateItem(request, response);
        }
    }

    private void listItems(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        List<Item> items = itemService.getAll();
        request.setAttribute("items", items);
        request.getRequestDispatcher("sItemManage.jsp").forward(request, response);
    }

    private void addItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	  request.setCharacterEncoding("UTF-8");
          
          Item item1 = new Item();
         

          DiskFileItemFactory factory = new DiskFileItemFactory();
          ServletFileUpload upload = new ServletFileUpload(factory);
          upload.setHeaderEncoding("UTF-8"); 
          try {
              List<FileItem> formItems = upload.parseRequest(request);

              for (FileItem item : formItems) {
                  if (item.isFormField()) {
                      String fieldName = item.getFieldName();
                      String fieldValue = item.getString("UTF-8");

                      if ("iName".equals(fieldName)) {
                          item1.setiName(fieldValue);
                      } else if ("iPrice".equals(fieldName)) {
                    	  item1.setiPrice(Double.parseDouble(fieldValue));
                      } else if ("iInventory".equals(fieldName)) {
                    	  item1.setiInventory(Integer.parseInt(fieldValue));
                      } else if ("iIntroduce".equals(fieldName)) {
                    	  item1.setiIntroduce(fieldValue);
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
                       item1.setiImage("./img/"+filename);
                  }
              }

              itemService.addItem(item1);
              response.setContentType("text/html;charset=UTF-8");
              response.getWriter().println("<script>alert('上架成功')</script>");
              response.sendRedirect("ItemManagerController?action=list");

          } catch (Exception ex) {
              ex.printStackTrace();
          }
    }

    private void updateItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	request.setCharacterEncoding("UTF-8");
 	   String iIdString = request.getParameter("iId");
 	   iIdString = iIdString.replace("/", "");
 	   int iId = Integer.parseInt(iIdString);
    	
 	  Item item1 = new Item();
      item1.setiId(iId);
      String existingImage = null;
      DiskFileItemFactory factory = new DiskFileItemFactory();
      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setHeaderEncoding("UTF-8"); 
      try {
          List<FileItem> formItems = upload.parseRequest(request);

          for (FileItem item : formItems) {
              if (item.isFormField()) {
                  String fieldName = item.getFieldName();
                  String fieldValue = item.getString("UTF-8");

                  if ("iName".equals(fieldName)) {
                      item1.setiName(fieldValue);
                  } else if ("iPrice".equals(fieldName)) {
                	  item1.setiPrice(Double.parseDouble(fieldValue));
                  } else if ("iInventory".equals(fieldName)) {
                	  item1.setiInventory(Integer.parseInt(fieldValue));
                  } else if ("iIntroduce".equals(fieldName)) {
                	  item1.setiIntroduce(fieldValue);
                  }else if ("existingImage".equals(fieldName)) {
                      existingImage = fieldValue;
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
                   item1.setiImage("./img/"+filename);
              }
          }
 	   
          if (item1.getiImage() == null && existingImage != null) {
        	  item1.setiImage(existingImage);
          }
		
        itemService.updateItem(item1);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println("<script>alert('更新成功')</script>");
        response.sendRedirect("ItemManagerController?action=list");
      } catch (Exception ex) {
          ex.printStackTrace();
      }
    }
}
