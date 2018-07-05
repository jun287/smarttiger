<!-- 28기 이원상 2018. 7. 5(목) boardQnADeletePro.jsp -->
<%@ page language = "java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "dao.BoardQnADao"%>
<%@ page import = "dao.ActivityDao"%>
<%
	request.setCharacterEncoding("euc-kr");
	int boardQnANumber=Integer.parseInt(request.getParameter("boardQnANumber"));
	BoardQnADao boardQnADao = new BoardQnADao();
	boardQnADao.deleteBoardQnA(boardQnANumber);
	ActivityDao activityDao = new ActivityDao();
	response.sendRedirect(request.getContextPath()+"/boardQnA/boardQnAList.jsp");
%>	