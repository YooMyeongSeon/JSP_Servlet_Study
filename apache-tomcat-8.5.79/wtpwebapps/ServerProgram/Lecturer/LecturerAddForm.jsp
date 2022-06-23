<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	}
	.input {
		width: 360px;
		outline: none;
		border: none;
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
		<h3>강사 등록</h3>
		<form action="CS" method="post">
			<input type="hidden" name="command" value="lecturerAddAction">
			<table>
				<tr>
					<th>강사 번호</th>
					<td><input class="input" type="number" name="idx" value="${seq}" readonly></td>
				</tr>
				<tr>
					<th>강사 이름</th>
					<td><input class="input" type="text" name="name" placeholder="강사 이름 입력" required></td>
				</tr>
				<tr>
					<th>전공</th>	
					<td><input class="input" type="text" name="major" placeholder="강사 전공 입력" required></td>
				</tr>
				<tr>
					<th>세부 전공</th>
					<td><input class="input" type="text" name="field" placeholder="세부 전공 입력" required></td>
				</tr>
			</table>
			<input id="sbm" type="submit" value="등록">
		</form>
		<button id="lst" onclick="location.href='CS?command=lecturerListAction'">취소</button>
	</div>
	<jsp:include page="/Footer.html"/>
</body>
</html>