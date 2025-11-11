<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加新宠物百科</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
 
  <link rel="stylesheet" href="./css/sAddGuide.css">
  <body>
     <div class="container">
    <h2>添加新的宠物百科条目</h2>
    <form action="GuideManagerController" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
    <div class="form-group">
        <label for="gTitle">标题:</label>
        <input type="text" id="gTitle" name="gTitle" placeholder="请输入标题" required><br>
        </div>
         <div class="form-group">
        <label for="gContent">内容:</label>
        <textarea id="gContent" name="gContent" placeholder="请输入内容" required></textarea><br>
        </div>
         <div class="form-group">
        <label>图片:</label>  <input type="file" id="gImage" name="gImage"><br>
       
        </div>
        <div class="form-group">
        
        <input type="submit" value="提交">
        </div>
    </form>
    <br>
    <a href="javascript:window.history.back()" class="back-link">返回上一页</a>
   </div>
  </body>
</html>
