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
	<%
		request.setCharacterEncoding("EUC-KR");
		String sessionId = (String)session.getAttribute("sessionId");
		String sessionLevel = (String)session.getAttribute("sessionLevel");
		String sessionName = (String)session.getAttribute("sessionName");
		System.out.println(sessionName + "<-- sessionName");
		System.out.println(sessionLevel + "<-- sessionLevel");
	
	%>	
		<div id="wrap">
			<header>
				<a href="<%= request.getContextPath() %>/index.jsp"><img id="logo" src="<%= request.getContextPath() %>/img/logo.jpg"></a>
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
			<%if(sessionId == null){ %>
				<article id="login_box">
					<img id="login_title" src="<%= request.getContextPath() %>/img/ttl_login.png">
					<div id="input_button">
						<form method="post" action="<%=request.getContextPath() %>/login/loginPro.jsp">
							<ul id="login_input">
								<li><input type="text" name="id"></li>
								<li><input type="password" name="pw"></li>
							</ul>
							<input type="image" id="login_btn" src="<%= request.getContextPath() %>/img/btn_login.gif">
						</form>
					</div>
					<div class="clear"></div>
					<div id="join_search">
						<a href="<%=request.getContextPath() %>/join/joinForm.jsp"><img src="<%= request.getContextPath() %>/img/btn_join.gif"></a>
						<img src="img/btn_search.gif">
					</div>
				</article>
			<%
			}else{
			%>	
				<article id="login_box">
					<img id="login_title" src="<%= request.getContextPath() %>/img/ttl_login.png">
					<div id="input_button">
						<a href="<%=request.getContextPath() %>/memberInformation/memberInformation.jsp"><%=sessionName%></a>님 <%=sessionLevel%>로<br>로그인<br>
						<a href="<%=request.getContextPath() %>/login/logOut.jsp">로그아웃</a>
					</div>
					<div class="clear"></div>
					<div id="join_search">
						<a href="<%=request.getContextPath() %>/join/joinForm.jsp"><img src="<%= request.getContextPath() %>/img/btn_join.gif"></a>
						<img src="img/btn_search.gif">
					</div>
				</article>
			<%} %>
			</aside>
				<section id="main">
				<section id="notice_free_youtube">
					<article id="notice">
						<!-- 공지사항 -->
						<div class="latest_title">
							<img class="latest_img" src="<%= request.getContextPath() %>/img/latest1.gif"> 
							<img class="more" src="<%= request.getContextPath() %>/img/more.gif">
							<div class="clear"></div>
						</div>
						<div class="latest_content">
							<img class="image" src="<%= request.getContextPath() %>/img/book_pen.gif">
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
							<img class="latest_img" src="<%= request.getContextPath() %>/img/latest2.gif"> 
							<img class="more" src="<%= request.getContextPath() %>/img/more.gif">
							<div class="clear"></div>
						</div>
						<div class="latest_content">
							<img class="image" src="<%= request.getContextPath() %>/img/book_pen.gif">
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
				<li><img src="<%= request.getContextPath() %>/img/facebook.gif"></li>
				<li><img src="<%= request.getContextPath() %>/img/blog.gif"></li>
				<li><img src="<%= request.getContextPath() %>/img/twitter.gif"></li>
			</ul>
		</footer>
		</div>
		<!-- wrap -->
	</body>
</html>