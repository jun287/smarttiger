<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<style>
			form{
				border:solid 3px ;
				width: 900px;
				height: 500px;
			}
			textarea{
				margin: 0 0 0 30px;
				width:800px;
				height: 300px;
			}
		</style>
	</head>
	<body>
		<form action="./insertGoodsAction.jsp" method="post">
			<label>��ǰ�̸�:</label>&nbsp;:&nbsp;<input type="text" name="title"><br><br>
			<label>����:</label><input type="text" name="price"><br>
			<label>��ǰ����</label><br><br>
			<textarea name="comment"></textarea><br>
			<label>����÷��</label>&nbsp;:&nbsp;<input type="file" value="����÷��" name="attachment">
			<input type="submit" value="�Ϸ�">
		</form>
	</body>
</html>