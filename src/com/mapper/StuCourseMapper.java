package com.mapper;

import java.util.List;

import com.entity.StuCourse;
import com.entity.User;

public interface StuCourseMapper {
	public User selectStuCourse(StuCourse stuCourse);

	public List<User> getStuCourseInfo();
	public StuCourse selectStuCourseById(String courdeId,String studentId);
	public StuCourse selectProgress(String courseId,String studentId);

}
