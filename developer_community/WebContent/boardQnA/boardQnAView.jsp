<!-- 28�� �̿��� 2018. 7. 5(��) boardQnAView.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "dao.BoardQnADao"%>
<%@ page import = "dao.BoardQnACommentdDao"%>
<%@ page import = "dto.BoardQnA"%>
<%@ page import = "dto.BoardQnAComment"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>QnA �Խ��� �� ����</title>
		<style>
			th, tr, td{
				border:1px solid #353535;
				margin-left:5px;
				text-align:center;
			}
			.clear{
				clear:both;
			}#QnAcontent, #QnACommentContent{
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
	BoardQnACommentdDao boardQnACommentdDao = new BoardQnACommentdDao();
	BoardQnAComment boardQnAComment = new BoardQnAComment();
	boardQnAComment.setBoardQnANumber(boardQnANumber);
	ArrayList<BoardQnAComment> boardQnACommentList = boardQnACommentdDao.selectBoardQnAComment(boardQnAComment);
%>			
				<table>
					<tr>
						<th>�۹�ȣ</th>
						<th>������</th>
						<th>�۾���</th>
						<th>�ۼ���</th>
						<th>��ȸ��</th>
						<th>ī�װ�</th>
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
					<span>���� ����</span><br>
					<%=boardQnA.getBoardQnAContent() %>
				</div>
<%
	if(sessionId == null){	
%>
				<div style="float:right;"><a href="<%=request.getContextPath()%>/boardQnA/boardQnAList.jsp">| ������� | </a></div>
<%		
	}else if(sessionId.equals(boardQnA.getMemberId())){
%>
				<div style="float:right;"><a href="<%=request.getContextPath()%>/boardQnA/boardQnAUpdateForm.jsp?boardQnANumber=<%=boardQnA.getBoardQnANumber()%>">| ���� | </a></div>
				<div style="float:right;"><a href="<%=request.getContextPath()%>/boardQnA/boardQnADeletePro.jsp?boardQnANumber=<%=boardQnA.getBoardQnANumber()%>">| ���� | </a></div>
				<div style="float:right;"><a href="<%=request.getContextPath()%>/boardQnA/boardQnAList.jsp">| ������� | </a></div>
<%		
	}else{
		boardQnADao.updateBoardQnA(boardQnA);			// ��ȸ�� ���� �޼ҵ�, ������ �ƴ� Ÿ���� �о������� ����
%>
				<div style="float:right;"><a href="<%=request.getContextPath()%>/boardQnA/boardQnACommentWriteForm.jsp?boardQnANumber=<%=boardQnA.getBoardQnANumber()%>">| ����ۼ� | </a></div>
				<div style="float:right;"><a href="<%=request.getContextPath()%>/boardQnA/boardQnAList.jsp">| ������� | </a></div>
<%		
	}for(int i=0; i<boardQnACommentList.size(); i++){
		boardQnAComment = boardQnACommentList.get(i);
%>				

			
				<div class="clear" id="QnACommentContent">
					<span><%=boardQnAComment.getMemberId() %>���� �亯 ����</span><br>
					<%=boardQnAComment.getBoardqnaCommentDate() %><br>
					<%=boardQnAComment.getBoardqnaCommentContent() %><br>
					<form>
						<input type="image" src="<%=request.getContextPath() %>/img/choose.png">
						<input type="hidden" name="memberId" value="<%=boardQnAComment.getMemberId() %>">
					</form>
				</div>
<%				
	}
%>	
			</div>
			<%@include file="/module/footer.jsp" %>
		</div>			
	</body>
</html>