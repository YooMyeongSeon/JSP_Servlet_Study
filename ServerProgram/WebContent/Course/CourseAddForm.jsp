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
	}
	.input {
		width: 360px;
		outline: none;
		border: none;
	}
	select {
		float: left;
		width: 80px;
		height: 25px;
	}
	#week {
		float: left;
	}
	#sbm, #lst {
		width: 80px;
		height: 25px;
		float: left;
		margin: 0px 10px;
	}
	#sbm {
		margin-left: 210px;
	}
</style>
</head>
<body>
	<jsp:include page="/Header.html"/>
	<div>
		<h3>교과목 등록</h3>
		<form action="CS" method="post">
			<input type="hidden" name="command" value="courseAddAction">
			<table>
				<tr>
					<th>과목 코드</th>
					<td><input class="input" type="number" id="id" name="id" placeholder="과목 코드입력 : 5자리 숫자로 입력" required></td>
				</tr>
				<tr>
					<th>과목 이름</th>
					<td><input class="input" type="text" id="name" name="name" placeholder="과목 이름 입력" required></td>
				</tr>
				<tr>
					<th>담당 강사</th>
					<td>
						<select name="lecturer">
							<c:forEach items="${lecturerList}" var="lecturer">
								<option value="${lecturer.idx}">${lecturer.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>학점</th>
					<td><input class="input" type="number" id="credit" name="credit" placeholder="학점 입력 : 1자리 숫자로 입력"required></td>
				</tr>
				<tr>
					<th>강의 요일</th>
					<td>
						<span id="week">
							<input type="radio" name="week" value="1" checked>월　
							<input type="radio" name="week" value="2">화　
							<input type="radio" name="week" value="3">수　
							<input type="radio" name="week" value="4">목　
							<input type="radio" name="week" value="5">금　
							<input type="radio" name="week" value="6">토
						</span>
					</td>
				</tr>
				<tr>
					<th>시작 시간</th>
					<td><input class="input" type="number" id="sh" name="start_hour" placeholder="시작 시간 입력 : 4자리 숫자로 입력 Ex)09시 00분 : 0900" required></td>
				</tr>
				<tr>
					<th>종료 시간</th>
					<td><input class="input" type="number" id="eh" name="end_hour" placeholder="종료 시간 입력 : 4자리 숫자로 입력" required></td>
				</tr>
			</table>
			<input id="sbm" type="submit" value="등록" onclick="check()">
		</form>
		<button id="lst" onclick="location.href='CS?command=courseListAction'">취소</button>
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