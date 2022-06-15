<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Oder.Coffee" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 주문 프로그램</title>
</head>
<body>
	<h1>카페 주문 프로그램</h1>
	<form action="Oder" method="POST">
		<select name="coffee">
			<option value="1">돌체 라떼</option>
			<option value="2">화이트 초콜릿 모카</option>
			<option value="3">카페 모카</option>
			<option value="4">카페 라떼</option>
			<option value="5">아메리카노</option>
			<option value="6">오늘의 커피</option>
			<option value="7">블론드 바닐라 더블샷 마키아또</option>
		</select>
		<select name="size">
			<option value="ts">톨</option>
			<option value="gs">그란데</option>
			<option value="vs">벤티</option>
		</select>
		<input type="number" name="ea">잔
		<input type="submit" value="선택">
	</form>
	<hr>
	<c:if test="${coffeeList != null}">
		<%	
			ArrayList<Coffee> coffeeList = (ArrayList<Coffee>)session.getAttribute("coffeeList");
			for (int i=0; i<coffeeList.size(); i++) {
				String cname = coffeeList.get(i).getCname();
				%>${cname}<%
			}
		%>
	</c:if>
</body>
</html>