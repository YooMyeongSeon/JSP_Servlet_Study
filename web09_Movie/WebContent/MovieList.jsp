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
			<td>코드</td>
			<td>영화</td>
			<td>감독</td>
			<td>주연</td>
			<td>가격</td>
		</tr>
		<%	
			List<Movie> movieList = (ArrayList<Movie>)request.getAttribute("movieList");
			for (int i=0; i<movieList.size(); i++) {
				out.print("<tr>");
				out.print("<td>" + movieList.get(i).getCode() + "</td>");
				out.print("<td><a href=\"InMovie.jsp?mname=" + movieList.get(i).getMname() + "\">" + movieList.get(i).getMname() + "</a></td>");
				out.print("<td>" + movieList.get(i).getDirector() + "</td>"); 
				out.print("<td>" + movieList.get(i).getMain() + "</td>");
				out.print("<td>" + movieList.get(i).getPrice() + "</td>");
				out.print("</tr>");
			}
		%>
	</table>
	<hr>
	<form action="AddMovie.jsp" method="POST"> <%-- 미구현 --%>
		<input type="submit" value="영화 등록">
	</form>
</body>
</html>