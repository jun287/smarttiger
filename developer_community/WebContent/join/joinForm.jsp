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
			<div id="jb-content">
			<%
				if(sessionId == null){
			%>
					<h3>ȸ�� ����</h3>  <!-- ȸ������ ������� ȸ�������� �޽��ϴ�.  -->
					<form method="post" action="./joinPro.jsp">
						<ul id="mem_form">
							<li>
								<ul class="cols">
									<li class="col1">���̵� :</li> <!-- ���̵� text �ڽ� "id"�� �޽��ϴ�. -->
									<li class="col2" ><input type="text" name="id"></li>
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">��й�ȣ :</li> <!-- ��й�ȣ password �ڽ� "pw"�� �޽��ϴ�.  -->
									<li class="col2"><input type="password" name="pw"></li>
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">�̸� :</li> <!-- �̸��� text �ڽ� "name"�� �޽��ϴ�. -->
									<li class="col2"><input type="text" name="name"></li>
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">�޴���ȭ :</li> <!--�޴���ȭ��ȣ�� text �ڽ��� select �� �޽��ϴ�.   -->
									<li class="col2">
										<select name="phone1">
											<option>010</option>
											<option>011</option>
											<option>017</option>
										</select> -
										<input class="hp" type="text" name="phone2"> - <input class="hp" type="text" name="phone3">
									</li>
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">�̸��� :</li> <!-- �̸����� select �� text�ڽ��� �޽��ϴ�. -->
									<li class="col2"><input id="email1" type="text" name="email1">@
										<select id="email2" name="email2">
											<option>����</option>
											<option>naver.com</option>
											<option>hanmail.net</option>
											<option>gmail.com</option>
										</select>
									</li>
								</ul>
							</li>
							<li>
								<ul class="cols"> <!--������ ���� ����� submit�� �����մϴ�(action����).  -->
									<li class="col1"></li>
									<li class="col2">
										<input type="submit" value="ȸ������">	
									</li>
								</ul>
							</li>
						</ul>
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
			</div>
			<%@ include file="/module/footer.jsp" %>

		</div>
	</body>
</html>