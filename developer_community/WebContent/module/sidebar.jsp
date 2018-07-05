<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>개발자 커뮤니티</title>
		<style>
			* {
				margin:0;
				padding:0;
			}
			
			ul {
				list-style-type:none;
			}
			
			body { 
				font-family:"맑은 고딕","돋움";
				font-size:12px;
				color:#444444;
			}
			
			#login_box {
				width:220px;
				height:120px;
				border:solid 1px #bbbbbb;
				border-radius:15px;
				margin:10px 0 0 10px;
				padding:10px 0 0 15px;
			}
			
			h2 {
				font-family:"Arial";
				margin-bottom:10px;
			}
			
			#login_box input {
				width:100px;
				height:18px;
			}
			
			#id_pass, #login_btn {
				display:inline-block;
				vertical-align:top;
			}
			
			#id_pass span{
				display:inline-block;
				width:20px;
			}
			
			#pass {
				margin-top:3px;
			}
			
			#login_btn button {
				margin-left:5px;
				padding:12px;
				border-radius:5px;		
			}
					
			#btns {
				margin:12px 0 0 0;
				text-decoration:underline;
			}		
			
			#btns li {
				margin-left:10px;
				display:inline;
			}

			#jb-sidebar {
				width: 300px;
				padding: 20px;
				margin-bottom: 20px;
				float: right;
				border: 1px solid #bcbcbc;
			}

		</style>
	</head>
	
	<body>
	<%
		request.setCharacterEncoding("EUC-KR");
		String sessionId = (String)session.getAttribute("sessionId");
		String sessionLevel = (String)session.getAttribute("sessionLevel");
		String sessionName = (String)session.getAttribute("sessionName");
		System.out.println(sessionName + "<-- sessionName");
		System.out.println(sessionLevel + "<-- sessionLevel");
	%>
		<div id="jb-sidebar">
			<%
				if(sessionId == null){
			%>
					<form method="post" action="<%=request.getContextPath() %>/login/loginPro.jsp">
						<div id="login_box">
							<h2>Member Login</h2>
							<ul id="input_button">
								<li id="id_pass">
									<ul>
										<li>
											<span>ID</span>
											<input type="text" name="id">
										</li> <!-- id -->
										<li id="pass">
											<span>PW</span>
											<input type="password" name="pw">
										</li> <!-- pw  -->
									</ul>
								</li> 
								<li id="login_btn">
									<button>로그인</button>				
								</li>
							</ul>
							<ul id="btns">
								<li><a href ="<%=request.getContextPath() %>/join/joinForm.jsp">회원가입</a></li>
							</ul>
						</div> <!-- login_box -->
					</form>
			<%
				}else{
			%>
					<div id="login_box">
						<h2>Member Login</h2>
						<ul id="input_button">
							<li id="id_pass">
								<ul>
									<li>
										<a href="<%=request.getContextPath() %>/memberInformation/memberInformation.jsp"><%=sessionName%></a>님 <%=sessionLevel%>로 로그인
									</li> 
								</ul>
								<br><br><a href="<%=request.getContextPath() %>/login/logOut.jsp">로그아웃</a>
							</li> 
						</ul>
					</div>
			<%
				} 
			%>
				
		</div>
	</body>
</html>