<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link type="text/css" rel="stylesheet" href="CSS/Board.css">
</head>
<body>
	<div id="wrap">
		<h1>게시물 수정</h1>
		<form action="BS" method="post">
			<input type="hidden" name="command" value="BoardUpdate">
			<input type="hidden" name="num" value="${bVo.num}">
			<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="name" value="${bVo.name}" required="required">* 필수</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" value="${bVo.pw}" required="required">* 필수</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" value="${bVo.email}"></td>
				</tr>
				<tr>
					<th>글 제목</th>
					<td><input type="text" name="title" value="${bVo.title}" required="required">* 필수</td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td><textarea rows="15" cols="70" name="content">${bVo.content}</textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="글 수정" onclick="update()">
						<input type="reset" value="다시 작성">
						<input type="button" value="취소" onclick="location.href='BS?command=BoardListAction'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		function update() {
			alert('게시글이 수정 되었습니다.');
		}
	</script>
</body>
</html>