<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 등록</title>
</head>
<body>
	<h1>영화 등록</h1>
	<form action="AM" method="POST">
		코드 : <input type="number" name="code" value="0"><br>
		영화 제목 : <input type="text" name="mname"><br>
		감독: <input type="text" name="director"><br>
		주인공 : <input type="text" name="main"><br>
		가격 : <input type="number" name="price" value="0"><br>
		<input type="submit" value="영화 등록">
		<input type="button" value="뒤로가기" onclick="location.href='index.jsp'">
	</form>
</body>
</html>