<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.entity.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>所有订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="./css/sAllOrder.css">
  </head>
  
  <body>
    <h1>所有订单信息</h1>
    <table>
        <tr>
            <th>订单编号</th>
            <th>买家编号</th>
            <th>图片</th>
            <th>购买内容</th>
            
            <th>购买时间</th>
            <th>买家评价</th>
             </tr>
            <%
            List<Order> orders = (List<Order>) request.getSession().getAttribute("orders");
            List<String> names = (List<String>)request.getSession().getAttribute("names");
         List<String> imgs = (List<String>)request.getSession().getAttribute("imgs");
         
            if (orders != null) {
            int i=0; 
                for (Order order : orders) {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒");
        		String formattedTime = dateFormat.format(order.getoTime());
        %>
         <tr>
                <td> <%= order.getoId() %> </td>
                <td> <%= order.getuId() %> </td>
                <td> <img src ="<%= imgs.get(i) %>" /></td>
               <td><%= names.get(i)  %></td>
               
               <td><%= formattedTime  %></td>
                <td><%=order.getoEvaluate() %></td>
                
                </tr>
               <%
                i++;
                }
                
            }
        %> 
        </table>
    <br>
    <div class="button-container">
        
    <a href="sMain.jsp" class="back-button">返回</a>
    </div>
 
  </body>
</html>
