<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키</title>
</head>
<body>
	<h1>쿠키 읽어오기</h1>
	<%
		//쿠키를 가져오기
		Cookie[] cookies = request.getCookies();
		
		//반복하여 꺼내기
		for (int i=0; i<cookies.length; i++) {
			out.println(cookies[i].getName()+" : "+cookies[i].getValue()+"<br>");
		}
	%>
</body>
</html>