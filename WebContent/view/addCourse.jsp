<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>录入课程</title>
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
				<h3 class="panel-title">录入课程</h3>
			</div>
			<div class="panel-body">
				<form class="bs-example bs-example-form" role="form"
					action="addCourse.do" method="post" id="addCourse">
					<table>
						<tbody>
							<tr>
								<td>
									<div class="input-group">
										<span class="input-group-addon">课&nbsp;&nbsp;程&nbsp;&nbsp;ID</span>
										<input type="text" class="form-control" required="required"
											placeholder="请输入课程ID" name="courseId" id="courseId" value="${courseId }">
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<div class="input-group">
										<span class="input-group-addon">课&nbsp;&nbsp;程&nbsp;&nbsp;名</span>
										<input type="text" class="form-control" required="required"
											placeholder="请输入课程名" name="courseName" id="courseName" value="${courseName }">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-group" style="width: 400px;">
										<span class="input-group-addon">教&nbsp;&nbsp;师&nbsp;&nbsp;ID</span>
										<input type="text" class="form-control" required="required"
											placeholder="请输入教师ID" name="teacherId" id="teacherId" value="${teacherId }">
										<span class="input-group-btn"> <a id="checkTeacher"
											class="btn btn-default " onclick="checkTeacher()">校验</a>
										</span>

									</div> <span>${teacherName }</span>
							</tr>
							
							<tr>
								<td>
									<div class="input-group">
										<span class="input-group-addon">课程分类</span> <select
											class="form-control" name="flag" id="flag">
											<option value="1" <c:if test="${courseflag==1}">selected</c:if>>前端</option>
											<option value="2" <c:if test="${courseflag==2}">selected</c:if>>后端</option>
											<option value="3" <c:if test="${courseflag==3}">selected</c:if>>数据库</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="form-group">
										<textarea class="form-control" name="courseIntroduction"
											rows="10" placeholder="请输入课程具体内容" id="courseIntroduction">${courseIntroduction }</textarea>
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
							onclick="addCourse()" />
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
// 	教师校验
		function checkTeacher() {
// 			var courseId = $("#courseId").val();
// 			var courseName = $("#courseName").val();
 			var teacherId = $("#teacherId").val();
// 			var courseIntroduction = $("#courseIntroduction").val();
// 			var flag = $("#flag option:selected").val();
			//window.location.href="checkTeacher.do?teacherId="+teacherId;
// 			$("#checkTeacher").attr("href",
// 					"checkTeacher.do?teacherId=" + teacherId+"&courseId="+courseId+"&courseName="+courseName+"&courseIntroduction="+courseIntroduction+"&flag="+flag);
		$("#checkTeacher").attr("href",
 					"checkTeacher.do?teacherId=" + teacherId);
		}
		//添加课程验证  
		function addCourse() {
			var courseId = $("#courseId").val();
			var courseName = $("#courseName").val();
			var teacherId = $("#teacherId").val();
			var courseIntroduction = $("#courseIntroduction").val();

			if (courseId == "" || courseId == null) {
				alert("请输入课程ID");
			} else {
				if (courseId.length > 5) {
					alert("课程ID不能大于5个字符");
				} else {
					if (courseName == "" || courseName == null) {
						alert("课程名不能为空");
					} else {
						if (teacherId == "" || teacherId == null) {
							alert("请输入教师ID");
						} else {
							if (teacherId.length > 6) {
								alert("教师ID不能大于6个字符");
							} else {
								if (courseIntroduction == ""
										|| courseIntroduction == null) {
									alert("请输入课程介绍信息");
								} else {
									$("#addCourse").submit();
								}

							}
						}
					}
				}
			}
		}
	</script>
</body>
</html>