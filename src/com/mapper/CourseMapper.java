package com.mapper;

import java.util.List;

import com.entity.CatalogOne;
import com.entity.Course;
import com.entity.User;

public interface CourseMapper {
	public User selectCourse(Course course) ;
	public List<User> getCourseInfo();
	public List<Course> selectStrCourseInfo(String id);
	public List<Course> searchCourses(String name);
	public List<Course> selectAllCourse();
	public List<Course> selectCourseByFlag(int flag);
	public Course selectCatalogOne(String courseId);
//查询教师课程
	public List<Course> selectTeacherCourse(String teacherId);
	public int addCourse(Course course);
	public Course selectCourseById(Course course);
	public Course selectCatalogAll(String courseId);
	public void addCatalogOne(String courseId,String catalogOneId,int num,String catalogOneName,String content);
	public void addCatalogTwo(String courseId,String catalogOneId,String catalogTwoId,int num,String catalogTwoName,String content);

}
