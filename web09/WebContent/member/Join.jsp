<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
<script type="text/javascript" src="./script/member.js"></script>
</head>
<body>
	<h1>회원 가입 페이지</h1>
	<span>'*'표시 항목은 필수 입력사항 입니다.</span>
	<form action="JS" method="POST" name="frm">
		<table>
			<tr>
				<td>이름 : </td>
				<td><input type="text" name="name" size="20"> * </td>
			</tr>
			<tr>
				<td>아이디 : </td>
				<td><input type="text" name="userId" size="20"> *
					<input type="hidden" name="reid" size="20"> 
					<input type="button" value="중복 체크" onclick="idCheck()"></td>
			</tr>
			<tr>
				<td>비밀번호 : </td>
				<td><input type="password" name="userPw" size="20"> * </td>
			</tr>
			<tr>
				<td>비밀번호 확인 : </td>
				<td><input type="password" name="pwCheck" size="20"> * </td>
			</tr>
			<tr>
				<td>이메일 : </td>
				<td><input type="email" name="email" size="20"></td>
			</tr>
			<tr>
				<td>전화번호 : </td>
				<td><input type="tel" name="phone" size="20"> * </td>
			</tr>
			<tr>
				<td>권한 : </td>
				<td><input type="radio" name="admin" value="0" checked>일반 회원
					<input type="radio" name="admin" value="1">관리자</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="가입" onclick="return joinCheck()">
					<input type="reset" value="취소"></td>
			</tr>
			<tr>
				<td colspan="2">${msg}</td>
			</tr>
		</table>
	</form>
</body>
</html>