<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 발생시 이동 페이지</title>
</head>
<body> 
	<h1>다음과 같은 에러 발생</h1>
	<%= exception.getMessage() %> <%-- 에러의 종류 출력 --%>
</body>
</html>