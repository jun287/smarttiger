<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="dao.GoodsDao" %>
<%@ page import="dto.Goods" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("euckr"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>goodsView.jsp</title>
		<style>
			#wrap{
				width: 800px;
				height: auto;
				border: 1px solid #000000;
				border-radius: 6px;
			}
			#titleDate{
				padding-top:10px;
				width: 800px;
				height: 30px;
				border-bottom: 1px double #000000;
			}
			#title{
				margin-left: 10px;
			}
			#date{
				float:right;
				margin-right: 10px;
			}
			#name{
				padding-left:10px;
				padding-top:10px;
				width: 790px;
				height: 30px;
				border-bottom: 1px double #000000;
			}
			#info{
				align-content:center;
			
				width: 800px;
				height: auto;
				
			}
			#img{
				margin:20px 0 10px 10px;
				border-radius:5px;
				float:left;
				width: 380px;
				height: 400px;
				border: 1px solid #000000;
			}
			#userinfo{
				margin:20px 10px 10px 0;
				border-radius:5px;
				
				float:right;
				width: 380px;
				height: 400px;
				border: 1px solid #000000;
			}
			#goodsInfo{
				clear:both;
				background-color:red;
				margin:0 0 0 10px;
				width: 780px;
			}
		</style>
	</head>
	<body>
		<%
		
			String sendCode=request.getParameter("sendCode");
			System.out.println(sendCode+"<--sendCode");
			
			GoodsDao GoodsDao=new GoodsDao();
			Goods goods=GoodsDao.selectGoods(sendCode);
			
			System.out.println(goods.getGoods_code()+"<--goods.getGoods_code()");
			System.out.println(goods.getId()+"<--goods.getId()");
			System.out.println(goods.getGoods_title()+"<--goods.getGoods_title()");
			System.out.println(goods.getGoods_price()+"<--goods.getGoods_price()");
			System.out.println(goods.getGoods_info()+"<--goods.getGoods_info()");
			System.out.println(goods.getGoods_date()+"<--goods.getGoods_date()");
			System.out.println(goods.getGoods_img()+"<--goods.getGoods_img()");
						
		%>
		
		<div id="wrap">
			<div id="titleDate">
				<span id="title"><%=goods.getGoods_title() %></span>
				<span id="date"><%=goods.getGoods_date() %></span>
			</div>
			<div id="name">
				<%=goods.getId() %>
			</div>
			<div id="info">
				<div id="img">
					
				</div>
				<div id="userinfo">
					<span><%=goods.getId() %></span><br>
					<span><%=goods.getGoods_price() %>원</span><br>
					<span>판매자 정보</span>	<br>			
					<span>거래 방법</span><br>				
					<span>배송방법</span><br>				
				</div>
				<div id="goodsInfo">
				
					<span><%=goods.getGoods_info()%></span>
				</div>
			</div>		
		</div>
	</body>
</html>