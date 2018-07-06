<!-- 28�� �̿��� 2018. 7. 4(��) boardQnAList.jsp -->
<%@ page language = "java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "dao.BoardQnADao"%>
<%@ page import = "dto.BoardQnA"%>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>QnA�Խ��� ����Ʈ</title>
		<style>
		tr, td, th{
			border:1px solid #353535;
		}
		#select, #page{
			float:left;
		}
		#search, #list, #write{
			float:right;
		}	
		.clear{
			clear:both;
		}
		</style>
		<script>
		window.addEventListener("load", function(){
			var pagePerRowButton = document.getElementById("pagePerRowButton");
			pagePerRowButton.addEventListener("click", function(){
				document.getElementById("selectForm").submit();
			});
			var searchButton = document.getElementById("searchButton");
			searchButton.addEventListener("click", function(){
				document.getElementById("searchForm").submit();
			});
		});	
		</script>
	</head>
	
	<body>
		<div id="jb-container">
		<%@include file="/module/header.jsp" %>
		<%@ include file="/module/sidebar.jsp" %>
			<div id="jb-content">		
				<div id="select">
					<form action="<%=request.getContextPath() %>/boardQnA/boardQnAList.jsp" method="post" id="selectForm">
						<select id="pagePerRow" name="pagePerRow">
							<option value="3">3���� ����</option>
							<option value="5">5���� ����</option>
							<option value="7">7���� ����</option>
							<option value="10">10���� ����</option>
						</select>
						<button type="button" id="pagePerRowButton">���⼳��</button>	
					</form>
				</div>	
				<div id="search">	
					<form action="<%=request.getContextPath() %>/boardQnA/boardQnAList.jsp" method="post" id="searchForm">
						<input type="date" name="beginDate">����<input type="date" name="endDate">����
						<select name="sk">
							<option value="boardqna_category">ī�װ�</option>
							<option value="boardqna_no">�۹�ȣ</option>
							<option value="boardqna_title">������</option>
							<option value="member_id">�۾���</option>
						</select>
						<input type="text" name="sv">
						<button type="button" id="searchButton">�˻�</button>
					</form>
				</div>
				<table class="clear">
					<tr>
						<th>ī�װ�</th><th>�� ��ȣ</th><th>�� ����</th><th>�۾���</th><th>�ۼ���¥</th><th>��ȸ��</th>
					</tr>
<%
	request.setCharacterEncoding("EUC-KR");
	
	String sk = (request.getParameter("sk")!=null)?request.getParameter("sk"):"";
	String sv = (request.getParameter("sv")!= null && !request.getParameter("sv").equals(""))?("%"+request.getParameter("sv")+"%"):"";
	System.out.println(sk+"<--sk");
	System.out.println(sv+"<--sv");
	String beginDate = (request.getParameter("beginDate")!=null)?request.getParameter("beginDate"):"";
	String endDate = (request.getParameter("endDate")!=null)?request.getParameter("endDate"):"";
	System.out.println(beginDate+"<--beginDate");
	System.out.println(endDate+"<--endDate");
	
	BoardQnADao boardQnADao = new BoardQnADao();
	BoardQnA boardQnA = new BoardQnA();
	ArrayList<BoardQnA> boardQnAList = new ArrayList<>();
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int pagePerRow = 10;
	if(request.getParameter("pagePerRow") != null){
		pagePerRow = Integer.parseInt(request.getParameter("pagePerRow"));
	}
	System.out.println(pagePerRow+"<--pagePerRow");
	int lastPage = boardQnADao.countBoardQnA(pagePerRow);
	boardQnAList = boardQnADao.selectBoardQnASearch(beginDate, endDate, sk, sv, currentPage, pagePerRow);
	for(int i=0; i<boardQnAList.size(); i++){
		boardQnA = boardQnAList.get(i);
%>
					<tr>
						<td><%=boardQnA.getBoardQnACategory() %></td>
						<td><%=boardQnA.getBoardQnANumber() %></td>
						<td><a href="<%=request.getContextPath() %>/boardQnA/boardQnAView.jsp?boardQnANumber=<%=boardQnA.getBoardQnANumber() %>"><%=boardQnA.getBoardQnAtitle() %></a></td>
						<td><%=boardQnA.getMemberId() %></td>
						<td><%=boardQnA.getBoardQnADate() %></td>
						<td><%=boardQnA.getBoardQnAhits() %></td>
					</tr>
<%		
	}
 %>			
				</table>
				<div id="page">	
<%
	if(currentPage !=0 && currentPage != 1){
%>
					<a href="<%=request.getContextPath() %>/boardQnA/boardQnAList.jsp?currentPage=<%=currentPage-1 %>">����</a>
<%
	}for(int p=1; p<=lastPage; p++){
%>		
					<a href="<%=request.getContextPath() %>/boardQnA/boardQnAList.jsp?currentPage=<%=p%>"><%=p%></a>
<%		
	}if(currentPage < lastPage){
%>	
					<a href="<%=request.getContextPath() %>/boardQnA/boardQnAList.jsp?currentPage=<%=currentPage+1 %>">����</a>
<%
	}
%>				
				</div>
				<div id="list"><a href="<%=request.getContextPath() %>/boardQnA/boardQnAList.jsp">���</a></div>
<%
	if(sessionId != null){
%>		
				<div id="write"><a href="<%=request.getContextPath() %>/boardQnA/boardQnAWriteForm.jsp">�۾���&nbsp;&nbsp;&nbsp;</a></div>
<%		
	}
%>		
			</div>
		<%@include file="/module/footer.jsp" %>
		</div>
	</body>
</html>