<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import ="dto.Member" %>
<%@ page import ="dao.MemberDao" %>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>������ Ŀ�´�Ƽ</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css"/>
		<style>
			* {
				margin:0;
				padding:0;
			}
			ul {
				list-style-type:none; /* ul�±��� ����� ���� �ʽ��ϴ�. */
			}
			
			h3 { /* h3�±��� ������ �����մϴ�. */
				margin:20px 0 0 50px;
			}
			
			body { 
				font-family:"���� ���","����";
				font-size:12px;
				color:#444444;
			}
			
			#mem_form { /* id : mem_form �� ũ�� ���� ����ü ����ũ�� ���ڻ� ���� �����մϴ�.  */
				width:500px;
				margin:10px 0 0 50px;
				font-family:"����";
				font-size:12px;
				color:#444444;
				padding-top:5px;
				padding-bottom:10px;
				border-top:solid 1px #cccccc;
				border-bottom:solid 1px #cccccc;
			}
			
			.cols li { /* cols Ŭ������ li�±��� ���κ�� ǥ�� �������� �ݴϴ�.  */
				display:inline-block;
				margin-top:5px;
			}
			
			.cols li.col1 { /* cols Ŭ������ li.col1 �±��� ũ�⸦ 100px ���������� �����������մϴ�.  */
				width:100px;
				text-align:right;
			}
			
			.cols li.col2 { /* cols Ŭ������ li.col2 �±��� ũ�⸦ 350px�� �մϴ�. */
				width:350px;
			}
			
			.cols li.col2 input.hp { /* cols Ŭ������ li.col2�� input Ŭ���� hp�� ũ�⸦ 35px�� �մϴ�. */
				width:35px;
			}
			#jb-container {
				width: 1200px;
				margin: 0px auto;
				padding: 20px;
				border: 1px solid #bcbcbc;
			}
			
			#jb-header {
				padding: 20px;
				margin-bottom: 20px;
				border: 1px solid #bcbcbc;
			}
			
			#jb-content {
				width: 800px;
				padding: 20px;
				margin-bottom: 20px;
				float: left;
				border: 1px solid #bcbcbc;
			}
			
			#jb-sidebar {
				width: 300px;
				padding: 20px;
				margin-bottom: 20px;
				float: right;
				border: 1px solid #bcbcbc;
			}
			
			#jb-footer {
				clear: both;
				padding: 20px;
				border: 1px solid #bcbcbc;
			}
			
			#jb ul {
				list-style-type: none;
			}
			
			#jb li {
				display: inline-block;
				margin: 12px 30px 0 50px;
				font-size: 13px;
			}			
		</style>
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
			<div id="jb-content">
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
						alert('�α��� ���ּ���');
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