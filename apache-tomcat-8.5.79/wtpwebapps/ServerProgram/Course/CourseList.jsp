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
	#add {
		float: right;
	}
	#lecturer {
		float: left;
	}
</style>
</head>
<body>
	<div>
		<h1>교과목 관리 사이트</h1>
		<h3>총 <span style="font-size: 20pt; color:#4371c6">${courseList.size()}</span>개의 교과목이 있습니다.</h3>
		<table>
			<tr>
				<th>과목 코드</th>
				<th>과목 명</th>
				<th>학점</th>
				<th>담당 강사</th>
				<th>강의 요일</th>
			</tr>
			<c:forEach items="${courseList}" var="course">
				<tr>
					<td>${course.id}</td>
					<td><a href="CS?command=courseViewAction&id=${course.id}">${course.name}</a></td>
					<td>${course.credit} 학점</td>
					<td>${course.lecturerName}</td>
					<td>${course.week}</td>
				</tr>
			</c:forEach>
		</table>
		<span id="lecturer"><button onclick="location.href='CS?command=lecturerListAction'">강사 보기</button></span>
		<span id="add"><button onclick="location.href='CS?command=courseAddFormAction'">교과목 등록</button></span>
		<p>Copyright(c) 2022 그린 아카데미 All right Reserved</p>
	</div>
</body>
</html>