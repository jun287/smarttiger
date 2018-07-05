<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

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
	%>	
		<div id="jb-container">
			<%@ include file="/module/header.jsp"%>
			<div id="jb-content">
			<%
				if(sessionId == null){
			%>
					<h3>회원 가입</h3>  <!-- 회원가입 양식으로 회원정보를 받습니다.  -->
					<form method="post" action="./joinPro.jsp">
						<ul id="mem_form">
							<li>
								<ul class="cols">
									<li class="col1">아이디 :</li> <!-- 아이디를 text 박스 "id"로 받습니다. -->
									<li class="col2" ><input type="text" name="id"></li>
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">비밀번호 :</li> <!-- 비밀번호 password 박스 "pw"로 받습니다.  -->
									<li class="col2"><input type="password" name="pw"></li>
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">이름 :</li> <!-- 이름을 text 박스 "name"로 받습니다. -->
									<li class="col2"><input type="text" name="name"></li>
								</ul>
							</li>
							<li>
								<ul class="cols">
									<li class="col1">휴대전화 :</li> <!--휴대전화번호를 text 박스와 select 로 받습니다.   -->
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
									<li class="col1">이메일 :</li> <!-- 이메일을 select 와 text박스로 받습니다. -->
									<li class="col2"><input id="email1" type="text" name="email1">@
										<select id="email2" name="email2">
											<option>선택</option>
											<option>naver.com</option>
											<option>hanmail.net</option>
											<option>gmail.com</option>
										</select>
									</li>
								</ul>
							</li>
							<li>
								<ul class="cols"> <!--위에서 받은 양식을 submit로 제출합니다(action으로).  -->
									<li class="col1"></li>
									<li class="col2">
										<input type="submit" value="회원가입">	
									</li>
								</ul>
							</li>
						</ul>
					</form>
			<%
				}else{
			%>	
					<script type="text/javascript">
						alert('로그인 중입니다.');
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