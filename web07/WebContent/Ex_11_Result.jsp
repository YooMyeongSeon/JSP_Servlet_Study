<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>색상 선택</title>
</head>
<body>
	<h1>스크립트릿을 이용한 색상 출력</h1>
	<%
		String color = request.getParameter("color");
		if (color.equals("red")) {
			%><span style="color:red;">빨강</span><%
		} else if (color.equals("blue")) {
			%><span style="color:blue;">파랑</span><%
		} else {
			out.println("<span style=\"color:green;\">초록</span>");
		}
	%>
	
	<h1>JSTL을 이용한 색상 출력</h1>
	<c:if test='${ param.color == "red" }'>
		<span style="color:red;">빨강</span>
	</c:if>
	<c:if test='${ param.color == "blue" }'>
		<span style="color:blue;">파랑</span>
	</c:if>
	<c:if test='${ param.color == "green" }'>
		<span style="color:green;">초록</span>
	</c:if>
	
	<h1>c:choose를 이용한 색상 출력</h1>
	<c:choose>
		<c:when test="${ param.color == 'red' }"><span style="color:red;">빨강</span></c:when>
		<c:when test="${ param.color == 'blue' }"><span style="color:blue;">파랑</span></c:when>
		<c:when test="${ param.color == 'green' }"><span style="color:green;">초록</span></c:when>
		<c:otherwise><span style="color:yellow;">노랑</span></c:otherwise> <%-- 스위치문의 디폴트와 같은 기능 --%>
	</c:choose>
</body>
</html>