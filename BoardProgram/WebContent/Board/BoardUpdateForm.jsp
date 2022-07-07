<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
<link type="text/css" rel="stylesheet" href="CSS/Board.css">
</head>
<body>
	<jsp:include page="/Header.html"/>
	<section>
		<p>게시물 수정</p>
		<form action="BUS" method="post">
			<input type="hidden" name="idx" value="${bVo.idx}">
			<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" value="${bVo.writer}" required></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" value="${bVo.subject}" required></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content">${bVo.content}</textarea></td>
				</tr>
			</table>
			<input class="button" type="submit" value="게시물 수정" id="wu_btn">
		</form>
		<button onclick="location.href='BVS?idx=${bVo.idx}'" id="wu_btn_2">취소</button>
	</section>
	<jsp:include page="/Footer.html"/>
</body>
</html>