<!-- 28기 이원상 2018. 7. 6(금) boardQnACommentWritePro.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "dao.BoardQnACommentDao"%>
<%@ page import = "dao.ActivityDao"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="boardQnAComment" class="dto.BoardQnAComment"/>
<jsp:setProperty name="boardQnAComment" property="*"/>
<jsp:useBean id="activity" class="dto.Activity"/>
<jsp:setProperty name="activity" property="*"/>
<%
	BoardQnACommentDao boardQnACommentDao = new BoardQnACommentDao();
	boardQnACommentDao.insertBoardQnAComment(boardQnAComment);
	ActivityDao activityDao = new ActivityDao();
	activityDao.answerFromUpdateActivity(activity);
	response.sendRedirect(request.getContextPath()+"/boardQnA/boardQnAView.jsp?boardQnANumber="+boardQnAComment.getBoardQnANumber());
	//답변글로 이동
%>
