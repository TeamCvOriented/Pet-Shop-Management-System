<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.entity.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改宠物信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="./css/sUpdatePet.css">
  </head>
  
  <body>
   <div class="container"> 
   <h2>修改宠物信息</h2>
   <%
            Pet pet = (Pet) request.getAttribute("pet");
        %>
   <form action="PetManagerController?action=updatePet&pId=<%= pet.getpId() %>" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
  		 <div class="form-group"> 
  		<label>宠物图片： </label> <img src="<%= pet.getpImage() %>" alt="Pet Image" width="100" height="100"><br>
  		<input type="hidden" id="existingImage" name="existingImage" value="<%= pet.getpImage() %>">
  		 <input type="file" id="pImage" name="pImage">
    </div>
    <div class="form-group"> 
       <label>宠物名字：</label><input type="text" id="pName" name="pName" value="<%=pet.getpName()%>"/>
       </div>
       <div class="form-group"> 
      <label>宠物价格： </label> <input type="text" id="pPrice" name="pPrice" value="<%=pet.getpPrice()%>"/>
       </div>
       <div class="form-group"> 
      <label>宠物品种： </label> <input type="text" id="pBreed" name="pBreed" value="<%=pet.getpBreed()%>"/>
       </div>
       <div class="form-group"> 
      <label>宠物年龄： </label> <input type="text" id="pAge" name="pAge" value="<%=pet.getpAge()%>"/>
       </div>
       <div class="form-group"> 
      <label>宠物性别： </label><input type="text" id="pSex" name="pSex" value="<%=pet.getpSex()%>"/>
       </div>
       <div class="form-group"> 
      <label>宠物状态： </label><input type="text" id="pState" name="pState" value="<%=pet.getpState()%>"/>
       </div>
       <div class="form-group"> 
       <label>宠物介绍： </label><input type="text" id="pIntroduce" name="pIntroduce" value="<%=pet.getpIntroduce()%>"/>
       </div>
	<input type="submit" value="提交">
    </form><br>
        <a href="javascript:window.history.back()" class="back-link">返回上一页</a>
     </div>
  </body>
</html>
