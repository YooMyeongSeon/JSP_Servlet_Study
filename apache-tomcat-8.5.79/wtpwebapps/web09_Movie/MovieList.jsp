<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="Set.Movie"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 정보 사이트</title>
</head>
<body>
	<h1>영화 정보 사이트</h1>
	<table border="1">
		<tr>
			<th>영화</th>
		</tr>
		<%	
			List<Movie> movieList = (ArrayList<Movie>)request.getAttribute("movieList");
			for (int i=0; i<movieList.size(); i++) {
				out.print("<tr>");
				out.print("<td><a href='IM?mname=" + movieList.get(i).getMname() + "'>" + movieList.get(i).getMname() + "</a></td>");
				out.print("</tr>");
			}
		%>
	</table>
	<hr>
	<form action="AddMovie.jsp" method="POST">
		<input type="submit" value="영화 등록">
	</form>
</body>
</html>