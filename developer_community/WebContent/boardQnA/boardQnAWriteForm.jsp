<!-- 28�� �̿��� 2018. 7. 4(��) boardQnAWriteForm.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String sessionId = (String)session.getAttribute("sessionId");
	String sessionLevel = (String)session.getAttribute("sessionLevel");
	String sessionName = (String)session.getAttribute("sessionName");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>QnA�Խ��� �� �ۼ�</title>
	</head>
	<body>
		<div>
			<form action="<%=request.getContextPath()%>/boardQnA/boardQnAWritePro.jsp" method="post">
				<div>	
					<label for="memberId">�ۼ���</label>
					<input type="text" id="memberId" name="memberId" value="<%=sessionId%>" readonly>
				</div>
				<div>	
					<label for="boardQnAtitle">�� ����</label>
					<input type="text" id="boardQnAtitle" name="boardQnAtitle">
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
					</textarea>
					<input type="submit" value="���">
				</div>
			</form>
		</div>
	</body>
</html>