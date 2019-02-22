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

import com.entity.Student;
import com.entity.User;
import com.mapper.StudentMapper;
import com.mapper.UserMapper;

@Controller
public class StudentController {
	@Autowired
	private StudentMapper studentService;
	
	/**
	 * 当前用户个人信息一览
	 * @author  刘晓宇 孟令星
	 * 时间   2019/2/1
	 */
	@RequestMapping("view/selectInfomation.do")
	public String changeStudent(HttpServletRequest request, HttpServletResponse response,User user,HttpSession session){
		String id = request.getParameter("id");
		System.out.println("id:"+id);
		Student student = studentService.changeStudent(id);
		request.setAttribute("student", student);
		return "alterInformation";
	}
	/**
	 * 当前用户个人信息修改
	 * @author  刘晓宇 孟令星
	 * 时间   2019/2/1
	 */
	@RequestMapping("view/updateStudent.do")
	public String updateStudent(HttpServletRequest request, HttpServletResponse response,Student student) throws IOException {
		HttpSession session =  request.getSession();
		String id = request.getParameter("studentId");
		int sex = Integer.valueOf(request.getParameter("stuSex"));
		int age = Integer.valueOf(request.getParameter("stuAge"));
		String name = request.getParameter("stuName");
		System.out.println(name);
		student.setStudentId(id);
		student.setStudentName(name);
		student.setStudentSex(sex);	
		student.setStudentAge(age);
		
		studentService.updateStudent(student);
		response.setContentType("text/html; charset=UTF-8"); //转码
		PrintWriter out = response.getWriter();
		out.flush();
		out.println("<script>");
		out.println("alert('个人信息修改成功!');");
		out.println("history.back();");
		out.println("</script>");

		session.setAttribute("stu", student);
		return "alterInformation";
		
	}
}

