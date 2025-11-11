<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>上架新宠物</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="./css/sAddPet.css">
  </head>
  
  <body>
   
  <div class="container"> 
  <h2>添加新的宠物</h2>
   <form action="PetManagerController?action=insertPet" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
     <div class="form-group">
      <label>宠物图片:</label> <input type="file" id="pImage" name="pImage" ><br>
      </div>
      <div class="form-group">
      <label>宠物名字:</label> <input type="text" id="pName" name="pName" placeholder="请输入名字"/><br>
      </div>
      <div class="form-group">
      <label>宠物价格:</label> <input type="text" id="pPrice" name="pPrice" placeholder="请输入价格"/><br>
      </div>
      <div class="form-group">
      <label>宠物品种:</label> <input type="text" id="pBreed" name="pBreed" placeholder="请输入品种"/><br>
      </div>
      <div class="form-group">
      <label>宠物年龄:</label> <input type="text" id="pAge" name="pAge" placeholder="请输入年龄"/><br>
      </div>
      <div class="form-group">
      <label>宠物性别:</label> <input type="text" id="pSex" name="pSex" placeholder="请输入性别"/><br>
      </div>
      <div class="form-group">
      <label>宠物状态:</label> <input type="text" id="pState" name="pState" placeholder="请输入状态"/><br>
      </div>
      <div class="form-group">
      <label>宠物介绍:</label> <input type="text" id="pIntroduce" name="pIntroduce" placeholder="请输入介绍"/><br>
      </div>
     <div class="form-group">
	  <input type="submit" value="提交">
	  </div>
    </form><br>
    <a href="javascript:window.history.back()" class="back-link">返回上一页</a>
    </div>
  </body>
</html>
