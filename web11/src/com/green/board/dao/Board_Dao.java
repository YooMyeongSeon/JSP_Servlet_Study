package com.green.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.green.board.db.DBManager;
import com.green.board.vo.Board_Vo;

public class Board_Dao {
	private Board_Dao() {}
	
	private static Board_Dao dao = new Board_Dao();
	
	public static Board_Dao getInstance() {
		return dao;
	}
	
	//----------
	
	public List<Board_Vo> selectAllBoards() {
		List<Board_Vo> list = new ArrayList<>();
		
		String sql = "select * from board order by num desc";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				Board_Vo bVo = new Board_Vo();
				
				bVo.setNum(rs.getInt("num"));
				bVo.setPw(rs.getString("pw"));
				bVo.setName(rs.getString("name"));
				bVo.setEmail(rs.getString("email"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setReadCount(rs.getInt("readCount"));
				bVo.setWriteDate(rs.getTimestamp("writeDate"));
				
				list.add(bVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}

	public void InsertBoard(Board_Vo bVo) {
		String sql = "insert into board(num, name, pw, email, title, content) values (board_seq.nextval, ?, ?, ?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, bVo.getName());
			psmt.setString(2, bVo.getPw());
			psmt.setString(3, bVo.getEmail());
			psmt.setString(4, bVo.getTitle());
			psmt.setString(5, bVo.getContent());
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt);
		}
	}

	public Board_Vo selectBoardByNum(int num) {
		Board_Vo bVo = null;
		
		String sql = "select * from board where num=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				bVo = new Board_Vo();
				
				bVo.setNum(rs.getInt("num"));
				bVo.setPw(rs.getString("pw"));
				bVo.setName(rs.getString("name"));
				bVo.setEmail(rs.getString("email"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setReadCount(rs.getInt("readCount"));
				bVo.setWriteDate(rs.getTimestamp("writeDate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt, rs);
		}
		return bVo;
	}

	public void UpdateReadCount(int num) {
		String sql = "update board set readCount = readCount + 1 where num=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt);
		}
	}

	public boolean chekPassword(int num, String pw) {
		Board_Vo bVo = selectBoardByNum(num); 
		
		if (bVo.getPw().equals(pw)) {
			return true;
		} else {
			return false;
		}
	}

	public void BoardDelete(int num) {		
		String sql = "delete from board where num=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt);
		}
	}

	public void UpdateBoard(Board_Vo bVo) {
		String sql = "update Board set pw=?, name=?, email=?, title=?, content=? where num=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, bVo.getPw());
			psmt.setString(2, bVo.getName());
			psmt.setString(3, bVo.getEmail());
			psmt.setString(4, bVo.getTitle());
			psmt.setString(5, bVo.getContent());
			psmt.setInt(6, bVo.getNum());
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt);
		}
	}
	
	public List<Board_Vo> selectTargetBoard(int section, int page) {
		List<Board_Vo> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "select * from(select rownum as nick, num, name, email, pw, title, content, readcount, writedate from(select * from board order by num desc)) " +
					 "where nick BETWEEN (? - 1) * 100 + (? - 1) * 10 + 1 and (? - 1) * 100 + ? * 10";
	
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, section);
			psmt.setInt(2, page);
			psmt.setInt(3, section);
			psmt.setInt(4, page);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				Board_Vo bVo = new Board_Vo();
				
				bVo.setNum(rs.getInt("num"));
				bVo.setPw(rs.getString("pw"));
				bVo.setName(rs.getString("name"));
				bVo.setEmail(rs.getString("email"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setReadCount(rs.getInt("readCount"));
				bVo.setWriteDate(rs.getTimestamp("writeDate"));
				
				list.add(bVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt, rs);
		}
		return list;
	}
	
	public int selectAllBoardNumber() {
		int cntAll = 0;
		String sql = "select count(*) from board";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				cntAll = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return cntAll;
	}
	
	
	
	
	
}