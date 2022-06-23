package com.server.vo;

public class CourseVo {
	private String id;
	private String name;
	private int credit;
	private int lecturer;
	private String week;
	private int start_hour;
	private int end_hour;
	private String lecturerName;
	private String oldId;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public int getLecturer() {
		return lecturer;
	}
	public void setLecturer(int lecturer) {
		this.lecturer = lecturer;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(int week) {
		String r_week;
		
		if (week == 1) {
			r_week = "월요일";
		} else if (week == 2) {
			r_week = "화요일";
		} else if (week == 3) {
			r_week = "수요일";
		} else if (week == 4) {
			r_week = "목요일";
		} else if (week == 5) {
			r_week = "금요일";
		} else {
			r_week = "토요일";
		}
		
		this.week = r_week;
	}
	public int getStart_hour() {
		return start_hour;
	}
	public void setStart_hour(int start_hour) {
		this.start_hour = start_hour;
	}
	public int getEnd_hour() {
		return end_hour;
	}
	public void setEnd_hour(int end_hour) {
		this.end_hour = end_hour;
	}
	public String getLecturerName() {
		return lecturerName;
	}
	public void setLecturerName(String lecturerName) {
		this.lecturerName = lecturerName;
	}
	public String getOldId() {
		return oldId;
	}
	public void setOldId(String oldId) {
		this.oldId = oldId;
	}
}