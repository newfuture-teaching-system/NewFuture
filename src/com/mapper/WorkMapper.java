package com.mapper;

import java.util.List;

import com.entity.User;
import com.entity.Work;

public interface WorkMapper {
	public User selectWork(Work work) ;
	public List<User> getWorkInfo();
	public Work workContentInfo(String id,String courseId,String workId);
	public List<Work> selectCourseWork(String courseId,String studentId);
	public Work selectStudentWork(String studentId,int workId);
	public void updateStudentWork(Work work);
	public void saveWork(String studentId,String workContent,String workId);
}
