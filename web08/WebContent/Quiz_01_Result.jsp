<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 1 : 회원 가입</title>
</head>
<body>
	<%!
		Connection conn = null;
		PreparedStatement psmt = null;
		String url = "jdbc:oracle:thin:@oracle.interstander.com:41521:XE";
		String uId = "green03";
		String uPw = "1234";
	%>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String userid = request.getParameter("userId");
		String userpw = request.getParameter("userPw");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int admin = 0;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,uId,uPw);
			String sql = "insert into member values(?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, userid);
			psmt.setString(3, userpw);
			psmt.setString(4, email);
			psmt.setString(5, phone);
			psmt.setInt(6, admin);
			
			psmt.executeUpdate();
			
			out.println("<p>입력 성공</p>");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (psmt != null)psmt.close();
				if (conn != null)conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	%>
</body>
</html>