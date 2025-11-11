<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="com.entity.*"%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <title>个人主页</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="./css/cMain.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <script src="./js/jquery-3.5.1.slim.min.js"></script>
    <script src="./js/popper.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script>
        function readGuide(gId) {
            window.location.href = 'GuideController?action=read&gId=' + gId;
        }
    </script>
   
</head>
<%
    int userId = Integer.parseInt(request.getSession().getAttribute("uId").toString());
%>
<body>
    <header>
        <h1>个人主页</h1>
         <a  id="a1" href="choice.jsp"><img src="./img/退出登录.png" id="imgaa" /><span>退出登录</span></a>
    </header>
    <div class="container">
        <!-- 轮播图开始 -->
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="3000">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="./img/lunbo1.jpg" alt="First slide">
                    <div class="carousel-caption d-none d-md-block">
                        <!-- <h5>第一张图片标题</h5> -->
                        <!-- <p>第一张图片描述</p> -->
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="./img/lunbo2.jpg" alt="Second slide">
                    <div class="carousel-caption d-none d-md-block">
                        <!-- <h5>第二张图片标题</h5> -->
                        <!-- <p>第二张图片描述</p> -->
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="./img/lunbo3.jpg" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block">
                        <!-- <h5>第三张图片标题</h5> -->
                        <!-- <p>第三张图片描述</p> -->
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="./img/lunbo4.jpg" alt="Fourth slide">
                    <div class="carousel-caption d-none d-md-block">
                        <!-- <h5>第四张图片标题</h5> -->
                        <!-- <p>第四张图片描述</p> -->
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="./img/lunbo5.jpg" alt="Fifth slide">
                    <div class="carousel-caption d-none d-md-block">
                        <!-- <h5>第五张图片标题</h5> -->
                        <!-- <p>第五张图片描述</p> -->
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- 轮播图结束 -->

        <div class="content mt-4">
            <div class="nav-links">
                <a href="ShopPetController?action=1">宠物商城</a>
                <a href="ShopItemController?action=1">宠物用品商城</a>
                <a href="ShopServiceController?action=1">宠物服务商城</a>
                <a href="UpdateController?action=1">个人信息</a>
                <a href="OrderController?action=1">历史订单</a>
                <a href="ShopServiceController?action=2">历史服务</a>
                <a href="ShopPetController?action=2">我的宠物</a>
            </div>

            <div class="pet-guide-table">
                <table>
                    <thead>
                        <h3>这些宠物小知识，你知道吗?</h3>
                    </thead>
                    <tbody>
                    <% 
    Boolean noOrders = (Boolean) request.getAttribute("noOrders");
     Boolean noServices = (Boolean) request.getAttribute("noServices");
    if (noOrders != null && noOrders) { 
%>
    <script>
        alert('您还没有订单');
    </script>
                        <%
                        }
                        if (noServices != null && noServices) { 
                      
                       %> 
                         <script>
        alert('您还没有预约过服务');
    </script>
                        <%
                        
                        }
                            List<Guide> guides = (List<Guide>) request.getAttribute("guides");
                            if (guides != null) {
                                for (Guide guide : guides) {
                        %>
                            <tr>
                            	<td><%= guide.getgTitle() %></td>
                                <td><button onclick="readGuide(<%= guide.getgId() %>)" class="btn btn-primary">查看详情>></button></td>
                                
                            </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        
    </div>
    <div id="footer">
		
		<p>
			南京理工大学计算机科学与工程学院 版权所有&nbsp;Copyright&nbsp;&copy;&nbsp;2024&nbsp;All Rights Reserved
		</p>
		<p>
			联系我们：&nbsp; Tell: 647567457&nbsp; E-mail: 5647647@qq.com &nbsp;地址: 江苏省南京市玄武区孝陵卫街道200号南京理工大学
		</p>
	</div>	
</body>
</html>
