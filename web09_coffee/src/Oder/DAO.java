package Oder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Oder.DAO;

public class DAO {
	private DAO(){}
	
	private static DAO dao = new DAO();
	
	public static DAO getInstance() {
		return dao;
	}
	
	public Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
		Connection conn = ds.getConnection();
		return conn;
	}
	
	public Coffee getCoffee(String cname, String size, int ea) {
		Coffee coffee = new Coffee();
		String csize;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		String sql = "select * from coffee where cname=?";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cname);

			rs = psmt.executeQuery();

			if (rs.next()) {
				coffee.setCname(rs.getString("cname"));
				
				if (size.equals("ts")) {
					csize = "톨";
					coffee.setPrice((rs.getInt("tprice")*ea));
				} else if (size.equals("gs")) {
					csize = "그란데";
					coffee.setPrice((rs.getInt("gprice")*ea));
				} else {
					csize = "벤티";
					coffee.setPrice((rs.getInt("vprice")*ea));
				}
				coffee.setSize(csize);
				coffee.setEa(ea);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (psmt != null)psmt.close();
				if (conn != null)conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return coffee;
	}
}