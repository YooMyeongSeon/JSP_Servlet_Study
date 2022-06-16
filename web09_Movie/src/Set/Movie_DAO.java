package Set;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Set.Movie_DAO;

public class Movie_DAO {
	private Movie_DAO(){}
	
	private static Movie_DAO dao = new Movie_DAO();
	
	public static Movie_DAO getInstance() {
		return dao;
	}
	
	public Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
		Connection conn = ds.getConnection();
		return conn;
	}
	
	//1. 영화 목록의 영화 갯수를 구하는 메서드 생성
	public int getMovieEa() {
		int movieEa = 0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from movie";
				
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				movieEa += 1;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (stmt != null)stmt.close();
				if (conn != null)conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return movieEa;
	}

	public List<Movie> getMovie() {
		List<Movie> MovieList = new ArrayList<Movie>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from movie";
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				Movie movie = new Movie();
				
				movie.setCode(rs.getInt("code"));
				movie.setMname(rs.getString("mname"));
				movie.setDirector(rs.getString("director"));
				movie.setMain(rs.getString("main"));
				movie.setPrice(rs.getInt("price"));
				
				MovieList.add(movie);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)rs.close();
				if (stmt != null)stmt.close();
				if (conn != null)conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return MovieList;
	}
	
	
	
	
	
}