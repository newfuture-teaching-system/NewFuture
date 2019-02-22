<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生所选课程</title>
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
	vertical-align: middle;
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
				<!-- <div class="panel-heading">已经选择学习课程</div> -->
				<!-- /.panel-heading -->
				<table class="table table-bordered table-striped" border="1"
					align="center">
					<caption>
						<h1>所学课程</h1>
					</caption>
					<thead>
						<tr>
							<th style="width: 100px;">编号</th>
							<th>课程名</th>
							<th>课程学习进度</th>
							<th>授课老师</th>
						</tr>
					</thead>
					<tbody>
						<!--用foreach循环取出数据库内容  -->
						<c:forEach items="${sessionScope.courseList}" var="course"
							varStatus="c">
							<tr>
								<td style="width: 100px;">${c.index+1}</td>
								<td>${course.getCourseName()}</td>
								<td>${course.getStuCourse().getCourseProgress()}</td>
								<td>${course.getStuCourse().getTeacherName()}</td>
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
		一共${sessionScope.pageInfo.pages}页 &nbsp;&nbsp;<a
			href="course.do?id=${sessionScope.user.getUserId()}&page=${sessionScope.pageInfo.firstPage}">第一页</a>
		<a href="course.do?id=${sessionScope.user.getUserId()}&page=${sessionScope.pageInfo.nextPage}">下一页</a>
		<a href="course.do?id=${sessionScope.user.getUserId()}&page=${sessionScope.pageInfo.prePage}">上一页</a>
		<a href="course.do?id=${sessionScope.user.getUserId()}&page=${sessionScope.pageInfo.lastPage}">最后页</a>
	</p>





</body>
</html>