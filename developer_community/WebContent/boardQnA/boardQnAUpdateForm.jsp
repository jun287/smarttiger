<!-- 28�� �̿��� 2018. 7. 6(��) boardQnAUpdateForm.jsp -->
<%@ page language = "java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "dao.BoardQnADao" %>
<%@ page import = "dto.BoardQnA" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>QnA�Խ��� �� �ۼ�</title>
	</head>
	<body>
		<div id="jb-container">
		<%@include file="/module/header.jsp" %>
		<%@ include file="/module/sidebar.jsp" %>
<%
	request.setCharacterEncoding("EUC-KR");
	int boardQnANumber = Integer.parseInt(request.getParameter("boardQnANumber"));
	BoardQnADao boardQnADao = new BoardQnADao();
	BoardQnA boardQnA = new BoardQnA();
	boardQnA.setBoardQnANumber(boardQnANumber);
	boardQnA = boardQnADao.selectBoardQnA(boardQnA);
	if(!sessionId.equals(boardQnA.getMemberId())){
		response.sendRedirect(request.getContextPath()+"/boardQnA/boardQnAList.jsp");
	}
%>		
			<div id="jb-content">		
				<div>
					<form action="<%=request.getContextPath()%>/boardQnA/boardQnAUpdatePro.jsp" method="post">
						<div>	
							<label for="memberId">�ۼ���</label>
							<input type="text" id="memberId" name="memberId" value="<%=boardQnA.getMemberId()%>" readonly>
							<input type="hidden" name="boardQnANumber" value="<%=boardQnA.getBoardQnANumber()%>">
						</div>
						<div>	
							<label for="boardQnAtitle">�� ����</label>
							<input type="text" id="boardQnAtitle" name="boardQnAtitle" value="<%=boardQnA.getBoardQnAtitle()%>">
						</div>
						<div>
							<label for="boardQnACategory">�� ����</label>
							<select name="boardQnACategory" id="boardQnACategory">
								<option value="java">�ڹ�</option>
								<option value="DBMS">�����ͺ��̽�</option>
								<option value="javaScript">�ڹٽ�ũ��Ʈ</option>
								<option value="htmlAndCss">html and css</option>
								<option value="��Ÿ">��Ÿ</option>					
							</select>
						</div>
						<div>	
							<label for="boardQnAContent">�� ����</label>
							<textarea name="boardQnAContent" id="boardQnAContent" style="width:300px; height:300px;">
							<%=boardQnA.getBoardQnAContent()%></textarea>
							<input type="submit" value="����">
						</div>
					</form>
				</div>
			</div>
			<%@include file="/module/footer.jsp" %>
		</div>	
	</body>
</html>