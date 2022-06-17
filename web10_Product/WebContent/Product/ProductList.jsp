<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
<link type="text/css" rel="stylesheet" href="Style/ProductCss.css">
</head>
<body>
	<div id="wrap" align="center">
	<h1>상품 리스트 : 관리자 페이지</h1>
	<table class="lset">
		<tr>
			<th>번호</th>
			<th>코드</th>
			<th>상품</th>
			<th>가격</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${list}" var="product" varStatus="p">
			<tr>
				<td>${p.count}</td>
				<td>${product.code}</td>
				<td>${product.name}</td>
				<td><fmt:formatNumber value="${product.price}" type="currency"/></td>
				<td><a href="PU?code=${product.code}">상품 수정</a></td>
				<td><a href="PD?code=${product.code}&pic=${product.pictureurl}">상품 삭제</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5" style="border:white; text-align:right;">
				<button onclick="location.href='PW'">상품 등록</button>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>