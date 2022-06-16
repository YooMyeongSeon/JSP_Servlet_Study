<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Set.Movie"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
</head>
<body>
	<h1>영화  상세 정보</h1>
	<table border="1">
		<tr>
			<th>코드</th>
			<th>영화</th>
			<th>감독</th>
			<th>주연</th>
			<th>가격</th>
		</tr>
		<% 
			Movie movie = (Movie)request.getAttribute("movie");
			out.print("<tr>");
			out.print("<td>" + movie.getCode() + "</td>");
			out.print("<td>" + movie.getMname() + "</td>");
			out.print("<td>" + movie.getDirector() + "</td>");
			out.print("<td>" + movie.getMain() + "</td>");
			out.print("<td>" + movie.getPrice() + "</td>");
			out.print("</tr>");
		%>
	</table>
	<hr>
	<input type="button" value="영화 정보 변경" onclick="location.href='UM?mname=<%=movie.getMname()%>'">
	<input type="button" value="영화 정보 삭제" onclick="location.href='RM?code=<%=movie.getCode()%>'">
	<input type="button" value="뒤로가기" onclick="location.href='index.jsp'">
</body>
</html>