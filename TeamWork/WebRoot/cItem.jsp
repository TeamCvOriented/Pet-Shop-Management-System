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
    
    <title>宠物用品详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="./css/cItem.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
  </head>
  <script>
        function buyItem(iId) {
            var num = document.getElementById("num").innerHTML;
            if (num == 0) {
            alert("请选择购买数量！");
            return;
        }
            window.location.href = 'OrderController?action=buyitem&itemnum=' + num + '&buyiId=' + iId;
        }
  </script>
  <body>
  <%
           List<Item> item2 = (List<Item>)request.getSession().getAttribute("item");
          int size = item2.size();
		Item[] item1 = item2.toArray(new Item[size]); 
        %>
        <div class = "main">
        
  <div id = "header">
    <div class = "title">
    <h1>宠物用品详情</h1>
    </div>
    <div class = "back">
    
    </div>
  </div>
   		
  <div class = "content">
  
  <div class = "left">
  <img alt="" src="<%= item1[0].getiImage() %>">
  </div>
  
  <div class = "right">
   			<h5><%= item1[0].getiName() %></h5>
   			
  			 <i>价格：<span>&yen<%= String.format("%.2f", item1[0].getiPrice()) %></span></i>
  			 <i>库存：<%= item1[0].getiInventory() %></i>            
            <p id = "p1">介绍：<%= item1[0].getiIntroduce() %></p>
            <div class="quantity-selector ">
		<button id="increase" class="increase-btn">+</button><span id="num">0</span><button class="decrease-btn" id="reduce" disabled>-</button>
    </div>
             <p><button class = "button" onclick="buyItem(<%= item1[0].getiId() %>)">立即购买</button> <a href="ShopItemController?action=1">返回</a></p>    <!--这里可以加一个确定弹窗-->
  </div>
  
  </div>
  </div>
    
   
  </body>
  
  
  
  
  
  
  <!--当大于商品余量时，也可以添加一个按钮的禁用-->
  <script>
		let num = document.getElementById("num");
		let increase = document.getElementById("increase");
		let reduce = document.getElementById("reduce");

		increase.onclick = function() {
			num.innerHTML = parseInt(num.innerHTML) + 1;
			if (num.innerHTML > 0) {
				reduce.disabled = false;
			}
		}
		reduce.onclick = function() {
			num.innerHTML = parseInt(num.innerHTML) - 1;
			if (num.innerHTML == 0) {
				reduce.disabled = true;
			}
		}
  </script>
</html>
