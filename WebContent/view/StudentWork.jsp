<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>作业批改</title>
<meta name="layout" content="main">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="js/html2canvas.js"></script>
<script type="text/javascript" src="js/html2canvas.min.js"></script>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="text-align:center">
	<form action="checkWork.do" method="post" id="checkWorkForm">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">${message}</h3>
				<img alt="homework" src="../textImage/${requestScope.result }">
			</div>
			<input type="hidden" name="studentId" value="${studentId}" />
			<input type="hidden" name="courseId" value="${courseId}" />
			<input type="hidden" name="workId" value="${workId}" />
			<div class="panel-body">
				<textarea id="workCheckContent" name="workCheckContent" rows="10" cols="120"
					placeholder="批改作业……">${studentWork.workCheckContent }</textarea>
			</div>
		</div>
		<div>
				<input type="button" class="btn btn-info" value="提交" onclick="check()" />
				<button type="button" class="btn btn-info" onclick="history.back(-1)">返回</button>
		</div>
	</form>
	<script type="text/javascript">
	function check() {
		var content = $("#workCheckContent").val();
		if(content == null || content == ""){
			alert("请输入批改内容");
		}else{
			$("#checkWorkForm").submit();
		}
	}
	</script>
</body>
</html>