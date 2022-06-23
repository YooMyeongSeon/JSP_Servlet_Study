<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		text-align: left;
	}
</style>
</head>
<body>
	<div>
		<h1>교과목 관리 사이트</h1>
		<h3>교과목 상세 보기</h3>
		<table>
			<tr>
				<th>과목 코드</th>
				<td>${cVo.id}</td>
			</tr>
			<tr>
				<th>과목 명</th>
				<td>${cVo.name}</td>
			</tr>
			<tr>
				<th>담당 강사</th>
				<td>${cVo.lecturerName}</td>
			</tr>
			<tr>
				<th>학점</th>
				<td>${cVo.credit} 학점</td>
			</tr>
			<tr>
				<th>강의 요일</th>
				<td>${cVo.week}</td>
			</tr>
			<tr>
				<th>시작 시간</th>
				<td>
					<c:choose>
						<c:when test="${cVo.start_hour < 1000}">
							0${fn:substring(cVo.start_hour,0,1)}시 ${fn:substring(cVo.start_hour,1,3)}분
						</c:when>
						<c:when test="${cVo.start_hour >= 1000}">
							${fn:substring(cVo.start_hour,0,2)}시 ${fn:substring(cVo.start_hour,2,4)}분
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>종료 시간</th>
				<td>
					<c:choose>
						<c:when test="${cVo.end_hour < 1000}">
							0${fn:substring(cVo.end_hour,0,1)}시 ${fn:substring(cVo.end_hour,1,3)}분
						</c:when>
						<c:when test="${cVo.end_hour >= 1000}">
							${fn:substring(cVo.end_hour,0,2)}시 ${fn:substring(cVo.end_hour,2,4)}분
						</c:when>
					</c:choose>
				</td>
			</tr>
		</table>
		<button onclick="location.href='CS?command=courseUpdateFormAction&id=${cVo.id}'">수정</button>
		<button onclick="location.href='CS?command=courseDeleteAction&id=${cVo.id}'">삭제</button>
		<button onclick="location.href='CS?command=courseListAction'">목록</button>
		<p>Copyright(c) 2022 그린 아카데미 All right Reserved</p>
	</div>
</body>
</html>