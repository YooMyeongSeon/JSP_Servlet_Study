<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>POST 전송시 한글 깨짐</h3>
	<form action="EX_20_Result.jsp" method="POST">
		이름 : <input type="text" name="name">
		<input type="submit" value="입력">
	</form>
	<h3>POST 전송시 한글 깨짐 방지</h3>
	<form action="EX_20_Result2.jsp" method="POST">
		이름 : <input type="text" name="name">
		<input type="submit" value="입력">
	</form>
	<h3>POST 전송시 한글 깨짐 방지(fmt를이용한 방법)</h3>
	<form action="EX_20_Result3.jsp" method="POST">
		이름 : <input type="text" name="name">
		<input type="submit" value="입력">
	</form>
</body>
</html>