<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한글 깨짐 방지</title>
</head>
<body>
	<h1>POST 한글 깨짐 방지</h1>
	<% request.setCharacterEncoding("UTF-8"); %>
	이름 : <%= request.getParameter("name") %>
</body>
</html>