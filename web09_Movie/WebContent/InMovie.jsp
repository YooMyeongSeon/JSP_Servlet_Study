<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
</head>
<body>
	<h1>영화 상세 정보</h1>
	<%
		out.println(request.getParameter("mname"));
	%>
</body>
</html>