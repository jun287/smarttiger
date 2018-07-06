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
	request.setCharacterEncoding("EUC-KR");
	String sessionId = (String)session.getAttribute("sessionId");
	String sessionLevel = (String)session.getAttribute("sessionLevel");
	String sessionName = (String)session.getAttribute("sessionName");
	if(sessionId == null){
		response.sendRedirect(request.getContextPath()+"/boardQnA/boardQnAList.jsp");
	}
	BoardQnACommentDao boardQnACommentDao = new BoardQnACommentDao();
	int countBoardQnAComment = boardQnACommentDao.countBoardQnAComment(boardQnAComment);
	if(countBoardQnAComment == 0){							// 답글 입력 제한(1개이상 금지);
		boardQnACommentDao.insertBoardQnAComment(boardQnAComment);
		ActivityDao activityDao = new ActivityDao();
		activity=activityDao.selectActivity(activity);
		activityDao.answerFromUpdateActivity(activity);	
	}else{
		System.out.println("해당글에 작성된 답글이 1개 이상임.");
	}
	response.sendRedirect(request.getContextPath()+"/boardQnA/boardQnAView.jsp?boardQnANumber="+boardQnAComment.getBoardQnANumber());
	//답변글로 이동
%>
