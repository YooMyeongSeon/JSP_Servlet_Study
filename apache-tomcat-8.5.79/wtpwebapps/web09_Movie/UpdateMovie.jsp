<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Set.Movie"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 정보 수정</title>
</head>
<body>
	<h1>영화 정보 수정</h1>
	<% Movie movie = (Movie)request.getAttribute("movie"); %>
	<form action="UM" method="POST">
		코드 : <input type="number" name="code" value="<%=movie.getCode()%>" readonly> ※코드는 수정불가<br>
		영화 제목 : <input type="text" name="mname" value="<%=movie.getMname()%>"><br>
		감독: <input type="text" name="director" value="<%=movie.getDirector()%>"><br>
		주인공 : <input type="text" name="main" value="<%=movie.getMain()%>"><br>
		가격 : <input type="number" name="price" value="<%=movie.getPrice()%>"><br>
		<input type="submit" value="정보 수정">
		<input type="button" value="뒤로가기" onclick="location.href='index.jsp'">
	</form>
</body>
</html>