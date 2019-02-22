package com.entity;

import java.util.Date;

public class Question {
	private String studentId;
	private String teacherId;
	private String courseId;
	private int questionId;
	private String question;
	private Date questionTime;
	private String answer;
	private Date answerTime;
	private String questionTitle;
	private int questionState;
	private Course course;
	private StuCourse stuCourse;
	private Student student;
	private User user;
	private Work work;
	
	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public StuCourse getStuCourse() {
		return stuCourse;
	}

	public void setStuCourse(StuCourse stuCourse) {
		this.stuCourse = stuCourse;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Work getWork() {
		return work;
	}

	public void setWork(Work work) {
		this.work = work;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

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

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Date getQuestionTime() {
		return questionTime;
	}

	public void setQuestionTime(Date questionTime) {
		this.questionTime = questionTime;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getAnswerTime() {
		return answerTime;
	}

	public void setAnswerTime(Date answerTime) {
		this.answerTime = answerTime;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public int getQuestionState() {
		return questionState;
	}

	public void setQuestionState(int questionState) {
		this.questionState = questionState;
	}

}
