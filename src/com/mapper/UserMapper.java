package com.mapper;

import java.util.List;

import com.entity.User;

public interface UserMapper {
	public User selectUser(User user);

	public List<User> getStuCourseInfo(String id);// 学生课程作业情况

	public int addStudent(User user);

	public User selectUserById(User user);

	public List<User> getQuestionInfo(String id);// 学生疑问信息
	
	public void changeUserInfo(User user);
	
	public void addStuCourse(String studentId,String courseId,String time,String teacherName);
	
	public int addTeacher(User user);

}
