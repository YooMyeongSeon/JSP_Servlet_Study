<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="Ex_04_TestLogin.jsp" method="POST">
		아이디 : <input type="text" name="userId"><br>
		비밀번호 : <input type="password" name="userPw"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>