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
			<div id="jb-content">
				<h3>가입 양식</h3>  <!-- 회원가입 양식으로 회원정보를 받습니다.  -->
				<form method="post" action="./joinPro.jsp">
					<ul id="mem_form">
						<li>
							<ul class="cols">
								<li class="col1">아이디 :</li> <!-- 아이디를 text 박스 "id"로 받습니다. -->
								<li class="col2" ><input type="text" name="id"></li>
							</ul>
						</li>
						<li>
							<ul class="cols">
								<li class="col1">비밀번호 :</li> <!-- 비밀번호 password 박스 "pw"로 받습니다.  -->
								<li class="col2"><input type="password" name="pw"></li>
							</ul>
						</li>
						<li>
							<ul class="cols">
								<li class="col1">이름 :</li> <!-- 이름을 text 박스 "name"로 받습니다. -->
								<li class="col2"><input type="text" name="name"></li>
							</ul>
						</li>
						<li>
							<ul class="cols">
								<li class="col1">휴대전화 :</li> <!--휴대전화번호를 text 박스와 select 로 받습니다.   -->
								<li class="col2">
									<select name="phone1">
										<option>010</option>
										<option>011</option>
										<option>017</option>
									</select> -
									<input class="hp" type="text" name="phone2"> - <input class="hp" type="text" name="phone3">
								</li>
							</ul>
						</li>
						<li>
							<ul class="cols">
								<li class="col1">이메일 :</li> <!-- 이메일을 select 와 text박스로 받습니다. -->
								<li class="col2"><input id="email1" type="text" name="email1">@
									<select id="email2" name="email2">
										<option>선택</option>
										<option>naver.com</option>
										<option>hanmail.net</option>
										<option>gmail.com</option>
									</select>
								</li>
							</ul>
						</li>
						<li>
							<ul class="cols"> <!--위에서 받은 양식을 submit로 제출합니다(action으로).  -->
								<li class="col1"></li>
								<li class="col2">
									<input type="submit" value="회원가입">	
								</li>
							</ul>
						</li>
					</ul>
				</form>
			</div>
			
			<%@ include file="/module/sidebar.jsp" %>

			<%@ include file="/module/footer.jsp" %>

		</div>
	</body>
</html>