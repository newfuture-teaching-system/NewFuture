package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creatId.CreatId;
import com.entity.CatalogOne;
import com.entity.CatalogOneTwo;
import com.entity.Course;
import com.entity.StuCourse;
import com.entity.Teacher;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.CatalogOneTwoMapper;
import com.mapper.CourseMapper;
import com.mapper.StuCourseMapper;
import com.mapper.TeacherMapper;
import com.mapper.UserMapper;

import net.sf.json.JSON;

@Controller
public class CourseController {
	@Autowired
	private CourseMapper CourseMapper;
	@Autowired
	private TeacherMapper TeacherMapper;
	@Autowired
	private UserMapper UserMapper;
	@Autowired
	private StuCourseMapper StuCourseMapper;

	@Autowired
	private CatalogOneTwoMapper catalogOneTwoMapper;

	/**
	 * 瀛︾敓瀛︿範璇剧▼鎯呭喌
	 * 
	 * @author 瀹嬬珳娆� 鏃堕棿 2019/1/31
	 * 
	 */
	@RequestMapping("view/course.do")
	public String getstrCourseInfo(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		int page = Integer.parseInt(request.getParameter("page"));
		if (page == 1) {
			PageHelper.startPage(page, 5);
		} else {
			PageHelper.startPage(page, 5);
		}
		List<Course> courseList = CourseMapper.selectStrCourseInfo(id);
		PageInfo pageInfo = new PageInfo<>(courseList);
		// 鍒ゆ柇list闆嗗悎鏄惁涓虹┖
		if (courseList != null) {
			session.setAttribute("courseList", courseList);
			session.setAttribute("pageInfo", pageInfo);
			return "course";
		} else {
			System.out.println("璇ユ暟鎹笉瀛樺湪锛�");
		}
		return "course";
	}

	/**
	 * 鍒嗙被璇剧▼妫�绱�
	 * 
	 * @author 鐜嬪┓鐜� 鏃堕棿 2019/1/31
	 */
	@RequestMapping("view/search.do")
	public String search(String searchMessage, HttpServletRequest request) {
		System.out.println("name:" + searchMessage);
		List<Course> searchCoursesList = CourseMapper.searchCourses(searchMessage);
		request.setAttribute("searchCoursesList", searchCoursesList);
		return "search";
	}

	/**
	 * 妫�绱㈠叏閮ㄨ绋�
	 * 
	 * @author 鐜嬪┓鐜� 鏃堕棿 2019/1/31
	 */
	@RequestMapping("view/searchAll.do")
	public String searchAll(HttpServletRequest request) {
		List<Course> searchCoursesList = CourseMapper.selectAllCourse();
		request.setAttribute("searchCoursesList", searchCoursesList);
		return "search";
	}

	/**
	 * 鍒嗙被妫�绱㈣绋�
	 * 
	 * @author 鐜嬪┓鐜� 鏃堕棿 2019/1/31
	 */
	@RequestMapping("view/searchPart.do")
	public String searchPart(int flag, HttpServletRequest request) {
		System.out.println("flag:" + flag);
		List<Course> searchCoursesList = CourseMapper.selectCourseByFlag(flag);
		request.setAttribute("searchCoursesList", searchCoursesList);
		return "search";
	}

	// 查看课程
	@RequestMapping("view/getCourseMessage.do")
	public String getCourseMessage(String courseId, HttpServletRequest request) {
		System.out.println("查看课程courseId:" + courseId);
		Teacher teacher = TeacherMapper.selectTeacherByCourseId(courseId);
		Course course = CourseMapper.selectCatalogOne(courseId);
		System.out.println("list大小：" + course.getCatalogOneList().size());
		request.setAttribute("teacher", teacher);
		request.setAttribute("course", course);
		return "courseMessage";
	}

	// 添加学生课程
	@RequestMapping("view/addStuCourse.do")
	public String addStuCourse(String studentId, String courseId, HttpServletRequest request) {
		System.out.println("添加课程stuId：" + studentId);
		StuCourse stuCourse = StuCourseMapper.selectStuCourseById(courseId, studentId);
		String dateStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").format(new Date());
		if (stuCourse == null) {
			Teacher teacher = TeacherMapper.selectTeacherByCourseId(courseId);
			String teacherName = teacher.getTeacherName();
			UserMapper.addStuCourse(studentId, courseId, dateStr, teacherName);
		}
		return "redirect:/view/selectCatalogAll.do?studentId=" + studentId + "&courseId=" + courseId;
		// return "index";
	}

	@RequestMapping("view/test.do")
	public void test(String studentId, String courseId) {
		System.out.println("test:" + studentId + "  " + courseId);
	}

	// 添加课程信息
	@RequestMapping("view/addCourse.do")
	public String addCourse(Course course, String teacherId, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		System.out.println("courseId:" + course.getCourseId());
		Course selectCourse = CourseMapper.selectCourseById(course);
		Teacher selectTeacher = TeacherMapper.selectTeacherById(teacherId);
		if (selectCourse != null) {
			request.setAttribute("message", "课程已存在");
			request.setAttribute("courseflag", course.getFlag());
			request.setAttribute("teacherId", teacherId);
			request.setAttribute("courseId", course.getCourseId());
			request.setAttribute("courseName", course.getCourseName());
			request.setAttribute("courseIntroduction", course.getCourseIntroduction());
			return "addCourse";
		} else if (selectTeacher == null) {
			request.setAttribute("message", "教师ID不存在");
			request.setAttribute("courseflag", course.getFlag());
			request.setAttribute("teacherId", teacherId);
			request.setAttribute("courseId", course.getCourseId());
			request.setAttribute("courseName", course.getCourseName());
			request.setAttribute("courseIntroduction", course.getCourseIntroduction());
			return "addCourse";
		} else {
			System.out.println("111");
			int courseCount = CourseMapper.addCourse(course);
			int teacherCount = TeacherMapper.addTeaCourse(teacherId, course.getCourseId());
			System.out.println("count:" + courseCount);
			request.setAttribute("courseId", course.getCourseId());

			return "addCatalog";
		}
	}

//		课程全目录
	@RequestMapping("view/selectCatalogAll.do")
	public String selectCatalogAll(String courseId, String studentId, HttpServletRequest request, HttpSession session) {
		session = request.getSession();
		String cid = request.getParameter("courseId");
		String sid = request.getParameter("studentId");
		Course catalogAll = CourseMapper.selectCatalogAll(cid);
		StuCourse stuCourse = StuCourseMapper.selectProgress(cid, sid);
		request.setAttribute("courseId", cid);
		session.setAttribute("catalogAll", catalogAll);
		session.setAttribute("stuCourse", stuCourse);
		List<CatalogOne> listOne = catalogAll.getCatalogOneList();
		session.setAttribute("listOne", listOne);
		return "studyCenter";
	}

//		课程章节内容

	@RequestMapping("view/selectContent.do")
	public String selectContent(String courseId, String oneId, String twoId, HttpServletRequest request,
			HttpSession session) {
		session = request.getSession();
		String cid = request.getParameter("courseId");
		String oid = request.getParameter("oneId");
		String tid = request.getParameter("twoId");
		System.out.println("cid:" + cid);
		System.out.println("oid:" + oid);
		System.out.println("tid:" + tid);
		CatalogOneTwo twoContent = catalogOneTwoMapper.selectContent(cid, oid, tid);
		session.setAttribute("twoContent", twoContent);
		request.setAttribute("courseId", cid);
		request.setAttribute("oneId", oid);
		request.setAttribute("twoId", tid);
		System.out.println(twoContent.getCatalogTwoName());
		return "studyOneTwo";
	}

//主页分类检索课程
	@RequestMapping("view/indexCourse.do")
	public String indexCourse(HttpServletRequest request) {
		List<Course> oneCourses = CourseMapper.selectCourseByFlag(1);
		List<Course> twoCourses = CourseMapper.selectCourseByFlag(2);
		List<Course> threeCourses = CourseMapper.selectCourseByFlag(3);
		request.setAttribute("oneCourses", oneCourses);
		request.setAttribute("twoCourses", twoCourses);
		request.setAttribute("threeCourses", threeCourses);
		return "index";
	}

	// 添加一级目录
	@RequestMapping("view/addOne.do")
	public String addOne(String courseId, int[] num, String[] catalogOneName, String[] content,
			HttpServletRequest request) {
		System.out.println("sddOneCourseId:" + courseId);
		if (num!=null) {
			for (int i = 0; i < num.length; i++) {
				String catalogOneId = CreatId.creatId(i);
				CourseMapper.addCatalogOne(courseId, catalogOneId, num[i], catalogOneName[i], content[i]);
			}
		}
		Course course = CourseMapper.selectCatalogOne(courseId);
		request.setAttribute("course", course);
		return "chooseCatalog";
	}

	// 选择添加二级目录
	@RequestMapping("view/turnToAddTwo.do")
	public String turnToAddTwo(String courseId, String catalogOneId, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		List<CatalogOneTwo> catalogOneTwos = catalogOneTwoMapper.selectCatalogOneTwos(courseId, catalogOneId);
		if (catalogOneTwos.size() > 0) {
			response.setContentType("text/html; charset=UTF-8"); // 转码
			PrintWriter out = response.getWriter();
			out.flush();
			out.println("<script>");
			out.println("alert('已添加二级目录!');");
			 out.println("history.back();");
			out.println("</script>");
			return "redirect:/view/addOne.do?courseId=" + courseId;
		} else {
			request.setAttribute("courseId", courseId);
			request.setAttribute("catalogOneId", catalogOneId);
			return "addCatalogTwo";
		}

	}

	// 添加二级目录
	@RequestMapping("view/addTwo.do")
	public String addTwo(String courseId, String catalogOneId, int[] num, String[] catalogOneName, String[] content,
			HttpServletRequest request, HttpServletResponse response) throws IOException {

		System.out.println("sddTwoCourseId:" + courseId);
		for (int i = 0; i < num.length; i++) {
			String catalogTwoId = CreatId.creatId(i);
			CourseMapper.addCatalogTwo(courseId, catalogOneId, catalogTwoId, num[i], catalogOneName[i], content[i]);
		}
//		response.setContentType("text/html; charset=UTF-8"); // 转码
//		PrintWriter out = response.getWriter();
//		out.flush();
//		out.println("<script>");
//		out.println("alert('添加成功!');");
//		// out.println("history.back();");
//		out.println("</script>");
		return "redirect:/view/addOne.do?courseId=" + courseId;
	}

}
