<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="Set.Movie_DAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 연동 테스트</title>
</head>
<body>
	<%
		Movie_DAO dao = Movie_DAO.getInstance();
		Connection conn = dao.getConnection();
		if (conn != null ) {
			out.println("데이터베이스 연결 성공");
		} else {
			out.println("데이터베이스 연결 실패");
		}
	%>
</body>
</html>