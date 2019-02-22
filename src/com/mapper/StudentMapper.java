package com.mapper;

import java.util.List;

import com.entity.Student;
import com.entity.User;

public interface StudentMapper {
	public User selectStudent(Student student) ;
	public List<User> getStudentInfo();
	public Student changeStudent(String id);
	public void updateStudent(Student student); 
	public int addStudent(User user) ;
	//通过课程id查询学生
	public List<Student> selectCourseStudent(String courseId);
}
