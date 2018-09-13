<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <base href="<%=basePath%>">
    
    <title>12306登录账号</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
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

	<link href='https://fonts.useso.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
	
	<link rel="stylesheet" href="<%=basePath%>logincss/animate.css">
	<link rel="stylesheet" href="<%=basePath%>logincss/style.css">
	<link rel="stylesheet" href="<%=basePath%>logincss/bootstrap.min.css">
	
	<!-- Modernizr JS -->
	<script src="<%=basePath%>loginjs/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="loginjs/respond.min.js"></script>
	<![endif]-->
	

  </head>
  
  <%-- <body>
    <form action="<%=basePath%>LoginSvl" method="post">
        <table align="center">
            <tr><td height=200></td></tr>
            <tr><td>用户名<td><input type="text"  name="uname"/> ${msg} </td></tr>
            <tr><td>密码<td><input type="password"  name="pwd"/></td></tr>
            <tr><td colspan=2 align="center"> <input type="submit" value="提交"/></td></tr>
        </table>
    </form>
      
    
  </body> --%>
  
  
  <body>
  <br/><br/><br/>
		<div class="container" >
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					

					<!-- Start Sign In Form -->
					<form action="<%=basePath%>LoginSvl" method="post" class="fh5co-form animate-box" data-animate-effect="fadeIn">
						<h2>登录</h2>
						<div class="form-group">
							
							<label for="username" class="sr-only">Username</label>
							<input type="text" class="form-control" name="uname" placeholder="用户名" autocomplete="off">
							<%-- <div class="alert alert-success" role="alert">${msg}</div> --%>
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">Password</label>
							<input type="password" class="form-control" name="pwd" placeholder="密码" autocomplete="off">
						</div>
							<c:if test="${msg != null}">
								<div class="alert alert-warning" role="alert">${msg}</div>
							</c:if>
						<div class="form-group">
							<label for="remember"><input type="checkbox" id="remember"> 记住我</label>
						</div>
						<div class="form-group">
							<p>还未注册? <a href="<%=basePath%>RegistSvl">注册</a>  </p>
						</div>
						<div class="form-group">
							<p> <a href="<%=basePath%>ForgotSvl">忘记密码</a> | <a href="<%=basePath%>TicketQuerySvl">返回首页</a></p>
						</div>
						<div class="form-group">
							<input type="submit" value="登录" class="btn btn-primary">
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
