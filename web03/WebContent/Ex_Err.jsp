<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>에러 유발 페이지</h3>
	<%--강제로 자바의 예외를 발생(2를 0으로 나누는 것은 불가능)--%>
	<%=2/0%>
</body>
</html>