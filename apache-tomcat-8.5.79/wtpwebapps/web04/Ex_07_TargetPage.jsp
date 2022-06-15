<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 : Forward</title>
</head>
<body>
	<h1>Forward로 이동된 페이지</h1>
	<%
		String name = URLDecoder.decode(request.getParameter("name"), "UTF-8");
		//String name = request.getAttribute("name"); 과 같은 기능의 태그
	%>
	<p><%=name%>님, 환영합니다!</p>
</body>
</html>