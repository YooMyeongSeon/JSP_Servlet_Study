<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<script type="text/javascript" src="./script/member.js"></script>
</head>
<body>
	<h1>아이디 중복 체크</h1>
	<form action="ICS" method="GET" name="frm">
		아이디 : <input type="text" name="userId" value="${userId}">
		<input type="submit" value="중복체크"><br>
		
		<c:if test="${result == 1}">
			<script type="text/javascript">
				opener.document.frm.userId.value="";
			</script>
				<p>${userId}는 이미 사용중인 아이디 입니다.</p>
		</c:if>
		<c:if test="${result == -1}">
			<p>${userId}는 사용 가능한 아이디 입니다.</p>
			<input type="button" value="사용하기" onclick="idOk()">
		</c:if>
	</form>
</body>
</html>