<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加教师用户</title>
<link
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
table {
	border-collapse: collapse;
	margin: 0 auto;
	text-align: center;
}

table td, table th {
	border: 0px;
	height: 50px;
	width: 250px;
}

table thead th {
	background-color: #E6E6FA;
	width: 100px;
}
</style>
</head>
<body>
	<div class="row">
		<!-- <div class="col-lg-6"> -->
		<div class="panel panel-info">
			<div class="panel-heading text-center">
				<h3 class="panel-title">添加用户</h3>
			</div>
			<div class="panel-body">
				<form id="addTeacher" class="bs-example bs-example-form" role="form"
					action="addTeacher.do" method="post" >
					<table>
						<tbody>

							<tr>
								<td>
									<div class="input-group">
										<span class="input-group-addon">教师ID</span> <input type="text"
											class="form-control" required="required"
											placeholder="请输入教师ID" name="userId" id="teacherId">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-group">
										<span class="input-group-addon">姓&nbsp;&nbsp;&nbsp;&nbsp;名</span>
										<input type="text" class="form-control" required="required"
											placeholder="请输入教师姓名" name="username" id="teacherName">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div style="text-align: center">
						<span style="color: red;">${message }</span>
					</div>
					<div class="panel-heading text-center">
						<input type="button" class="btn btn-default" id="save" value="确认"
							onclick="addTeacher()" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--添加教师用户验证  -->
	<script type="text/javascript">
		
		function addTeacher() {
			var teacherId = $("#teacherId").val();
			var teacherName = $("#teacherName").val();

			if (teacherId == "" || teacherId == null) {
				alert("请输入用户ID");
			} else {
			if (teacherId.length > 6) {
					alert("用户ID不能大于6个字符");
			} else {
			if (teacherName == "" || teacherName == null) {
					alert("用户名不能为空");
			} else {
					$("#addTeacher").submit();
					}
				}
			}
		}
		

			
		
	</script>
</body>
</html>