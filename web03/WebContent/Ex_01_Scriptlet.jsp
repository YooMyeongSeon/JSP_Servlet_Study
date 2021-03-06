<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%-- 지시자 태그 : 페이지의 속성을 지정 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트릿 태그의 종류</title>
</head>
<body>
	<%
		//기본 스크립트릿 태그 : 자바 코드를 기술
		String subject = "JSP";
	%>
	<h1>hello <% out.println(subject); %></h1>
	<hr>
	
	<%!
		//선언 태그 : 변수와 메서드를 선언
		int num1 = 10;
		int num2 = 20;
		int result = num1 + num2;
	%>
	<%=
		//표현, 출력식 태그 : 계산식, 메서드를 호출한 결과를 문자열 형태로 출력
		num1 + " + " + num2 + " = " + result
	%>
	<%-- 주석 태그 --%>
</body>
</html>