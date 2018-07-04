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
		
			System.out.println(Goods.getTitle()+"<--Goods.getTitle()");
			System.out.println( Goods.getComment()+"<--Goods.getComment()");
			System.out.println(Goods.getPrice()+"<--Goods.getPrice()");
			System.out.println(Goods.getAttachment()+"<--Goods.getAttachment()");
			GoodsDao goodsdao=new GoodsDao();
			goodsdao.insertGoods(Goods);
		%>
	</body>
</html>