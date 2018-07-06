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
						<span><%=goods.getGoods_price() %>원</span><br><br>
						<span>판매자 정보&nbsp;&nbsp;<%=goods.getEmail() %></span><br><br>			
						<span>거래 방법 : 안전거래미사용</span><br>	
						<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;직접거래</span><br><br>		
						<span>배송방법 : 판매자와 직접연락하세요</span><br><br>				
					</div>
					<div id="goodsInfo">
						<p>----------------------------------------------------------------------------------------------------------------------</P>
						<p>* 거래전 필독! 주의하세요!</p>
						<p>* 연락처가 없이 외부링크, 카카오톡, 댓글로만 거래할 때 </p>
						<p>* 연락처 및 계좌번호를 사이버캅과 더치트로 꼭 조회해보기 </p>
						<p>* 업체인 척 위장하여 신분증과 사업자등록증을 보내는 경우 </p>
						<p>* 고가의 물품(휴대폰,전자기기)등만 판매하고 최근(1주일 내) 게시글만 있을 때 </p>
						<p>* 해외직구로 면세받은 물품을 판매하는 행위는 불법입니다.</p>
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
							
								<a href="<%=request.getContextPath()%>/goods/goodsDelete.jsp?sendCode=<%=sendCode%>"><input type="button" value="삭제">	</a>
								<a href="<%=request.getContextPath()%>/goods/goodsUpdateForm.jsp?sendCode=<%=sendCode%>"><input type="button" value="수정">	</a>
						<%
						}
						}
						%>
						<a href="./goodsList.jsp"><input type="button" value="목록">	</a>
					</div>
					
				</div>
			
			</div>
			<%@ include file="/module/footer.jsp" %>
		</div>
	</body>
</html>