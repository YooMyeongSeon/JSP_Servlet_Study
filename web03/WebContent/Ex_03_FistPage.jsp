<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 지시자</title>
</head>
<body>
	<h1>퍼스트 페이지 입니다.</h1>
	<a href="./Ex_03_SecondPage.jsp">세컨드 페이지로 이동합니다.</a><br>
	<%@ include file="./Footer/Footer.jsp"%>
</body>
</html>