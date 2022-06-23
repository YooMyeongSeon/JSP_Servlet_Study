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
</style>
</head>
<body>
	<div>
		<h1>교과목 관리 사이트</h1>
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
			<input type="submit" value="등록">
			<button onclick="location.href='CS?command=lecturerListAction'">취소</button>
		</form>
		<p>Copyright(c) 2022 그린 아카데미 All right Reserved</p>
	</div>
</body>
</html>