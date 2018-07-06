<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="dao.GoodsDao" %>
<%@ page import="dto.Goods" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>goodsdelete.jsp</title>
	</head>
	<body>
		<%
			String sendCode=request.getParameter("sendCode");
			System.out.println(sendCode+"<--sendCode");	
			
			GoodsDao goodsDao=new GoodsDao();
			goodsDao.deleteGoods(sendCode);
			
			response.sendRedirect(request.getContextPath()+"/goods/goodsList.jsp");
		%>
	</body>
</html>