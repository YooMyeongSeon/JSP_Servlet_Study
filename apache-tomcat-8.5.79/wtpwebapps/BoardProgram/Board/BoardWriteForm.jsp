<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<link type="text/css" rel="stylesheet" href="CSS/Board.css">
</head>
<body>
	<jsp:include page="/Header.html"/>
	<section>
		<p>게시물 작성</p>
		<form action="BWS" method="post">
			<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" required></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" required></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content"></textarea></td>
				</tr>
			</table>
			<input class="button" type="submit" value="게시물 작성" id="wu_btn">
		</form>
		<button onclick="location.href='BLS'" id="wu_btn_2">목록</button>
	</section>
	<jsp:include page="/Footer.html"/>
</body>
</html>