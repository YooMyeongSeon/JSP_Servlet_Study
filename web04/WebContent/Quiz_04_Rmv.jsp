<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz_04</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("list");
	
		String rmvList = request.getParameter("listRmv");
	
		list.remove(rmvList);
		
		session.setAttribute("list", list);
		response.sendRedirect("Quiz_04_List.jsp");
	%>
</body>
</html>	