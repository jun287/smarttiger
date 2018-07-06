<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import="dao.MemberDao" %>
<%@ page import="dto.Member" %>


<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println(id);
		System.out.println(pw);
		
		MemberDao memberDao = new MemberDao();
		String result = memberDao.memberLogin(id, pw);
		
		System.out.println(result);
		
		if(result.equals("01로그인 성공")){
			Member member = memberDao.memberGetForSession(id);
			session.setAttribute("sessionId", member.getId());
			session.setAttribute("sessionLevel", member.getLevel());
			session.setAttribute("sessionName", member.getName());
			
	%>
			<script type="text/javascript">
				location.href='<%= request.getContextPath()%>/index.jsp';
			</script>
	<%
		}else if(result.equals("02아이디 불일치")){
	%>
			<script type="text/javascript">
				alert('ID를 정확히 입력해주세요');
				location.href='<%= request.getContextPath()%>/login/loginForm.jsp';
			</script>	
	<%	
		}else if(result.equals("03비번 불일치")){
	%>
			<script type="text/javascript">
				alert('PW를 정확히 입력해주세요');
				location.href='<%= request.getContextPath()%>/login/loginForm.jsp';
			</script>
	<%		
		}
	%>
	</body>
</html>