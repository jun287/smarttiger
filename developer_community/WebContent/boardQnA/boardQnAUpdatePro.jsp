<!-- 28�� �̿��� 2018. 7. 6(��) boardQnAUpdatePro.jsp -->
<%@ page language = "java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "dao.BoardQnADao"%>
<%@ page import = "dto.BoardQnA"%>
<%@ page import = "dao.BoardQnACommentDao"%>
<%@ page import = "dto.BoardQnAComment"%>
<% 	request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="boardQnA" class="dto.BoardQnA"/>
<jsp:setProperty name="boardQnA" property="*"/>
<%
	String sessionId = (String)session.getAttribute("sessionId");
	String sessionLevel = (String)session.getAttribute("sessionLevel");
	String sessionName = (String)session.getAttribute("sessionName");

	int boardQnANumber=Integer.parseInt(request.getParameter("boardQnANumber"));
	System.out.println(boardQnANumber+"<--boardQnANumber");
	
	BoardQnADao boardQnADao = new BoardQnADao();
		
	BoardQnACommentDao boardQnACommentDao = new BoardQnACommentDao();
	BoardQnAComment boardQnAComment = new BoardQnAComment();
	boardQnAComment = boardQnACommentDao.selectBoardQnAComment(boardQnANumber);
	
	if(boardQnAComment.getMemberId() !=null && !boardQnAComment.getMemberId().equals("")){
		System.out.println("�ۼ��� ����� �־� ���� �� �� ����");
		response.sendRedirect(request.getContextPath()+"/boardQnA/boardQnAList.jsp");
	}else if(sessionId.equals(boardQnA.getMemberId()) && boardQnAComment.getMemberId() == null ){
		System.out.println("�ۼ��� ����� ���� �� �ۼ��ڰ� Ȯ�εǾ� ����������.");
		boardQnADao.updateBoardQnA(boardQnA);					//���� �޼ҵ�
 		response.sendRedirect(request.getContextPath()+"/boardQnA/boardQnAList.jsp");
		
	}else if(!sessionId.equals(boardQnA.getMemberId())){
		response.sendRedirect(request.getContextPath()+"/boardQnA/boardQnAList.jsp");
	}
%>	