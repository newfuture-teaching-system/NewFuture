package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.User;
import com.mapper.StudentMapper;
import com.mapper.TeacherMapper;
import com.mapper.UserMapper;

@Controller
public class UserController {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private StudentMapper studentMapper;
	@Autowired
	private TeacherMapper teacherMapper;

	/**
	 * 登陆功能的实现
	 * @author 王婷玉
	 * 时间 2019/01/28
	 * @param request
	 * @param response
	 * @param user
	 * @param session
	 * @throws IOException
	 */
	@RequestMapping("view/login.do")
	@ResponseBody
	public void login(HttpServletRequest request, HttpServletResponse response, User user, HttpSession session)
			throws IOException {

		user.setUserId(request.getParameter("userId"));
		user.setPassword(request.getParameter("password"));

		User loginUser = userMapper.selectUser(user);
		if (loginUser != null) {
			session.setAttribute("user", loginUser);
			PrintWriter out = response.getWriter();
			out.print(loginUser.getFlag());// 返回用户身份的flag给ajax

		} else {
			PrintWriter out = response.getWriter();
			out.print("");// 登陆失败返回空

		}

	}

	/**
	 * 注册功能的实现
	 * @author 王婷玉
	 * 时间 2019/1/29
	 */
	@RequestMapping("view/addUser.do")
	public void addUser(User user, HttpServletResponse response) throws IOException {
		System.out.println("userId:" + user.getUserId());
		User selectUser = userMapper.selectUserById(user);
		System.out.println("selectUser:" + selectUser);
		int flag = 0;
		if (selectUser != null) {
			flag = 0;
		} else {
			int count = userMapper.addStudent(user);
			int studentCount = studentMapper.addStudent(user);
			System.out.println("count:" + count);
			System.out.println("studentCount:" + studentCount);
			if (count > 0) {
				flag = 1;
			}
		}
		PrintWriter out = response.getWriter();
		out.print(flag);

	}

	/**
	 * 用户退出网站功能的实现
	 * Author 王婷玉
	 * 时间 2019/01/29
	 */
	@RequestMapping("view/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "first";
	}
	/**
	 * 用户修改密码功能的实现
	 * Author 王婷玉 强梓宸
	 * 时间 2019/02/1
	 */
	@RequestMapping("view/changeUserInfo.do")
	public String changeUserInfo(User user, String newPassword, HttpServletRequest request,HttpServletResponse response) throws IOException {
		User changer = userMapper.selectUser(user);
		if (changer != null) {
			changer.setPassword(newPassword);
			changer.setUsername(user.getUsername());
			userMapper.changeUserInfo(changer);
			//设置格式，密码修改成功提示
			response.setContentType("text/html; charset=UTF-8"); //转码
			PrintWriter out = response.getWriter();
			out.flush();
			out.println("<script>");
			out.println("alert('信息修改成功!');");
			//out.println("history.back();");
			out.println("</script>");
			request.setAttribute("msg"," ");
			return "updateUserInfo";
		} else {
			request.setAttribute("msg","原密码错误!");
			return "updateUserInfo";
		}

	}
//	注册教师用户
	@RequestMapping("view/addTeacher.do")
	public String addTeacher(User user, HttpServletResponse response, HttpServletRequest request) throws IOException {
		System.out.println("userId:" + user.getUserId());
		User selectUser = userMapper.selectUserById(user);
		if (selectUser != null) {
			request.setAttribute("message", "用户名已存在");
			return "addTeacher";
		} else {
			int count = userMapper.addTeacher(user);
			int teacherCount = teacherMapper.addTeacher(user);
			System.out.println("count:" + count);
			//设置格式，密码修改成功提示
			response.setContentType("text/html; charset=UTF-8"); //转码
			PrintWriter out = response.getWriter();
			out.flush();
			out.println("<script>");
			out.println("alert('添加成功!');");
			out.println("history.back();");
			out.println("</script>");
			request.setAttribute("message", "");
			return "addTeacher";
		}
		
		

	}

}
