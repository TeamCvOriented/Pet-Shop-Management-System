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
    
    <title>宠物百科条目一览</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="./css/sAllGuide.css">
	
    
	<script>
        function deleteGuide(gId) {
            window.location.href = 'GuideManagerController?action=delete&gId=' + gId;
        }
         function readGuide(gId) {
            window.location.href = 'GuideManagerController?action=read&gId=' + gId;
        }
    </script>
  </head>
  
  <body>
    <h1>宠物百科条目一览</h1>
    <table>
        <tr>
            <th>删除</th>
            <th>标题</th>
            <th>详情</th>
        </tr>
        <%
            List<Guide> guides = (List<Guide>) request.getAttribute("guides");
            if (guides != null) {
                for (Guide guide : guides) {
        %>
            <tr>
                <td><button onclick="deleteGuide(<%= guide.getgId() %>)" class="back-button1">删除</button></td>
                <td><%= guide.getgTitle() %></td>
                <td><button onclick="readGuide(<%= guide.getgId() %>)" class="back-button1">查看详情>></button></td>
            </tr>
        <%
                }
            }
        %>
    </table>
    <br>
    
    <div class="button-container">
        <a href="GuideManagerController?action=add" class="back-button">添加新百科</a>
    <a href="sMain.jsp" class="back-button">返回上一页</a>
    </div>
    
    
</body>
</html>
