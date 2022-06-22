package com.server.course.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.server.course.vo.CourseVo;
import com.server.course.vo.LecturerVo;
import com.server.db.DBManager;

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
		
	}
	
	
	
	
	
}