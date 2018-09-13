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
	<title>铁路客户服务中心</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
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
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="css/superfish.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">
	<!-- Date Picker -->
	<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
	<!-- CS Select -->
	<link rel="stylesheet" href="css/cs-select.css">
	<link rel="stylesheet" href="css/cs-skin-border.css">
	
	<link rel="stylesheet" href="css/style.css">
	


	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<style>
		#div1{
			color:gray;
			vertical-align: middle;
    		text-align: center;  
		}
	</style>

	</head>
	<body>
		<div id="fh5co-wrapper">
		<div id="fh5co-page">

		<header id="fh5co-header-section" class="sticky-banner">
			<div class="container">
				<div class="nav-header">
					<a class="js-fh5co-nav-toggle fh5co-nav-toggle dark"><i></i></a>
					<h1 id="fh5co-logo"><a><i class="icon-address"></i>中国铁路客户服务中心</a></h1>
					<!-- START #fh5co-menu-wrap -->
					<nav id="fh5co-menu-wrap" role="navigation">
						<ul class="sf-menu" id="fh5co-primary-menu">
							<li class="active"><a href="<%=basePath%>">首页</a></li>
						<!--	<li>
								<a href="vacation.html" class="fh5co-sub-ddown">Vacations</a>
								<ul class="fh5co-sub-menu">
									<li><a href="#">Family</a></li>
									<li><a href="#">CSS3 &amp; HTML5</a></li>
									<li><a href="#">Angular JS</a></li>
									<li><a href="#">Node JS</a></li>
									<li><a href="#">Django &amp; Python</a></li>
								</ul>
							</li>
						<!--	<li><a href="flight.html">Flights</a></li>  -->
							
							
							
	<!--修改{-->			<c:if test="${user == null}">
	
							<li><a href="<%=basePath%>LoginSvl" >登录</a></li>
							<li><a href="<%=basePath%>RegistSvl">注册</a></li>
							</c:if>
							<c:if test="${user != null}">
							<li>
							<a><i class="icon-user-tie"></i>&nbsp;${user.uname}</a>
								
								<ul class="fh5co-sub-menu">
									<li><a href="<%=basePath%>BookImfoQuerySvl">我的订单</a></li>
									<li><a href="<%=basePath%>LogoutSvl">注销</a></li>
									<!-- <li><a href="#">Django &amp; Python</a></li> -->
								</ul>
							</li>
							<%-- <li><a href="car.html">我的订单</a></li>
	      	    			<li><a>欢迎${user.uname}</a></li>
	      	    			<li><a href="<%=basePath%>LogoutSvl">注销</a></li> --%>
	      	    			</c:if>  
	<!--修改}-->      	    			
	      	    			
						
						</ul>
					</nav>
				</div>
			</div>
		</header>

<div class="fh5co-hero">
	<div class="fh5co-overlay"></div>
	<div class="fh5co-cover" data-stellar-background-ratio="0.5" style="background-image: url(images/cover_bg_1.jpg);">
		<div class="desc">
			<div class="container">
				<div class="tabulation animate-box">
					<div>
						<ul class="nav nav-tabs" role="tablist">
								      <li role="presentation" class="active">
								      	<a href="<%=basePath%>" aria-controls="flights" role="tab" data-toggle="tab">历史订单</a>
								      </li>
								    <!--  <li role="presentation">
								    	   <a href="#hotels" aria-controls="hotels" role="tab" data-toggle="tab">Hotels</a>
								      </li>
								      <li role="presentation">
								    	   <a href="#packages" aria-controls="packages" role="tab" data-toggle="tab">Packages</a>
								      </li>  -->
						</ul>
						<div class="tab-content">
					<table class="table table-hover" id="div1">
 						<tr class="text-center">
 						<th class="text-center">车次</th>
 						<th class="text-center">出发地</th>
 						<th class="text-center">目的地</th>
 						<th class="text-center">出发日期</th>
 						<th class="text-center">出发时间</th>
 						<th class="text-center">历时</th>
 						<th class="text-center">座位号</th>
 						<th class="text-center">类型</th>
 						<th></th>
 						<th class="text-center">订单编号</th>				
 						</tr>
 					
					<c:forEach var="bt" items="${btim}">
 					<tr>
 						<td>${bt.tno}</td>
 						<td>${bt.departure_name}</td>
 						<td>${bt.destination_name}</td>
 						<td>${bt.startDate}</td>
 						<td>${bt.startTime}</td>
 						<td>${bt.longTime}</td>
 						<td>${bt.seatno}</td>
 						<td>${bt.type}</td>
 						<td></td>
 						<td>${bt.orderno}</td>
 					</tr>
 					</c:forEach>
 					
 					
				</table>

					</div>
					</div>
				</div>
			</div>>
		</div>
	</div>
</div>
		
		
	<footer>
			<div id="footer">
				<div class="container">
					<div class="row row-bottom-padded-md">
						<div class="col-md-2 col-sm-2 col-xs-12 fh5co-footer-link">
							<h3>热门目的地</h3>
							<ul>
							
								<li><a href="#">北京</a></li>
								<li><a href="#">成都</a></li>
								<li><a href="#">厦门</a></li>
								<li><a href="#">上海</a></li>
								<li><a href="#">重庆</a></li>
							</ul>
						</div>
						<div class="col-md-2 col-sm-2 col-xs-12 fh5co-footer-link">
							<h3>攻略指南</h3>
							<ul>
								<li><a href="#">攻略社区</a></li>
								<li><a href="#">旅游攻略</a></li>
								<li><a href="#">旅行游记</a></li>
								<li><a href="#">旅游问答</a></li>
							</ul>
						</div>
						<div class="col-md-2 col-sm-2 col-xs-12 fh5co-footer-link">
							<h3>关于12306</h3>
							<ul>
								<li><a href="#">关于12306</a></li>
								<li><a href="#">隐私政策</a></li>
								<li><a href="#">联系我们</a></li>
								<li><a href="#">12306热点</a></li>
								<li><a href="#">诚聘英才</a></li>
							</ul>
						</div>
						<div class="col-md-2 col-sm-2 col-xs-12 fh5co-footer-link">
							<h3>快速入口</h3>
							<ul>
								<li><a href="#">火车时刻表</a></li>
								<li><a href="#">正晚点查询</a></li>
								<li><a href="#">公告信息</a></li>
								<li><a href="#">更多</a></li>
							</ul>
						</div>
						<div class="col-md-2 col-sm-2 col-xs-12 fh5co-footer-link">
							<h3>合作伙伴</h3>
							<ul>
								<li><a href="http://azha.site" target="_blank">&copy;阿扎哲健甫</a></li>
								<li><a href="mailto:754696166@qq.com">&copy;Noea</a></li>
								<li><a href="mailto:794113934@qq.com">&copy;Finwood</a></li>
								<li><a href="http://12306.cn" target="_blank">12306</a></li>
							</ul>
						</div>
						<div class="col-md-2 col-sm-2 col-xs-12 fh5co-footer-link">
						
							<h3>关于旅行</h3>
							<p>一个背包，几本书，所有喜欢的歌，一张单程车票，一颗潇洒的心，在路上遇见最真实的自己。</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-md-offset-3 text-center">
							<p class="fh5co-social-icons">
								<a href="#"><i class="icon-renren"></i></a>
								<a href="#"><i class="icon-qq"></i></a>
								<a href="#"><i class="icon-sina-weibo"></i></a>
								<a href="#"><i class="icon-facebook2"></i></a>
								<a href="#"><i class="icon-twitter"></i></a>
							</p>
							<p>版权所有&nbsp;&copy;2017-2018&nbsp;北京工业大学&nbsp;BigData<br>浏览更多信息请访问<a href="http://12306.cn/" target="_blank" title="12306">12306</a></p>
						</div>
					</div>
				</div>
			</div>
		</footer>


	

	</div>
	<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->

	<!-- jQuery -->


	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/sticky.js"></script>

	<!-- Stellar -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Superfish -->
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="js/bootstrap-datepicker.min.js"></script>
	<!-- CS Select -->
	<script src="js/classie.js"></script>
	<script src="js/selectFx.js"></script>
	
	<!-- Main JS -->
	<script src="js/main.js"></script>

	</body>
</html>