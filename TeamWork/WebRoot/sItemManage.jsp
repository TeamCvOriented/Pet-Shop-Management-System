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
    
    <title>宠物用品管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" href="./css/sItemManage.css">
	  <script>
        function editItem(iId) {
            window.location.href = 'ItemManagerController?action=edit&iId=' + iId;
        }
    </script>
  </head>
  
  <body>
    <h1>宠物用品管理</h1>
    <table>
        <tr>
            <th>图片</th>
            <th>名称</th>
            <th>库存</th>
            <th>价格</th>
            <th>介绍</th>
            <th>操作</th>
        </tr>
        <%
            List<Item> items = (List<Item>) request.getAttribute("items");
            for (Item item : items) {
        %>
        <tr>
            <td> <img src ="<%= item.getiImage() %>" /></td>
            <td><%= item.getiName() %></td>
            <td><%= item.getiInventory() %></td>
            
            <td><%= String.format("%.2f", item.getiPrice()) %></td>
           
            <td><%= item.getiIntroduce() %></td>
            <td><button onclick="editItem(<%= item.getiId() %>)" class="back-button1">编辑</button></td>
        </tr>
        <%
            }
        %>
    </table>
    <br>
    
    <div class="button-container">
    
    <a href="ItemManagerController?action=add" class="back-button">添加新的宠物用品</a>
    <a href="sMain.jsp" class="back-button">返回</a>
       
    </div>
    
</body>
</html>
