package com.mapper;

import java.util.List;

import com.entity.Teacher;
import com.entity.User;

public interface TeacherMapper {
	public Teacher selectTeacherByCourseId(String courseId);
	public Teacher selectTeacherInfo(String id);
	public void updateTeacher(Teacher teacher);
	public int addTeacher(User user);
	public int addTeaCourse(String teacherId,String courseId);
	public Teacher selectTeacherById(String teacherId) ;
	
}
