<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String subject = "JSP!!";
	%>
	<h1>hello <%out.println(subject);%></h1>
	<hr>
	<%!
		int num1 = 10;
		int num2 = 20;
		int result = num1 + num2;
	%>
	<%!
		String name = "홍길동"; //<%!로 선언가능
	%>
	
	<%
		out.println("이름 : " + name + "<br>");
	%>
	
	<%=
		num1 + " + " + num2 + " = " + result
	%>
</body>
</html>