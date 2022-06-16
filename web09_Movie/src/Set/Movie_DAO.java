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

	public void AddMovie(Movie movie) {		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		String sql = "insert into movie values(?,?,?,?,?)";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, movie.getCode());
			psmt.setString(2, movie.getMname());
			psmt.setString(3, movie.getDirector());
			psmt.setString(4, movie.getMain());
			psmt.setInt(5, movie.getPrice());
			
			psmt.executeUpdate();
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
	}

	public Movie getInMovie(String mname) {
		Movie movie = new Movie();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "select * from movie where mname=?";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setNString(1, mname);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				movie.setCode(rs.getInt("code"));
				movie.setMname(rs.getString("mname"));
				movie.setDirector(rs.getString("director"));
				movie.setMain(rs.getString("main"));
				movie.setPrice(rs.getInt("price"));
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
		return movie;
	}

	public void ReMovie(int code) {
		Connection conn = null;
		PreparedStatement psmt = null;
		
		String sql = "delete from movie where code=?";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, code);
			psmt.executeUpdate();
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
	}

	public void UpdateMovie(Movie movie) {
		Connection conn = null;
		PreparedStatement psmt = null;
		
		String sql = "update movie set mname=?, director=?, main=?, price=? where code=?";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, movie.getMname());
			psmt.setString(2, movie.getDirector());
			psmt.setString(3, movie.getMain());
			psmt.setInt(4, movie.getPrice());
			psmt.setInt(5, movie.getCode());
			
			psmt.executeUpdate();
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
	}
}