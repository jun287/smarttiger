<!-- 28�� �̿��� 2018. 7. 6(��) boardQnACommentWritePro.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "dao.BoardQnACommentdDao"%>
<%@ page import = "dao.ActivityDao"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="boardQnAComment" class="dto.BoardQnAComment"/>
<jsp:setProperty name="boardQnAComment" property="*"/>
<jsp:useBean id="activity" class="dto.Activity"/>
<jsp:setProperty name="activity" property="*"/>
<%
	BoardQnACommentdDao boardQnACommentdDao = new BoardQnACommentdDao();
	boardQnACommentdDao.insertBoardQnAComment(boardQnAComment);
	ActivityDao activityDao = new ActivityDao();
	activityDao.answerFromUpdateActivity(activity);
	response.sendRedirect(request.getContextPath()+"/boardQnA/boardQnAView.jsp?boardQnANumber="+boardQnAComment.getBoardQnANumber());
	//����Ʈ�� �̵�
%>
