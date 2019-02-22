<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改学生信息</title>
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
					<h3 class="panel-title">修改个人信息</h3>
				</div>
				<div class="panel-body">
					<form class="bs-example bs-example-form" role="form"
						action="updateStudent.do?studentId=${requestScope.student.getStudentId()}"
						method="post" id="alterInfo">
						<table>
							<tbody>

								<tr>
									<td>
										<div class="input-group">
											<div class="input-group">
												<span class="input-group-addon">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span>
												<input type="text" class="form-control" placeholder="请输入姓名"
													name="stuName"　
													value="${requestScope.student.getStudentName()}">
											</div>
										</div>
									</td>
								</tr>


								<tr>
									<td>
										<div class="input-group">
											<div class="input-group">
												<span class="input-group-addon">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄</span>
												<c:if test="${requestScope.student.getStudentAge()==0}">
													<input type="text" class="form-control" placeholder="请输入年龄"
														name="stuAge" id="studentAge" >
												</c:if>
												<c:if test="${requestScope.student.getStudentAge()!=0}">
													<input type="text" class="form-control" placeholder="请输入年龄"
														name="stuAge" id="studentAge"
														value="${requestScope.student.getStudentAge()}">
												</c:if>

											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="input-group">
											<div class="input-group">
												<span class="input-group-addon">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</span>
												<c:choose>
													<c:when test="${requestScope.student.getStudentSex()==0}">
														<select class="form-control" name="stuSex">
															<option value="0">男</option>
															<option value="1">女</option>
														</select>
													</c:when>
													<c:when test="${requestScope.student.getStudentSex()==1}">
														<select class="form-control" name="stuSex">
															<option value="1">女</option>
															<option value="0">男</option>
														</select>
													</c:when>
													<c:otherwise>
														<select class="form-control" name="stuSex">
															<option value="0">男</option>
															<option value="1">女</option>
														</select>
													</c:otherwise>
												</c:choose>

											</div>
										</div>
									</td>
								</tr>

							</tbody>
						</table>
						<div class="panel-heading text-center">
							<input type="button" class="btn btn-default" id="left save"
								style="margin-right: 130px;" value="保存" onclick="alterInformation()"/> 
							<input type="reset"
								class="btn btn-default" id="right clear" value="重置" />
						</div>
					</form>

				</div>

			</div>

		</div>
	<!-- </div> -->
	<script type="text/javascript">
function alterInformation() {
			var studentAge = $("#studentAge").val();
			var reg = /^\+?[1-9][0-9]*$/;
			if (studentAge.length > 2 || !reg.test(studentAge)) {
					alert("请输入正确年龄");
			}else {
					$("#alterInfo").submit();
					}
				}
</script>
</body>
</html>