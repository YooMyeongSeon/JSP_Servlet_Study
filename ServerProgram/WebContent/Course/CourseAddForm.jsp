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
	th {
		width: 200px;
	}
</style>
</head>
<body>
	<div>
		<h1>교과목 관리 사이트</h1>
		<h3>교과목 등록</h3>
		<form action="CS" method="post">
			<input type="hidden" name="command" value="courseAddAction">
			<table>
				<tr>
					<th>과목 코드</th>
					<td><input type="number" name="id" required></td>
				</tr>
				<tr>
					<th>과목 명</th>
					<td><input type="text" name="name" required></td>
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
					<td><input type="number" name="credit" required></td>
				</tr>
				<tr>
					<th>요일</th>
					<td>
						월<input type="radio" name="week" value="1" checked>
						화<input type="radio" name="week" value="2">
						수<input type="radio" name="week" value="3">
						목<input type="radio" name="week" value="4">
						금<input type="radio" name="week" value="5">
					</td>
				</tr>
				<tr>
					<th>시작 시간</th>
					<td><input type="number" name="start_hour" required></td>
				</tr>
				<tr>
					<th>종료 시간</th>
					<td><input type="number" name="end_hour" required></td>
				</tr>
			</table>
			<input type="submit" value="등록">
			<button type="button" onclick="location.href='CS?command=courseListAction'">취소</button>
		</form>
		<p>Copyright(c) 2022 그린 아카데미 All right Reserved</p>
	</div>
</body>
</html>