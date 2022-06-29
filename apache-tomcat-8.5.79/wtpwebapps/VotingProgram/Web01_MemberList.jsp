<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<h2>후보조회</h2>
		<table>
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>소속정당</th>
				<th>학력</th>
				<th>주민번호</th>
				<th>지역구</th>
				<th>대표전화</th>
			</tr>
			<c:forEach items="${list}" var="member"> <!-- forEach로 받아온 리스트 출력 -->
				<tr>
					<td>${member.m_No}</td>
					<td>${member.m_Name}</td>
					<td>${member.p_Name}</td>
					<td>
						<c:if test="${member.p_School == 1}">고졸</c:if> <!-- if문으로 조건별 학력 변경 -->
						<c:if test="${member.p_School == 2}">학사</c:if>
						<c:if test="${member.p_School == 3}">석사</c:if>
						<c:if test="${member.p_School == 4}">박사</c:if>
					</td>
					<td>
						${fn:substring(member.m_Jumin,0,6)}-${fn:substring(member.m_Jumin,6,13)} <!-- 함수를 이용하여 문자열을 잘라서 주민번호 표시 -->
					</td>
					<td>${member.m_City}</td>
					<td>
						${member.p_Tel1}-${member.p_Tel2}-${member.p_Tel3} <!-- El표기법으로 차례대로 정렬 -->
					</td>
				</tr>
			</c:forEach>
		</table>
	</section>
	<jsp:include page="/Footer.html"/>
</body>
</html>