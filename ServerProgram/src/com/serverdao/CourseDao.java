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

	
	
	
	
	
}