<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>다음과 같은 에러 발생</p>
	<%=exception.getMessage()%>
</body>
</html>

<%--
	try {
		예외가 발생할 수 있는 코드
	} catch {
		예외가 발생하면 실행되는 코드
		err.
		err.
	}
--%>