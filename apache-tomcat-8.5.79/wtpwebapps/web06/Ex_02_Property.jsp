<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 : Property</title>
</head>
<body>
	<%-- 액션 태그로 값을 저장하기 --%>
	<jsp:useBean id="m1" class="com.green.beans.Member" scope="session"/>
	
	<jsp:setProperty property="name" name="m1" value="홍길동"/>
	<%-- m1.setName("홍길동"); 과 같은 기능 --%>
	
	저장된 이름 : <jsp:getProperty property="name" name="m1"/>
	<%-- m1.getName();과 같은 기능, 출력문을 따로 사용하지 않는다. --%>
</body>
</html>