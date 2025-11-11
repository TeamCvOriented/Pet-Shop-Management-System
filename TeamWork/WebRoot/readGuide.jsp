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
    <title>宠物百科</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" href="./css/readGuide.css">
</head>
<body>
    <div class="guide-container">
        <% Guide guide = (Guide) request.getAttribute("guide"); %>
        
        <h1 class="guide-title"><%= guide.getgTitle() %></h1>
        <img src="<%= guide.getgImage() %>" class="guide-image" />
        <p class="guide-content"><%= guide.getgContent().replace("\n", "<br>") %></p>
        
        <a href="javascript:window.history.back()" class="back-link">返回上一页</a>
    </div>
</body>
</html>
