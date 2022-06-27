<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<h2>투표검수조회</h2>
		<table>
			<tr>
				<th>성명</th>
				<th>생년월일</th>
				<th>나이</th>
				<th>성별</th>
				<th>후보번호</th>
				<th>투표시간</th>
				<th>유권자확인</th>
			</tr>
			<c:forEach items="${list}" var="vote">
				<tr>
					<td>${vote.v_Name}</td>
					<td>
						19${fn:substring(vote.v_Jumin,0,2)}년 ${fn:substring(vote.v_Jumin,2,4)}월 ${fn:substring(vote.v_Jumin,4,6)}일생
					</td>
					<td></td>
					<td></td>				
					<td>${vote.m_No}</td>
					<td></td>
					<td>${vote.v_Confirm}</td>
				</tr>
			</c:forEach>
		</table>
	</section>
	<jsp:include page="/Footer.html"/>
</body>
</html>