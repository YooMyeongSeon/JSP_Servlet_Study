<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>홈페이지 입장에 성공하였습니다.</p>
	<%--<h1><%=URLDecoder.decode(request.getParameter("name"), "UTF-8")%>님 환영합니다.</h1>--%>
	<h1><%=request.getAttribute("name")%>님 환영합니다.</h1>
	<a href="Ex_04_LoginForm.jsp">로그아웃</a>
</body>
</html>