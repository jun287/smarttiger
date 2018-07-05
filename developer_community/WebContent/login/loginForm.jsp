<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>개발자 커뮤니티</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css"/>
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
		<div id="jb-container">
			<%@ include file="/module/header.jsp"%>
			<div align="center">
			<%
				if(sessionId == null){
			%>
					<h3>로그인 해주세요</h3><br>  <!-- 회원가입 양식으로 회원정보를 받습니다.  -->
					<form method="post" action="<%=request.getContextPath() %>/login/loginPro.jsp">
						<div id="login_box">
							<h2>Member Login</h2>
							<ul id="input_button">
								<li id="id_pass">
									<ul>
										<li>
											<span>ID</span>
											<input type="text" name="id">
										</li> <!-- id -->
										<li id="pass">
											<span>PW</span>
											<input type="password" name="pw">
										</li> <!-- pw  -->
									</ul>
								</li> 
								<li id="login_btn">
									<button>로그인</button>				
								</li>
							</ul>
							<ul id="btns">
								<li><a href ="<%=request.getContextPath() %>/join/joinForm.jsp">회원가입</a></li>
							</ul>
						</div> <!-- login_box -->
					</form>
			<%
				}else{
			%>	
					<script type="text/javascript">
						alert('로그인 중입니다.');
						location.href='<%= request.getContextPath()%>/index.jsp';
					</script>
			<%
				} 
			%>
			</div><br><br><br> <!-- login_box -->
			<%@ include file="/module/footer.jsp" %>
		</div>
	</body>
</html>