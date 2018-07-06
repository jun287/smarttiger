<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euckr"); %>
<%@ page import="dao.GoodsDao" %>
<%@ page import="dto.Goods" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			String sendCode=request.getParameter("sendCode");
			
			Goods goods=new Goods();
			
			goods.setGoods_code(request.getParameter("sendCode"));
			goods.setGoods_title(request.getParameter("goods_title"));
			goods.setGoods_price(request.getParameter("goods_price"));
			goods.setGoods_info(request.getParameter("goods_info").replace("\r\n","<br>"));
			goods.setGoods_img(request.getParameter("goods_img"));
			
			GoodsDao goodsDao=new GoodsDao();
			goodsDao.updateGoods(goods);
			
			response.sendRedirect(request.getContextPath()+"/goods/goodsView.jsp?sendCode="+sendCode);
		%>
	</body>
</html>