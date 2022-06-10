<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		double result = Double.parseDouble(request.getParameter("result"));
		String corona;
		
		if (result < 37.5) {
			corona = "음성";
		} else {
			int random = (int)(Math.random()*100);
			if (random < 19) {
				corona = "음성";
			} else {
				corona = "양성";
			}
		}
	%>
	<p><%=name%>님, 코로나 '<%=corona%>' 입니다.</p>
</body>
</html>