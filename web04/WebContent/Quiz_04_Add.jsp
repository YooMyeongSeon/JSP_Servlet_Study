<%@page import="com.sun.scenario.effect.impl.sw.sse.SSESepiaTonePeer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		if (session.getAttribute("list")==null) {
			%><%!ArrayList<String> list = new ArrayList<>();%><%
			list.add(request.getParameter("add_list"));	
		} else {
			ArrayList<String> list = (ArrayList<String>)session.getAttribute("list");
			list.add(request.getParameter("add_list"));
		}
		session.setAttribute("list", list);
		response.sendRedirect("Quiz_04_List.jsp");
	%>
</body>
</html>	