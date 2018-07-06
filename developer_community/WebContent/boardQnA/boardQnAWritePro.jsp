<!-- 28기 이원상 2018. 7. 4(수) boardQnAWritePro.jsp -->
<%@ page language = "java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "dao.BoardQnADao"%>
<%@ page import = "dao.ActivityDao"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="boardQnA" class="dto.BoardQnA"/>
<jsp:setProperty name="boardQnA" property="*"/>
<jsp:useBean id="activity" class="dto.Activity"/>
<jsp:setProperty name="activity" property="*"/>
<%
	request.setCharacterEncoding("euc-kr");
	String sessionId = (String)session.getAttribute("sessionId");
	String sessionLevel = (String)session.getAttribute("sessionLevel");
	String sessionName = (String)session.getAttribute("sessionName");
	if(sessionId == null){
		response.sendRedirect(request.getContextPath()+"/boardQnA/boardQnAList.jsp");
	}
	BoardQnADao boardQnADao = new BoardQnADao();
	boardQnADao.insertBoardQnA(boardQnA);
	ActivityDao activityDao = new ActivityDao();
	activityDao.questionFromUpdateActivity(activity);
	response.sendRedirect(request.getContextPath()+"/boardQnA/boardQnAList.jsp");
	//리스트로 이동
%>
