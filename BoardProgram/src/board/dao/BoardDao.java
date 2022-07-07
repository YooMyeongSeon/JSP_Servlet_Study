package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import board.db.DBManager;
import board.vo.BoardVo;
import board.vo.commentVo;

public class BoardDao {
	private BoardDao() {}
	
	private static BoardDao dao = new BoardDao();
	
	public static BoardDao getInstance() {
		return dao;
	}

	public List<BoardVo> boardList() {
		List<BoardVo> list = new ArrayList<>();
		
		String sql = "select * from board_tbl";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				BoardVo bVo = new BoardVo();
				
				bVo.setIdx(rs.getInt("idx"));
				bVo.setWriter(rs.getString("writer"));
				bVo.setSubject(rs.getString("subject"));
				bVo.setContent(rs.getString("content"));
				bVo.setRegdate(rs.getString("regdate"));
				
				list.add(bVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}

	public BoardVo boardByIdx(int idx) {
		BoardVo bVo = null;
		
		String sql = "select * from board_tbl where idx=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				bVo = new BoardVo();
				
				bVo.setIdx(rs.getInt("idx"));
				bVo.setWriter(rs.getString("writer"));
				bVo.setSubject(rs.getString("subject"));
				bVo.setContent(rs.getString("content"));
				bVo.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt, rs);
		}
		return bVo;
	}
	
	public List<commentVo> commentList(int idx) {
		List<commentVo> list = new ArrayList<>();
		
		String sql = "select * from comment_tbl where bidx=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				commentVo cVo = new commentVo();
				
				cVo.setIdx(rs.getInt("idx"));
				cVo.setWriter(rs.getString("writer"));
				cVo.setContent(rs.getString("content"));
				cVo.setRegdate(rs.getString("regdate"));
				
				list.add(cVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt, rs);
		}
		return list;
	}

	public void boardWrite(BoardVo bVo) {
		String sql = "insert into board_tbl values (board_seq.nextval, ?, ?, ?, sysdate)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, bVo.getWriter());
			psmt.setString(2, bVo.getSubject());
			psmt.setString(3, bVo.getContent());
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt);
		}
	}

	public void boardUpdate(BoardVo bVo) {
		String sql = "update board_tbl set writer=?, subject=?, content=? where idx=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, bVo.getWriter());
			psmt.setString(2, bVo.getSubject());
			psmt.setString(3, bVo.getContent());
			psmt.setInt(4, bVo.getIdx());
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt);
		}
	}

	public void boardDelete(int idx) {
		String sql = "delete from board_tbl where idx=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt);
		}
	}
	
	
	
	
	
}