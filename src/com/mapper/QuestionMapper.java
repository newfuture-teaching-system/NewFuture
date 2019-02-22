package com.mapper;

import java.util.List;

import com.entity.Question;
import com.entity.User;

public interface QuestionMapper {
	public User selectQuestion(Question question) ;
	public List<User> getQuestionInfo();
	public Question getqueContentInfo(String id,int questionId);
	public void addQuestion (Question question);
	public List<Question> selectCourseQues(String studentId, String courseId);
	public Question getTeaQuesContentInfo(String studentId, int questionId);
	public void updateStudentQues(Question question);
}
