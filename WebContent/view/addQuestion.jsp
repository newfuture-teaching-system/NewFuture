<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加疑问</title>
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
}

table td {
	border: 0px;
	height: 80px;
	width: 270px;
}
</style>
</head>
<body>
	<div class="panel-body">
	<div class="panel panel-info">
				<div class="panel-heading text-center">
					<h3 class="panel-title">疑问提交</h3>
				</div>
		<form role="form" action="addQuestion.do" method="post" id="addQue">
			<table>
				<tbody>
					<tr>
						<td><input type="hidden" name="studentId" value="${sessionScope.user.getUserId() }">
							<input type="hidden" name="teacherId" value="${teacher.getTeacherId()}"> <input
							type="hidden" name="courseId" value="${courseId}">
							<div class="input-group">
								<span class="input-group-addon">标题栏</span> <input type="text"
									class="form-control" name="questionTitle" id="addTitle" placeholder="请输入标题">
							</div>
							</td>
					</tr>
					<tr>
						<td>
							<div class="form-group">
								<textarea class="form-control" name="question" rows="10"
									placeholder="请输入疑问内容" id="addQues"></textarea>
							</div>
						</td>
					</tr>
								
				</tbody>
			</table>
			<div class="panel-heading text-center">
				<input type="button" class="btn btn-default"
					style="margin-right: 0px;" value="提交"  onclick="addQuestion()"/>
			</div>
		</form>
	</div>
	</div>
	<script type="text/javascript">
function addQuestion() {
			var addTitle = $("#addTitle").val();
			var addQues = $("#addQues").val();
			if (addTitle == null||addTitle == "") {
					alert("请输入标题内容");
			}else {
				if (addQues == null||addQues == "") {
					alert("请输入疑问内容");
				}else{
					$("#addQue").submit();
					}
				}
}
</script>
</body>
</html>