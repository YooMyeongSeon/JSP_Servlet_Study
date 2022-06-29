package com.vote.vo;

public class MemberVO { //후보 조회와 투표하기의 후보 목록 조회에 사용
	private int m_No;
	private String m_Name;
	private int p_School;
	private String m_Jumin;
	private String m_City;
	private String p_Name;
	private String p_Tel1;
	private String p_Tel2;
	private String p_Tel3;
	
	public int getM_No() {
		return m_No;
	}
	public void setM_No(int m_No) {
		this.m_No = m_No;
	}
	public String getM_Name() {
		return m_Name;
	}
	public void setM_Name(String m_Name) {
		this.m_Name = m_Name;
	}
	public int getP_School() {
		return p_School;
	}
	public void setP_School(int p_School) {
		this.p_School = p_School;
	}
	public String getM_Jumin() {
		return m_Jumin;
	}
	public void setM_Jumin(String m_Jumin) {
		this.m_Jumin = m_Jumin;
	}
	public String getM_City() {
		return m_City;
	}
	public void setM_City(String m_City) {
		this.m_City = m_City;
	}
	public String getP_Name() {
		return p_Name;
	}
	public void setP_Name(String p_Name) {
		this.p_Name = p_Name;
	}
	public String getP_Tel1() {
		return p_Tel1;
	}
	public void setP_Tel1(String p_Tel1) {
		this.p_Tel1 = p_Tel1;
	}
	public String getP_Tel2() {
		return p_Tel2;
	}
	public void setP_Tel2(String p_Tel2) {
		this.p_Tel2 = p_Tel2;
	}
	public String getP_Tel3() {
		return p_Tel3;
	}
	public void setP_Tel3(String p_Tel3) {
		this.p_Tel3 = p_Tel3;
	}
}