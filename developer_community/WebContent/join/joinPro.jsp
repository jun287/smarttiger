<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import="dto.Member" %>
<%@ page import="dao.MemberDao" %>
<%@ page import="dao.ActivityDao" %>
<%@ page import="dto.Activity" %>

<!DOCTYPE html>
<%
	request.setCharacterEncoding("euckr");
	// joinForm ���� ȸ������ ��Ŀ� �°� ������ �޾Ƽ� ������ �����մϴ�.
	String id = request.getParameter("id"); 
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");	
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	
	// ����ȣ�� 3���� ���� �޾Ƽ� �ϳ��� ������ ���� ����ݴϴ�.
	String phone = phone1+"-"+phone2+"-"+phone3;
	// �̸��ϵ� 2���� ���� �޾Ƽ� �ϳ��� ������ ���� ����ݴϴ�.
	String email = email1+"@"+email2;
	
	// ���� �°� �������� �ܼ�â�� ������ݴϴ�.
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
	Activity activity = new Activity();
	activity.setMemberId(id);
	ActivityDao activityDao = new ActivityDao();
	activityDao.insertActivity(activity);
	
	response.sendRedirect(request.getContextPath()+"/index.jsp");

%>