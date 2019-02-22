package com.entity;

import java.util.List;

public class Course {
	private String courseId;
	private String courseName;
	private String courseIntroduction;
	private int flag;
	private StuCourse stuCourse;//学生课程
	private List<CatalogOne> catalogOneList;
	
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public StuCourse getStuCourse() {
		return stuCourse;
	}
	public void setStuCourse(StuCourse stuCourse) {
		this.stuCourse = stuCourse;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseIntroduction() {
		return courseIntroduction;
	}
	public void setCourseIntroduction(String courseIntroduction) {
		this.courseIntroduction = courseIntroduction;
	}
	public List<CatalogOne> getCatalogOneList() {
		return catalogOneList;
	}
	public void setCatalogOneList(List<CatalogOne> catalogOneList) {
		this.catalogOneList = catalogOneList;
	}
	
	
	
	
	
}
