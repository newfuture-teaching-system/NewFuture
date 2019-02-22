<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>疑问解答</title>
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
		<h3 class="panel-title"><span class="glyphicon glyphicon-question-sign"></span>&nbsp;${studentQuestion.getQuestionTitle()}</h3>
	</div>
	<div class="panel-body">
		${studentQuestion.question}
	</div>
</div>
</div>
<form class="bs-example bs-example-form" role="form" action="answerQues.do" method="post" id="teaAnswer">
<div class="col-md-8 col-md-offset-2">
<div class="panel panel-danger">
	<div class="panel-heading">
		<h3 class="panel-title"><span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;答疑解惑</h3>
	</div>
	<input type="hidden" name="studentId" value="${studentId}" />
			<input type="hidden" name="courseId" value="${courseId}" />
			<input type="hidden" name="questionId" value="${questionId}" />
	<div class="input-group input-group-lg" style="padding: 20px;">
			<div class="form-group" >
    <textarea class="form-control" id="answer" name="answer" style="height: 200px;width: 600px;" placeholder="请输入解答内容">${studentQuestion.answer}</textarea>
  </div>
  
</div>
</div>

<div>
<button type="button" class="btn btn-primary" onclick="check()">提交</button>
<button type="button" class="btn btn-primary" onclick="history.back(-1)">返回</button>
</div>
</div>
</form>
<script type="text/javascript">
	function check(){
		var answer = $("#answer").val();
		if(answer == null || answer == ""){
			alert("请输入解答内容");
		}else{
			$("#teaAnswer").submit();
		}
		}
</script>
</body>
</html>