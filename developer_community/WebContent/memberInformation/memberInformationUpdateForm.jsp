<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import ="dto.Member" %>
<%@ page import ="dao.MemberDao" %>

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
		
		MemberDao memberDao = new MemberDao();
		Member member = memberDao.memberInformationSelect(sessionId);
		
	%>
		<div id="jb-container">
			<%@ include file="/module/header.jsp"%>
			<div id="jb-content2">
			<%
				if(sessionId != null){
			%>

					<h3>ȸ�� ����</h3>  <!-- ȸ������ ������� ȸ�������� �޽��ϴ�.  -->
					<form method="post" action="./memberInformationUpdatePro.jsp">
						<ul id="mem_form">
							<li>
								<ul class="cols">
									<li class="col1">���̵� :</li> 
									<li class="col2" ><%=member.getId()%></li>
									<input type="hidden" name="id" value="<%=member.getId()%>">
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">��й�ȣ :</li> 
									<li class="col2"><input type="password" name="pw" value="<%=member.getPw()%>"></li>
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">�̸� :</li> 
									<li class="col2"><input type="text" name="name" value="<%=member.getName()%>"></li>
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">���� :</li> 
									<li class="col2"><%=member.getLevel()%></li>
									<input type="hidden" name="level" value="<%=member.getLevel()%>">
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">�޴���ȭ :</li> 
									<li class="col2"><input type="text" name="phone" value="<%=member.getPhone()%>"></li>
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">�̸��� :</li> <!-- �̸����� select �� text�ڽ��� �޽��ϴ�. -->
									<li class="col2"><input id="email1" type="text" name="email" value="<%=member.getEmail()%>"></li>
								</ul>
							</li>
							<li>
								<ul class="cols"> <!--������ ���� ����� submit�� �����մϴ�(action����).  -->
									<li class="col1"></li>
									<li class="col2">
										<input type="submit" value="����">	
									</li>
								</ul>
							</li>
						</ul>
					</form>
			<%
				}else{
			%>			
					<script type="text/javascript">
						alert('�α��� ���ּ���.');
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