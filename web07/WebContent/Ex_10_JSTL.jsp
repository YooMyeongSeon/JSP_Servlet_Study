<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<%-- JSTL로 내장 객체에 값 저장 --%>
	<c:set var="str" value="Hello" scope="request"/>
	저장된 값 출력 : <%= request.getAttribute("str").toString() %><br>
	El표기로 출력 : ${ str }
	<hr>
	
	<c:set var="str2" value="${ str }" scope="request"/>
	<c:set var="add" value="${ 10+20 }" scope="request"/>
	합계 : ${ add }
	<hr>
	
	<c:set var="bool" value="${ 10>20 }" scope="request"/>
	결과 : ${ bool }
	<hr>
	
	<%-- JSTL로 자바빈에 접근 --%>
	<c:set var="m1" value="<%= new com.green.beans.Member() %>" scope="request"/>
	<c:set target="${ m1 }" property="userId" value="ko"/>
	<c:set target="${ m1 }" property="userPw" value="1234"/>
	<c:set target="${ m1 }" property="userName">
		고길동
	</c:set>
	아이디 : ${ m1.userId }<br>
	비밀번호 : ${ m1.userPw }<br>
	이름 : ${ m1.userName }
	<hr>
	
	<c:set var="chk" value="테스트"/>
	변수 선언 후 chk 값 : ${ chk }<br>
	<c:remove var="chk"/>
	변수 삭제 후 chk 값 : ${ chk }
	<hr>
	
	<c:out value="${ m1.userName }"/>
</body>
</html>