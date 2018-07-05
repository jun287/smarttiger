<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="./css/main.css">
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
		<div id="jb-sidebar">
			<h2>로그인</h2>
			<%
				if(sessionId == null){
			%>
					<form method="post" action="<%=request.getContextPath() %>/login/loginPro.jsp">
						<input type="text" name="id"> : <input type="submit" value="로그인">
						<input type="password" name="pw"> : <a href ="<%=request.getContextPath() %>/join/joinForm.jsp">회원가입</a>
					</form>
			<%
				}else{
			%>
					<a href="<%=request.getContextPath() %>/memberInformation/memberInformation.jsp"><%=sessionName%></a>님 <%=sessionLevel%>로 로그인
					<a href="<%=request.getContextPath() %>/login/logOut.jsp">로그아웃</a><br>
					<a href="<%=request.getContextPath() %>/join/joinForm.jsp"><img src="<%= request.getContextPath() %>/img/btn_join.gif"></a>
			<%
				} 
			%>
		</div>
	</body>
</html>