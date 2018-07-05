<!-- 28기 이원상 2018. 7. 5(목) boardQnAView.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "dao.BoardQnADao"%>
<%@ page import = "dto.BoardQnA"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>QnA 게시판 글 보기</title>
		<style>
			th, tr, td{
				border:1px solid #353535;
				margin-left:5px;
				text-align:center;
			}
			.clear{
				clear:both;
			}
			#QnAcontent, #viewHead{
				border:1px solid #353535;
				margin:15px 0 0 0;
				padding:15px 15px 15px 15px;
			}span{
				font-size:25px;
				font-weight:bold;
			}
		</style>
	</head>
	<body>
		<div id="jb-container">
		<%@include file="/module/header.jsp" %>
			<div id="jb-content">
<%
	request.setCharacterEncoding("EUC-KR");
	String sessionId = (String)session.getAttribute("sessionId");
	String sessionLevel = (String)session.getAttribute("sessionLevel");
	String sessionName = (String)session.getAttribute("sessionName");
	int boardQnANumber = Integer.parseInt(request.getParameter("boardQnANumber"));
	BoardQnADao boardQnADao = new BoardQnADao();
	BoardQnA boardQnA = new BoardQnA();
	boardQnA.setBoardQnANumber(boardQnANumber);
	boardQnA = boardQnADao.selectBoardQnA(boardQnA);
%>			
				<table>
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>글쓴이</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>카테고리</th>
					</tr>
					<tr>
						<td><%=boardQnA.getBoardQnANumber()%></td>
						<td><%=boardQnA.getBoardQnAtitle() %></td>
						<td><%=boardQnA.getMemberId() %></td>
						<td><%=boardQnA.getBoardQnADate() %></td>
						<td><%=boardQnA.getBoardQnAhits() %></td>
						<td><%=boardQnA.getBoardQnACategory() %></td>
					</tr>			
				</table>
				<div class="clear" id="QnAcontent">
					<span>질문 내용</span><br>
					<%=boardQnA.getBoardQnAContent() %>
				</div>
<%
	if(sessionId == null){	
%>
				<div style="float:right;"><a href="<%=request.getContextPath()%>/boardQnA/boardQnAList.jsp">| 목록으로 | </a></div>
<%		
	}else if(sessionId.equals(boardQnA.getMemberId())){
%>
				<div style="float:right;"><a href="<%=request.getContextPath()%>/boardQnA/boardQnAUpdateForm.jsp?boardQnANumber=<%=boardQnA.getBoardQnANumber()%>">| 수정 | </a></div>
				<div style="float:right;"><a href="<%=request.getContextPath()%>/boardQnA/boardQnADeletePro.jsp?boardQnANumber=<%=boardQnA.getBoardQnANumber()%>">| 삭제 | </a></div>
				<div style="float:right;"><a href="<%=request.getContextPath()%>/boardQnA/boardQnAList.jsp">| 목록으로 | </a></div>
<%		
	}else{
		boardQnADao.updateBoardQnA(boardQnA);			// 조회수 증가 메소드, 본인이 아닌 타인이 읽었을때만 적용
%>
				<div style="float:right;"><a href="<%=request.getContextPath()%>/boardQnA/boardQnACommentWriteForm.jsp?boardQnANumber=<%=boardQnA.getBoardQnANumber()%>">| 답글작성 | </a></div>
				<div style="float:right;"><a href="<%=request.getContextPath()%>/boardQnA/boardQnAList.jsp">| 목록으로 | </a></div>
<%		
	}	
%>					
			</div>
			<%@include file="/module/footer.jsp" %>
		</div>			
	</body>
</html>