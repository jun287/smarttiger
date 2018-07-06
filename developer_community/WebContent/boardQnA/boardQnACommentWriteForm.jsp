<!-- 28�� �̿��� 2018. 7. 5(��) boardQnACommentWriteForm.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "dao.BoardQnADao"%>
<%@ page import = "dto.BoardQnA"%>
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
			}
			#QnAcontent, #QnACommentContent{
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
				<div style="float:right;"><a href="<%=request.getContextPath()%>/boardQnA/boardQnAList.jsp">| ������� | </a></div>
<%
	if(sessionId != null){
%>			
				<div id="QnACommentContent">
				<span>�亯 ����</span><br>
					<form action="<%=request.getContextPath()%>/boardQnA/boardQnACommentWritePro.jsp" method="post">
						<div> 
							<label for="memberId">�亯�� ID:</label>
							<input type="text" name="memberId" id="memberId" value="<%=sessionId%>" readonly>
							<input type="hidden" name="boardQnANumber" value="<%=boardQnA.getBoardQnANumber()%>">
						</div>
						<div>	
							<label for="boardqnaCommentContent">�� ����</label>
							<textarea name="boardqnaCommentContent" id="boardqnaCommentContent" style="width:300px; height:300px;">
							</textarea>
							<input type="submit" value="���">
						</div>
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