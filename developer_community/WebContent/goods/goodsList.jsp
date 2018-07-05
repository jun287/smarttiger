<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ page import="driverdb.DriverDB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.GoodsDao" %>
<%@ page import="dto.Goods" %>
<% request.setCharacterEncoding("euckr"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	#title{
		width: 400px;
	}
	th{
		background-color: #8C8C8C;
	}
	#goods_inquiry{
		text-align: center;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th id="title">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%
			GoodsDao goodsDao=new GoodsDao();
			ArrayList<Goods> result=goodsDao.selectGoods();
			
			for(int i=0;i<result.size();i++){
				Goods resultgoods=result.get(i);
		%>
			<tr>
				<td>
					<%=resultgoods.getGoods_code()%>&nbsp;&nbsp;&nbsp;
					<a href="./goodsView.jsp?gods_code=<%=resultgoods.getGoods_code() %>"><%=resultgoods.getGoods_title() %></a>
				</td>
				<td><%=resultgoods.getId() %></td>
				<td><%=resultgoods.getGoods_date() %></td>
				<td id="goods_inquiry"><%=resultgoods.getGoods_inquiry() %></td>
			</tr>
		<%
			}
		%>
	</table>
</body>
</html>