package com.entity;

import java.util.Date;

public class Work {
	private int id;
	private String workId;
	private String studentId;
	private String workContent;
	private Date workSubmitTime;
	private Date workCheckTime;
	private int workState;
	private Course course;
	private StuCourse stuCourse;
	private Student student;
	private User user;
	private WorkOneTwo workOneTwo;
	private String workCheckContent;

	
	public WorkOneTwo getWorkOneTwo() {
		return workOneTwo;
	}
	public void setWorkOneTwo(WorkOneTwo workOneTwo) {
		this.workOneTwo = workOneTwo;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public StuCourse getStuCourse() {
		return stuCourse;
	}
	public void setStuCourse(StuCourse stuCourse) {
		this.stuCourse = stuCourse;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getWorkCheckContent() {
		return workCheckContent;
	}
	public void setWorkCheckContent(String workCheckContent) {
		this.workCheckContent = workCheckContent;
	}

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWorkId() {
		return workId;
	}
	public void setWorkId(String workId) {
		this.workId = workId;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	

	public String getWorkContent() {
		return workContent;
	}
	public void setWorkContent(String workContent) {
		this.workContent = workContent;
	}
	public Date getWorkSubmitTime() {
		return workSubmitTime;
	}
	public void setWorkSubmitTime(Date workSubmitTime) {
		this.workSubmitTime = workSubmitTime;
	}
	public Date getWorkCheckTime() {
		return workCheckTime;
	}
	public void setWorkCheckTime(Date workCheckTime) {
		this.workCheckTime = workCheckTime;
	}
	public int getWorkState() {
		return workState;
	}
	public void setWorkState(int workState) {
		this.workState = workState;
	}
	
	
}
