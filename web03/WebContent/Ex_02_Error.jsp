<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="Ex_02_ErrorPage.jsp"%> <%-- 에러 발생시 이동 경로 지정 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 유발 페이지</title>
</head>
<body>
	<h1>에러 유발 페이지</h1>
	<%-- 강제로 자바의 예외를 발생(2를 0으로 나누는 것은 불가능) --%>
	<%= 2/0 %>
</body>
</html>