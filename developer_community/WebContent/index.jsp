<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>개발자 커뮤니티</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css"/>
	</head>
	<body>	
		<div id="jb-container">
			<%@ include file="/module/header.jsp"%>
			<div>
				<%@ include file="/module/content.jsp" %>
			</div>
			<div>
				<%@ include file="/module/sidebar.jsp" %>
			</div>
			<div>
				<%@ include file="/module/footer.jsp" %>
			</div>
		</div>
	</body>
</html>