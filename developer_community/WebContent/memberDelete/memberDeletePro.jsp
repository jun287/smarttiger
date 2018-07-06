<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import = "dao.MemberDao" %>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<%
		String id= request.getParameter("id");
		String pw= request.getParameter("pw");
		
		MemberDao memberDao = new MemberDao();
		
	%>
	</body>
</html>