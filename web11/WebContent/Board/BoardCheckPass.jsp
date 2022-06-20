<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호 확인 페이지</title>
</head>
<body>
	<div id="wrap">
		<h1>암호 확인</h1>
		<form action="BS" method="POST">
			<input type="hidden" name="command" value="BoardCheckPass">
			<input type="hidden" name="num" value="${param.num}">
			<table>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" required></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="입력">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="color:red">${msg}</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>