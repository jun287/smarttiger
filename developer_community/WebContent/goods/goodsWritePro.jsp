<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="dao.GoodsDao"%>
<%request.setCharacterEncoding("euckr"); %>
<jsp:useBean id="Goods" class="dto.Goods"/>
<jsp:setProperty property="*" name="Goods"/>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			replace("\r\n","<br>");
			System.out.println(Goods.getGoods_title()+"<--Goods.getTitle()");
			System.out.println( Goods.getGoods_info()+"<--Goods.getComment()");
			System.out.println(Goods.getGoods_price()+"<--Goods.getPrice()");
			System.out.println(Goods.getGoods_img()+"<--Goods.getAttachment()");
			GoodsDao goodsdao=new GoodsDao();
			goodsdao.insertGoods(Goods);
			
			response.sendRedirect("./goodsList.jsp");
		%>
	</body>
</html>