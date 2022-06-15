<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키</title>
</head>
<body>
	<h1>쿠키 삭제</h1>
	<%
		Cookie cookieA = new Cookie("name", "고길동"); //이름이 같은 쿠키를 덮어쓰기
		cookieA.setMaxAge(0); //유지할 기간을 0으로 함으로써, 쿠키를 삭제
		
		//클라이언트에게 쿠키를 전송
		response.addCookie(cookieA);
	%>
</body>
</html>