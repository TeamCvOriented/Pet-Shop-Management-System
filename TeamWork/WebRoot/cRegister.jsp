<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>买家端注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="./css/cRegister.css">
	<link rel="stylesheet" href="./css/page.min.css">
	<link rel="stylesheet" href="./style.css">
  <script type="text/javascript">

	// 验证密码和验证码
	function validateForm() {
		var password = document.getElementById("password").value;
		var confirmpassword = document.getElementById("confirmpassword").value;
		var phone = document.getElementById("phone").value;
		
		let regExp = /^(1\d{10})$/; // 1开头的11位数字
		
		if (!/\d/.test(password) || !/[a-zA-Z]/.test(password)) {
        alert("密码必须包含数字和字母！");
        return false;
      }
		if (password !== confirmpassword) {
			alert("密码不一致");
			return false;
		}
		if (!regExp.test(phone)) {
			alert("手机号不是11位");
			return false;
		}
		return true;
	}
	
  </script>
  </head>
<body id="i9pe">
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="keywords" content=""/>
  <title>用户登录
  </title>


  <div id="iwelv" class="bg-main-img c2733">

    <!-- Main Content -->
    <main id="iqgi5" class="main-content c2758">
      <div class="rounded shadow-7 w-400 mw-100 p-6 mx-auto">
        <h5 class="mb-7">买家端注册
        </h5>
        <form action="RegisterController" method="get" onsubmit="return validateForm()">
        <input type="hidden" name="identity" value="customer"/>
          <div class="form-group">
            <input type="text" name="name" placeholder="用户名" class="form-control"/>
          </div>
          <div class="form-group">
            <input type="password" name="password" id="password" placeholder="密码" class="form-control"/>
          </div>
          <div class="form-group">
            <input type="password" name="confirmpassword" id="confirmpassword" placeholder="确认密码" class="form-control"/>
          </div>
          <div class="form-group">
            <input type="text" name="email" placeholder="邮箱" class="form-control"/>
          </div>
          <div class="form-group">
            <input type="text" name="phone" placeholder="手机号" id="phone" class="form-control"/>
          </div>
<!-- <div class="form-group d-flex align-items-center"> -->
<!--           <input type="text" name="verification" placeholder="验证码" class="form-control flex-grow-1"/> -->
<!--     <canvas id="canvas" onclick="dj()" style="background-color:white"></canvas> -->
<!-- 	</div> -->
          
          <div class="form-group flexbox py-3">
            <div class="custom-control custom-checkbox">
              <input type="checkbox" checked class="custom-control-input"/>
            </div>
          </div>
          <div class="form-group">
            <button type="submit" class="btn btn-block btn-primary" id="button1">注册</button>
          </div>
        </form>
        
        <p class="text-center text-muted small-2">已有账号？ 
          <a href="cLogin.jsp">立即登录</a>
        </p>
      </div>
    </main>
 
  </div>

 
</body>

</html>
