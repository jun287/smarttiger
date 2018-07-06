<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euckr"); %>
<%@ page import="dao.GoodsDao" %>
<%@ page import="dto.Goods" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>goodsUpdateForm.jsp</title>
		<style>
			form{
				
				padding:1px 1px 1px 1px;
				width: 850px;
				height: 500px;
				
			}
			textarea{
				margin: 0 0 0 0;
				width:800px;
				height: 300px;
			}
			#info{
				padding:15px 5px 5px 15px;
				height: 500px;
				border: 1px dotted #000000;
			}
			#button{
				margin-top:10px;
				float: right;
			}
		</style>
	</head>
	<body>
		<%
			String sendCode=request.getParameter("sendCode");
			GoodsDao goodsDao=new GoodsDao();
			Goods goods=goodsDao.selectGoods(sendCode);
			
		%>
		<form action="./goodsUpdatePro.jsp?sendCode=<%=sendCode%>" method="post">
			<div id="info">
				<label id="name">상품이름:</label>&nbsp;&nbsp;<input type="text" name="goods_title" value="<%=goods.getGoods_title() %>"><br><br>
				<label id="name">상품가격:</label>&nbsp;&nbsp;<input type="text" name="goods_price" value="<%=goods.getGoods_price() %>"><br><br>
				<label id="name">상품정보</label><br><br>
				<textarea name="goods_info"><%=goods.getGoods_info().replace("<br>","\r\n")%></textarea><br>
				<label>사진첨부</label>&nbsp;:&nbsp;<input type="file" value="사진첨부" name="goods_img" value="">
			</div>
			<div id="button">
				<input type="submit" value="수정완료">
			</div>
		</form>
	</body>
</html>