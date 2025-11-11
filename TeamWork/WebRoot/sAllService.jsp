<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.entity.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>所有服务预约</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="./css/sAllService.css">
  </head>
  
  <body>
    <h1>所有服务预约信息</h1>
    <table>
        <tr>
        
            <th>服务图片</th>
            <th>服务名称</th>
            
            <th>用户ID</th>
            <th>宠物ID</th>
            
            <th>预约服务时间</th>
            <th>状态</th>
        </tr>
        <%
            List<Service> services = (List<Service>) request.getAttribute("services");
            if (services != null) {
                for (Service service : services) {
                
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒");
                    String formattedTime = dateFormat.format(service.getsTime());
        %>
        <tr>
            <td><img src="<%= service.getsImage() %>" /></td>
            <td><%= service.getsName() %></td>
            
            <td><%= service.getuId() %></td>
            <td><%= service.getpId() %></td>
            
            <td><%= formattedTime %></td>
            <td><%= service.getsState() %></td>
        </tr>
        <%
                }
            }
        %> 
    </table>
    <br>
    <div class="button-container">
        <a href="sMain.jsp" class="back-button">返回</a>
    </div>
</body>
</html>
