<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>������ Ŀ�´�Ƽ</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css"/>
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
		<div id="jb-sidebar">
			<%
				if(sessionId == null){
			%>
					<form method="post" action="<%=request.getContextPath() %>/login/loginPro.jsp">
						<div id="login_box">
							<h2>Member Login</h2>
							<ul id="input_button">
								<li id="id_pass">
									<ul>
										<li>
											<span>ID</span>
											<input type="text" name="id">
										</li> <!-- id -->
										<li id="pass">
											<span>PW</span>
											<input type="password" name="pw">
										</li> <!-- pw  -->
									</ul>
								</li> 
								<li id="login_btn">
									<button>�α���</button>				
								</li>
							</ul>
							<ul id="btns">
								<li><a href ="<%=request.getContextPath() %>/join/joinForm.jsp">ȸ������</a></li>
							</ul>
						</div> <!-- login_box -->
					</form>
			<%
				}else{
			%>
					<div id="login_box">
						<h2>Member Login</h2>
						<ul id="input_button">
							<li id="id_pass">
								<ul>
									<li>
										<a href="<%=request.getContextPath() %>/memberInformation/memberInformationUpdateForm.jsp"><%=sessionName%></a>�� <%=sessionLevel%>�� �α���
									</li> 
								</ul>
								<br><br><a href="<%=request.getContextPath() %>/login/logOut.jsp">�α׾ƿ�</a>
							</li> 
						</ul>
					</div>
			<%
				} 
			%>
				
		</div>
	</body>
</html>