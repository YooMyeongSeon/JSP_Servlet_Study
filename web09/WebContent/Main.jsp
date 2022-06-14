<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전용 페이지</title>
</head>
<body>
	<h1>회원 전용 페이지</h1>
	<table>
		<tr>
			<td>안녕하세요, ${loginUser.name}(${loginUser.userId})님 환영합니다!</td>
		</tr>
		<tr>
			<td>
				<form action="LOS" method="GET">
					<input type="submit" value="로그아웃">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>