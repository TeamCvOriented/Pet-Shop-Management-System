<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.entity.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="./css/sInfo.css">
	<link rel="stylesheet" href="./css/bootstrap.min.css">
  </head>
  
  <body>
     <%
   	User userInfo = (User) session.getAttribute("UserInfo");
     %>
     
      <div class="main">
    
    <div class = "board">
   <h3>个人信息</h3>
     <p>用户名：<%=userInfo.getuName()%></p>
      <p>邮箱：<%=userInfo.getuEmail()%></p>
      <p>手机号：<%=userInfo.getuPhone()%></p>
	  <a href="sUpdateInfo.jsp">编辑</a>
	  <a href="sMain.jsp">返回</a>
    </div>
    
      <div class="call">
		<h3>联系我们：</h3>
		<p>QQ:123456789</p>
		<p>邮箱：5647647@qq.com</p>
		<p>手机：647567457</p>
		<p>地址：江苏省南京市玄武区孝陵卫街道<br />200号南京理工大学</p>
	</div>	
  </div>
     
    
  </body>
</html>
