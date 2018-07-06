<!-- 28기 이원상 2018. 7. 5(목) boardQnADeletePro.jsp -->
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
		System.out.println("작성된 답글이 있어 삭제 할 수 없음");
		response.sendRedirect(request.getContextPath()+"/boardQnA/boardQnAList.jsp");
	}else if(sessionId.equals(boardQnA.getMemberId()) && boardQnAComment.getMemberId() == null ){
		System.out.println("작성된 답글이 없고 글 작성자가 확인되어 삭제가능함.");
		boardQnADao.deleteBoardQnA(boardQnANumber);				// QnA 삭제 메소드
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