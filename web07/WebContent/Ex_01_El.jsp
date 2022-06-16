<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>El 표기법</title>
</head>
<body>
	<%-- 자바의 데이터를 HTML문서로 출력하는 방법 --%>
	<%
		String str = "안녕하세요";
		request.setAttribute("str", str);
	%>
	
	<%-- 1. 스크립트릿으로 출력 --%>
	<% out.println(str); %>
	
	<%-- 2. 표현식으로 출력 --%>
	<%= str %>
	
	<%-- 3. El표기법으로 출력 --%>
	${str}
</body>
</html>