package com.serverdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.server.db.DBManager;
import com.server.vo.CourseVo;
import com.server.vo.LecturerVo;

public class CourseDao {
	private CourseDao() {}
	
	private static CourseDao dao = new CourseDao();
	
	public static CourseDao getInstance() {
		return dao;
	}

	public List<CourseVo> selectAllCourse() {
		List<CourseVo> list = new ArrayList<>();

		String sql = "select id, c.name cname, credit, lecturer, week, start_hour, end_hour, l.name lname from course_tbl c inner join lecturer_tbl l on c.lecturer = l.idx order by id";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				CourseVo cVo = new CourseVo();
				
				cVo.setId(rs.getString("id"));
				cVo.setName(rs.getString("cname"));
				cVo.setCredit(rs.getInt("credit"));
				cVo.setLecturer(rs.getInt("lecturer"));
				cVo.setWeek(rs.getInt("week"));
				cVo.setStart_hour(rs.getInt("start_hour"));
				cVo.setEnd_hour(rs.getInt("end_hour"));
				cVo.setLecturerName(rs.getString("lname"));
				
				list.add(cVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}

	public void addCourse(CourseVo cVo) {
		String sql = "insert into course_tbl values(?, ?, ?, ?, ?, ?, ?)";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			int weeknum = 0;
			
			if (cVo.getWeek().equals("월요일")) {
				weeknum = 1;
			} else if (cVo.getWeek().equals("화요일")) {
				weeknum = 2;
			} else if (cVo.getWeek().equals("수요일")) {
				weeknum = 3;
			} else if (cVo.getWeek().equals("목요일")) {
				weeknum = 4;
			} else if (cVo.getWeek().equals("금요일")) {
				weeknum = 5;
			} else {
				weeknum = 6;
			}
			
			psmt.setString(1, cVo.getId());
			psmt.setString(2, cVo.getName());
			psmt.setInt(3, cVo.getCredit());
			psmt.setInt(4, cVo.getLecturer());
			psmt.setInt(5, weeknum);
			psmt.setInt(6, cVo.getStart_hour());
			psmt.setInt(7, cVo.getEnd_hour());
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt);
		}
	}

	public CourseVo selectCourseByNum(String id) {
		CourseVo cVo = null;
		
		String sql = "select id, c.name cname, credit, lecturer, week, start_hour, end_hour, l.name lname from course_tbl c inner join lecturer_tbl l on c.lecturer = l.idx where id=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				cVo = new CourseVo();
				
				cVo.setId(rs.getString("id"));
				cVo.setName(rs.getString("cname"));
				cVo.setCredit(rs.getInt("credit"));
				cVo.setLecturer(rs.getInt("lecturer"));
				cVo.setWeek(rs.getInt("week"));
				cVo.setStart_hour(rs.getInt("start_hour"));
				cVo.setEnd_hour(rs.getInt("end_hour"));
				cVo.setLecturerName(rs.getString("lname"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt, rs);
		}
		return cVo;
	}

	public void updateCourse(CourseVo cVo) {
		String sql = "update course_tbl set id=?, name=?, credit=?, lecturer=?, week=?, start_hour=?, end_hour=? where id=?";

		Connection conn = null;
		PreparedStatement psmt = null;

		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			int weeknum = 0;
			
			if (cVo.getWeek().equals("월요일")) {
				weeknum = 1;
			} else if (cVo.getWeek().equals("화요일")) {
				weeknum = 2;
			} else if (cVo.getWeek().equals("수요일")) {
				weeknum = 3;
			} else if (cVo.getWeek().equals("목요일")) {
				weeknum = 4;
			} else if (cVo.getWeek().equals("금요일")) {
				weeknum = 5;
			} else {
				weeknum = 6;
			}
			
			psmt.setString(1, cVo.getId());
			psmt.setString(2, cVo.getName());
			psmt.setInt(3, cVo.getCredit());
			psmt.setInt(4, cVo.getLecturer());
			psmt.setInt(5, weeknum);
			psmt.setInt(6, cVo.getStart_hour());
			psmt.setInt(7, cVo.getEnd_hour());
			psmt.setString(8, cVo.getOldId());
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt);
		}
	}

	public void deleteCourse(String id) {
		String sql = "delete from course_tbl where id=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt);
		}
	}

	public List<LecturerVo> selectAllLecturer() {
		List<LecturerVo> list = new ArrayList<>();

		String sql = "select * from lecturer_tbl";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				LecturerVo lVo = new LecturerVo();
				
				lVo.setIdx(rs.getInt("idx"));
				lVo.setName(rs.getString("name"));
				lVo.setMajor(rs.getString("major"));
				lVo.setField(rs.getString("field"));
				
				list.add(lVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}
	
	public int selectSeq() {
		int seq = 0;
		
		String sql = "SELECT LAST_NUMBER seq FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'LECTURER_SEQ'";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				seq = rs.getInt("seq");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return seq;
	}

	public void addLecturer(LecturerVo lVo) {
		String sql = "insert into lecturer_tbl values(LECTURER_SEQ.nextval, ?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, lVo.getName());
			psmt.setString(2, lVo.getMajor());
			psmt.setString(3, lVo.getField());
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt);
		}
	}

	public LecturerVo selectLecturerByNum(int idx) {
		LecturerVo lVo = null;
		
		String sql = "select * from lecturer_tbl where idx=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				lVo = new LecturerVo();
				
				lVo.setIdx(rs.getInt("idx"));
				lVo.setName(rs.getString("name"));
				lVo.setMajor(rs.getString("major"));
				lVo.setField(rs.getString("field"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt, rs);
		}
		return lVo;
	}

	public void updateLecturer(LecturerVo lVo) {
		String sql = "update lecturer_tbl set name=?, Major=? where idx=?";

		Connection conn = null;
		PreparedStatement psmt = null;

		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, lVo.getName());
			psmt.setString(2, lVo.getMajor());
			psmt.setInt(3, lVo.getIdx());
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, psmt);
		}
	}
	
	public void deleteLecturer(int idx) {
		String sql = "delete from lecturer_tbl where idx=?";
		
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