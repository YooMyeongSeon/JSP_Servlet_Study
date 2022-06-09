<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String bgColor = request.getParameter("bgcolor");

	if (bgColor.equals("red")) {
		%>
		<body style="background-color:red">
		<%
	} else if (bgColor.equals("blue")) {
		%>
		<body style="background-color:blue">
		<%
	} else {
		%>
		<body style="background-color:green">
		<%
	}
%>
<a href="Ex_06_SelectColor.jsp">선택 화면으로 돌아가기</a>
</body>
</body>
</html>