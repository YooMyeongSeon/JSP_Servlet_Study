<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>표현식에서의 연산</h1>
	<%-- 1. 표현식에서의 연산 --%>
	<% String str1 = request.getParameter("num1");
	int num1 = Integer.parseInt(str1);
	int num2 = Integer.parseInt(request.getParameter("num2")); %>
	<%=num1%> + <%=num2%> = <%=num1+num2%>
	<hr>
	
	<%-- 2. El표기에서의 연산 --%>
	${param.num1} + ${param.num2} = ${param.num1+param.num2}<br>
	<hr>
</body>
</html>