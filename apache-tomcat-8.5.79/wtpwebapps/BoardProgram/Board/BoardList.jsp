<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<link type="text/css" rel="stylesheet" href="CSS/Board.css">
</head>
<body>
	<jsp:include page="/Header.html"/>
	<section>
		<p>총 <span style="font-size: 20pt; color:#0078C8">${list.size()}</span>개의 게시물이 있습니다.</p>
		<table>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:forEach items="${list}" var="board">
				<tr>
					<td>${board.idx}</td>
					<td>${board.writer}</td>
					<td class="subject"><a href="BVS?idx=${board.idx}">${board.subject}</a></td>
					<td>${fn:substring(board.regdate,0,16)}</td>
				</tr>
			</c:forEach>
		</table>
		<button onclick="location.href='BWS'">게시물 작성</button>
	</section>
	<jsp:include page="/Footer.html"/>
</body>
</html>