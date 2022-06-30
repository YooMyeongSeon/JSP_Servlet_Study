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
			<c:forEach items="${list}" var="vote"> <!-- 받아온 리스트 출력 -->
				<tr>
					<td>${vote.v_Name}</td>
					<td>
						<c:if test="${fn:substring(vote.v_Jumin,6,7) < 3}"> <!-- 주민번호 뒷자리를 이용해 if문으로 조건별 2000대생, 1900년대생 구분 -->
							19${fn:substring(vote.v_Jumin,0,2)}년 ${fn:substring(vote.v_Jumin,2,4)}월 ${fn:substring(vote.v_Jumin,4,6)}일생 <!-- 함수를 이용하여 문자열을 잘라서 생년월일 표시 -->
						</c:if>
						<c:if test="${fn:substring(vote.v_Jumin,6,7) >= 3}">
							20${fn:substring(vote.v_Jumin,0,2)}년 ${fn:substring(vote.v_Jumin,2,4)}월 ${fn:substring(vote.v_Jumin,4,6)}일생 
						</c:if>
					</td>
					<td>
						<c:if test="${fn:substring(vote.v_Jumin,6,7) < 3}">
							만 ${2020 - (1900 + (fn:substring(vote.v_Jumin,0,2)))}살 <!-- 함수를 이용하여 문자열을 잘라서 나이 표시 -->
						</c:if>
						<c:if test="${fn:substring(vote.v_Jumin,6,7) >= 3}">
							만 ${2020 - (2000 + (fn:substring(vote.v_Jumin,0,2)))}살
						</c:if>
						
					</td>
					<td>
						<c:if test="${(fn:substring(vote.v_Jumin,6,7))%2 == 1}">남</c:if> <!-- 함수를 이용하여 문자열을 잘라 주민번호 뒷자리를 파악한 뒤 if문으로 조건별 성별 변경, 홀수는 남자, 짝수는 여자 -->
						<c:if test="${(fn:substring(vote.v_Jumin,6,7))%2 == 0}">여</c:if>
					</td>				
					<td>${vote.m_No}</td>
					<td>
						${fn:substring(vote.v_Time,0,2)}:${fn:substring(vote.v_Time,2,4)} <!-- 함수를 이용하여 문자열을 잘라서 투표시간 표시 -->
					</td>
					<td>
						<c:if test="${vote.v_Confirm == 'Y'}">확인</c:if> <!-- if문으로 조건별 유권자 확인 여부 변경 -->
						<c:if test="${vote.v_Confirm == 'N'}">미확인</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</section>
	<jsp:include page="/Footer.html"/>
</body>
</html>