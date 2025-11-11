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
    
    <title>宠物详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="./css/cPet.css">
	<link rel="stylesheet" href="./css/bootstrap.min.css">
<script>
        function buyPet(pId) {
            window.location.href = 'OrderController?action=buypet&buypId=' + pId;
        }
    </script>
  </head>
  
  <body>
  		<%
          List<Pet> pet2 = (List<Pet>)request.getSession().getAttribute("Pet");
          int size = pet2.size();
		Pet[] pet1 = pet2.toArray(new Pet[size]); 
        %>
        <div class = "main">
        
  <div id = "header">
    <div class = "title">
    <h1>宠物详情</h1>
    </div>
    <div class = "back">
    
    </div>
  </div>
   		
  <div class = "content">
  
  <div class = "left">
  <img alt="" src="<%= pet1[0].getpImage() %>">
  </div>
  
  <div class = "right">
   			<h5>品种：<%= pet1[0].getpBreed() %></h5>
   			
  			 <i>价格：<span>&yen<%= String.format("%.2f", pet1[0].getpPrice()) %></span></i>            
            <p id = "p1">介绍：<%= pet1[0].getpIntroduce()  %></p>
             <p><button class = "button" onclick="buyPet(<%= pet1[0].getpId() %>)">立即购买</button> <a href="ShopPetController?action=1">返回</a></p>    <!--这里可以加一个确定弹窗-->
  </div>
  
  </div>
  </div>
  </body>
</html>
