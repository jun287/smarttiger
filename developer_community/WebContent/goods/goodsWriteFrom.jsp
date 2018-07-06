<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<style>
			form{
				
				padding:1px 1px 1px 1px;
				width: 850px;
				height: 500px;
				
			}
			textarea{
				margin: 0 0 0 0;
				width:800px;
				height: 300px;
			}
			#info{
				padding:15px 5px 5px 15px;
				border: 1px dotted #000000;
			}
			#button{
				margin-top:10px;
				float: right;
			}
		</style>
	</head>
	<body>
		<div id="jb-container">
			<%@ include file="/module/header.jsp"%>
			<div id="jb-content2">
				<form action="./goodsWritePro.jsp" method="post">
					<div id="info">
						<label id="name">��ǰ�̸�:</label>&nbsp;&nbsp;<input type="text" name="goods_title"><br><br>
						<label id="name">��ǰ����:</label>&nbsp;&nbsp;<input type="text" name="goods_price"><br><br>
						<label id="name">��ǰ����</label><br><br>
						<textarea name="goods_info"></textarea><br>
						<label>����÷��</label>&nbsp;:&nbsp;<input type="file" value="����÷��" name="goods_img">
					</div>
					<div id="button">
						<input type="submit" value="�Ϸ�">
					</div>
				</form>
			</div>
			<%@ include file="/module/footer.jsp" %>
		</div>
	</body>
</html>