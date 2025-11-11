<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page import="com.entity.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>宠物服务详情</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="./css/cService.css">
	<link rel="stylesheet" href="./css/bootstrap.min.css">
    <script>
        function getService(sId) {
            var pId = document.getElementById("pId").value;
            var radioButtons = document.getElementsByName('serviceTime');
            var selectedTime = null;
            for (var i = 0; i < radioButtons.length; i++) {
                if (radioButtons[i].checked) {
                    selectedTime = radioButtons[i].value;
                    break;
                }
            }
            if (selectedTime) {
                window.location.href = 'ShopServiceController?action=getservice&servicepId=' + pId + '&getsId=' + sId + '&serviceTime=' + encodeURIComponent(selectedTime);
            } else {
                alert("请选择一个服务时间");
            }
        }
    </script>
</head>
<body>
 <%
    Service service = (Service) request.getSession().getAttribute("service");
    %>
<div class = "main">
        
  <div id = "header">
    <div class = "title">
    <h1>宠物服务</h1>
    </div>
    <div class = "back">
    
    </div>
  </div>
   		
  <div class = "content">
  
  <div class = "left">
  <img alt="" src="<%= service.getsImage() %>">
  </div>
  
  <div class = "right">
   			<h5><%= service.getsName() %></h5>
   			
  			 <i>价格：<span>&yen<%= String.format("%.2f", service.getsPrice()) %></span></i>            
            <p id = "p1">介绍：<%= service.getsIntroduce()  %></p>
           <p id = "p2">请输入预约的宠物ID:<input type="text" name="pId" id="pId"/></p> 

<h6>请选择服务时间：</h6>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Calendar calendar = Calendar.getInstance();
calendar.add(Calendar.DAY_OF_MONTH, 5);
String fiveDaysLater = sdf.format(calendar.getTime());
String[] timeSlots = {
        fiveDaysLater + " 09:00-10:00",
        fiveDaysLater + " 10:00-11:00",
        fiveDaysLater + " 11:00-12:00",
        fiveDaysLater + " 14:00-15:00",
        fiveDaysLater + " 15:00-16:00",
        fiveDaysLater + " 16:00-17:00"
};
for (String timeSlot : timeSlots) {
    out.println("<input type='radio' name='serviceTime' value='" + timeSlot + "'> " + timeSlot + "<br>");
}
%>
             <p><button class = "button" onclick="getService(<%= service.getsId() %>)">立即预约</button> <a href="ShopServiceController?action=1">返回</a></p>    <!--这里可以加一个确定弹窗-->
  </div>
  
  </div>
  </div>
</body>
</html>
