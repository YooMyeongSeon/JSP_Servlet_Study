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
	#lecturer {
		float: left;
		margin-top: 10px;
		width: 80px;
		height: 25px;
	}
	h3 {
		width: 500px;
		margin: 0px auto;
	}
	#add {
		float: right;
		width: 80px;
		height: 25px;
	}
</style>
</head>
<body>
	<jsp:include page="/Header.html"/>
	<div>
		<button id="lecturer" onclick="location.href='CS?command=lecturerListAction'">강사 보기</button>
		<h3>총 <span style="font-size: 20pt; color:#4371c6">${courseList.size()}</span>개의 교과목이 있습니다.</h3>
		<table>
			<tr>
				<th>과목 코드</th>
				<th>과목 이름</th>
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
		<button id="add" onclick="location.href='CS?command=courseAddFormAction'">교과목 등록</button>
	</div>
	<jsp:include page="/Footer.html"/>
</body>
</html>