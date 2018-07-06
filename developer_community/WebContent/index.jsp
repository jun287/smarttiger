<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.GoodsDao" %>
<%@ page import="dto.Goods" %>
<%@ page import="dao.BoardQnADao"%>
<%@ page import="dto.BoardQnA"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>개발자 커뮤니티</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css"/>
		<style>
			#main-content1{
				width: 390px;
				float:left;
				border: 1px solid #bcbcbc;
			}
			#main-content2{
				width: 390px;	
				float:right;
				border: 1px solid #bcbcbc;
			}
			
			#title{
				width: 170px;
			}
			#userid{
				width: 50px;
			}
			#date{
				width: 100px;
			}
			#inquiry{
				width: 50px;
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
		<div id="jb-container">
			<%@ include file="/module/header.jsp"%>
			<div id="jb-content">
				<div id="main-content1">
				<% 
					String sk = (request.getParameter("sk")!=null)?request.getParameter("sk"):"";
					String sv = (request.getParameter("sv")!= null && !request.getParameter("sv").equals(""))?("%"+request.getParameter("sv")+"%"):"";
					System.out.println(sk+"<--sk");
					System.out.println(sv+"<--sv");
					String beginDate = (request.getParameter("beginDate")!=null)?request.getParameter("beginDate"):"";
					String endDate = (request.getParameter("endDate")!=null)?request.getParameter("endDate"):"";
					System.out.println(beginDate+"<--beginDate");
					System.out.println(endDate+"<--endDate");
					
					BoardQnADao boardQnADao = new BoardQnADao();
					BoardQnA boardQnA = new BoardQnA();
					ArrayList<BoardQnA> boardQnAList = new ArrayList<>();
					int currentPage = 1;
					if(request.getParameter("currentPage") != null){
						currentPage = Integer.parseInt(request.getParameter("currentPage"));
					}
					int pagePerRow = 10;
					if(request.getParameter("pagePerRow") != null){
						pagePerRow = Integer.parseInt(request.getParameter("pagePerRow"));
					}
					System.out.println(pagePerRow+"<--pagePerRow");
					int lastPage = boardQnADao.countBoardQnA(pagePerRow);
					boardQnAList = boardQnADao.selectBoardQnASearch(beginDate, endDate, sk, sv, currentPage, pagePerRow);

				%>
					<h2>Q&A 게시판</h2>
					<table>
						<tr>
							<th id="title">제목</th>
							<th id="userid">작성자</th>
							<th id="date">작성일</th>
							<th id="inquiry">조회수</th>
						</tr>
				<%
					for(int i=0; i<boardQnAList.size(); i++){
						boardQnA = boardQnAList.get(i);
				%>
						<tr>
							<td><a href="<%=request.getContextPath() %>/boardQnA/boardQnAView.jsp?boardQnANumber=<%=boardQnA.getBoardQnANumber() %>"><%=boardQnA.getBoardQnAtitle() %></a></td>
							<td><%=boardQnA.getMemberId() %></td>
							<td><%=boardQnA.getBoardQnADate() %></td>
							<td><%=boardQnA.getBoardQnAhits() %></td>
						</tr>
				<%
					}
				%>
				
					</table>
				</div>
				
				<div id="main-content2">
					<h2>중고 게시판</h2>
					<table>
						<tr>
							<th id="title">제목</th>
							<th id="userid">작성자</th>
							<th id="date">작성일</th>
							<th id="inquiry">조회수</th>
						</tr>
						<%
							int row=10;
							int currentPage1;
							
							if(request.getParameter("currentPage")==null){
								currentPage1=1;
							}else{
								currentPage1=Integer.parseInt(request.getParameter("currentPage"));
							}
							
							GoodsDao goodsDao=new GoodsDao();
							int total=goodsDao.paging(row);
							ArrayList<Goods> result=goodsDao.selectGoodsList(currentPage1,row);
			
							for(int i=0;i<result.size();i++){
								Goods resultgoods=result.get(i);
						%>
							<tr>
								<td>
									<%=resultgoods.getGoods_code()%>&nbsp;&nbsp;&nbsp;
									<a href="<%=request.getContextPath() %>/goods/goodsView.jsp?sendCode=<%=resultgoods.getGoods_code() %>"><%=resultgoods.getGoods_title() %></a>
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
			</div>
			<%@ include file="/module/sidebar.jsp" %>
			<%@ include file="/module/footer.jsp" %>
		</div>
	</body>
</html>