<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL : Url</title>
</head>
<body>
	<%-- 이미지를 저장하는 것이 아닌 경로를 저장 --%>
	<c:url var="pic" value="images/sunset-gf1a98b7ed_640.jpg" scope="request"/>
	<div>${pic}</div>
	<hr>
	
	<img alt="사진" src="${pic}" width="500px"/>
</body>
</html>