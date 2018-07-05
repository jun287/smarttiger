<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import ="dto.Member" %>
<%@ page import ="dao.MemberDao" %>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>개발자 커뮤니티</title>
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

					<h3>회원 정보</h3>  <!-- 회원가입 양식으로 회원정보를 받습니다.  -->
					<form method="post" action="./memberInformationUpdatePro.jsp">
						<ul id="mem_form">
							<li>
								<ul class="cols">
									<li class="col1">아이디 :</li> 
									<li class="col2" ><%=member.getId()%></li>
									<input type="hidden" name="id" value="<%=member.getId()%>">
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">비밀번호 :</li> 
									<li class="col2"><input type="password" name="pw" value="<%=member.getPw()%>"></li>
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">이름 :</li> 
									<li class="col2"><input type="text" name="name" value="<%=member.getName()%>"></li>
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">권한 :</li> 
									<li class="col2"><%=member.getLevel()%></li>
									<input type="hidden" name="level" value="<%=member.getLevel()%>">
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">휴대전화 :</li> 
									<li class="col2"><input type="text" name="phone" value="<%=member.getPhone()%>"></li>
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">이메일 :</li> <!-- 이메일을 select 와 text박스로 받습니다. -->
									<li class="col2"><input id="email1" type="text" name="email" value="<%=member.getEmail()%>"></li>
								</ul>
							</li>
							<li>
								<ul class="cols"> <!--위에서 받은 양식을 submit로 제출합니다(action으로).  -->
									<li class="col1"></li>
									<li class="col2">
										<input type="submit" value="수정">	
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