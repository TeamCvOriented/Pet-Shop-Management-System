<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="com.entity.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>评价订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
     <link rel="stylesheet" href="./css/cEvaluate.css">
  </head>
  
  <body>
<div class="comment-form-container">
 <h2>发表评论：</h2>
   <form action="OrderController" method="get" onsubmit="return EvaluateForm()">
   <input type="hidden" name="oId" value=<%= request.getSession().getAttribute("oId")  %> />
   <input type="hidden" name="action" value="evaluate" />
   <div class="form-group">
   <textarea id="Evaluate" name="Evaluate"  rows-"4"  placeholder="留下您的评论" required></textarea><br>
   </div>
   <div class="form-group">
   <button id ='btn' type="submit" value="提交"  >提交评论</button>
   </div>
   </form>
   <a href="javascript:window.history.back()" class="back-link">返回上一页</a>
  
 </div>
  </body>
  <script>
  // 声明变量
  var btn = document.getElementById('btn');

  // 给按钮添加点击事件
  btn.onclick = function EvaluateForm() {
    // 获取当前textarea的值
    var val = document.getElementById("Evaluate").value;

    // 检查值是否为空或者null
    if (val === '' || val === null) {
      alert('请输入评论');
      return false; // 阻止表单提交
    } else {
      return true; // 允许表单提交
    }
  };
</script>
</html>
