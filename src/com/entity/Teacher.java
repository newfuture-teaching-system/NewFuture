package com.entity;

import java.util.List;

public class Teacher {
private String teacherId;
private String teacherName;
private int teacherSex;
private int teacherAge;
private TeacherCourse teacherCourse;
public String getTeacherId() {
	return teacherId;
}
public void setTeacherId(String teacherId) {
	this.teacherId = teacherId;
}
public String getTeacherName() {
	return teacherName;
}
public void setTeacherName(String teacherName) {
	this.teacherName = teacherName;
}
public int getTeacherSex() {
	return teacherSex;
}
public void setTeacherSex(int teacherSex) {
	this.teacherSex = teacherSex;
}
public int getTeacherAge() {
	return teacherAge;
}
public void setTeacherAge(int teacherAge) {
	this.teacherAge = teacherAge;
}
public TeacherCourse getTeacherCourse() {
	return teacherCourse;
}
public void setTeacherCourse(TeacherCourse teacherCourse) {
	this.teacherCourse = teacherCourse;
}


}
