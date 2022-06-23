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
	#course {
		float: left;
	}
</style>
</head>
<body>
	<div>
		<h1>교과목 관리 사이트</h1>
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
		<span id="course"><button onclick="location.href='CS?command=courseListAction'">교과목 보기</button></span>
		<span id="add"><button onclick="location.href='CS?command=lecturerAddFormAction'">강사 등록</button></span>
		<p>Copyright(c) 2022 그린 아카데미 All right Reserved</p>
	</div>
</body>
</html>