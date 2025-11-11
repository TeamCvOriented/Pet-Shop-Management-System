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
    
    <title>历史订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="./css/myOrder.css">
	<script>
        function makeEvaluate(oId) {
            window.location.href = 'OrderController?action=make&oId=' + oId;
        }
    </script>
  </head>
  
  <body>
  
  <div id = "header">
  		<div class = "title">
    <h1>历史订单</h1>
    </div>
    <div class = "back">
     <a href="GuideController?action=cMain"><img src="./img/灰色向左箭头.png" alt="" /></a>
    </div>
  		</div>
    <table>
        <tr>
           <th>编号</th>
            <th>购买内容</th>
           <th>图片</th>
            <th>时间</th>
            <th>评论</th>
            <th>操作</th>
        </tr>
        <%
         List<Order> myordertlist1 = (List<Order>)request.getSession().getAttribute("myorderlist"); 
         List<String> names = (List<String>)request.getSession().getAttribute("names");
         List<String> imgs = (List<String>)request.getSession().getAttribute("imgs");
         int i=0; 
            for (Order order : myordertlist1) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒");
        		String formattedTime = dateFormat.format(order.getoTime());
        %>
        <tr>
               <td> <%= order.getoId() %> </td>
               <td><%= names.get(i)  %></td>
               <td> <img src ="<%= imgs.get(i) %>" /></td>
               <td><%= formattedTime  %></td>
               <td><%= order.getoEvaluate()  %></td>
               <td><button onclick="makeEvaluate(<%= order.getoId() %>)" class="back-button1">写评论</button></td>
        </tr>
        <%
        i++;
            }
        %>
    </table>
   
  </body>
</html>
