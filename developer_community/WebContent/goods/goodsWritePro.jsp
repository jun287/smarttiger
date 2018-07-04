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
			<label>상품이름:</label>&nbsp;:&nbsp;<input type="text" name="title"><br><br>
			<label>가격:</label><input type="text" name="price"><br>
			<label>상품정보</label><br><br>
			<textarea name="comment"></textarea><br>
			<label>사진첨부</label>&nbsp;:&nbsp;<input type="file" value="사진첨부" name="attachment">
			<input type="submit" value="완료">
		</form>
	</body>
</html>