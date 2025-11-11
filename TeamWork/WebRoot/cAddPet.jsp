<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加宠物</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="./css/cAddPet.css">
  </head>
  
  <body>
   
    <div class="container">
    <h2>添加宠物信息</h2>
   <form action="ShopPetController?action=insertPet" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
    <div class="form-group">
       <label>宠物图片：</label> <input type="file" id="pImage" name="pImage"><br>
       </div>
        <div class="form-group">
      <label>宠物名字：</label> <input type="text" id="pName" name="pName" />
       </div>
        <div class="form-group">
       <label>宠物品种：</label> <input type="text" id="pBreed" name="pBreed" />
       </div>
        <div class="form-group">
       <label>宠物年龄：</label> <input type="text" id="pAge" name="pAge" />
       </div>
        <div class="form-group">
       <label>宠物性别：</label> <input type="text" id="pSex" name="pSex" />
       </div>
        <div class="form-group">
       <label>宠物介绍：</label> <input type="text" id="pIntroduce" name="pIntroduce" />
       </div>
		 <input type="submit" value="提交">
    </form><br>
   <a href="javascript:window.history.back()" class="back-link">返回上一页</a>
   </div>
  </body>
</html>
