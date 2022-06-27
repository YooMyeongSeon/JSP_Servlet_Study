package com.vote.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.vote.db.VoteDB;
import com.vote.vo.VoteVo;

public class VoteDao {
	private VoteDao() {}
	
	private static VoteDao dao = new VoteDao();
	
	public static VoteDao getInstance() {
		return dao;
	}
	
	public List<VoteVo> selectVote() {
		List<VoteVo> list = new ArrayList<>();
		
		String sql = "SELECT * FROM TBL_VOTE_202005";
		
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
				vVo.setV_Area(rs.getString("V_AREA"));
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
	
	
	
	
	
}