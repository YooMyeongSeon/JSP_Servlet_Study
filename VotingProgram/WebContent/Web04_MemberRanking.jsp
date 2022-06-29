<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구의원투표 프로그램</title>
<link type="text/css" rel="stylesheet" href="CSS/Style.css">
</head>
<body>
	<jsp:include page="/Header.html"/>
	<section id="contents">
		<h2>후보자등수</h2>
		<table>
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>총투표건수</th>
			</tr>
			<c:forEach items="${rankList}" var="rank"> <!-- 받아온 리스트 출력 -->
				<tr>
					<td>${rank.m_no}</td>
					<td>${rank.m_name}</td>
					<td>${rank.voteCount}</td>
				</tr>
			</c:forEach>
		</table>
	</section>
	<jsp:include page="/Footer.html"/>
</body>
</html>