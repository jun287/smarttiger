<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>������ Ŀ�´�Ƽ</title>
		<style>
			* {
				margin:0;  /* ������ 0���� �մϴ�. */
				padding:0;
			}
			
			ul {
				list-style-type:none; /* ul�±��� ����� ���� �ʽ��ϴ�. */
			}
			
			h3 { /* h3�±��� ������ �����մϴ�. */
				margin:20px 0 0 50px;
			}
			
			#mem_form { /* id : mem_form �� ũ�� ���� ����ü ����ũ�� ���ڻ� ���� �����մϴ�.  */
				width:500px;
				margin:10px 0 0 50px;
				font-family:"����";
				font-size:12px;
				color:#444444;
				padding-top:5px;
				padding-bottom:10px;
				border-top:solid 1px #cccccc;
				border-bottom:solid 1px #cccccc;
			}
			
			.cols li { /* cols Ŭ������ li�±��� ���κ�� ǥ�� �������� �ݴϴ�.  */
				display:inline-block;
				margin-top:5px;
			}
			
			.cols li.col1 { /* cols Ŭ������ li.col1 �±��� ũ�⸦ 100px ���������� �����������մϴ�.  */
				width:100px;
				text-align:right;
			}
			
			.cols li.col2 { /* cols Ŭ������ li.col2 �±��� ũ�⸦ 350px�� �մϴ�. */
				width:350px;
			}
			
			.cols li.col2 input.hp { /* cols Ŭ������ li.col2�� input Ŭ���� hp�� ũ�⸦ 35px�� �մϴ�. */
				width:35px;
			}
			
			#intro {
				vertical-align:top; 
			}
		</style>
	</head>
	<body>
		<h3>���� ���</h3>  <!-- ȸ������ ������� ȸ�������� �޽��ϴ�.  -->
		<form method="post" action="./joinPro.jsp">
			<ul id="mem_form">
				<li>
					<ul class="cols">
						<li class="col1">���̵� :</li> <!-- ���̵� text �ڽ� "id"�� �޽��ϴ�. -->
						<li class="col2"><input type="text" name="id"></li>
					</ul>
				</li>
				<li>
					<ul class="cols">
						<li class="col1">��й�ȣ :</li> <!-- ��й�ȣ password �ڽ� "pw"�� �޽��ϴ�.  -->
						<li class="col2"><input type="password" name="pw"></li>
					</ul>
				</li>
				<li>
					<ul class="cols">
						<li class="col1">�̸� :</li> <!-- �̸��� text �ڽ� "name"�� �޽��ϴ�. -->
						<li class="col2"><input type="text" name="name"></li>
					</ul>
				</li>
				<li>
					<ul class="cols">
						<li class="col1">�޴���ȭ :</li> <!--�޴���ȭ��ȣ�� text �ڽ��� select �� �޽��ϴ�.   -->
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
						<li class="col1">�̸��� :</li> <!-- �̸����� select �� text�ڽ��� �޽��ϴ�. -->
						<li class="col2"><input id="email1" type="text" name="email1">@
							<select id="email2" name="email2">
								<option>����</option>
								<option>naver.com</option>
								<option>hanmail.net</option>
								<option>gmail.com</option>
							</select>
						</li>
					</ul>
				</li>
				<li>
					<ul class="cols"> <!--������ ���� ����� submit�� �����մϴ�(action����).  -->
						<li class="col1"></li>
						<li class="col2">
							<input type="submit" value="ȸ������">	
						</li>
					</ul>
				</li>
			</ul>
		</form>
	</body>
</html>