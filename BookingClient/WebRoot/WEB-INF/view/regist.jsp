<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>12306注册账号</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	

  

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="<%=basePath%>images/12306.png">
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" href="<%=basePath%>logincss/bootstrap.min.css">
	<link rel="stylesheet" href="<%=basePath%>logincss/animate.css">
	<link rel="stylesheet" href="<%=basePath%>logincss/style.css">

	<!-- Modernizr JS -->
	<script src="<%=basePath%>loginjs/modernizr-2.6.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
		<script type="text/javascript">
		function unameValid(){
			var uname = $("#uname").val();
			var destURL = "<%=basePath%>UserValidSvl?uname=" + uname;
			$.ajax({
				type : "GET",
				url : destURL,
				success : function(msg) {
				var span = document.getElementById("unameAlert");
				if(msg == 1){
					span.innerHTML = "您输入的用户名可以使用！";
				}else{
					span.innerHTML = "您输入的用户名已存在，请重新输入！";
				}
			}
			});
		}
		</script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="loginjs/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
	<br><br><br>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					

					<!-- Start Sign In Form -->
					<form action="<%=basePath%>RegistSvl" method="post" class="fh5co-form animate-box" data-animate-effect="fadeIn">
						<h2>注册</h2>
						<!-- <div class="form-group">
							<div class="alert alert-success" role="alert">您的信息已记录</div> 
						</div> -->
						<div class="form-group">
							<label for="name" class="sr-only">用户名</label>
							<input type="text" class="form-control" id="uname" name="uname" placeholder="姓名" autocomplete="off" onblur="unameValid()">
						</div>
						<div class="form-group">
							<span id="unameAlert"></span>
						</div>
						<div class="form-group">
							<label for="email" class="sr-only">邮箱</label>
							<input type="email" class="form-control" id="email" placeholder="邮箱" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">密码</label>
							<input type="password" class="form-control" id="password" placeholder="密码"  name="pwd" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="re-password" class="sr-only">再次确认密码</label>
							<input type="password" class="form-control" id="re-password" placeholder="再次确认密码" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="remember"><input type="checkbox" id="remember">记住我</label>
						</div>
						<div class="form-group">
							<p>已有账号? <a href="<%=basePath%>LoginSvl">登录</a> | <a href="<%=basePath%>TicketQuerySvl">返回首页</a></p>
						</div>
						
						<div class="form-group">
							<input type="submit" value="注册" class="btn btn-primary">
						</div>
						
					</form>
					<!-- END Sign In Form -->

				</div>
			</div>

		</div>
	
	<!-- jQuery -->
	<script src="<%=basePath%>loginjs/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="<%=basePath%>loginjs/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="<%=basePath%>loginjs/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="<%=basePath%>loginjs/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="<%=basePath%>loginjs/main.js"></script>

	</body>
</html>