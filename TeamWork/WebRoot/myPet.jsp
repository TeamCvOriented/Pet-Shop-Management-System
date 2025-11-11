<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="com.entity.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的宠物</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="./css/myPet.css">
	
  </head>

  <body>
   
  		<div id = "header">
  		<div class = "title">
    <h1>我的宠物</h1>
    </div>
    <div class = "back">
     <a href="GuideController?action=cMain"><img src="./img/灰色向左箭头.png" alt="" /></a>
    </div>
    
    	
    
  		</div>
  		
  		
  		<table>
        <tr>
           <th>宠物编号</th>
           <th>宠物图片</th>
           <th>宠物种类</th>
            <th>宠物名字</th>
            <th>宠物年龄</th>
            <th>宠物性别</th>
        </tr>
          <%
         List<Pet> mypetlist = (List<Pet>)request.getSession().getAttribute("petlist"); 
            for (Pet p : mypetlist) {
        %>
        <tr>
               <td> <%= p.getpId() %> </td>
               <td class  = "img"> <img src ="<%= p.getpImage() %>" /> </td>
               <td><%= p.getpBreed()  %></td>
               <td><%= p.getpName()  %></td>
               <td><%= p.getpAge()%></td>
               <td><%= p.getpSex() %></td>
        </tr>
        <%
        }
        %>
    </table>
    <br>
    <div class="button-container">
     
    <a href="ShopPetController?action=add" class="back-button">添加宠物</a>
        
    </div>
    
    
  </body>
</html>
