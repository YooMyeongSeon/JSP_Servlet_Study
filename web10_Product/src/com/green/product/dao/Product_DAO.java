package com.green.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.green.product.vo.Product_Vo;

public class Product_DAO {
	private Product_DAO() {}
	private static Product_DAO dao = new Product_DAO();
	public static Product_DAO getInstance() {
		return dao;
	}
	
	public Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
		Connection conn = ds.getConnection();
		return conn;
	}
	
	public void close(Connection conn, Statement stmt) { //PreparedStatement는 다형성으로 Statement로 처리할 수 있다.
		try {
			if (conn != null)conn.close();
			if (stmt != null)stmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if (conn != null)conn.close();
			if (stmt != null)stmt.close();
			if (rs != null)rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Product_Vo> selectAllProduct() {
		List<Product_Vo> list = new ArrayList<>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from producttbl order by code DESC";
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Product_Vo pVo = new Product_Vo();
				
				pVo.setCode(rs.getInt("code"));
				pVo.setName(rs.getString("name"));
				pVo.setPrice(rs.getInt("price"));
				pVo.setPictureurl(rs.getString("pictureurl"));
				pVo.setDescription(rs.getString("description"));
				
				list.add(pVo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, stmt, rs);
		}
		return list;
	}

	public void insertProduct(Product_Vo pVo) {
		Connection conn = null;
		PreparedStatement psmt = null;
		
		String sql = "insert into producttbl values(product_seq.nextval,?,?,?,?)";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, pVo.getName());
			psmt.setInt(2, pVo.getPrice());
			psmt.setString(3, pVo.getPictureurl());
			psmt.setString(4, pVo.getDescription());
			
			psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, psmt);
		}
	}

	public void deleteProduct(int code) {
		Connection conn = null;
		PreparedStatement psmt = null;
		
		String sql = "delete from producttbl where code=?";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, code);
		
			psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, psmt);
		}
	}

	public Product_Vo productUpdate(int code) {
		Product_Vo pVo = new Product_Vo();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "select * from producttbl where code=?";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, code);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				pVo.setCode(code);
				pVo.setName(rs.getString("name"));
				pVo.setPrice(rs.getInt("price"));
				pVo.setPictureurl(rs.getString("pictureurl"));
				pVo.setDescription(rs.getString("description"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, psmt, rs);
		}
		return pVo;
	}

	public void updateProduct(Product_Vo pVo) {
		Connection conn = null;
		PreparedStatement psmt = null;
		
		String sql = "update producttbl set name=?, price=?, pictureurl=?, description=? where code=?";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, pVo.getName());
			psmt.setInt(2, pVo.getPrice());
			psmt.setString(3, pVo.getPictureurl());
			psmt.setString(4, pVo.getDescription());
			psmt.setInt(5, pVo.getCode());
			
			psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, psmt);
		}
	}
}