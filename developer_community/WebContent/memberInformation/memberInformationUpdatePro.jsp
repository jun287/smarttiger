<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import ="dao.MemberDao" %>

<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="member" class="dto.Member"/>
<jsp:setProperty name="member" property="*"/>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			/* String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String level = request.getParameter("level");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			
			Member member = new Member();
			
			member.setId(id);
			member.setPw(pw);
			member.setName(name);
			member.setLevel(level);
			member.setPhone(phone);
			member.setEmail(email); */
			
			MemberDao memberDao = new MemberDao();
			memberDao.memberUpdate(member);
		%>	
			<script type="text/javascript">
				alert('회원정보가 수정되었습니다.');
				location.href='<%=request.getContextPath()%>/index.jsp';
			</script>
			
			<!-- response.sendRedirect(request.getContextPath()+"/index.jsp"); -->
	</body>
</html>