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
    
    <title>宠物商城</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" type="text/css" href="./css/cPetShop.css">
	<link rel="stylesheet" href="./css/bootstrap.min.css">
    <script>
        function detailedPet(pId) {
            window.location.href = 'ShopPetController?action=detailed&pId=' + pId;
        }

        function searchPet() {
            var pBreed = document.getElementById("searchBreed").value;
            window.location.href = 'ShopPetController?action=search&breed=' + encodeURIComponent(pBreed);
        }
    </script>
  </head>
  <body>
  
  <div id = "header">
    
    <div class = "title">
    <h1>宠物商城</h1>
    </div>
    
    <div class = "back">
    <a href="GuideController?action=cMain"><img src="./img/灰色向左箭头.png" alt="" /></a>
    </div>
    
    <div class = "search">
    	 <input type="text" id="searchBreed" placeholder="搜索品种">
        <button class = "searchButton" onclick="searchPet()">搜索</button>
    </div>
        
    </div>
    <br>
    <div class = "main">
     <%
          List<Pet> petshoplist = (List<Pet>)request.getSession().getAttribute("petlist"); 
            for (Pet pet : petshoplist) {
        %>
  		<div class = "Box">
  		
  		<div class = "imgBox">
  		<img src ="<%= pet.getpImage() %>" />
  		</div>
  		
  		
  		<div class = "smallBox">
  		 <p><%= pet.getpBreed() %></p>
  		 
  		<p><i>&yen<%= String.format("%.2f", pet.getpPrice()) %></i></p>
  		<button class = "button" onclick="detailedPet(<%= pet.getpId() %>)">查看详情>></button>
  		</div>
  		
  		</div>
 		<%
            }
        %>
  	</div>
    </div>
   
  </body>
</html>
