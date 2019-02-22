<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>疑问</title>
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

				<table class="table table-bordered table-striped" border="1"
					align="center">
					<caption>
						<h1>疑问</h1>
					</caption>
					<thead>
						<tr>
							<th>编号</th>
							<th>课程</th>
							<th>疑问问题</th>
							<th>授课老师</th>
							<th>疑问状态</th>
							<th>提问时间</th>
							<th>回答时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sessionScope.queList}" var="questionInfo"
							varStatus="q">
							<tr>
								<td style="width: 100px;">${q.index+1 }</td>
								<td>${questionInfo.getCourse().getCourseName() }</td>
								<td><a href="questionContent.do?id=${sessionScope.user.getUserId()}&questionId=${questionInfo.getQuestion().getQuestionId() }" >${questionInfo.getQuestion().getQuestionTitle() }</a></td>
								<td>${questionInfo.getStuCourse().getTeacherName() }</td>
								<c:if test="${questionInfo.getQuestion().getQuestionState()==0 }"><td>未解决</td></c:if>
								<c:if test="${questionInfo.getQuestion().getQuestionState()==1 }"><td>已解决</td></c:if>
								<td style="width: 200px;">${questionInfo.getQuestion().getQuestionTime() }</td>
								<td style="width: 200px;">${questionInfo.getQuestion().getAnswerTime() }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>

	</div>
	<p style="text-align: center; color: black;">
		一共${sessionScope.pageInfo.pages}页 &nbsp;&nbsp;<a
			href="question.do?id=${sessionScope.user.getUserId()}&page=${sessionScope.pageInfo.firstPage}">第一页</a>
		<a href="question.do?id=${sessionScope.user.getUserId()}&page=${sessionScope.pageInfo.nextPage}">下一页</a>
		<a href="question.do?id=${sessionScope.user.getUserId()}&page=${sessionScope.pageInfo.prePage}">上一页</a>
		<a href="question.do?id=${sessionScope.user.getUserId()}&page=${sessionScope.pageInfo.lastPage}">最后页</a>
	</p>
</body>
</html>