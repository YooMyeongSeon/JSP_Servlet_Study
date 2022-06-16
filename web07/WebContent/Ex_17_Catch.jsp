<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL의 예외처리</title>
</head>
<body>
	<h1>자바의 예외처리 코드</h1>
	<%
		try {
			out.println("예외 발생 전");
			int num = 1/0;
			out.println("예외 발생 후"); //표시되지 않음
		} catch(Exception err) {
			out.println("<br>");
			err.printStackTrace();
			out.println("예외 코드 : "+err.getMessage());
		}
	%>
	
	<h1>JSTL로 예외 처리</h1>
	<c:catch var="err">
		예외 발생 전<br>
		<%= 1/0 %><br>
		예외 발생 후<br>
	</c:catch>
	예외 코드 : ${ err }
</body>
</html>