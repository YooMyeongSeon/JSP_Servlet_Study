<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request 내장 객체</title>
</head>
<body>
	1. 컨텍스트 패스(JSP페이지가 속한 웹 애플리케이션의 컨텍스트 패스) : <%=request.getContextPath()%><br>
	2. 요청 방식 : <%=request.getMethod()%> <br>
	3. 요청한 URL : <%=request.getRequestURL()%><br>
	4. 요청한 URI(요청 URL에서 쿼리 스트링 부분을 제외한 부분) : <%=request.getRequestURI()%><br>
	5. 서버 이름 : <%=request.getServerName()%><br>
	6. 프로토콜 이름 : <%=request.getProtocol()%><br>
</body>
</html>