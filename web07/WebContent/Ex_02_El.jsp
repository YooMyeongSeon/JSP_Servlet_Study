<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>El 표기법</title>
</head>
<body>
	<%-- 1. 데이터(숫자, 문자열 등)를 그대로 출력한다. --%>
	정수타입 : ${30}<br>
	실수타입 : ${3.14}<br>
	문자열타입 : ${"안녕하세요"}<br>
	논리타입 : ${true}<br>
	null(null값은 출력되지 않음) : ${null}
	<hr>
	
	<%-- 2. 산술연산이 가능하다. --%>
	5 + 2 : ${5+2}<br>
	5 - 2 : ${5-2}<br>
	5 x 2 : ${5*2}<br>
	5 / 2 : ${5/2}<br>
	5 % 2 : ${5%2}
	<hr>
	
	<%-- 3. 비교연산이 가능하다. : ==(eq), !=(ne), <(lt), >(gt), <=(le), >=(ge) --%>
	5 > 2 : ${5>2}<br>
	5 > 2 : ${5 gt 2}<br>
</body>
</html>