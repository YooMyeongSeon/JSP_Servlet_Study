<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<%-- 표현식에서의 문자열 비교 --%>
	== 연산자 사용 결과 : <%= request.getParameter("name") == "홍길동" %><br>
	equals() 메서드 사용 결과 : <%= request.getParameter("name").equals("홍길동") %>
	<hr>
	<%-- El표기법에서의 문자열 비교 --%>
	== 연산자 사용 결과 : ${ param.name=="홍길동" }<br>
	<hr>
</body>
</html>