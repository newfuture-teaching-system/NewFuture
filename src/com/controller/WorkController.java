package com.controller;

import java.awt.Font;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.User;
import com.entity.Work;
import com.entity.WorkOneTwo;
import com.fontImage.FontImage;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.UserMapper;
import com.mapper.WorkMapper;
import com.mapper.WorkOneTwoMapper;
import com.util.Base64Utils;

@Controller
public class WorkController {
	@Autowired
	private UserMapper userService;
	@Autowired
	private WorkMapper workService;
	@Autowired
	private WorkOneTwoMapper WorkOneTwoMapper;
	
	/**
	 * 当前用户科目及作业一览
	 * @author  刘晓宇
	 * 时间   2019/1/30
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("view/homework.do")
	public String getCourseInfo(HttpServletRequest request, HttpServletResponse response, User user) throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		int page = Integer.parseInt(request.getParameter("page"));
		System.out.println(page); 
		System.out.println(id);
		if (page == 1 || page == 0) {
			PageHelper.startPage(page, 5);
		} else {
			PageHelper.startPage(page, 5);

		}
		List<User> stuList = userService.getStuCourseInfo(id); 
		PageInfo pageInfo = new PageInfo<>(stuList);
		/* request.setAttribute("stuList", stuList); */
		session.setAttribute("stuList", stuList);
		session.setAttribute("pageInfo", pageInfo);
		return "homework";
	}
	/** 
	 * 当前作业具体内容及老师评价一览
	 * @author  刘晓宇
	 * 时间   2019/1/30
	 * @throws IOException 
	 */
	@RequestMapping("view/workContent.do")
	public String getWorkInfo(HttpServletRequest request,HttpServletResponse response,Work work) throws IOException{
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		//int homeWorkId = Integer.parseInt(request.getParameter("workId"));
		String courseId = request.getParameter("courseId");
		String id = request.getParameter("userId");
		System.out.println("workInfoUserId"+id);
		System.out.println("workInfohomeWorkId:"+work.getWorkId());
		System.out.println("workInfocourseId:"+courseId);
		Work homeWork = workService.workContentInfo(id,courseId,work.getWorkId());
		String s = homeWork.getWorkContent();
		String result = s.substring(s.lastIndexOf('/')+1).trim();
		System.out.println("workInfoResult:"+result);
		session.setAttribute("result", result);
		session.setAttribute("homeWork", homeWork);
		return "workContent";
	}
	//查看学生课程作业
	@RequestMapping("view/selectCourseWork.do")
	public String selectCourseWork(String courseId,String studentId,HttpServletRequest request) {
		System.out.println("查询作业cid："+courseId);
		System.out.println("学生sid："+studentId);
		List<Work> workList = workService.selectCourseWork(courseId, studentId);
		System.out.println("wList："+workList.size());
		request.setAttribute("workList", workList);
		request.setAttribute("studentId", studentId);
		request.setAttribute("courseId", courseId);
		return "homeworkList";
	}
	//查看学生作业
	@RequestMapping("view/checkStudentWork.do")
	public String checkStudentWork(int workId,String studentId,String courseId,HttpServletRequest request) {
		System.out.println("studentWorkId:"+workId);
		System.out.println("workStudentId:"+studentId);
		Work studentWork = workService.selectStudentWork(studentId, workId);
		System.out.println("studentWork:"+studentWork);
		if(studentWork==null) {
			request.setAttribute("message", "没有作业信息");
		}else {
			String content = studentWork.getWorkContent();
			System.out.println("content:"+content);
			String result = content.substring(content.lastIndexOf('/')+1).trim();
			System.out.println(result);
			request.setAttribute("result", result);
			request.setAttribute("message", "");
			request.setAttribute("studentId", studentId);
			request.setAttribute("courseId", courseId);
			request.setAttribute("workId", workId);
			request.setAttribute("studentWork", studentWork);
		}
		return "StudentWork";
	}
	//批改学生作业
	@RequestMapping("view/checkWork.do")
	public String checkWork(Work work,String courseId ) {
		System.out.println("tworkId:"+work.getWorkId());
		System.out.println("checkacaontent"+work.getWorkCheckContent());
		work.setWorkCheckTime(new Date());
		workService.updateStudentWork(work);
		return "redirect:/view/selectCourseWork.do?courseId="+courseId+"&studentId="+work.getStudentId();
	}
	//上传作业
	@RequestMapping("view/saveWork.do")
	public void saveWork(HttpServletRequest request, HttpServletResponse response, Work work, String workId,
			String studentId) throws Exception {
		int intWorkId = Integer.valueOf(workId);
		Work selectedWork = workService.selectStudentWork(studentId, intWorkId);
		if(selectedWork!=null) {
			response.setContentType("text/html; charset=UTF-8"); //转码
			PrintWriter out = response.getWriter();
			out.flush();
			out.println("<script>");
			out.println("alert('作业已提交，无需再次提交!');");
			out.println("history.back();");
			out.println("</script>");
			}else {
				System.out.println(request.getContextPath() );
				request.setCharacterEncoding("UTF-8");	
				FontImage fontImage = new FontImage();
				System.out.println("workId"+workId);
				HttpSession session = request.getSession();
				String workContent = request.getParameter("workContent");
				System.out.println(workContent);
				String content = FontImage.imageFullPath();
				fontImage.creatMyImage(workContent,content);
				System.out.println("saveWork:"+content);
				workService.saveWork(studentId, content,workId);
				response.setContentType("text/html; charset=UTF-8"); //转码
				PrintWriter out = response.getWriter();
				out.flush();
				out.println("<script>");
				out.println("alert('作业提交成功');");
				out.println("history.back();");
				out.println("</script>");
			}
		
		

	}
	//查询作业题目
	@RequestMapping("view/selectWorkQ.do")
	public String selectWorkQ(String courseId, String oneId, String twoId, HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setAttribute("courseId", courseId);
		request.setAttribute("oneId", oneId);
		request.setAttribute("twoId", twoId);
		System.out.println("c" + courseId + oneId + twoId);
		WorkOneTwo workQuestion = WorkOneTwoMapper.selectWorkQ(courseId, oneId, twoId);
		if(workQuestion == null) {
			response.setContentType("text/html; charset=UTF-8"); //转码
			PrintWriter out = response.getWriter();
			out.flush();
			out.println("<script>");
			out.println("alert('该章暂无作业');");
			out.println("history.back();");
			out.println("</script>");
			return "";
		}else {
		request.setAttribute("workQuestion", workQuestion);
		System.out.println("测试" + workQuestion.getWork());
		return "saveImage";
		}
	}
}
