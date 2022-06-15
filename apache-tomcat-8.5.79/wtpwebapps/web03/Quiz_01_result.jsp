<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz_01</title>
</head>
<body>
	<%
		int ko_score = Integer.parseInt(request.getParameter("ko_score"));
		int en_score = Integer.parseInt(request.getParameter("en_score"));
		int ma_score = Integer.parseInt(request.getParameter("ma_score"));
		int sum = ko_score + en_score + ma_score;
		int avg = sum / 3;
	%>
	<p>입력된 점수의 총점 : <%=sum%></p>
	<p>입력된 점수의 평균 : <%=avg%></p>
</body>
</html>