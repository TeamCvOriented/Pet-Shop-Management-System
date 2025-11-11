package com.controller;

import com.entity.Pet;
import com.entity.User;
import com.service.PetService;




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


public class PetManagerController extends HttpServlet {
    private PetService petService;

    public void init() throws ServletException {
        petService = new PetService();
    }
 
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	   request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("list".equals(action)) {
            listPets(request, response);
        } else if ("add".equals(action)) {
            request.getRequestDispatcher("sAddPet.jsp").forward(request, response);
        } else if ("edit".equals(action)) {
            int pId = Integer.parseInt(request.getParameter("pId"));
            Pet pet = petService.getPetBypId(pId).get(0);
            request.setAttribute("pet", pet);
            request.getRequestDispatcher("sUpdatePet.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");

    	String action = request.getParameter("action");
       
        if ("insertPet".equals(action)) {
            
            addPet(request, response);
        } else if ("updatePet".equals(action)) {
            updatePet(request, response);
        }
    }

    private void listPets(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	   request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        List<Pet> pets = petService.getByuId(0);
        request.setAttribute("pets", pets);
        request.getRequestDispatcher("sPetManage.jsp").forward(request, response);
    }

    private void addPet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        Pet pet = new Pet();
       

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
                    } else if ("pPrice".equals(fieldName)) {
                        pet.setpPrice(Double.parseDouble(fieldValue));
                    } else if ("pBreed".equals(fieldName)) {
                        pet.setpBreed(fieldValue);
                    } else if ("pAge".equals(fieldName)) {
                        pet.setpAge(fieldValue);
                    } else if ("pSex".equals(fieldName)) {
                        pet.setpSex(fieldValue);
                    } else if ("pState".equals(fieldName)) {
                        pet.setpState(fieldValue);
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

            petService.addPet(pet, 0);
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('上架成功')</script>");
            
            response.sendRedirect("PetManagerController?action=list");

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    private void updatePet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	   request.setCharacterEncoding("UTF-8");

    	   
    	   Pet pet = new Pet();
           DiskFileItemFactory factory = new DiskFileItemFactory();
           ServletFileUpload upload = new ServletFileUpload(factory);
           upload.setHeaderEncoding("UTF-8");
    	   String pIdString = request.getParameter("pId");
    	   pIdString = pIdString.replace("/", "");
    	   int pId = Integer.parseInt(pIdString);
    	   pet.setpId(pId);
    	   String existingImage = null;
           try {
               List<FileItem> formItems = upload.parseRequest(request);

               for (FileItem item : formItems) {
                   if (item.isFormField()) {
                       String fieldName = item.getFieldName();
                       String fieldValue = item.getString("UTF-8");

                       if ("pName".equals(fieldName)) {
                           pet.setpName(fieldValue);
                       }else if ("pPrice".equals(fieldName)) {
                           pet.setpPrice(Double.parseDouble(fieldValue));
                       } else if ("pBreed".equals(fieldName)) {
                           pet.setpBreed(fieldValue);
                       } else if ("pAge".equals(fieldName)) {
                           pet.setpAge(fieldValue);
                       } else if ("pSex".equals(fieldName)) {
                           pet.setpSex(fieldValue);
                       } else if ("pState".equals(fieldName)) {
                           pet.setpState(fieldValue);
                       } else if ("pIntroduce".equals(fieldName)) {
                           pet.setpIntroduce(fieldValue);
                       }else if ("existingImage".equals(fieldName)) {
                           existingImage = fieldValue;
                       }
                   } else {
                   	String savePath = this.getServletContext().getRealPath("/img");
                     
                       String filename = item.getName();
//                       System.out.println(filename);
                       if(filename==null || filename.trim().equals("")){
                           continue;
                       }
                       filename = filename.substring(filename.lastIndexOf("\\")+1);
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
               if (pet.getpImage() == null && existingImage != null) {
                   pet.setpImage(existingImage);
               }
    	   
		petService.updatePet(pet);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println("<script>alert('更新成功')</script>");
	
        response.sendRedirect("PetManagerController?action=list");
           } catch (Exception ex) {
               ex.printStackTrace();
           }
    }
}
