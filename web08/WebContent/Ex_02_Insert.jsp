<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 삽입</title>
</head>
<body>
	<%!
		Connection conn = null;
		Statement stmt = null;
		
		String url = "jdbc:oracle:thin:@oracle.interstander.com:41521:XE";
		String uId = "green03";
		String uPw = "1234";
		
		//삽입할 데이터 준비
		String name = "최길동";
		String userid = "choi";
		String userpw = "1234";
		String email = "choi@naver.com";
		String phone = "010-1234-5678";
		int admin = 0;
	%>
	
	<%
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,uId,uPw);
			stmt = conn.createStatement();
			
			String sql = "INSERT INTO member "+ 
   						 " VALUES ('"+name+"','"+userid+"','"+userpw+"','"+email+"','"+phone+"',"+admin+")";
			int num = stmt.executeUpdate(sql); //int 형태로 횟수가 출력된다.
			System.out.println("바뀐 행의 갯수 : " + num);
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