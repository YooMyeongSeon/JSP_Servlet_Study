<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<script type="text/javascript" src="./script/member.js"></script>
</head>
<body>
	<h1>로그인 페이지</h1>
	<form action="LS" method="POST" name="frm">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userId" required="required"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPw" required="required"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인" onclick="return loginCheck()">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소">&nbsp;&nbsp;&nbsp;
					<input type="button" value="회원가입" onclick="location.href='JS'">
				</td>
			</tr>
			<tr>
				<td  colspan="2" align="center">${msg}</td>
			</tr>
		</table>
	</form>
</body>
</html>