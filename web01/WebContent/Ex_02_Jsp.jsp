<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹 애플리케이션 작성</title>
</head>
<body>
	<% //스크립트릿 태그
		int num1 = 10;
		int num2 = 20;
		int result = num1 + num2;
	%>
	<p><%=num1%> + <%=num2%> = <%=result%></p>
</body>
</html>