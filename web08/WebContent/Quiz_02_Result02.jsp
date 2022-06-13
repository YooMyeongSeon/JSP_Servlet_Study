<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 2-2 : 회원 정보 수정</title>
</head>
<body>
	<%!
		Connection conn = null;
		Statement stmt = null;
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
			stmt = conn.createStatement();
			
			String sql = "UPDATE member SET "+ 
   						 "userid = '"+userid+"', userpw = '"+userpw+"', email = '"+email+"', phone = '"+phone+"' where name='"+name+"'";
			stmt.executeUpdate(sql);
			
			out.println("<h1>회원 정보 변경 완료</h1>");
			out.println("<p>이름 : "+name+"</p>");
			out.println("<p>아이디 : "+userid+"</p>");	
			out.println("<p>이메일 : "+email+"</p>");
			out.println("<p>전화번호 : "+phone+"</p>");
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)stmt.close();
				if (conn != null)conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	%>
</body>
</html>