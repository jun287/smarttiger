<!-- 28기 이원상 2018. 7. 4(수) boardQnAWriteForm.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>QnA게시판 글 작성</title>
	</head>
	<body>
		<div id="jb-container">
		<%@include file="/module/header.jsp" %>
		<%@ include file="/module/sidebar.jsp" %>
<%
	request.setCharacterEncoding("EUC-KR");
	if(sessionId == null){
		response.sendRedirect(request.getContextPath()+"/boardQnA/boardQnAList.jsp");
	}
%>		
			<div id="jb-content">		
				<div>
					<form action="<%=request.getContextPath()%>/boardQnA/boardQnAWritePro.jsp" method="post">
						<div>	
							<label for="memberId">작성자</label>
							<input type="text" id="memberId" name="memberId" value="<%=sessionId%>" readonly>
						</div>
						<div>	
							<label for="boardQnAtitle">글 제목</label>
							<input type="text" id="boardQnAtitle" name="boardQnAtitle">
						</div>
						<div>
							<label for="boardQnACategory">글 구분</label>
							<select name="boardQnACategory" id="boardQnACategory">
								<option value="java">자바</option>
								<option value="DBMS">데이터베이스</option>
								<option value="javaScript">자바스크립트</option>
								<option value="htmlAndCss">html and css</option>
								<option value="기타">기타</option>					
							</select>
						</div>
						<div>	
							<label for="boardQnAContent">글 내용</label>
							<textarea name="boardQnAContent" id="boardQnAContent" style="width:300px; height:300px;">
							</textarea>
							<input type="submit" value="등록">
						</div>
					</form>
				</div>
			</div>
			<%@include file="/module/footer.jsp" %>
		</div>	
	</body>
</html>