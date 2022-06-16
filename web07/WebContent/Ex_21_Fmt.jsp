<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL : fmt</title>
</head>
<body>
	<h1>숫자 표기</h1>
	<fmt:formatNumber value="1234567.89" var="number"/>
	${number}<br> <!-- 1,234,567.89 -->
	<fmt:formatNumber value="1234567.89" groupingUsed="false"/><br> <!-- 1234567.89, 콤마를 삭제 -->
	<fmt:formatNumber value=".35" type="percent"/><br> <!-- 35% -->
	<fmt:formatNumber value="5000" type="currency"/><br> <!-- ₩5000 -->
	<fmt:formatNumber value="5000" type="currency" currencySymbol="¥"/> <!-- ¥5000 -->
	<hr>
	
	<h1>소수점 표시</h1>
	<fmt:formatNumber value="1234567.891234567" pattern="#,#00.0#"/><br> <!-- 1,234,567.89 -->
	<fmt:formatNumber value="1234567.8" pattern="#,#00.0#"/><br> <!-- 1,234,567.8 -->
	<fmt:formatNumber value="1234567.8" pattern="#,#00.000"/><br> <!-- 1,234,567.800 -->
	<fmt:formatNumber value="12.8" pattern="0,000,000.000"/><br> <!-- 0,000,012.800, 0은 없다면 0으로 표시, #은 없다면 표시하지 않음 -->
	<hr>
	
	<h1>날짜 표시</h1>
	<c:set var="now" value="<%= new java.util.Date() %>"/>
	<fmt:formatDate value="${now}"/><br> <!-- 2022. 6. 10(type="date") -->
	<fmt:formatDate value="${now}" type="time"/><br> <!-- 오후 4:36:45 -->
	<fmt:formatDate value="${now}" type="both"/><br> <!-- 2022. 6. 10 오후 4:36:45 -->
	<fmt:formatDate value="${now}" pattern="yyy년  MM월 dd일 hh시 mm분 ss초" /><br> <!-- 2022년 6월 10일 오후 4시 36분 45초 -->
	<hr>
	
	<h1>국가 코드를 변경하여 날짜 표시</h1>
	<fmt:timeZone value="GMT">
		GMT : <fmt:formatDate value="${now}" type="both"/><br>
	</fmt:timeZone>
	<fmt:timeZone value="GMT-8">
		GMT-8 : <fmt:formatDate value="${now}" type="both"/><br>
	</fmt:timeZone>
	<hr>
	
	톰캣 서버의 기본 로케일 : <%= response.getLocale() %><br>
	
	<fmt:setLocale value="zh_CN"/>
	로케일을 중국으로 설정한 후 로케일 확인 : <%= response.getLocale() %><br>
	통화 : <fmt:formatNumber value="10000" type="currency"/><br>
	날짜 : <fmt:formatDate value="${now}" type="both"/><br>
	
	<fmt:setLocale value="ja_JP"/>
	로케일을 일본으로 설정한 후 로케일 확인 : <%= response.getLocale() %><br>
	통화 : <fmt:formatNumber value="10000" type="currency"/><br>
	날짜 : <fmt:formatDate value="${now}" type="both"/><br>
	
	<fmt:setLocale value="en_US"/>
	로케일을 미국으로 설정한 후 로케일 확인 : <%= response.getLocale() %><br>
	통화 : <fmt:formatNumber value="10000" type="currency"/><br>
	날짜 : <fmt:formatDate value="${now}" type="both"/>
</body>
</html>