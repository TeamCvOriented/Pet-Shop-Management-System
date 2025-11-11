<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="com.entity.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>历史服务预约记录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="./css/myService.css">
	<link rel="stylesheet" href="./css/bootstrap.min.css">
  </head>
  <body>

  		<div id = "header">
  		<div class = "title">
    <h1>历史服务预约记录</h1>
    </div>
    <div class = "back">
     <a href="GuideController?action=cMain"><img src="./img/灰色向左箭头.png" alt="" /></a>
    </div>
  		</div>
  		
  		<table>
        <tr>
           <th>服务预约编号</th>
           <th>图片</th>
            <th>服务名称</th>
            <th>宠物ID</th>
            
            <th>状态</th>
            <th>时间</th>
        </tr>
        <%
         List<Service> myservicelist = (List<Service>)request.getSession().getAttribute("myservice"); 
            for (Service service : myservicelist) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");
        		String formattedTime = dateFormat.format(service.getsTime());
        %>
        <tr>
               <td> <%= service.getsId() %> </td>
               <td class = "img"> <img src ="<%= service.getsImage() %>" /></td>
               <td><%= service.getsName()  %></td>
               <td><%= service.getpId()  %></td>
               
                <td><%= service.getsState()  %></td>
               <td><%= formattedTime %></td>
              
               
        </tr>
        <%
            }
        %>
    </table>
  </body>
</html>
