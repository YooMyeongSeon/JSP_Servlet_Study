<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 : Forward</title>
</head>
<body>
	<h1>액션 태그 Forward 예제</h1>
	
	<jsp:forward page="Ex_07_TargetPage.jsp">
		<jsp:param value='<%=URLEncoder.encode("홍길동", "UTF-8")%>' name="name"/>
	</jsp:forward>
	<%
		//request.setAttribute("name", "홍길동");
		//request.getRequestDispatcher("Ex_07_TargetPage.jsp").forward(request, response); 과 같은 기능의 태그
	%>
</body>
</html>