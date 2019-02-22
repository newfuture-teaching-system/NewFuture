<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>教师信息修改</title>
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
		<div class="panel panel-info">
			<div class="panel-heading text-center">
				<h3 class="panel-title">修改个人信息</h3>
			</div>
			<div class="panel-body">
				<form id="teacherinspect" class="bs-example bs-example-form"
					role="form"
					action="updateTeacher.do?teacherId=${requestScope.teacher.getTeacherId()}"
					method="post">
					<table>
						<tbody>

							<tr>
								<td>
									<div class="input-group">
										<div class="input-group">
											<span class="input-group-addon">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span>
											<input type="text" class="form-control" placeholder="请输入姓名"
												name="teacherName" id="teacherNameId"
												value="${requestScope.teacher.getTeacherName()}">
										</div>
									</div>
								</td>
							</tr>


							<tr>
								<td>
									<div class="input-group">
										<div class="input-group">
											<span class="input-group-addon">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄</span>
											<input type="text" class="form-control" placeholder="请输入年龄"
												name="teacherAge" id="teacherAgeId"
												value="${requestScope.teacher.getTeacherAge()}">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-group">
										<div class="input-group">
											<span class="input-group-addon">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</span>

											<select class="form-control" name="teacherSex">
												<option value="0"
													${requestScope.teacher.getTeacherSex()==0?selected:""}>女</option>
												<option value="1"
													${requestScope.teacher.getTeacherSex()==1?selected:""}>男</option>
											</select>


										</div>
									</div>
								</td>
							</tr>

						</tbody>
					</table>
					<div class="panel-heading text-center">
						<input type="button" class="btn btn-default" id="left save"
							style="margin-right: 130px;" value="保存" onclick="inspect()" /> <input
							type="reset" class="btn btn-default" id="right clear" value="重置" />
					</div>
				</form>

			</div>

		</div>

	</div>
	<script type="text/javascript">
		function inspect() {
			var teacherNameId = $("#teacherNameId").val();
			var teacherAge = $("#teacherAgeId").val();
			var reg = /^\+?[1-9][0-9]*$/;
			if (teacherNameId == null || teacherNameId == "") {
				alert("请输入姓名");
			} else {
				if (teacherAge == null || teacherAge == "") {
					alert("请输入年龄");
				}else if(teacherAge.length > 2 || !reg.test(teacherAge)){
					alert("请输入正确年龄");
				}
				else {
					$("#teacherinspect").submit();
				}
			}

		}
	</script>


</body>
</html>