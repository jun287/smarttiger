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
		<div id="jb-container">
			<%@ include file="/module/header.jsp"%>
			<div align="center">
			<%
				if(sessionId == null){
			%>
					<h3>�α��� ���ּ���</h3><br>  <!-- ȸ������ ������� ȸ�������� �޽��ϴ�.  -->
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
					<script type="text/javascript">
						alert('�α��� ���Դϴ�.');
						location.href='<%= request.getContextPath()%>/index.jsp';
					</script>
			<%
				} 
			%>
			</div><br><br><br> <!-- login_box -->
			<%@ include file="/module/footer.jsp" %>
		</div>
	</body>
</html>