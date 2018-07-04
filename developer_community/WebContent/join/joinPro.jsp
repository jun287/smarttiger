<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import="java.sql.DriverManager"%> <!-- 드라이버 로딩을 위해 DrvierManager 클래스를 import 합니다. -->
<%@ page import="java.sql.Connection"%> <!-- db 연결을 위해 Connection 클래스를 import 합니다. -->
<%@ page import="java.sql.PreparedStatement"%> <!-- Query문 객체생성 및 사용하기 위해 PreparedStatement 클래스를 import 합니다. -->
<%@ page import="java.sql.ResultSet" %> <!-- select Query 문을 조회하고 결과를 사용하기위해 ResulSet클래스를  import 합니다. -->
<%@ page import="dto.Member" %>
<%@ page import="dao.MemberDao" %>

<!DOCTYPE html>

<%
	request.setCharacterEncoding("euckr"); // joinForm 에서 받은 값들의 문자인코딩을 euckr로 받습니다.
	
	// joinForm 에서 회원가입 양식에 맞게 값들을 받아서 변수에 대입합니다.
	String id = request.getParameter("id"); 
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");	
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	
	// 폰번호는 3개의 값을 받아서 하나의 변수에 값을 담아줍니다.
	String phone = phone1+"-"+phone2+"-"+phone3;
	// 이메일도 2개의 값을 받아서 하나의 변수에 값을 담아줍니다.
	String email = email1+"@"+email2;
	
	// 값이 맞게 들어오는지 콘솔창에 출력해줍니다.
	System.out.println(phone);
	System.out.println(email);
	
	Member member = new Member();
	
	member.setId(id);
	member.setPw(pw);
	member.setName(name);
	member.setPhone(phone);
	member.setEmail(email);
	
	MemberDao memberDao = new MemberDao();
	memberDao.memberJoin(member);
	
	response.sendRedirect(request.getContextPath()+"/index.jsp");
%>