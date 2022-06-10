<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>색상을 선택</h3>
	<form action="Ex_11_Result.jsp" method="POST">
		<label for="color">색상을 선택하세요</label>
		<select id="color" name="color">
			<option value="red">빨강</option>
			<option value="blue">파랑</option>
			<option value="green">초록</option>
		</select>
		<input type="submit" value="선택">
	</form>
</body>
</html>