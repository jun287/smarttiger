<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<%
	session.invalidate();	//���� ����
	System.out.println("�α��� ����");
	response.sendRedirect(request.getContextPath()+"/index.jsp"); // ������ ����ǰ� index.jsp�� ������ �̵��˴ϴ�.
%>