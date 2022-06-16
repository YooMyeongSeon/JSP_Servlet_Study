<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>El 표기법</title>
</head>
<body>
	<%-- 1. 표현식에서의 연산 --%>
	<%
		String str1 = request.getParameter("num1");
		int num1 = Integer.parseInt(str1);
		int num2 = Integer.parseInt(request.getParameter("num2"));
	%>
	<%=num1%> + <%=num2%> = <%=num1+num2%>
	<hr>
	
	<%-- 2. El표기에서의 연산 --%>
	${param.num1} + ${param.num2} = ${param.num1+param.num2}
</body>
</html>