<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키 삭제</h3>
	<%
		Cookie a = new Cookie("name", "고길동"); //이름이 같은 쿠키를 덮어쓰기
		a.setMaxAge(0); //유지할 기간을 0으로 함으로써, 쿠키를 삭제
		
		//클라이언트에게 쿠키를 전송
		response.addCookie(a);
	%>
</body>
</html>