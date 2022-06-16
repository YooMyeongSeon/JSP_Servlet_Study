<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL : import</title>
</head>
<body>
	<%-- 페이지 불러오기 --%>
	<c:import var="page" url="http://localhost:8085/web07/Ex_02.jsp" charEncoding="UTF-8"/>
	${ page }<br>
	<hr>
	${ page }<br>
</body>
</html>