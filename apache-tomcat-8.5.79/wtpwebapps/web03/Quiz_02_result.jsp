<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz_02</title>
<style>
	table, tr, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<%
		String dan = request.getParameter("dan");
		int dan_i = 0;
		
		if (dan.equals("dan2")) {
			dan_i = 2;
		} else if (dan.equals("dan3")) {
			dan_i = 3;
		} else if (dan.equals("dan4")) {
			dan_i = 4;
		} else if (dan.equals("dan5")) {
			dan_i = 5;
		} else if (dan.equals("dan6")) {
			dan_i = 6;
		} else if (dan.equals("dan7")) {
			dan_i = 7;
		} else if (dan.equals("dan8")) {
			dan_i = 8;
		} else {
			dan_i = 9;
		}
	%>
	<table>
		<%
			for (int i=1; i<=9; i++) {
				%>
				<tr><td> <%=dan_i + " x " + i + " = " + dan_i*i%> </td></tr>
				<%
			}
		%>
	</table>
</body>
</html>