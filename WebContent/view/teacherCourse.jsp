<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>教师课程情况</title>
<link
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
table {
	border-collapse: collapse;
	margin: 0 auto;
	text-align: center;
}

table td, table th {
	border: 1px solid #cad9ea;
	color: #666;
	height: 30px;
	width: 150px;
	text-align: center;
}

table thead th {
	background-color: #E6E6FA;
	width: 100px;
}

table tr:nth-child(odd) {
	background: #fff;
}

table tr:nth-child(even) {
	background: #F5FAFA;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<!-- <div class="panel-heading">作业情况</div> -->
				<!-- /.panel-heading -->
				<nav class=" navbar-default" role="navigation">
					<div class="container-fluid">
						<div class="navbar-header">
							<a class="navbar-brand" href="#">课程情况查询</a>
						</div>
						<div>
							<form class="navbar-form navbar-right" action="selectCourseInfo.do?teacherId=${sessionScope.user.getUserId()}&page=1" method="post">
								<input type="hidden" value="100001" name="teacherId" />
								<div class="form-group">

									<select class="form-control" name="courseId">
										<c:forEach items="${teacherCourses}" var="course">
											<option value="${course.courseId }" <c:if test="${selectedId==course.courseId }">selected</c:if>>
												${course.courseName}
											</option>
										</c:forEach>
									</select>


								</div>
								<button type="submit" class="btn btn-default">提交</button>
							</form>
						</div>
					</div>
				</nav>

				<table class="table table-bordered table-striped" border="1"
					align="center">
					<thead>
						<tr>
							<th>编号</th>
							<th>学生姓名</th>
							<th>学习进度</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${studentList }" var="student" varStatus="s">
							<tr>
								<td>${s.count }</td>
								<td>${student.studentName }</td>
								<td>${student.stuCourse.courseProgress }</td>
								<td><a
									href="selectCourseWork.do?courseId=${selectedId }&studentId=${student.studentId}&flag=-1"
									class="btn btn-primary btn-lg btn-sm"> <span
										class="glyphicon glyphicon-list-alt"></span>&nbsp查看作业
								</a> <a
									href="tql.do?courseId=${selectedId }&studentId=${student.studentId}"
									class="btn btn-primary btn-lg btn-sm"> <span
										class="glyphicon glyphicon-question-sign"></span>&nbsp;查看疑问
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!--分页设计 -->
	<p style="text-align: center; color: black;">
		一共${sessionScope.pageInfo.pages}页 &nbsp;&nbsp; <a
			href="selectCourseInfo.do?teacherId=${sessionScope.user.getUserId()}&page=1&courseId=${requestScope.courseId }">第一页</a>
		<a
			href="selectCourseInfo.do?teacherId=${sessionScope.user.getUserId()}&page=${sessionScope.pageInfo.nextPage}&courseId=${requestScope.courseId }">下一页</a>
		<a
			href="selectCourseInfo.do?teacherId=${sessionScope.user.getUserId()}&page=${sessionScope.pageInfo.prePage}&courseId=${requestScope.courseId }">上一页</a>
		<a
			href="selectCourseInfo.do?teacherId=${sessionScope.user.getUserId()}&page=${sessionScope.pageInfo.lastPage}&courseId=${requestScope.courseId }">最后页</a>
	</p>
</body>
</html>