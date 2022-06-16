<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>El의 자바빈 접근</title>
</head>
<body>
	<h1>리퀘스트에 저장된 자바빈에서 프로퍼티 출력</h1>
	아이디 : ${ requestScope.member.userId }<br>
	비밀번호 : ${ member.userPw }<br>
	이름 : ${ member["userName"] }
</body>
</html>