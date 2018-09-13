<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>12306找回密码</title>
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
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="loginjs/respond.min.js"></script>
	<![endif]-->
<!-- 	<script type="text/javascript">
		function()
	</script> -->
	</head>
	<body>
	<br><br><br>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					

					<!-- Start Sign In Form -->
					<form action="#" class="fh5co-form animate-box" data-animate-effect="fadeIn">
						<h2>找回密码</h2>
					<!-- 	<div class="form-group">
							<div class="alert alert-success" role="alert">已发送到您的邮箱</div>
						</div> -->
						<div class="form-group">
							<label for="email" class="sr-only">邮箱</label>
							<input type="email" class="form-control" id="email" placeholder="邮箱" autocomplete="off">
						</div>
						<div class="form-group">
							<p><a href="<%=basePath%>LoginSvl">登录</a> 或 <a href="<%=basePath%>RegistSvl">注册</a></p>
						</div>
						<div class="form-group">
							<p> <a href="<%=basePath%>TicketQuerySvl">返回首页</a></p>
						</div>
						<div class="form-group">
							<input type="submit" value="发送验证邮件" class="btn btn-primary">
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