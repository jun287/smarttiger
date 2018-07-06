<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="dao.GoodsDao"%>
<%@ page import="dto.Goods"%>
<%@ page import="dto.Member" %>
<%@ page import="dao.MemberDao" %>
<%request.setCharacterEncoding("euckr"); %>


<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			
			Goods goods = new Goods();
			String sessionId=(String)session.getAttribute("sessionId");
			goods.setGoods_title(request.getParameter("goods_title"));
			goods.setGoods_price(request.getParameter("goods_price"));
			goods.setGoods_info(request.getParameter("goods_info").replace("\r\n","<br>"));
			goods.setGoods_img(request.getParameter("goods_img"));
			
			System.out.println(goods.getGoods_title()+"<--goods.getGoods_title()");
			System.out.println(goods.getGoods_info()+"<--goods.getGoods_info()");
			System.out.println(goods.getGoods_price()+"<--goods.getGoods_price()");
			System.out.println(goods.getGoods_img()+"<--goods.getGoods_img()");
			
			
			MemberDao memberDao=new MemberDao();
			Member member=memberDao.memberInformationSelect(sessionId);
			String email=member.getEmail();
			
			System.out.println(email+"<--email");
			
			
			
			GoodsDao goodsdao=new GoodsDao();
			goodsdao.insertGoods(goods,sessionId,email);
			
			response.sendRedirect(request.getContextPath()+"/goods/goodsList.jsp");
		%>
	</body>
</html>