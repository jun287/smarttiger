<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>개발자 커뮤니티</title>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css"/>
		<style>
			* {
				margin:0;
				padding:0;
			}
			ul {
				list-style-type:none; /* ul태그의 목록을 쓰지 않습니다. */
			}
			
			h3 { /* h3태그의 여백을 설정합니다. */
				margin:20px 0 0 50px;
			}
			
			body { 
				font-family:"맑은 고딕","돋움";
				font-size:12px;
				color:#444444;
			}
			
			#mem_form { /* id : mem_form 에 크기 여백 글자체 글자크기 글자색 등을 설정합니다.  */
				width:500px;
				margin:10px 0 0 50px;
				font-family:"돋움";
				font-size:12px;
				color:#444444;
				padding-top:5px;
				padding-bottom:10px;
				border-top:solid 1px #cccccc;
				border-bottom:solid 1px #cccccc;
			}
			
			.cols li { /* cols 클래스에 li태그의 라인블록 표시 윗여백을 줍니다.  */
				display:inline-block;
				margin-top:5px;
			}
			
			.cols li.col1 { /* cols 클래스에 li.col1 태그의 크기를 100px 글자정렬을 오른쪽으로합니다.  */
				width:100px;
				text-align:right;
			}
			
			.cols li.col2 { /* cols 클래스에 li.col2 태그의 크기를 350px로 합니다. */
				width:350px;
			}
			
			.cols li.col2 input.hp { /* cols 클래스에 li.col2중 input 클래스 hp의 크기를 35px로 합니다. */
				width:35px;
			}
			#jb-container {
				width: 1200px;
				margin: 0px auto;
				padding: 20px;
				border: 1px solid #bcbcbc;
			}
			
			#jb-header {
				padding: 20px;
				margin-bottom: 20px;
				border: 1px solid #bcbcbc;
			}
			
			#jb-content {
				width: 800px;
				padding: 20px;
				margin-bottom: 20px;
				float: left;
				border: 1px solid #bcbcbc;
			}
			
			#jb-sidebar {
				width: 300px;
				padding: 20px;
				margin-bottom: 20px;
				float: right;
				border: 1px solid #bcbcbc;
			}
			
			#jb-footer {
				clear: both;
				padding: 20px;
				border: 1px solid #bcbcbc;
			}
			
			#jb ul {
				list-style-type: none;
			}
			
			#jb li {
				display: inline-block;
				margin: 12px 30px 0 50px;
				font-size: 13px;
			}			
		</style>
	</head>
	<body>	
		<div id="jb-container">
			<%@ include file="/module/header.jsp"%>

			<%@ include file="/module/sidebar.jsp" %>

			<%@ include file="/module/footer.jsp" %>
		</div>
	</body>
</html>