package com.vote.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.vote.db.VoteDB;
import com.vote.vo.MemberVO;
import com.vote.vo.RankVo;
import com.vote.vo.VoteVo;

public class VoteDao { //데이터 베이스와 연결하여 동작하는 클래스, 싱글턴 패턴으로 구성
	private VoteDao() {}
	
	private static VoteDao dao = new VoteDao();
	
	public static VoteDao getInstance() {
		return dao;
	}
	
	public List<VoteVo> selectVote() { //투표검수조회 기능
		List<VoteVo> list = new ArrayList<>();
		
		String sql = "SELECT * FROM TBL_VOTE_202005 WHERE V_AREA='제1투표장'"; //제1투표장에서 투표한 인원들만 조회
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = VoteDB.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				VoteVo vVo = new VoteVo();
				
				vVo.setV_Jumin(rs.getString("V_JUMIN"));
				vVo.setV_Name(rs.getString("V_NAME"));
				vVo.setM_No(rs.getInt("M_NO"));
				vVo.setV_Time(rs.getString("V_TIME"));
				vVo.setV_Confirm(rs.getString("V_CONFIRM"));
				
				list.add(vVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			VoteDB.close(con, stmt, rs);
		}
		return list;
	}

	public List<MemberVO> selectMember() { //후보조회, 투표하기의 후보 항목을 불러오는 기능
		List<MemberVO> list = new ArrayList<>();
		
		String sql = "SELECT * FROM TBL_MEMBER_202005 M JOIN TBL_PARTY_202005 P ON M.P_CODE = P.P_CODE"; //후보 테이블과 정당 테이블을 조인하여 조회
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = VoteDB.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				MemberVO mVo = new MemberVO();
				
				mVo.setM_No(rs.getInt("M_NO"));
				mVo.setM_Name(rs.getString("M_NAME"));
				mVo.setP_School(rs.getInt("P_SCHOOL"));
				mVo.setM_Jumin(rs.getString("M_JUMIN"));
				mVo.setM_City(rs.getString("M_CITY"));
				mVo.setP_Name(rs.getString("P_Name"));
				mVo.setP_Tel1(rs.getString("P_Tel1"));
				mVo.setP_Tel2(rs.getString("P_Tel2"));
				mVo.setP_Tel3(rs.getString("P_Tel3"));
				
				list.add(mVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			VoteDB.close(con, stmt, rs);
		}
		return list;
	}

	public void addVote(VoteVo vVo) { //투표를 저장하는 기능
		String sql = "INSERT INTO TBL_VOTE_202005 VALUES(?, ?, ?, ?, ?, ?)"; //받아온 정보들을 테이블에 저장
		
		Connection con = null;
		PreparedStatement psmt = null;
		
		try {
			con = VoteDB.getConnection();
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, vVo.getV_Jumin());
			psmt.setString(2, vVo.getV_Name());
			psmt.setInt(3, vVo.getM_No());
			psmt.setString(4, vVo.getV_Time());
			psmt.setString(5, vVo.getV_Area());
			psmt.setString(6, vVo.getV_Confirm());
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			VoteDB.close(con, psmt);
		}
	}
	
	public List<RankVo> getVoteRanking() { //후보자등수 조회 기능
		List<RankVo> list = new ArrayList<>();
		
		//카운트, 조인, 그룹을 이용해 총투표건수 등수 조회  
		String sql = "SELECT m.m_no, m.m_name, count(v.m_no) as voting " + 
				" FROM TBL_MEMBER_202005 m LEFT OUTER JOIN TBL_VOTE_202005 v " + 
				" ON v.m_no = m.m_no " + 
				" WHERE v.v_CONFIRM ='Y' " + //투표이력테이블(TBL_VOTE_202005 v)의 '유권자항목' 데이터가 'Y'인 데이터 건수 출력
				" GROUP BY m.m_no, m.m_name " + 
				" ORDER BY count(v.m_no) DESC"; //총투표건수 내림차순
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = VoteDB.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				RankVo rVo = new RankVo();
				
				rVo.setM_no(rs.getInt("m_no"));
				rVo.setM_name(rs.getString("m_name"));
				rVo.setVoteCount(rs.getInt("voting"));
				
				list.add(rVo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			VoteDB.close(conn, stmt, rs);
		}
		return list;
	}
}