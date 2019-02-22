<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>章节学习内容</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">${sessionScope.twoContent.getCatalogTwoName()}</h3>
		</div>
		<div class="panel-body">${sessionScope.twoContent.getContent()}
		</div>
	</div>
	<div class="nav navbar-nav btn-group pull-right">
		<a href="selectWorkQ.do?courseId=${courseId}&oneId=${oneId}&twoId=${twoId}" class="btn btn-default">课后作业</a>
		<a href="selectTeacherId.do?courseId=${courseId}" class="btn btn-default">疑难解答</a>
	</div>
</body>
</html>