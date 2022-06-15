package com.green.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.green.VO.Member_Vo;

public class Member_DAO { //데이터베이스 연동을 위한 클래스(※싱글톤 패턴으로 구성)
	
	//1. 생성자 차단
	private Member_DAO(){}
	
	//2. 클래스 내부에 인스턴스 생성
	private static Member_DAO dao = new Member_DAO();
	
	//3. 만들어진 인스턴스를 꺼내쓰기 위한 메서드 생성
	public static Member_DAO getInstance() {
		return dao;
	}
	
	//4. 데이터베이스 연결 객체를 생성하기 위한 메서드 생성
	public Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
		Connection conn = ds.getConnection();
		return conn;
	}
	
	//5. 아이디 정보를 통해서 회원 정보를 찾는 메서드 생성
	
	//6. 사용자 인증 처리 메서드 생성
	public int userCheck(String userId, String userPw) {
		int result = -1;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "select userpw from member where userid=?";
				
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setNString(1, userId);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				if (rs.getString("userpw") != null && rs.getString("userpw").equals(userPw)) {
					result = 1; //로그인 성공
				} else {
					result = 0; //비밀번호가 틀리거나, null인 경우
				}
			} else {
				result = -1; //아이디를 찾을 수 없는 경우
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
		return result;
	}
	
	//7. 아이디를 가지고 회원 정보를 가져오는 메서드 생성
	public Member_Vo getMember(String userId) {
		Member_Vo mVo = null;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member where userid=?";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setNString(1, userId);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				mVo = new Member_Vo();
				mVo.setName(rs.getString("name"));
				mVo.setUserId(rs.getString("userid"));
				mVo.setUserPw(rs.getString("userpw"));
				mVo.setEmail(rs.getString("email"));
				mVo.setPhone(rs.getString("phone"));
				mVo.setAdmin(rs.getInt("admin"));
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
		
		return mVo;
		
	}
	//8. 회원 가입을 처리할 메서드 생성
	public int insertMember(Member_Vo mVo) {
		int result = -1;

		Connection conn = null;
		PreparedStatement psmt = null;
		
		String sql = "insert into member values(?,?,?,?,?,?)";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, mVo.getName());
			psmt.setString(2, mVo.getUserId());
			psmt.setString(3, mVo.getUserPw());
			psmt.setString(4, mVo.getEmail());
			psmt.setString(5, mVo.getPhone());
			psmt.setInt(6, mVo.getAdmin());
			
			result = psmt.executeUpdate();
			
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
		return result;
	}
	
	//9. 아이디 중복을 체크하는 메서드 생성
	public int confirmId(String userId) {
		int result = -1;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "select userid from member where userid=?";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, userId);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) { //중복된 아이디가 존재
				result = 1;
			} else { //중복된 아이디가 존재하지 않음(사용 가능한 아이디)
				result = -1;
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
		return result;
	}

	public int updateMember(Member_Vo mVo) {
		int result = -1;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		String sql = "UPDATE member SET userpw=?, email=?, phone=?, admin=? WHERE userid=?";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, mVo.getUserPw());
			psmt.setString(2, mVo.getEmail());
			psmt.setString(3, mVo.getPhone());
			psmt.setInt(4, mVo.getAdmin());
			psmt.setString(5, mVo.getUserId());
			
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(psmt!=null)psmt.close();
				if(conn!=null)conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}