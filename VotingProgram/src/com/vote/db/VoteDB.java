package com.vote.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class VoteDB {
	public static Connection getConnection() throws Exception { //데이터베이스에 연결하기 위한 메서드
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@oracle.interstander.com:41521:XE", "green03", "1234");
		return con;
	}
	
	public static void close(Connection con, Statement stmt) { //데이터베이스에 연결하기위해 사용한 메서드를 닫는 메서드
		try {
			if (con != null)con.close();
			if (stmt != null)stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection con, Statement stmt, ResultSet rs) {
		try {
			if (con != null)con.close();
			if (stmt != null)stmt.close();
			if (rs != null)rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}