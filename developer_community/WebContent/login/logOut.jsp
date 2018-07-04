<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<%
	session.invalidate();	//세션 종료
	System.out.println("로그인 종료");
	response.sendRedirect(request.getContextPath()+"/index.jsp"); // 세선이 종료되고 index.jsp로 페이지 이동됩니다.
%>