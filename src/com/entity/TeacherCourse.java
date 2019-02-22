package com.entity;

import java.sql.Date;

public class TeacherCourse {
private String teacherId;
private String courseId;
private Date startLessonTime;
public String getTeacherId() {
	return teacherId;
}
public void setTeacherId(String teacherId) {
	this.teacherId = teacherId;
}
public String getCourseId() {
	return courseId;
}
public void setCourseId(String courseId) {
	this.courseId = courseId;
}
public Date getStartLessonTimeDate() {
	return startLessonTime;
}
public void setStartLessonTimeDate(Date startLessonTime) {
	this.startLessonTime = startLessonTime;
}

}
