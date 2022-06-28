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
			<c:forEach items="${list}" var="member">
				<tr>
					<td>${member.m_No}</td>
					<td>${member.m_Name}</td>
					<td>${member.p_Name}</td>
					<td>
						<c:if test="${member.p_School == 1}">고졸</c:if>
						<c:if test="${member.p_School == 2}">학사</c:if>
						<c:if test="${member.p_School == 3}">석사</c:if>
						<c:if test="${member.p_School == 4}">박사</c:if>
					</td>
					<td>
						${fn:substring(member.m_Jumin,0,6)}-${fn:substring(member.m_Jumin,6,13)}
					</td>
					<td>${member.m_City}</td>
					<td>
						<fmt:formatNumber value="${member.p_Tel1}" pattern="00"/>-${member.p_Tel2}-<fmt:formatNumber value="${member.p_Tel3}" pattern="0000"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</section>
	<jsp:include page="/Footer.html"/>
</body>
</html>