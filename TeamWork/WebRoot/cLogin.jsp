<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>买家端登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="./css/cLogin.css">
	<link rel="stylesheet" href="./css/page.min.css">
	<link rel="stylesheet" href="./style.css">
  </head>
<body id="i9pe">
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="keywords" content=""/>
  <title>用户登录
  </title>
<!--   <link href="https://coscdn.htmlpage.cn/html-template/assets/css/page.min.css" rel="stylesheet"/> -->
<!--   <link href="https://coscdn.htmlpage.cn/html-template/assets/css/style.css" rel="stylesheet"/> -->

  <div id="iwelv" class="bg-main-img c2733">

    <!-- Main Content -->
    <main id="iqgi5" class="main-content c2758">
      <div class="rounded shadow-7 w-400 mw-100 p-6 mx-auto">
        <h5 class="mb-7">买家端登录
        </h5>
        <form action="LoginController" method="get" onsubmit="return onSubmitLoginForm()">
        <input type="hidden" name="identity" value="customer"/>
          <div class="form-group">
            <input type="text" name="name" placeholder="用户名" class="form-control"/>
          </div>
          <div class="form-group">
            <input type="password" name="password" placeholder="密码" class="form-control"/>
          </div>
          <div class="form-group d-flex align-items-center">
          <input type="text" name="verification" placeholder="验证码" class="form-control flex-grow-1"/>
    <canvas id="canvas" onclick="dj()" style="background-color:white"></canvas>
	</div>
          
          <div class="form-group flexbox py-3">
            <div class="custom-control custom-checkbox">
              <input type="checkbox" checked class="custom-control-input"/>
            </div>
          </div>
          <div class="form-group">
            <button type="submit" class="btn btn-block btn-primary">登录</button>
          </div>
        </form>
        <hr class="w-30"/>
        <p class="text-center text-muted small-2">您还没有账号？ 
          <a href="cRegister.jsp">立即注册</a>
        </p>
      </div>
    </main>
 
  </div>

 
</body>
<script>
 var show_num = [];
 draw(show_num);
function dj(){
 draw(show_num);   
 }
function sublim(){
var val = document.getElementsByName("verification")[0].value.toLowerCase();  
    var num = show_num.join("").toLowerCase();
    if(val == '') {
      alert('请输入验证码！');
      return false;
    } else if(val == num) {
      document.getElementsByName("verification")[0].value = '';
      draw(show_num);
      return true;
    } else {
      alert('验证码错误！\n请重新输入！');
      document.getElementsByName("verification")[0].value = '';
      draw(show_num);
      return false;
    }
          }
function draw(show_num) {
        var canvas_width=document.getElementById('canvas').clientWidth;
        var canvas_height=document.getElementById('canvas').clientHeight;
        var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
        var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
        canvas.width = canvas_width;
        canvas.height = canvas_height;
        var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0,q,w,e,r,t,y,u,i,o,p,a,s,d,f,g,h,j,k,l,z,x,c,v,b,n,m";
        var aCode = sCode.split(",");
        var aLength = aCode.length;//获取到数组的长度
			
        for (var i = 0; i <= 3; i++) {
            var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
            var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
            var txt = aCode[j];//得到随机的一个内容
            show_num[i] = txt;
            var x = 10 + i * 20;//文字在canvas上的x坐标
            var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
            context.font = "bold 23px 微软雅黑";

            context.translate(x, y);
            context.rotate(deg);

            context.fillStyle = randomColor();
            context.fillText(txt, 0, 0);

            context.rotate(-deg);
            context.translate(-x, -y);
        }
        for (var i = 0; i <= 5; i++) { //验证码上显示线条
            context.strokeStyle = randomColor();
            context.beginPath();
            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.stroke();
        }
        for (var i = 0; i <= 30; i++) { //验证码上显示小点
            context.strokeStyle = randomColor();
            context.beginPath();
            var x = Math.random() * canvas_width;
            var y = Math.random() * canvas_height;
            context.moveTo(x, y);
            context.lineTo(x + 1, y + 1);
            context.stroke();
        }
    }
function randomColor() {//得到随机的颜色值
        var r = Math.floor(Math.random() * 256);
        var g = Math.floor(Math.random() * 256);
        var b = Math.floor(Math.random() * 256);
        return "rgb(" + r + "," + g + "," + b + ")";
    }
  

            // 在表单提交时调用校验函数
        function onSubmitLoginForm(event) {
          
            return sublim();
        }
  
</script>
</html>
