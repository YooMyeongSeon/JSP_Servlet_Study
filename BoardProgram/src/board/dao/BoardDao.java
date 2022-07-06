package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import board.db.DBManager;
import board.vo.BoardVo;

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
	
	
	
	
	
}