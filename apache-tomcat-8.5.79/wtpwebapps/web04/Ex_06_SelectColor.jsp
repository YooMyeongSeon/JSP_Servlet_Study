<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배경 색상 선택</title>
</head>
<body>
	<h1>배경 색상을 선택하세요</h1>
	<form action="Ex_06_BgColor.jsp" method="get">
		<select name="bgColor">
			<option value="red">빨강</option>
			<option value="blue">파랑</option>
			<option value="green">초록</option>		
		</select>
		<input type="submit" value="선택">
	</form>
</body>
</html>