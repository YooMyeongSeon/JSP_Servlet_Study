<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션</title>
</head>
<body>
	<%
		if (session.getAttribute("name") == null) {
			//로그인을 하지않고 접속한 경우
			response.sendRedirect("Ex_04_LoginForm.jsp");
		} else {
	%>
		<h1><%=session.getAttribute("name")%>(<%=session.getAttribute("id")%>)님, 환영합니다!</h1>
		<p>로그인에 성공하였습니다</p>
		<form action="Ex_04_Logout.jsp" method="POST">
			<input type="submit" value="로그아웃">
		</form>
		</body>
		</html>
	<%
		}
	%>