<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>El의 자바빈 접근</title>
</head>
<body>
	<h1>자바빈에 데이터 저장</h1>
	<jsp:useBean id="member" class="com.green.beans.Member" scope="request">
		<jsp:setProperty property="userId" name="member" value="hong"/>
		<jsp:setProperty property="userPw" name="member" value="1234"/>
		<jsp:setProperty property="userName" name="member" value="홍길동"/>
	</jsp:useBean>	
	<jsp:forward page="Ex_08_Result.jsp"/>
</body>
</html>