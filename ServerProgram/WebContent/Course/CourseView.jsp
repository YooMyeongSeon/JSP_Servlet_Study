<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버 프로그램 구현</title>
<link type="text/css" rel="stylesheet" href="CSS/Style.css">
<style>
	div {
		width: 600px;
	}
	table {
		margin: 20px auto;
		width: 600px;
	}
	th {
		width: 200px;
	}
	td {
		width: 400px;
		padding: 10px 20px;
		text-align: left;
	}
	button {
		width: 80px;
		height: 25px;
		margin: 0px 10px;
	}
</style>
</head>
<body>
	<jsp:include page="/Header.html"/>
	<div>
		<h3>교과목 상세 보기</h3>
		<table>
			<tr>
				<th>과목 코드</th>
				<td>${cVo.id}</td>
			</tr>
			<tr>
				<th>과목 이름</th>
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
		<button onclick="check()">삭제</button>
		<button onclick="location.href='CS?command=courseListAction'">목록</button>
	</div>
	<jsp:include page="/Footer.html"/>
	<script type="text/javascript">
		function check() {
			if (confirm("교과목을 삭제하시겠습니까?")) {location.href="CS?command=courseDeleteAction&id=${cVo.id}";}
		}
	</script>
</body>
</html>