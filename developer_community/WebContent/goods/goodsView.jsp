<%@page import="dao.MemberDao"%>
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
			#button a:link{
				color:white;
			}
			#button a:hover{
			color:white;	
			}
			#button a:visited{
			color:white;	
			}
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
				border-bottom: 1px solid #000000;
			}
			#title{
				margin-left: 10px;
				font-size: 15px;
			}
			#date{
				float:right;
				margin-right: 10px;
				font-size: 12px;
			}
			#name{
				padding-left:10px;
				padding-top:10px;
				width: 790px;
				height: 30px;
				border-bottom: 1px solid #000000;
			}
			#info{
				align-content:center;
			
				width: 800px;
				height: auto;
				
			}
			#img{
				
				font-size:70px;
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
				font-size:15px;
				float:right;
				width: 380px;
				height: 400px;
				
			}
			#goodsInfo{
				clear:both;
				
				margin:0 0 10px 10px;
				width: 780px;
			}
			#button{
				
				margin-left: 690px;
				margin-bottom:10px;
			}
		</style>
	</head>
	<body>
		<%
			String sessionId = (String)session.getAttribute("sessionId");
			String sessionEmail =(String)session.getAttribute("sessionEmail");
			
			String sendCode=request.getParameter("sendCode");
			System.out.println(sendCode+"<--sendCode");
		
			GoodsDao goodsDao=new GoodsDao();
			Goods goods=goodsDao.selectGoods(sendCode);
			int inquiry=Integer.parseInt(goods.getGoods_inquiry())+1;
			goodsDao.insertInquiry(inquiry, sendCode);
			
			System.out.println(goods.getGoods_code()+"<--goods.getGoods_code()");
			System.out.println(goods.getId()+"<--goods.getId()");
			System.out.println(goods.getEmail()+"<--goods.getEmail()");
			System.out.println(goods.getGoods_title()+"<--goods.getGoods_title()");
			System.out.println(goods.getGoods_price()+"<--goods.getGoods_price()");
			System.out.println(goods.getGoods_info()+"<--goods.getGoods_info()");
			System.out.println(goods.getGoods_date()+"<--goods.getGoods_date()");
			System.out.println(goods.getGoods_img()+"<--goods.getGoods_img()");
						
		%>
		<div id="jb-container">
			<%@ include file="/module/header.jsp"%>
			<div id="jb-content2">
				<div id="titleDate">
					<span id="title"><%=goods.getGoods_title() %></span>
					<span id="date"><%=goods.getGoods_date() %></span>
				</div>
				<div id="name">
					<%=goods.getId()%>
				</div>
				<div id="info">
					<div id="img">
						<br>&nbsp;
						<span>smart</span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span>tiger</span>
					</div>
					<div id="userinfo">
						<span><%=goods.getGoods_title() %></span><br><br>
						<span><%=goods.getGoods_price() %>��</span><br><br>
						<span>�Ǹ��� ����&nbsp;&nbsp;<%=goods.getEmail() %></span><br><br>			
						<span>�ŷ� ��� : �����ŷ��̻��</span><br>	
						<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����ŷ�</span><br><br>		
						<span>��۹�� : �Ǹ��ڿ� ���������ϼ���</span><br><br>				
					</div>
					<div id="goodsInfo">
						<p>----------------------------------------------------------------------------------------------------------------------</P>
						<p>* �ŷ��� �ʵ�! �����ϼ���!</p>
						<p>* ����ó�� ���� �ܺθ�ũ, īī����, ��۷θ� �ŷ��� �� </p>
						<p>* ����ó �� ���¹�ȣ�� ���̹�İ�� ��ġƮ�� �� ��ȸ�غ��� </p>
						<p>* ��ü�� ô �����Ͽ� �ź����� ����ڵ������ ������ ��� </p>
						<p>* ���� ��ǰ(�޴���,���ڱ��)� �Ǹ��ϰ� �ֱ�(1���� ��) �Խñ۸� ���� �� </p>
						<p>* �ؿ������� �鼼���� ��ǰ�� �Ǹ��ϴ� ������ �ҹ��Դϴ�.</p>
						<p>----------------------------------------------------------------------------------------------------------------------</P>
					</div>
					<div id="goodsInfo">
					
						<span><%=goods.getGoods_info()%></span>
					</div>
					<div id="button">	
						<%
						if(sessionId!=null){
						
							if(goods.getId().equals(sessionId)){
						%>
							
								<a href="<%=request.getContextPath()%>/goods/goodsDelete.jsp?sendCode=<%=sendCode%>"><input type="button" value="����">	</a>
								<a href="<%=request.getContextPath()%>/goods/goodsUpdateForm.jsp?sendCode=<%=sendCode%>"><input type="button" value="����">	</a>
						<%
						}
						}
						%>
						<a href="./goodsList.jsp"><input type="button" value="���">	</a>
					</div>
					
				</div>
			
			</div>
			<%@ include file="/module/footer.jsp" %>
		</div>
	</body>
</html>