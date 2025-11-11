<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>宠物店管理系统登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="./css/choice.css">
	<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- 新 Bootstrap 核心 CSS 文件 -->

  </head>
  
  <body id="i9pe">


  <section data-block-type="contents" data-id="2" draggable="true" class="fdb-block">
    <div class="container">
      <div class="row text-center">
        <div class="col-12">
          <h1 id="iw6h">
            <b>宠物店管理系统登录
            </b>
          </h1>
          <div id="iwygm" class="c25357">
            <br/>
          </div>
          <p class="text-h2">
          </p>
        </div>
      </div>
      <div class="row text-center pt-3 pt-xl-5">
        <div class="col-12 col-sm-10 m-auto m-md-0 col-md-6">
          <button type="button" id="i2mks" onclick="window.location.href='./cLogin.jsp'">我是买家</button>
          <p class="text-h3">
          </p>
        </div>
        <div class="col-12 col-sm-10 m-auto m-md-0 col-md-6">
          <button type="button" id="ir31x" onclick="window.location.href='./sLogin.jsp'">我是店家</button>
        </div>
      </div>
    </div>
  </section>
</body>
</html>
