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
    
    <title>修改宠物用品信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="./css/sUpdateItem.css"> 
  </head>
  
  <body>
        <%
            Item item = (Item) request.getAttribute("item");
        %>
         <div class="container"> 
           <h2>修改宠物用品信息</h2>
   <form action="ItemManagerController?action=updateItem&iId=<%= item.getiId() %>" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
    <div class="form-group">
        
        <label>宠物用品图片： </label> <img src="<%= item.getiImage() %>" alt="Item Image" width="100" height="100"><br>
  		<input type="hidden" id="existingImage" name="existingImage" value="<%= item.getiImage() %>">
  		 <input type="file" id="iImage" name="iImage">
        </div>
          <div class="form-group">
        <label>宠物用品名：</label> <input type="text" id="iName" name="iName" value="<%=item.getiName()%>"/>
        </div>
       <div class="form-group">        
       <label>宠物用品价格：</label><input type="text" id="iPrice" name="iPrice" value="<%=item.getiPrice()%>"/>
       </div>
        <div class="form-group">
      <label>宠物用品余量：</label><input type="text" id="iInventory" name="iInventory" value="<%=item.getiInventory()%>"/>
      </div>
       <div class="form-group">
      <label>宠物用品介绍：</label><input type="text" id="iIntroduce" name="iIntroduce" value="<%=item.getiIntroduce()%>"/>
       </div>
		<input type="submit" value="提交">
    </form><br>
       <a href="javascript:window.history.back()" class="back-link">返回上一页</a>
    </div>
  </body>
</html>
