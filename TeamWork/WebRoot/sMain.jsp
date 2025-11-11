<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>店家主页</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="./css/sMain.css">
</head>

<body>
    <div class="background">
        <div class="logout-container">
            <a id="a1" href="choice.jsp"><img src="./img/关机.png" id="logout-button" /></a>
        </div>
        <div class="centered-container">
            <div class="title">
                <h1>店家主页</h1>
            </div>
            <nav>
                <a href="PetManagerController?action=list" class="button">宠物管理</a>
                <a href="sAddPet.jsp" class="button">上架新宠物</a>
                <a href="ItemManagerController?action=list" class="button">宠物用品管理</a>
                <a href="sAddItem.jsp" class="button">上架新宠物用品</a>
                <a href="sReservationController?action=1" class="button">查看所有预约服务</a>
                <a href="UpdateController?action=2" class="button">个人信息</a>
                <a href="sOrderController" class="button">查看所有订单</a>
                <a href="GuideManagerController?action=all" class="button">宠物百科管理</a>
            </nav>
        </div>
    </div>
</body>
</html>
