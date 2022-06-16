<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 접근</title>
</head>
<body>
	<%-- 리퀘스트 내장 객체에 값을 저장 --%>
	<%
		request.setAttribute("num1", 10);
		request.setAttribute("num2", 20);
	%>
	
	<%-- 표현식에서의 합계 --%>
	<%= request.getAttribute("num1") %> + <%= request.getAttribute("num2") %> = <%= (Integer)request.getAttribute("num1") + (Integer)request.getAttribute("num2") %>
	<hr>
	
	<%-- El표기법에서의 합계 --%>
	${ requestScope.num1 } + ${ requestScope.num2 } = ${ requestScope.num1 + requestScope.num2 }
	<hr>
	
	<%-- 세션 내장 객체에 값을 저장 --%>
	<%
		session.setAttribute("num1", 10);
		session.setAttribute("num2", 20);
	%>
	
	<%-- 표현식에서의 합계 --%>
	<%= session.getAttribute("num1") %> + <%= session.getAttribute("num2") %> = <%= (Integer)session.getAttribute("num1") + (Integer)session.getAttribute("num2") %>
	<hr>
	
	<%-- El표기법에서의 합계 --%>
	${ sessionScope.num1 } + ${ sessionScope.num2 } = ${ sessionScope.num1 + sessionScope.num2 }
</body>
</html>