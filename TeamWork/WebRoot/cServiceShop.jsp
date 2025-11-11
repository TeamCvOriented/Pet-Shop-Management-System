<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="com.entity.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>服务商城</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <link rel="stylesheet" type="text/css" href="./css/cServiceShop.css">
	<link rel="stylesheet" href="./css/bootstrap.min.css">
<script>
        function detailedService(sId) {
            window.location.href = 'ShopServiceController?action=detailed&sId=' + sId;
        }
    </script>
  </head>
  <body>
   <div id = "header">
    
    <div class = "title">
    <h1>服务商城</h1>
    </div>
    
    <div class = "back">
    <a href="GuideController?action=cMain"><img src="./img/灰色向左箭头.png" alt="" /></a>
    </div>
    
        
    </div>
    <br>
    <div class = "main">
     <%
           List<Service> Servicelist = (List<Service>)request.getSession().getAttribute("Servicelist"); 
            if (Servicelist != null) {
            for (Service service : Servicelist) {
        %>
  		<div class = "Box">
  		
  		<div class = "imgBox">
  		<img src ="<%= service.getsImage() %>" />
  		</div>
  		
  		
  		<div class = "smallBox">
  		 <p><%= service.getsName() %></p>
  		 
  		<p><i>&yen<%= String.format("%.2f", service.getsPrice()) %></i></p>
  		<button class = "button"onclick="detailedService(<%= service.getsId() %>)">查看详情>></button>
  		</div>
  		
  		</div>
 		<%
            }
            }
        %>
  	</div>
    </div>
  </body>
</html>
