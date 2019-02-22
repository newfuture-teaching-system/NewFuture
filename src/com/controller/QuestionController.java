package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.Question;
import com.entity.Teacher;
import com.entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.QuestionMapper;
import com.mapper.TeacherMapper;
import com.mapper.UserMapper;

@Controller
public class QuestionController {
	@Autowired
	private UserMapper userService;
	@Autowired
	private QuestionMapper questionService;
	@Autowired
	private TeacherMapper TeacherMapper;
	/**
	 * 褰撳墠瀛︾敓鐢ㄦ埛闂涓�瑙�
	 * @author  鍒樻檽瀹�
	 * 鏃堕棿   2019/1/28
	 */
	@RequestMapping("view/question.do")
	public String getQuestionInfo(HttpServletRequest request,HttpServletResponse response,User user) {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		System.out.println("yonghu id:"+id);
		int page=Integer.parseInt(request.getParameter("page"));
		if (page==1||page==0) {
			PageHelper.startPage(page,5);
		}
		else
		{
			PageHelper.startPage(page,5);
		}	
		List<User> queList = userService.getQuestionInfo(id);
		PageInfo pageInfo = new PageInfo<>(queList);
		session.setAttribute("queList", queList);
		session.setAttribute("pageInfo", pageInfo);
		return "question";
	}
	/**
	 * 褰撳墠闂鍐呭鍙婂洖澶嶄俊鎭煡鐪�
	 * @author  鍒樻檽瀹�
	 * 鏃堕棿   2019/1/28
	 */
	@RequestMapping("view/questionContent.do")
	public String getqueContentInfo(HttpServletRequest request,HttpServletResponse response,Question question){
		HttpSession session = request.getSession();
		int queId = Integer.valueOf(request.getParameter("questionId"));
		String id = request.getParameter("id");
		System.out.println("questId:"+queId);
		System.out.println("id::"+id);
		Question ques = questionService.getqueContentInfo(id,queId);
		System.out.println(ques.getQuestionId());
		session.setAttribute("ques", ques);
		return "questionContent";
	}
	//添加疑问
	@RequestMapping("view/addQuestion.do")
	public void addQuestion(HttpServletRequest request,HttpServletResponse response,Question question) throws IOException{
		
		questionService.addQuestion(question);
		System.out.println("测试1"+question.getQuestionTitle());
		System.out.println("测试1"+question.getTeacherId());response.setContentType("text/html; charset=UTF-8"); //转码
		PrintWriter out = response.getWriter();
		out.flush();
		out.println("<script>");
		out.println("alert('疑问提交成功');");
		out.println("history.back();");
		out.println("</script>");
	}
//	检索教师id
	@RequestMapping("view/selectTeacherId.do")
	public String selectTeacherId(HttpServletRequest request,HttpServletResponse response,String courseId){
		Teacher teacher = TeacherMapper.selectTeacherByCourseId(courseId);
		System.out.println("selectTeacherIdCourseId:"+courseId);
		System.out.println("selectTidTeacher:"+teacher);
		request.setAttribute("teacher", teacher);
		request.setAttribute("courseId", courseId);
		return "addQuestion";
	}
	//查看课程疑问
	@RequestMapping("view/tql.do")
	public String selectCourseQues(String courseId, String studentId, HttpServletRequest request) {
		System.out.println("查询作业cid：" + courseId);
		System.out.println("查询作业sid：" + studentId);
		List<Question> quesList = questionService.selectCourseQues(studentId, courseId);
		System.out.println("list：" + quesList.size());
		request.setAttribute("quesList", quesList);
		request.setAttribute("studentId", studentId);
		request.setAttribute("courseId", courseId);
		return "teacherQuestionList";
	}
	// 查看学生疑问
		@RequestMapping("view/checkStudentQues.do")
		public String checkStudentQues(HttpServletRequest request, int questionId, String studentId, String courseId) {
			System.out.println("studentId:" + questionId);
			System.out.println("questionId:" + studentId);
			Question studentQuestion = questionService.getTeaQuesContentInfo(studentId, questionId);
			System.out.println("ques:" + studentQuestion);
			request.setAttribute("studentId", studentId);
			request.setAttribute("questionId", questionId);
			request.setAttribute("courseId", courseId);
			request.setAttribute("studentQuestion", studentQuestion);
			return "teacherQuestionCourse";
		}

		// 答疑解惑
		@RequestMapping("view/answerQues.do")
		public String answerQues(HttpServletRequest request, HttpServletResponse response, Question question,
				String courseId) {
			System.out.println("questionId:" + question.getQuestionId());
			System.out.println("answer:" + question.getAnswer());
			question.setAnswerTime(new Date());
			questionService.updateStudentQues(question);
			return "redirect:/view/tql.do?courseId=" + courseId + "&studentId=" + question.getStudentId();
		}
}
