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
    
    <title>宠物管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="./css/sPetManage.css">
	  <script>
        function editPet(pId) {
            window.location.href = 'PetManagerController?action=edit&pId=' + pId;
        }
    </script>
  </head>
  
  <body>
    <h1>宠物管理</h1>
    <table>
        <tr>
            <th>图片</th>
            <th>名字</th>
            <th>价格</th>
            <th>品种</th>
            <th>年龄</th>
            <th>性别</th>
            <th>状态</th>
            <th>介绍</th>
            <th>操作</th>
        </tr>
        <%
            List<Pet> pets = (List<Pet>) request.getAttribute("pets");
            for (Pet pet : pets) {
        %>
        <tr>
            <td> <img src ="<%= pet.getpImage() %>" /></td>
            <td><%= pet.getpName() %></td>
            <td><%= String.format("%.2f", pet.getpPrice()) %></td>
            <td><%= pet.getpBreed() %></td>
            <td><%= pet.getpAge() %></td>
            <td><%= pet.getpSex() %></td>
            <td><%= pet.getpState() %></td>
            <td><%= pet.getpIntroduce() %></td>
            <td><button onclick="editPet(<%= pet.getpId() %>)" class="back-button1">编辑</button></td>
        </tr>
        <%
            }
        %>
    </table>
    <br>
    <div class="button-container">
     
    <a href="PetManagerController?action=add" class="back-button">添加新的宠物</a>
     <a href="sMain.jsp" class="back-button">返回上一页</a>
        
    </div>
   
</body>
</html>
