<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>作业</title>
<meta name="layout" content="main">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="js/html2canvas.js"></script>
<script type="text/javascript" src="js/html2canvas.min.js"></script>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="text-align:center">
	<form action="saveWork.do?workId=${workQuestion.getWorkId()}&studentId=${sessionScope.user.getUserId()}" method="post">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">${workQuestion.getWork()}</h3>
			</div>
			<div class="panel-body">
				<textarea id="view" name="workContent" rows="10" cols="120"
					placeholder="请输入作业代码……"></textarea>

			</div>
		</div>
		<div>
				<input type="submit" class="btn btn-info" value="截图上传" />
				
		</div>
	</form>
</body>
</html>