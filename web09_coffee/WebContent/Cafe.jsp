<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Oder.Coffee"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<option value="돌체 라떼">돌체 라떼</option>	
			<option value="화이트 초콜릿 모카">화이트 초콜릿 모카</option>
			<option value="카페 모카">카페 모카</option>
			<option value="카페 라떼">카페 라떼</option>
			<option value="아메리카노">아메리카노</option>
			<option value="오늘의 커피">오늘의 커피</option>
			<option value="블론드 바닐라 더블샷 마키아또">블론드 바닐라 더블샷 마키아또</option>
		</select>
		<select name="size">
			<option value="ts">톨</option>
			<option value="gs">그란데</option>
			<option value="vs">벤티</option>
		</select>
		<input type="number" name="ea" value="1" required>잔
		<input type="submit" value="선택">
	</form>
	<hr>
	<c:if test="${coffeeList != null}">
		커피 / 사이즈 / 가격 / 잔<br>
		<%	
			ArrayList<Coffee> coffeeList = (ArrayList<Coffee>)session.getAttribute("coffeeList");
			int add = 0;
			for (int i=0; i<coffeeList.size(); i++) {
				out.print(coffeeList.get(i).getCname() + " / ");
				out.print(coffeeList.get(i).getSize() + " / ");
				out.print(coffeeList.get(i).getPrice() + "원 / "); 
				out.print(coffeeList.get(i).getEa() + "잔<br>");
				add = add + coffeeList.get(i).getPrice();
			}
			out.println("<p>총합 : " + add + "원</p>");
		%>
		<form action="Reset" method="POST">
			<input type="submit" value="리셋">
		</form>
	</c:if>
</body>
</html>