<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>疑问详情</title>
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
		<h3 class="panel-title"><span class="glyphicon glyphicon-question-sign"></span>&nbsp;${sessionScope.ques.getQuestionTitle()}</h3>
	</div>
	<div class="panel-body">
		${ques.getQuestion()}
	</div>
</div>
</div>
<div class="col-md-8 col-md-offset-2">
<div class="panel panel-danger">
	<div class="panel-heading">
		<h3 class="panel-title"><span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;解答</h3>
	</div>
	<div class="panel-body">
		${ques.getAnswer()}
	</div>
</div>
</div>
<div class="col-md-8 col-md-offset-2">
<button type="button" class="btn btn-info" onclick="returnWork()">返回</button>
</div>
<script type="text/javascript">
	function returnWork(){
		window.location.href="question.jsp"; 
		}
</script>
</body>
</html>