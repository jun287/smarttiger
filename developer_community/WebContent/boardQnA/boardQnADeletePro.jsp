<!-- 28�� �̿��� 2018. 7. 5(��) boardQnADeletePro.jsp -->
<%@ page language = "java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "dao.BoardQnADao"%>
<%@ page import = "dao.ActivityDao"%>
<%@ page import = "dto.BoardQnA"%>
<%@ page import = "dao.BoardQnACommentDao"%>
<%@ page import = "dto.BoardQnAComment"%>
<%@ page import = "dto.Activity"%>
<%
	request.setCharacterEncoding("euc-kr");
	String sessionId = (String)session.getAttribute("sessionId");
	String sessionLevel = (String)session.getAttribute("sessionLevel");
	String sessionName = (String)session.getAttribute("sessionName");

	int boardQnANumber=Integer.parseInt(request.getParameter("boardQnANumber"));
	System.out.println(boardQnANumber+"<--boardQnANumber");
	
	BoardQnA boardQnA = new BoardQnA();
	BoardQnADao boardQnADao = new BoardQnADao();
	boardQnA.setBoardQnANumber(boardQnANumber);
	boardQnA = boardQnADao.selectBoardQnA(boardQnA);
	
	BoardQnACommentDao boardQnACommentDao = new BoardQnACommentDao();
	BoardQnAComment boardQnAComment = new BoardQnAComment();
	boardQnAComment = boardQnACommentDao.selectBoardQnAComment(boardQnANumber);
	System.out.println(boardQnAComment+"<--boardQnAComment");
	if(boardQnAComment.getMemberId() !=null && !boardQnAComment.getMemberId().equals("")){
		System.out.println("�ۼ��� ����� �־� ���� �� �� ����");
		response.sendRedirect(request.getContextPath()+"/boardQnA/boardQnAList.jsp");
	}else if(sessionId.equals(boardQnA.getMemberId()) && boardQnAComment.getMemberId() == null ){
		System.out.println("�ۼ��� ����� ���� �� �ۼ��ڰ� Ȯ�εǾ� ����������.");
		boardQnADao.deleteBoardQnA(boardQnANumber);				// QnA ���� �޼ҵ�
		response.sendRedirect(request.getContextPath()+"/boardQnA/boardQnAList.jsp");
		ActivityDao activityDao = new ActivityDao();
		Activity activity = new Activity();
		activity.setMemberId(boardQnA.getMemberId());
		activity=activityDao.selectActivity(activity);
		activityDao.deleteFromUpdateActivity(activity);
	}else if(!sessionId.equals(boardQnA.getMemberId())){
		response.sendRedirect(request.getContextPath()+"/boardQnA/boardQnAList.jsp");
	}
%>	