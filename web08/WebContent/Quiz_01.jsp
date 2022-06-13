<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 1 : 회원 가입</title>
</head>
<body>
	<h1>문제 1 : 회원 가입</h1>
	<form action="Quiz_01_Result.jsp" method="POST">
		이름 : <input type="text" name="name"><br>
		아이디 : <input type="text" name="userId"><br>
		비밀번호 : <input type="password" name="userPw"><br>
		전화번호 : <input type="text" name="phone"><br>
		이메일 : <input type="text" name="email"><br>
		<input type="submit" value="회원 가입">
	</form>
</body>
</html>