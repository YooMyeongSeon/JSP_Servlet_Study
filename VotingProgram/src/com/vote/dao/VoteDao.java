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

public class VoteDao {
	private VoteDao() {}
	
	private static VoteDao dao = new VoteDao();
	
	public static VoteDao getInstance() {
		return dao;
	}
	
	public List<VoteVo> selectVote() {
		List<VoteVo> list = new ArrayList<>();
		
		String sql = "SELECT * FROM TBL_VOTE_202005 WHERE V_AREA='제1투표장'";
		
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

	public List<MemberVO> selectMember() {
		List<MemberVO> list = new ArrayList<>();
		
		String sql = "SELECT * FROM TBL_MEMBER_202005 M JOIN TBL_PARTY_202005 P ON M.P_CODE = P.P_CODE";
		
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
				mVo.setP_Tel1(rs.getInt("P_Tel1"));
				mVo.setP_Tel2(rs.getInt("P_Tel2"));
				mVo.setP_Tel3(rs.getInt("P_Tel3"));
				
				list.add(mVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			VoteDB.close(con, stmt, rs);
		}
		return list;
	}

	public void addVote(VoteVo vVo) {
		String sql = "INSERT INTO TBL_VOTE_202005 VALUES(?, ?, ?, ?, ?, ?)";
		
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
	
	public List<RankVo> getVoteRanking() {
		List<RankVo> list = new ArrayList<>();
		
		String sql = "SELECT v.m_no, m.m_name, count(v.m_no) as voting " + 
				" FROM TBL_VOTE_202005 v INNER JOIN TBL_MEMBER_202005 m " + 
				" ON v.m_no = m.m_no " + 
				" WHERE v.V_CONFIRM = 'Y' " + 
				" GROUP BY v.m_no, m.m_name " + 
				" ORDER BY count(v.m_no) DESC";
		
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