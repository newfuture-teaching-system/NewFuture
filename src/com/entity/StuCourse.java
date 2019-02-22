package com.entity;

import java.util.Date;

public class StuCourse {
	private String studentId;
	private String courseId;
	private Date signUpTime;
	private Date startTime;
	private String teacherName;
	private String courseProgress;
	
	
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public Date getSignUpTime() {
		return signUpTime;
	}
	public void setSignUpTime(Date signUpTime) {
		this.signUpTime = signUpTime;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getCourseProgress() {
		return courseProgress;
	}
	public void setCourseProgress(String courseProgress) {
		this.courseProgress = courseProgress;
	}
	
	
}
