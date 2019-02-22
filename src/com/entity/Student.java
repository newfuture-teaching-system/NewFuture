package com.entity;

public class Student {
	private String studentId;
	private String studentName;
	private int studentSex;
	private int studentAge;
	private User user;
	private StuCourse stuCourse;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public int getStudentSex() {
		return studentSex;
	}
	public void setStudentSex(int studentSex) {
		this.studentSex = studentSex;
	}
	public int getStudentAge() {
		return studentAge;
	}
	public void setStudentAge(int studentAge) {
		this.studentAge = studentAge;
	}
	public StuCourse getStuCourse() {
		return stuCourse;
	}
	public void setStuCourse(StuCourse stuCourse) {
		this.stuCourse = stuCourse;
	}
	
	
	
}
