<!-- 28�� �̿��� 2018. 7. 4(��) boardQnAWritePro.jsp -->
<%@ page language = "java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "dao.BoardQnADao"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="boardQnA" class="dto.BoardQnA"/>
<jsp:setProperty name="boardQnA" property="*"/>
<%
	BoardQnADao boardQnADao = new BoardQnADao();
	boardQnADao.insertBoardQnA(boardQnA);
%>
