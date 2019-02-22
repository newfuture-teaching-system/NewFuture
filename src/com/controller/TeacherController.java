package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.Course;
import com.entity.Student;
import com.entity.Teacher;
import com.entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.CourseMapper;
import com.mapper.StuCourseMapper;
import com.mapper.StudentMapper;
import com.mapper.TeacherMapper;
import com.mapper.UserMapper;

@Controller
public class TeacherController {
	@Autowired
	private TeacherMapper teacherService;
	@Autowired
	private CourseMapper CourseMapper;
	@Autowired
	private StudentMapper StudentMapper;
	@Autowired
	private UserMapper UserMapper;

	// 获取教师信息
	@RequestMapping("view/TeacherInformation.do")
	public String selectTeacherInfo(HttpServletRequest request, HttpServletResponse response) {
		String tId = request.getParameter("teacherId");
		Teacher teacher = teacherService.selectTeacherInfo(tId);
		request.setAttribute("teacher", teacher);
		return "updateTeacherInfo";
	}

	// 修改教师信息
	@RequestMapping("view/updateTeacher.do")
	public String updateTeacher(HttpServletRequest request, HttpServletResponse response, Teacher teacher)
			throws IOException {
		HttpSession session = request.getSession();
		String tid = request.getParameter("teacherId");
		teacherService.updateTeacher(teacher);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.flush();
		out.println("<script>");
		out.println("alert('信息修改成功');");
		out.println("history.back();");
		out.println("</script>");
		session.setAttribute("teacher", teacher);
		return "updateTeacherInfo";
	}

	// 查询课程信息
	@RequestMapping("view/selectCourseInfo.do")
	public String selectCourseInfo(String teacherId, String courseId, HttpServletRequest request) {
		// 查询教师课程
		List<Course> teacherCourses = CourseMapper.selectTeacherCourse(request.getParameter("teacherId"));
		
		System.out.println(teacherCourses.size());

		HttpSession session = request.getSession();
		int page = Integer.parseInt(request.getParameter("page").trim());
		System.out.println("page="+page);
		if (page == 1) {
			PageHelper.startPage(page, 5);
		} else {
			PageHelper.startPage(page, 5);
		}
		// 查询学生列表
		System.out.println("查询courseId：" + request.getParameter("courseId"));
		List<Student> studentList = StudentMapper.selectCourseStudent(request.getParameter("courseId"));
		PageInfo pageInfo = new PageInfo<>(studentList);

		session.setAttribute("studentList", studentList);
		session.setAttribute("pageInfo", pageInfo);
		request.setAttribute("courseId", courseId);
		request.setAttribute("teacherCourses", teacherCourses);
		request.setAttribute("selectedId", courseId);
		request.setAttribute("studentList", studentList);
		return "teacherCourse";
	}

	// 校验教师id
	@RequestMapping("view/checkTeacher.do")
	public String checkTeacher(String flag,String courseIntroduction,String courseId,String courseName,String teacherId, HttpServletRequest request) {
		System.out.println("insertId:" + teacherId);
		Teacher selectTeacher = teacherService.selectTeacherById(teacherId);
		System.out.println("teacher:" + selectTeacher);
		if (selectTeacher == null) {
			request.setAttribute("teacherName", "未检索到该老师");
		} else {
			request.setAttribute("teacherName", selectTeacher.getTeacherName());
		}
		System.out.println("flag:"+flag);
		request.setAttribute("courseflag", flag);
		request.setAttribute("teacherId", teacherId);
		request.setAttribute("courseId", courseId);
		request.setAttribute("courseName", courseName);
		request.setAttribute("courseIntroduction", courseIntroduction);
		return "addCourse";
	}

}
