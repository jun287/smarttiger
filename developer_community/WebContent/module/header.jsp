<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css"/>
	</head>
	<body>
		<div id="jb-header">
			<nav>
				<a href="<%= request.getContextPath() %>/index.jsp">HOME</a> | 
 				<a href="<%= request.getContextPath() %>/login/loginForm.jsp">LOGIN</a> |
			  	<a href="<%= request.getContextPath() %>/join/joinForm.jsp">JOIN</a> |
			</nav>
			<h1>스마트 타이거</h1>
			<nav>
				<ul id="jb">
					<li><a href="<%= request.getContextPath() %>/index.jsp">Home</a></li>
					<li>|</li>
					<li><a href="<%= request.getContextPath() %>/boardQnA/boardQnAList.jsp">Q&A 게시판</a></li>
					<li>|</li>
					<li><a href="<%= request.getContextPath() %>/goods/goodsList.jsp">중고 거래</a></li>
					<li>|</li>
					<li><a href="<%= request.getContextPath() %>/memberInformation/memberInformationUpdateForm.jsp">회원 정보</a></li>
					<li>|</li>
					<li><a href="<%= request.getContextPath() %>/memberDelete/memberDeleteForm.jsp">회원 탈퇴</a></li>
				</ul>
			</nav>
		</div>
	</body>
</html>