<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz_04</title>
</head>
<body>
	<h1>할 일 목록</h1>
	<%
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("list");
		for (int i=0; i<list.size(); i++) {
	%>
			<%=list.get(i)%> <a href="Quiz_04_Rmv.jsp?listRmv=<%=list.get(i)%>"><button>삭제</button></a><br>
	<%
		}
		out.print("<hr>");
	%>
	<a href="Quiz_04.jsp"><button>할 일 기록</button></a>
</body>
</html>