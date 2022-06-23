<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버 프로그램 구현</title>
<link type="text/css" rel="stylesheet" href="CSS/Style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	.input {
		width: 360px;
		outline: none;
		border: none;
		color: #ccc;
	}
	#week {
		float: left;
	}
	button, #sbm {
		width: 80px;
		height: 25px;
		margin: 0px 10px;
		float: left;
	}
	#sbm {
		margin-left: 210px;
	}
	select {
		float: left;
		width: 80px;
		height: 25px;
	}
</style>
</head>
<body>
	<jsp:include page="/Header.html"/>
	<div>
		<h3>교과목 수정</h3>
		<form action="CS" method="post">
			<input type="hidden" name="command" value="courseUpdateAction">
			<input type="hidden" name="oldId" value="${cVo.id}">
			<table>
				<tr>
					<th>과목 코드</th>
					<td><input class="input" type="number" id="id" name="id" required value="${cVo.id}"></td>
				</tr>
				<tr>
					<th>과목 이름</th>
					<td><input class="input" type="text" id="name" name="name" required value="${cVo.name}"></td>
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
					<td><input class="input" type="number" id="credit" name="credit" value="${cVo.credit}" required></td>
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
					<td>
						<c:choose>
							<c:when test="${cVo.start_hour < 1000}">
								<input class="input" id="sh" type="number" name="start_hour" value="0${cVo.start_hour}" required>
							</c:when>
							<c:otherwise>
								<input class="input" id="sh" type="number" name="start_hour" value="${cVo.start_hour}" required>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>종료 시간</th>
					<td><input class="input" id="eh" type="number" name="end_hour" value="${cVo.end_hour}" required></td>
				</tr>
			</table>
			<input type="submit" id="sbm" onclick="check()" value="수정">
		</form>
		<button onclick="location.href='CS?command=courseViewAction&id=${cVo.id}'">취소</button>
	</div>
	<jsp:include page="/Footer.html"/>
	<script type="text/javascript">
		function check() {
			if ($('#id').val().length != 5) {
				alert('과목 코드 형식이 올바르지 않습니다.');
				$('#id').focus();
				$('#id').val("");
				return false;
			}
			if ($('#credit').val().length != 1) {
				alert('학점 형식이 올바르지 않습니다.');
				$('#credit').focus();
				$('#credit').val("");
				return false;
			}
			if (($('#sh').val().length != 4) || ($('#sh').val() > 2400)) {
				alert('시작 시간 형식이 올바르지 않습니다.');
				$('#sh').focus();
				$('#sh').val("");
				return false;
			}
			if (($('#eh').val().length != 4) || ($('#eh').val() > 2400)) {
				alert('종료 시간 형식이 올바르지 않습니다.');
				$('#eh').focus();
				$('#eh').val("");
				return false;
			}
		}
	</script>
</body>
</html>