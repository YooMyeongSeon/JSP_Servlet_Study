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
	#course {
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
		<button id="course" onclick="location.href='CS?command=courseListAction'">교과목 보기</button>
		<h3>총 <span style="font-size: 20pt; color:#4371c6">${lecturerList.size()}</span>명의 강사가 있습니다.</h3>
		<table>
			<tr>
				<th>강사 번호</th>
				<th>강사 이름</th>
				<th>전공</th>
			</tr>
			<c:forEach items="${lecturerList}" var="lecturer">
				<tr>
					<td>${lecturer.idx} 번</td>
					<td><a href="CS?command=lecturerUpdateFormAction&idx=${lecturer.idx}">${lecturer.name}</a></td>
					<td>${lecturer.major}</td>
				</tr>
			</c:forEach>
		</table>
		<button id="add" onclick="location.href='CS?command=lecturerAddFormAction'">강사 등록</button>
	</div>
	<jsp:include page="/Footer.html"/>
</body>
</html>