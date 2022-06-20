<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
<link type="text/css" rel="stylesheet" href="CSS/Board.css">
</head>
<body>
	<div id="wrap">
		<h1>게시글 상세 보기</h1>
		<table>
			<tr>
				<th>작성자</th>
				<td>${bVo.name}</td>
				<th>이메일</th>
				<td>${bVo.email}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${bVo.writeDate}"/></td>
				<th>조회수</th>
				<td>${bVo.readCount}</td>
			</tr>
			<tr>
				<th>글 제목</th>
				<td colspan="3">${bVo.title}</td>
			</tr>
			<tr>
				<th>글 내용</th>
				<td colspan="3">${bVo.content}</td>
			</tr>
			<tr>
				<td colspan="4">
				<input type="button" value="게시물 수정" onclick="openWin('BS?command=BoardCheckPassForm&num=${bVo.num}','update')">
				<input type="button" value="게시물 삭제" onclick="openWin('BS?command=BoardCheckPassForm&num=${bVo.num}','delete')">
				<input type="button" value="목록 보기" onclick="location.href='BS?command=BoardListAction'">
				</td>
			</tr>
		</table>
	</div>
	<script>
		function openWin(url, name) {
			window.open(url, name, "width=500, height=400");
		}
	</script>
</body>
</html>