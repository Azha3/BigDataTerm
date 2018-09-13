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
    <base href="<%=basePath%>">
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>铁路客户服务中心</title>
    
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
	


	<!-- Modernizr JS -->
	<script src="<%=basePath%>js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->


  </head>
  
 <%--  <body>
  	<center>
  	  <table align="center" width=90%>
    	 <tr>
	      	<td align=right>       	     
	      	    <c:if test="${user != null}">
	      	    	<a>欢迎${user.uname}登录</a>
	      	    </c:if>
	      	    <c:if test="${user == null}">
	      	     	<a href="<%=basePath%>LoginSvl">登录</a>      
	      	    </c:if>  		      	
	      	</td>
      	 </tr>
      </table>
      <table>
      	<tr>
      		<td>出发地</td><td>
      			<select id="departure">
      				<option>---请选择---</option>
	      			<c:forEach items="${areaList}" var="area">
	      				<option value="${area.ano}">${area.aname}</option>
	      			</c:forEach>
      			</select>
      		&nbsp;&nbsp;</td>
      		<td>目的地</td><td>
      			<select id="destination">
      				<option>---请选择---</option>
      				<c:forEach items="${areaList}" var="area">
	      				<option value="${area.ano}">${area.aname}</option>
	      			</c:forEach>
      			</select>
      		&nbsp;&nbsp;</td>
      		<td>出发日期</td><td><input class="easyui-datebox" id="startDate" value="${startDate}"></input>&nbsp;&nbsp;</td>
      		<td><input type="button" style="width:70" value="查询" onclick="query_submit()"/></td>
      	</tr>
      </table>
      <table border="1" id="table01">
      	<tr>
      		<th width="100">车次</th>
      		<th width="120">出发站</th>
      		<th width="120">到达站</th>
      		<th width="100">发车时间</th>
      		<th width="150">历时</th>
      		<th width="100">一等座</th>
      		<th width="100">二等座</th>
      		<th width="100">硬座</th>
      		<th width="100">硬卧</th>
      		<th width="100">软卧</th>
      		<th width="100">备注</th>
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
								<div class="tabulation animate-box">

								  <!-- Nav tabs -->
								   <ul class="nav nav-tabs" role="tablist">
								      <li role="presentation" class="active">
								      	<a  aria-controls="flights" role="tab" data-toggle="tab">票务查询</a>
								      </li>
								    <!--  <li role="presentation">
								    	   <a href="#hotels" aria-controls="hotels" role="tab" data-toggle="tab">Hotels</a>
								      </li>
								      <li role="presentation">
								    	   <a href="#packages" aria-controls="packages" role="tab" data-toggle="tab">Packages</a>
								      </li>  -->
								   </ul>

								   <!-- Tab panes -->
									<div class="tab-content">
									 <div role="tabpanel" class="tab-pane active" id="flights">
										<div class="row">
											<div class="col-sm-12 mt">
												<div class="input-field">
													<section>
														<label for="departure">出发地：</label>
															<select id="departure" class="cs-select cs-skin-border">
																<!-- <option value="" disabled selected>北京站(BJ,Beijing)</option>
																<option value="economy">北京站(BJ,Beijing)</option>
																<option value="first">上海站(SH,Shanghai)</option>
																<option value="business">莆田站(PT,Putian)</option> -->
									
																<c:forEach items="${areaList}" var="area">
	      														<option value="${area.ano}">${area.aname}</option>
	      														</c:forEach>
															</select>
													</section>											
												</div>
											</div>
											<div class="col-sm-12 mt">
												<div class="input-field">
													<section>
														<label for="destination">目的地：</label>
															<select id="destination" class="cs-select cs-skin-border">
																<!-- <option value="" disabled selected>上海站(SH,Shanghai)</option>
																<option value="economy">北京站(BJ,Beijing)</option>
																<option value="first">上海站(SH,Shanghai)</option>
																<option value="business">莆田站(PT,Putian)</option> -->
															
																<c:forEach items="${areaList}" var="area">
	      														<option value="${area.ano}">${area.aname}</option>
	      														</c:forEach>
															</select>
													</section>											
												</div>
											</div>
											<div class="col-xxs-12 col-xs-12 mt alternate">
												<div class="input-field">
													<label for="startDate">出发日期：</label>
													<input type="text" class="form-control" id="date-start" placeholder="07/20/2018"/>
												</div>
											</div>
									
											
											<div class="col-xs-12">
												  <a href="#fh5co-tours"><input type="submit" class="btn btn-primary btn-block" value="查询" onclick="query_submit()" >
												  </a>
											</div>
										</div>
									 </div>
					
									</div>

								</div>
							</div>
							<div class="desc2 animate-box">
								<div class="col-sm-7 col-sm-push-1 col-md-7 col-md-push-1">
									 <p>中国铁路客户服务中心<a href="http://www.12306.cn" target="_blank" class="fh5co-site-name">12306</a></p>
									<h2>生活不止眼前的苟且</h2>
									<h2>还有诗和远方的田野</h2> 
									<!-- <p><a class="btn btn-primary btn-lg" href="#">Get Started</a></p> -->
										
								
									
								
									
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
				
				
				
				
				
			</div>
			

		</div>
		
					
			<div id="fh5co-tours" class="fh5co-section-gray" style="display:none">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
						<h3>查询结果</h3>
						
					</div>
				</div>
				<div class="row">
					<br><br><br>
					<div class="container">
				<div class="tabulation animate-box">
					<div>
						<ul class="nav nav-tabs" role="tablist">
								     
							<br>	
						</ul>
						<div class="tab-content">
					<table class="table table-hover" id="table01">
 						<tr>
 						<th>车次</th>
 						<th>出发地</th>
 						<th>到达地</th>
 						<th>发车时间</th>
 						<th>历时</th>
 						<th>一等座</th>
 						<th>二等座</th>
 						<th>硬座</th>
 						<th>硬卧</th>
 						<th>软卧</th>
 						<th>备注</th>
 						
 						
 					</tr>
 					
 					
 				
 					
 					
				</table>

					</div>
					</div>
				</div>
			</div>
			
					
					
					
				</div>
			</div>
		</div>	


		<div id="fh5co-testimonial" >
			<div class="container">
				<div class="row row-bottom-padded-md">
					<div class="col-md-5 animate-box">
						
						<div class="box-testimony animate-box">			
						<blockquote>
							<span class="quote"><span><i class="icon-quotes-right"></i></span></span>
							<h2>&ldquo;请旅客朋友根据地图</h2 >
							<h2>规划出行路线&rdquo;</h2 >
						</blockquote>
						
						<p class="author">12306温馨提示</p>
							</div>
							
							
						</div>	
							
							
							<div class="col-md-7 animate-box">
							<br><br><br><br>
						<div class="tabulation animate-box fadeInUp animated">
						 <iframe src="<%=basePath%>html/map.html" width="800" height="600" frameborder="0" scrolling="no"></iframe>
						 </div>
					</div>
				</div>
			</div>
			
		</div>
		
		<div id="fh5co-destination">
			<div class="tour-fluid">
				<div class="row">
					<div class="col-md-12">
						<ul id="fh5co-destination-list" class="animate-box">
							<li class="one-forth text-center" style="background-image: url(images/place-1.jpg); ">
								<a href="#">
									<div class="case-studies-summary">
										<h2>北京</h2>
									</div>
								</a>
							</li>
							<li class="one-forth text-center" style="background-image: url(images/place-2.jpg); ">
								<a href="#">
									<div class="case-studies-summary">
										<h2>香港</h2>
									</div>
								</a>
							</li>
							<li class="one-forth text-center" style="background-image: url(images/place-3.jpg); ">
								<a href="#">
									<div class="case-studies-summary">
										<h2>上海</h2>
									</div>
								</a>
							</li>
							<li class="one-forth text-center" style="background-image: url(images/place-4.jpg); ">
								<a href="#">
									<div class="case-studies-summary">
										<h2>广州</h2>
									</div>
								</a>
							</li>

							<li class="one-forth text-center" style="background-image: url(images/place-5.jpg); ">
								<a href="#">
									<div class="case-studies-summary">
										<h2>杭州</h2>
									</div>
								</a>
							</li>
							<li class="one-half text-center">
								<div class="title-bg">
									<div class="case-studies-summary">
										<h2>热门景点</h2>
										<span><a href="#">浏览更多景点</a></span>
									</div>
								</div>
							</li>
							<li class="one-forth text-center" style="background-image: url(images/place-6.jpg); ">
								<a href="#">
									<div class="case-studies-summary">
										<h2>成都</h2>
									</div>
								</a>
							</li>
							<li class="one-forth text-center" style="background-image: url(images/place-7.jpg); ">
								<a href="#">
									<div class="case-studies-summary">
										<h2>大连</h2>
									</div>
								</a>
							</li>
							<li class="one-forth text-center" style="background-image: url(images/place-8.jpg); ">
								<a href="#">
									<div class="case-studies-summary">
										<h2>大理</h2>
									</div>
								</a>
							</li>
							<li class="one-forth text-center" style="background-image: url(images/place-9.jpg); ">
								<a href="#">
									<div class="case-studies-summary">
										<h2>三亚</h2>
									</div>
								</a>
							</li>
							<li class="one-forth text-center" style="background-image: url(images/place-10.jpg); ">
								<a href="#">
									<div class="case-studies-summary">
										<h2>莆田</h2>
									</div>
								</a>
							</li>
						</ul>		
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
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  <script>
  	function query_submit(){
  		document.getElementById("fh5co-tours").style.display="";
  		 $('#table01 tr').each(function(i){
  		 		if(i != 0){
  		 			$(this).remove();
  		 		}	    
  		  }); 
  		var params = new Object();
  		params.departure = $('#departure').val();
  		params.destination = $('#destination').val();
  		params.startDate = $('#date-start').val();
  		$.ajax({
   			type: "POST",
   			url: "<%=basePath%>TicketQuerySvl",
   			data: params,
   			success: function(msg){
   				
   				if(msg == '3'){
     				alert("初始化信息失败，请重新查询");
     			}else if(msg == '4'){
     				window.location.href = '<%=basePath%>AjaxErrorSvl';
     			}else{
     			    var tdList = $.parseJSON(msg);
     				console.log(tdList);
     				var html = '';
     				for(var i = 0; i < tdList.length; i++){
     					html += '<tr>';
     					html += '<td>' + tdList[i].tno + '</td>';
     					html += '<td>' + tdList[i].departure_name + '</td>';
     					html += '<td>' + tdList[i].destination_name + '</td>';
     					html += '<td>' + tdList[i].startTime + '</td>';
     					html += '<td>' + tdList[i].longTime + '</td>'; 
     					
     					var bRet = 0;
     					for(var j = 0; j < tdList[i].ttdList.length; j++){
     						if(tdList[i].ttdList[j].count == 0){
     							html += '<td><center>   ---   </center></td>';
     						}else{
     							if(tdList[i].ttdList[j].count > 10){
     								html += '<td><center>   有  </center></td>';
     							}else{
     								html += '<td><center>' + tdList[i].ttdList[j].count + '</center></td>';
     							}
     							bRet = 1;
     						}
     					}
     					if(bRet == 1){
     						html += '<td><center><input type="button" value="预定" onClick="reserve(' + tdList[i].bno + ')"></center></td>';
     					}else{
     						html += '<td><center>无票</center></td>'
     					}
     					html += '<tr>'
     				}
     				
     				$('#table01').append(html);
     			}
   			}
		});
  	}
	
	function reserve(bno){
		if(bno != undefined)
			window.location.href = '<%=basePath%>User/TicketReserveSvl?bno=' + bno;
	}

  
  </script>
</html>
