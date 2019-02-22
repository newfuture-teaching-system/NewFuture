<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>作业详情</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#div1{
	margin-top: 25px;
}
</style>
</head>
<body>
<div class="col-md-8 col-md-offset-2" id="div1">
<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">已提交作业内容</h3>
	</div>
	<div class="panel-body">
		<img src="../textImage/${sessionScope.result}" alt="作业"/>
		
		<%-- ${requestScope.image} --%>
	</div>
</div>
</div>
<div class="col-md-8 col-md-offset-2">
<div class="panel panel-danger">
	<div class="panel-heading">
		<h3 class="panel-title">批改意见</h3>
	</div>
	<div class="panel-body">
		${sessionScope.homeWork.getWorkCheckContent()}
	</div>
</div>
</div>
<div class="col-md-8 col-md-offset-2">
<button type="button" class="btn btn-info" onclick="returnWork()">返回</button>
</div>
<script type="text/javascript">
	function returnWork(){
		window.location.href="homework.jsp"; 
		}
</script>
</body>
</html>