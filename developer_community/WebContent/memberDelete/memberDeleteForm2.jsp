<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("EUC-KR");
		String sessionId = (String)session.getAttribute("sessionId");
		String sessionLevel = (String)session.getAttribute("sessionLevel");
		String sessionName = (String)session.getAttribute("sessionName");
		System.out.println(sessionName + "<-- sessionName");
		System.out.println(sessionLevel + "<-- sessionLevel");
	%>
		<div id="jb-container">
			<%@ include file="/module/header.jsp"%>
			<div id="jb-content2">
			<%
				if(sessionId != null){
			%>	
				<h3><%=sessionName%>님 레알 탈퇴??</h3>
					<form method="post" action="<%=request.getContextPath() %>/memberDelete/memberDeletePro.jsp">
						<ul id="mem_form">
							<li>
								<ul class="cols">
									<li class="col1">비밀번호 :</li> <!-- 비밀번호 password 박스 "pw"로 받습니다.  -->
									<li class="col2">
										<input type="hidden" name="id">
										<input type="password" name="pw">
										<input type="submit" value="탈퇴">	
									</li>
								</ul>
							</li>
						</ul>
					</form>
			<%
				}else{
			%>			
					<script type="text/javascript">
						alert('로그인 해주세요.');
						location.href='<%= request.getContextPath()%>/login/loginForm.jsp';
					</script>
			<%
				} 
			%>
			</div>
			<%@ include file="/module/footer.jsp" %>
		</div>
	</body>
</html>