<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 2-1 : 회원 검색</title>
</head>
<body>
	<%!
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@oracle.interstander.com:41521:XE";
		String uId = "green03";
		String uPw = "1234";		
	%>
	<%
		request.setCharacterEncoding("UTF-8");
		String s_name = request.getParameter("name");
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,uId,uPw);
			stmt = conn.createStatement();
			
			String query = "select * from member where name='"+s_name+"'";
			rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				String name = rs.getString("name");
				String userid = rs.getString("userid");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				
				out.println("<p>이름 : "+name+"</p>");
				out.println("<p>아이디 : "+userid+"</p>");	
				out.println("<p>이메일 : "+email+"</p>");
				out.println("<p>전화번호 : "+phone+"</p>");
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
	<h1>문제 2-2 : 회원 정보 수정</h1>
	<form action="Quiz_02_Result02.jsp" method="POST">
		이름 : <input type="text" name="name" value="<%=s_name%>" readonly> ※이름은 변경할 수 없습니다.<br>
		아이디 : <input type="text" name="userId"><br>
		비밀번호 : <input type="password" name="userPw"><br>
		전화번호 : <input type="text" name="phone"><br>
		이메일 : <input type="text" name="email"><br>
		<input type="submit" value="회원 정보 수정">
	</form>
</body>
</html>