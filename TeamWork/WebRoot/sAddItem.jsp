<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>上架新宠物用品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="./css/sAddItem.css">
  </head>
  
  <body>
  <div class="container"> 
    <h2>添加新的宠物用品</h2>
   <form action="ItemManagerController?action=insertItem" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
    <div class="form-group">
       <label>宠物用品图片:</label><input type="file" id="iImage" name="iImage"><br>
       </div>
        <div class="form-group">
       <label>宠物用品名字:</label> <input type="text" id="iName" name="iName" />
       </div>
        <div class="form-group">
       <label>宠物用品价格:</label> <input type="text" id="iPrice" name="iPrice" />
       </div>
         <div class="form-group">
       <label>宠物用品余量:</label> <input type="text" id="iInventory" name="iInventory" />
       </div>
        <div class="form-group">
       <label>宠物用品介绍:</label> <input type="text" id="iIntroduce" name="iIntroduce" />
       </div>
       <div class="form-group">
		 <input type="submit" value="提交">
		</div>
    </form><br>
    <a href="javascript:window.history.back()" class="back-link">返回上一页</a>
    </div>
  </body>
</html>

