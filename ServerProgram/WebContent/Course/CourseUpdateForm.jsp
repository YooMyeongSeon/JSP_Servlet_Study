<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교과목 관리 사이트</title>
<link type="text/css" rel="stylesheet" href="CSS/Style.css">
<style>
	table {
		margin: 0 auto;
		width: 600px;
		margin-bottom: 10px;
	}
	th {
		width: 200px;
	}
	td {
		width: 400px;
	}
	.input {
		width: 380px;
		outline: none;
		border: none;
	}
	select {
		float: left;
	}
	#week {
		float: left;
	}
</style>
</head>
<body>
	<div>
		<h1>교과목 관리 사이트</h1>
		<h3>교과목 수정</h3>
		<form action="CS" method="post">
			<input type="hidden" name="command" value="courseUpdateAction">
			<input type="hidden" name="oldId" value="${cVo.id}">
			<table>
				<tr>
					<th>과목 코드</th>
					<td><input class="input" type="number" name="id" required value="${cVo.id}"></td>
				</tr>
				<tr>
					<th>과목 명</th>
					<td><input class="input" type="text" name="name" required value="${cVo.name}"></td>
				</tr>
				<tr>
					<th>담당 강사</th>
					<td>
						<select name="lecturer">
							<c:forEach items="${lecturerList}" var="lecturer">
								<c:choose>
									<c:when test="${lecturer.idx == cVo.lecturer}"><option value="${lecturer.idx}" selected>${lecturer.name}</option></c:when>
									<c:otherwise><option value="${lecturer.idx}">${lecturer.name}</option></c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>학점</th>
					<td><input class="input" type="number" name="credit" value="${cVo.credit}" required></td>
				</tr>
				<tr>
					<th>강의 요일</th>
					<td>
						<span id="week">
							<c:choose>
								<c:when test="${cVo.week eq '월요일'}"><input type="radio" name="week" value="1" checked>월　</c:when>
								<c:otherwise><input type="radio" name="week" value="1">월　</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${cVo.week eq '화요일'}"><input type="radio" name="week" value="2" checked>화　</c:when>
								<c:otherwise><input type="radio" name="week" value="2">화　</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${cVo.week eq '수요일'}"><input type="radio" name="week" value="3" checked>수　</c:when>
								<c:otherwise><input type="radio" name="week" value="3">수　</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${cVo.week eq '목요일'}"><input type="radio" name="week" value="4" checked>목　</c:when>
								<c:otherwise><input type="radio" name="week" value="4">목　</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${cVo.week eq '금요일'}"><input type="radio" name="week" value="5" checked>금　</c:when>
								<c:otherwise><input type="radio" name="week" value="5">금　</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${cVo.week eq '토요일'}"><input type="radio" name="week" value="6" checked>토</c:when>
								<c:otherwise><input type="radio" name="week" value="6">토</c:otherwise>
							</c:choose>
						</span>
					</td>
				</tr>
				<tr>
					<th>시작 시간</th>
					<td><input class="input" type="number" name="start_hour" value="${cVo.start_hour}" required></td>
				</tr>
				<tr>
					<th>종료 시간</th>
					<td><input class="input" type="number" name="end_hour" value="${cVo.end_hour}" required></td>
				</tr>
			</table>
			<input type="submit" value="수정">
			<button onclick="location.href='CS?command=courseViewAction&id=${cVo.id}'">취소</button>
		</form>
		<p>Copyright(c) 2022 그린 아카데미 All right Reserved</p>
	</div>
</body>
</html>