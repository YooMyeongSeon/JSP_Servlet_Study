<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체의 영역</title>
</head>
<body>
	하나의 페이지 속성 : <%=pageContext.getAttribute("name")%><br>
	하나의 리퀘스트 속성 : <%=request.getAttribute("name")%><br>
	하나의 세션 속성 : <%=session.getAttribute("name")%><br>
	하나의 애플리케이션 속성 : <%=application.getAttribute("name")%><br>
	
	<a href="Ex_05_ThirdPage.jsp">세번째 페이지로 이동</a>
</body>
</html>