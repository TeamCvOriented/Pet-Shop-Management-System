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
    
    <title>宠物用品商城</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/cItemShop.css">
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <script>
        function detailedItem(iId) {
            window.location.href = 'ShopItemController?action=detailed&iId=' + iId;
        }
        function searchItem() {
            var iName = document.getElementById("searchName").value;
            window.location.href = 'ShopItemController?action=search&name=' + encodeURIComponent(iName);
        }
    </script>
  </head>
  <body>
    
    <div id = "header">
    
    <div class = "title">
    <h1>宠物用品</h1>
    </div>
    
    <div class = "back">
    <a href="GuideController?action=cMain"><img src="./img/灰色向左箭头.png" alt="" /></a>
    </div>
    
    <div class = "search">
    	<input type="text" id="searchName" placeholder="搜索你想要的宠物用品">
        <button class = "searchButton" onclick="searchItem()">搜索</button>
    </div>
        
    </div>
    <br>
    <div class = "main">
     <%
           List<Item> Itemlist = (List<Item>)request.getSession().getAttribute("Itemlist"); 
            for (Item item : Itemlist) {
        %>
  		<div class = "Box">
  		
  		<div class = "imgBox">
  		<img src ="<%= item.getiImage() %>" />
  		</div>
  		
  		
  		<div class = "smallBox">
  		 <p><%= item.getiName() %></p>
  		 
  		<p><i>&yen<%= String.format("%.2f", item.getiPrice()) %></i></p>
  		<button class = "button" onclick="detailedItem(<%= item.getiId() %>)">查看详情</button>
  		</div>
  		
  		</div>
 		<%
            }
        %>
  	</div>
    </div>
   
    
  </body>
</html>
