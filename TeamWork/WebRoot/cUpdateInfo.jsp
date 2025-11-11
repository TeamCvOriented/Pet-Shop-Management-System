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
    
    <title>修改个人信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="./css/cUpdateInfo.css">
	
	
	
<script type="text/javascript">

	// 验证手机号
	function validateForm() {
		var phone = document.getElementById("phone").value;
		let regExp = /^(1\d{10})$/; // 1开头的11位数字
		
		if (!regExp.test(phone)) {
			alert("手机号不是11位");
			return false;
		}
		return true;
	}
	
  </script>
  
  
  </head>
  
  <body>
    <%
   	User userInfo = (User) session.getAttribute("UserInfo");
     %>
    <div class="container">
    <h2>修改个人信息</h2>
    <form action="UpdateController" method="get" onsubmit="return validateForm()" accept-charset="UTF-8">
    <input type="hidden" name="update" value="cUpdate"/>
     <div class="form-group">
      <label>用户名：</label><input type="text" name="newName" value="<%=userInfo.getuName()%>"/>
      </div>
      <div class="form-group">
      <label> 邮箱：</label><input type="text" name="newEmail" value="<%=userInfo.getuEmail()%>"/>
      </div>
      <div class="form-group">
 	  <label> 手机号：</label><input type="text" name="newPhone" value="<%=userInfo.getuPhone()%> "/>
 	  </div>
		 <input type="submit" value="提交">
    </form>
    
 <p>   <a href="javascript:window.history.back()" class="back-link">返回上一页</a></p>
  </div>
  </body>
</html>
