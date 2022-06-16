<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>

<%@ page import="javax.naming.Context"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.sql.DataSource"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 조회</title>
</head>
<body>
	<%!
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	%>
	
	<table border="1">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>암호</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>권한(1:관리자, 0:일반회원)</th>
		</tr>
	
	<%
		try {
			//1. 톰캣이 만든 커넥션을 사용
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();
			
			stmt = conn.createStatement();
			
			String query = "select * from member";

			rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				String name = rs.getString("name");
				String userid = rs.getString("userid");
				String userpw = rs.getString("userpw");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				int admin = rs.getInt("admin");
				
				out.println("<tr>");
				out.println("<td>"+name+"</td>");
				out.println("<td>"+userid+"</td>");
				out.println("<td>"+userpw+"</td>");
				out.println("<td>"+email+"</td>");
				out.println("<td>"+phone+"</td>");
				out.println("<td>"+admin+"</td>");
				out.println("</tr>");
			}
		} catch(Exception e) {
			e.printStackTrace();	
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	%>
	</table>
</body>
</html>