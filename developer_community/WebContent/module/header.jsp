<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="./css/main.css">
	</head>
	<body>
		<div id="jb-header">
			<nav>
				<a href="<%= request.getContextPath() %>/index.jsp">HOME</a> | 
			 	LOGIN |
			  	JOIN |
			</nav>
			<h1>스마트 타이거</h1>
			<nav>
				<ul id="jb">
					<li><a href="<%= request.getContextPath() %>/index.jsp">Home</a></li>
					<li>|</li>
					<li><a href="#">QnA게시판</a></li>
					<li>|</li>
					<li><a href="#">중고거래</a></li>
					<li>|</li>
					<li><a href="#">회원정보</a></li>
					<li>|</li>
				</ul>
			</nav>
		</div>
	</body>
</html>