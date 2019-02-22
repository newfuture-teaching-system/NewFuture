<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>作业情况</title>
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
				<table class="table table-bordered table-striped" border="1"
					align="center">
					<caption>
						<h1>作业情况</h1>
					</caption>
					<thead>
						<tr>
							<th>编号</th>
							<th>课程名</th>
							<th>授课老师</th>
							<th>作业提交时间</th>
							<th>是否已批改</th>
							<th>查看作业</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sessionScope.stuList}" var="courseInfo"
							varStatus="c">
							<tr>
								<td style="width: 100px;"> ${c.index+1}</td>
								<td>${courseInfo.getCourse().getCourseName() }</td>
								<td>${courseInfo.getStuCourse().getTeacherName() }</td>
								<td style="width: 200px;"> ${courseInfo.getWork().getWorkSubmitTime() }</td>
								<c:if test="${courseInfo.getWork().getWorkState()==0}"><td>未批改</td></c:if>
								<c:if test="${courseInfo.getWork().getWorkState()==1}"><td>已批改</td></c:if>
								<td><a href="workContent.do?userId=${sessionScope.user.getUserId()}&workId=${courseInfo.getWork().getWorkId()}&courseId=${courseInfo.getCourse().getCourseId() }" >详细作业内容</a></td>
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
	<p style="text-align: center; color: black;">
		一共${sessionScope.pageInfo.pages}页 &nbsp;&nbsp;<a
			href="homework.do?id=${sessionScope.user.getUserId()}&page=${sessionScope.pageInfo.firstPage}">第一页</a>
		<a href="homework.do?id=${sessionScope.user.getUserId()}&page=${sessionScope.pageInfo.nextPage}">下一页</a>
		<a href="homework.do?id=${sessionScope.user.getUserId()}&page=${sessionScope.pageInfo.prePage}">上一页</a>
		<a href="homework.do?id=${sessionScope.user.getUserId()}&page=${sessionScope.pageInfo.lastPage}">最后页</a>
	</p>
</body>
</html>