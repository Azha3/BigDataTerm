<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>车票预订</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>themes/icon.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.easyui.min.js"></script>


	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="<%=basePath%>images/12306.png">

	
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="<%=basePath%>css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="<%=basePath%>css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="<%=basePath%>css/superfish.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="<%=basePath%>css/magnific-popup.css">
	<!-- Date Picker -->
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap-datepicker.min.css">
	<!-- CS Select -->
	<link rel="stylesheet" href="<%=basePath%>css/cs-select.css">
	<link rel="stylesheet" href="<%=basePath%>css/cs-skin-border.css">
	
	<link rel="stylesheet" href="<%=basePath%>css/style.css">
	
	
	
	
	
	<link href="/bootstrap-select-1.12.4/dist/css/bootstrap-select.min.css" rel="stylesheet" />



	<!-- Modernizr JS -->
	<script src="<%=basePath%>js/modernizr-2.6.2.min.js"></script>
	<script src="/bootstrap-select-1.12.4/dist/js/bootstrap-select.min.js"></script>
	
	
	
	
	
	
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->



<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/layer.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>skin/default/layer.css"/>
</head>

<%-- <body style="width:100%;height:100%;">
	<center>
		<table align="center" width=90%>
			<tr>
				<td align=right><c:if test="${user != null}">
						<a>欢迎${user.uname}登录</a>
					</c:if> <c:if test="${user == null}">
						<a href="<%=basePath%>LoginSvl">登录</a>
					</c:if></td>
			</tr>
		</table>
		<table>
			<tr>
				<td>${td.startDate}&nbsp;&nbsp;${td.tno}次&nbsp;&nbsp;
					${td.departure_name}站(${td.startTime})&nbsp; -- &nbsp;
					${td.destination_name}站 &nbsp;&nbsp;&nbsp;&nbsp; 历时 ${td.longTime}</td>
			</tr>
		</table>

		<input type="hidden" id="bno" value="${td.bno}" />
		<table>
			<tr>
				<td>席别 : <select id="ticketType" name="ticketType">
						<c:forEach items="${ttdList}" var="ttd">

							<c:if test="${ttd.count>0 && ttd.type=='01'}">
								<option value='${ttd.type}'>一等座 -- ${ttd.count}张</option>
							</c:if>
							<c:if test="${ttd.count>0 && ttd.type=='02'}">
								<option value='${ttd.type}'>二等座 -- ${ttd.count}张</option>
							</c:if>
							<c:if test="${ttd.count>0 && ttd.type=='03'}">
								<option value='${ttd.type}'>硬座 -- ${ttd.count}张</option>
							</c:if>
							<c:if test="${ttd.count>0 && ttd.type=='04'}">
								<option value='${ttd.type}'>硬卧 -- ${ttd.count}张</option>
							</c:if>
							<c:if test="${ttd.count>0 && ttd.type=='05'}">
								<option value='${ttd.type}'>软卧 -- ${ttd.count}张</option>
							</c:if>
						</c:forEach>
				</select>
				</td>
				<td><input id="but01" type="button" value="提交订单" style="width:70" /></td>
			</tr>
		</table>
	</center>
</body>
 --%>



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


		<!-- end:header-top -->
	
		<div class="fh5co-hero">
			<div class="fh5co-overlay"></div>
			<div class="fh5co-cover" data-stellar-background-ratio="0.5" style="background-image: url(images/cover_bg_1.jpg);">
				<div class="desc">
					<div class="container">
						<div class="row">
							<div class="col-sm-5 col-md-5">
								

							
					<div class="container">
				<div class="tabulation animate-box">
					<div>
						<ul class="nav nav-tabs" role="tablist">
							 
								      <li role="presentation" class="active">
								      	<a href="<%=basePath%>" aria-controls="flights" role="tab" data-toggle="tab">预订车票</a>
								      </li>
								   
						</ul>
						<div class="tab-content">
		<input type="hidden" id="bno" value="${td.bno}" />				
		<table class="table table-hover" >
		<tr>
			<th>日期</th>
			<th>班次</th>
			<th>始发站</th>
			<th>目的地</th>
			<th>历时</th>
			<th>席别 </th>
		</tr>
			<tr>
			    <td style="vertical-align: middle !important;">${td.startDate}</td>
			    <td style="vertical-align: middle !important;">${td.tno}次</td>
			    <td style="vertical-align: middle !important;">${td.departure_name}站(${td.startTime})</td>
				<td style="vertical-align: middle !important;">${td.destination_name}站</td> 
				<td style="vertical-align: middle !important;">${td.longTime}</td>
				<td> 
				
				<select class="cs-select cs-skin-border " id="ticketType" name="ticketType">
				
							<option value="" disabled selected>---请选择座位---</option>
						<c:forEach items="${ttdList}" var="ttd">
							<c:if test="${ttd.price==0}">
								<c:if test="${ttd.count>0 && ttd.type=='01'}">
									<option value='${ttd.type}'>一等座 -- ${ttd.count}张</option>
								</c:if>
								<c:if test="${ttd.count>0 && ttd.type=='02'}">
									<option value='${ttd.type}'>二等座 -- ${ttd.count}张</option>
								</c:if>
								<c:if test="${ttd.count>0 && ttd.type=='03'}">
									<option value='${ttd.type}'>硬座 -- ${ttd.count}张</option>
								</c:if>
								<c:if test="${ttd.count>0 && ttd.type=='04'}">
									<option value='${ttd.type}'>硬卧 -- ${ttd.count}张</option>
								</c:if>
								<c:if test="${ttd.count>0 && ttd.type=='05'}">
									<option value='${ttd.type}'>软卧 -- ${ttd.count}张</option>
								</c:if>
							</c:if>
							<c:if test="${ttd.price!=0}">
								<c:if test="${ttd.count>0 && ttd.type=='01'}">
									<option value='${ttd.type}'>一等座 -- ${ttd.count}张 -- ${ttd.price}元</option>
								</c:if>
								<c:if test="${ttd.count>0 && ttd.type=='02'}">
									<option value='${ttd.type}'>二等座 -- ${ttd.count}张 -- ${ttd.price}元</option>
								</c:if>
								<c:if test="${ttd.count>0 && ttd.type=='03'}">
									<option value='${ttd.type}'>硬座 -- ${ttd.count}张 -- ${ttd.price}元</option>
								</c:if>
								<c:if test="${ttd.count>0 && ttd.type=='04'}">
									<option value='${ttd.type}'>硬卧 -- ${ttd.count}张 -- ${ttd.price}元</option>
								</c:if>
								<c:if test="${ttd.count>0 && ttd.type=='05'}">
									<option value='${ttd.type}'>软卧 -- ${ttd.count}张 -- ${ttd.price}元</option>
								</c:if>
							</c:if>
						</c:forEach>
				</select>
				
				</td>
				
				
			</tr>
			<tr>
			<td></td><td></td><td></td><td></td><td></td>
			<td><input class="btn btn-primary btn-xs" id="but01" type="button" value="提交订单"  /></td>
			</tr>
		</table>
						
						
						
					

					</div>
					</div>
			
			</div>
								  

									

							
										
								
									
								
									
								</div>
							</div>
						</div>
					</div>
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


	<script src="<%=basePath%>js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="<%=basePath%>js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="<%=basePath%>js/jquery.waypoints.min.js"></script>
	<script src="<%=basePath%>js/sticky.js"></script>

	<!-- Stellar -->
	<script src="<%=basePath%>js/jquery.stellar.min.js"></script>
	<!-- Superfish -->
	<script src="<%=basePath%>js/hoverIntent.js"></script>
	<script src="<%=basePath%>js/superfish.js"></script>
	<!-- Magnific Popup -->
	<script src="<%=basePath%>js/jquery.magnific-popup.min.js"></script>
	<script src="<%=basePath%>js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="<%=basePath%>js/bootstrap-datepicker.min.js"></script>
	<!-- CS Select -->
	<script src="<%=basePath%>js/classie.js"></script>
	<script src="<%=basePath%>js/selectFx.js"></script>
	
	<!-- Main JS -->
	<script src="<%=basePath%>js/main.js"></script>













	</body>
  






<script type="text/javascript">
	//绑定事件
	$(function(){
		$('#but01').bind('click',clickOrder);  //为提交订单按钮绑定提交事件
	})
	
	function clickOrder(){
		var params = new Object();
		params.bno = $('#bno').val();
		params.ticketType = $('#ticketType').val();
		$.ajax({
		   type: "POST",
		   url: '<%=basePath%>User/TicketReserveSvl',
		   data: params,
		   success: function(msg){
		   		layer.close(index);
		   		layer.open({
		  			type: 1,
		  			skin: 'layui-layer-rim', //加上边框
		  			area: ['520px', '240px'], //宽高
		  			content: '<div id="tc"></div>'
				});	
		   		if(msg != undefined){
		   			console.log("msg = " + msg);
		   			if(msg == "timeout"){
		   				$('#tc').html("因为购票人数过多，请10分钟之后去我的订单中查询购票结果");
		   			}else if(msg == "ordersuccess"){
		   				$('#tc').html("购票成功,请前往我的订单查询具体票信息");
		   			}else if(msg == "orderfail"){
		   				$('#tc').html("购票失败，请重新购票");
		   			}else{
		   				var order = $.parseJSON(msg);
		   				var html = '<font style="color:green;">出票成功</font></br>';
		   				html += '<table class="table table-hover" border="1">';
		   				html +='<tr>';
		   				html +='<td>订单号</td>';
		   				html +='<td>座位号</td>';	
		   				html +='<td>用户名</td>';
		   				html += '</tr>';
		   				html +='<tr>';
		   				html +='<td>' + order.orderno+ '</td>';
		   				html +='<td>' + order.seatno + '</td>';
		   				html +='<td>' + order.uname + '</td>';
		   				html += '</tr>';
		   				html += '</table>';
		   				$('#tc').html('<center>' + html + '</center>');
		   			}
		   		}
		   }
		});
		var index = layer.load(0, {shade: false});
		
	}


</script>
</html>
