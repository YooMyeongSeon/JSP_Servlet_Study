<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>
<link type="text/css" rel="stylesheet" href="CSS/Board.css">
</head>
<body>
	<jsp:include page="/Header.html"/>
	<section>
		<p>게시물 조회</p>
		<table>
			<tr>
				<th>제목</th>
				<td colspan="3">${bVo.subject}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${bVo.writer}</td>
				<th>작성일</th>
				<td>${fn:substring(bVo.regdate,0,10)}</td>
			</tr>
			<tr>
				<td colspan="4" id="content">${bVo.content}</td>
			</tr>
		</table>
		<button onclick="location.href='BUS'">게시물 수정</button>
		<button onclick="location.href='BDS'">게시물 삭제</button>
		<button onclick="location.href='BLS'">목록</button>
	</section>
	<jsp:include page="/Footer.html"/>
</body>
</html>