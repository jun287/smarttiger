<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>개발자 커뮤니티</title>
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/header.css">
		<link rel="stylesheet" type="text/css" href="css/footer.css">
		<link rel="stylesheet" type="text/css" href="css/main.css">
	</head>
	<body>
		<div id="wrap">
			<header>
				<a href="<%= request.getContextPath() %>/index.jsp"><img id="logo" src="img/logo.jpg"></a>
				<nav id="top_menu">
					<a href="<%= request.getContextPath() %>/index.jsp">HOME</a> | 
				 	LOGIN |
				  	JOIN | 
				  	NOTICE
				</nav>
				<nav id="main_menu">
					<ul>
						<li><a href="board_list.html"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
					</ul>
				</nav>
			</header>
			<!-- header -->
			<aside>
				<article id="login_box">
					<img id="login_title" src="img/ttl_login.png">
					<div id="input_button">
						<ul id="login_input">
							<li><input type="text"></li>
							<li><input type="password"></li>
						</ul>
						<a href="<%=request.getContextPath() %>/login/loginPro.jsp"><img id="login_btn" src="img/btn_login.gif"></a>
					</div>
					<div class="clear"></div>
					<div id="join_search">
						<a href="<%=request.getContextPath() %>/join/joinForm.jsp"><img src="img/btn_join.gif"></a>
						<img src="img/btn_search.gif">
					</div>
				</article>
			</aside>
	
			<section id="main">
				<img src="img/main_img.png">
				<section id="notice_free_youtube">
					<article id="notice">
						<!-- 공지사항 -->
						<div class="latest_title">
							<img class="latest_img" src="img/latest1.gif"> 
							<img class="more" src="img/more.gif">
							<div class="clear"></div>
						</div>
						<div class="latest_content">
							<img class="image" src="img/book_pen.gif">
							<ul class="list">
								<li>
									<div class="subject"></div>
									<div class="date">2017-09-20</div>
									<div class="clear"></div>
								</li>
							</ul>
						</div>
					</article>
					<article id="free">
						<!-- 자유 게시판 -->
						<div class="latest_title">
							<img class="latest_img" src="img/latest2.gif"> 
							<img class="more" src="img/more.gif">
							<div class="clear"></div>
						</div>
						<div class="latest_content">
							<img class="image" src="img/book_pen.gif">
							<ul class="list">
								<li>
									<div class="subject"></div>
									<div class="date">2017-09-20</div>
									<div class="clear"></div>
								</li>
							</ul>
						</div>
					</article>
				</section>
			
			</section>
			<!-- section main -->
			<div class="clear"></div>
	
			<footer>
				<img id="footer_logo" src="">
				<ul id="address">
					<li></li>
					<li></li>
					<li></li>
				</ul>
				<ul id="footer_sns">
					<li><img src="img/facebook.gif"></li>
					<li><img src="img/blog.gif"></li>
					<li><img src="img/twitter.gif"></li>
				</ul>
			</footer>
			<!-- footer -->
	
		</div>
		<!-- wrap -->
	</body>
</html>