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
	* {
		margin:0;
		padding:0;
	}
	ul {
		list-style-type:none; /* ul�±��� ����� ���� �ʽ��ϴ�. */
	}
	
	h3 { /* h3�±��� ������ �����մϴ�. */
		margin:20px 0 0 50px;
	}
	
	body { 
		font-family:"���� ���","����";
		font-size:12px;
		color:#444444;
	}
	
	#mem_form { /* id : mem_form �� ũ�� ���� ����ü ����ũ�� ���ڻ� ���� �����մϴ�.  */
		width:500px;
		margin:10px 0 0 50px;
		font-family:"����";
		font-size:12px;
		color:#444444;
		padding-top:5px;
		padding-bottom:10px;
		border-top:solid 1px #cccccc;
		border-bottom:solid 1px #cccccc;
	}
	
	.cols li { /* cols Ŭ������ li�±��� ���κ�� ǥ�� �������� �ݴϴ�.  */
		display:inline-block;
		margin-top:5px;
	}
	
	.cols li.col1 { /* cols Ŭ������ li.col1 �±��� ũ�⸦ 100px ���������� �����������մϴ�.  */
		width:100px;
		text-align:right;
	}
	
	.cols li.col2 { /* cols Ŭ������ li.col2 �±��� ũ�⸦ 350px�� �մϴ�. */
		width:350px;
	}
	
	.cols li.col2 input.hp { /* cols Ŭ������ li.col2�� input Ŭ���� hp�� ũ�⸦ 35px�� �մϴ�. */
		width:35px;
	}
	#jb-container {
		width: 1200px;
		margin: 0px auto;
		padding: 20px;
		border: 1px solid #bcbcbc;
	}
	
	#jb-header {
		padding: 20px;
		margin-bottom: 20px;
		border: 1px solid #bcbcbc;
	}
	
	#jb-content {
		width: 800px;
		padding: 20px;
		margin-bottom: 20px;
		float: left;
		border: 1px solid #bcbcbc;
	}
	
	#jb-sidebar {
		width: 300px;
		padding: 20px;
		margin-bottom: 20px;
		float: right;
		border: 1px solid #bcbcbc;
	}
	
	#jb-footer {
		clear: both;
		padding: 20px;
		border: 1px solid #bcbcbc;
	}
	
	#jb ul {
		list-style-type: none;
	}
	
	#jb li {
		display: inline-block;
		margin: 12px 30px 0 50px;
		font-size: 13px;
	}	
</style>
</head>
<body>
<div id="jb-container">
<%@ include file="/module/header.jsp"%>
	<div id="jb-content">
	<table>
		<tr>
			<th id="title">����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ��</th>
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
	</div>
<%@ include file="/module/sidebar.jsp" %>

<%@ include file="/module/footer.jsp" %>
</div>
</body>
</html>