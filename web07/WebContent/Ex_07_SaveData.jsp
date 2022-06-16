<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 접근</title>
</head>
<body>
	<h1>El표기법의 내장 객체 생략</h1>
	<%-- 각 내장 객체에 데이터 저장 --%>
	<%
		pageContext.setAttribute("name1", "페이지");
		request.setAttribute("name2", "리퀘스트");
		session.setAttribute("name3", "세션");
		application.setAttribute("name4", "어플리케이션");
	%>
	
	<%-- El표기법으로 내장 객체에 저장된 데이터 출력 --%>
	page 속성 : ${ pageScope.name1 }<br>
	request 속성 : ${ requestScope.name2 }<br>
	session 속성 : ${ sessionScope.name3 }<br>
	application 속성 : ${ applicationScope.name4 }
	<hr>
	
	<%-- 객체 이름이 같으면 가장 작은 단위의 객체부터 출력 --%>
	page 속성 : ${ name1 }<br>
	request 속성 : ${ name2 }<br>
	session 속성 : ${ name3 }<br>
	application 속성 : ${ name4 }<br>
</body>
</html>