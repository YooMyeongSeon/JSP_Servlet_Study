<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PreparedStatement</title>
</head>
<body>
	<%!
		Connection conn = null;
		PreparedStatement psmt = null;
		
		String url = "jdbc:oracle:thin:@oracle.interstander.com:41521:XE";
		String uId = "green03";
		String uPw = "1234";
		
		String name = "강길동";
		String userid = "kang";
		String userpw = "1234";
		String email = "kang@naver.com";
		String phone = "010-1234-5678";
		int admin = 0;
	%>
	
	<%
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,uId,uPw);
			
			//1. 미완성된 쿼리를 매개로 준다.
			String sql = "insert into member values(?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			
			//2. 미완성된 쿼리를 채워 넣는다.
			psmt.setString(1, name);
			psmt.setString(2, userid);
			psmt.setString(3, userpw);
			psmt.setString(4, email);
			psmt.setString(5, phone);
			psmt.setInt(6, admin);
			
			//3. 쿼리문 실행(이미 완성된 쿼리가 있음으로 쿼리를 넣으면 안됨)
			int num = psmt.executeUpdate();
			System.out.println("바뀐 행의 갯수 : " + num);
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