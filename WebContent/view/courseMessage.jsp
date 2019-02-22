<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查看课程</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#logo {
	font-family: fusanghua;
	font-style: oblique;
	font-size: 49px;
	font-weight: 900;
	color: #000080;
}

@font-face {
	font-family: 'fusanghua';
	src: url('../font/ttt.woff');
}

.fakeimg {
	height: auto;
	background: #B0C4DE;
}

.catalog {
	height: auto;
	background: #B0C4DE;
}
</style>
</head>
<body>
	<nav class="navbar-default navbar" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<p class="navbar-brand" id="logo">NewFuture</p>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="first.jsp"><span
						class="glyphicon glyphicon-home"></span></a></li>
				<li><a href="#" data-toggle="modal" data-target="#login"
					id="userName" onclick="select()"><span
						class="glyphicon glyphicon-user"></span> <c:choose>
							<c:when test="${sessionScope.user.getUsername() != null }">		
				${sessionScope.user.getUsername()}
				</c:when>
							<c:otherwise>
						登录
			</c:otherwise>
						</c:choose></a></li>
				<li><a href="logout.do"><span
						class="glyphicon glyphicon-log-out"></span> 退出登录</a></li>
			</ul>
		</div>
	</nav>
	<input type="hidden" id="userId"
		value="${sessionScope.user.getUserId()}" />
	<input type="hidden" id="flag" value="${sessionScope.user.getFlag()} ">
	<div class="container navbar" style="background: #B0C4DE;">
		<div class="row">
			<div class="col-sm-12 ">
				<div class="catalog" style="padding-top: 10px;">
					<div class="col-sm-4">
						<div class="navbar"
							style="height: 180px; background: #B0C4DE; display: flex; align-items: center; justify-content: center;">
							<img style="width: 100%; height: 180px;" src="img/learn.jpg">
						</div>

					</div>

					<div class="col-sm-8">
						<div class="navbar" style="height: 180px; background: white;">
							<div style="text-align: left; padding: 10px;">
								<input type="hidden" id="courseId" value="${course.courseId}" />
								<h3>${course.courseName}</h3>
								<p>${course.courseIntroduction}</p>
								<a href="#" id="addClass" class="btn btn-primary"
									onclick="checkLogin()">开始学习</a>


							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div class="container navbar" style="background: #B0C4DE;">
		<div class="row">
			<div class="col-sm-12">
				<div class="col-sm-8">
					<div class="catalog" style="padding-top: 10px;">
						<div class="col-sm-12 navbar" style="background: white;">
							<div class="navbar" style="height: auto; background: white;">
								<div style="text-align: left; padding: 10px;">
									<table class="table">
										<caption>课程介绍</caption>
										<thead>
											<tr>
												<th><span class="glyphicon glyphicon-list-alt"></span>&nbsp;关于本课</th>
											</tr>

										</thead>
										<tbody>
											<tr>
												<td><p>${course.courseIntroduction }</p></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div class=" col-sm-12 navbar" style="background: white;">
							<div class="navbar" style="height: auto; background: white;">
								<div style="text-align: left; padding: 10px;">
									<table class="table">
										<caption>课程目录</caption>
										<c:forEach items="${course.catalogOneList}" var="catalog">
											<thead>
												<tr>
													<th><span class="glyphicon glyphicon-book"></span>&nbsp;${catalog.catalogOneName }</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><p>${catalog.catalogIntroduction }</p></td>
												</tr>
											</tbody>
										</c:forEach>

									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

				<input type="hidden" id="teacherName"
					value="${teacher.teacherName }" />
				<div class="col-sm-4">
					<div class="fakeimg navbar" style="padding-top: 10px;">
						<div class="col-sm-12 navbar" style="background: white;">
							<div class="navbar" style="background: white; height: auto;">
								<div style="text-align: left; padding: 10px;">
									<table class="table">
										<caption>讲师</caption>
										<thead>
											<tr>

												<th><span class="glyphicon glyphicon-user"></span>&nbsp;${teacher.teacherName }</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><p></p></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div class="container-fluid  navbar-default">
		<div class="text-center border-top"
			style="margin-top: 20px; margin-bottom: 20px;">
			<p>Copyright 2019 by WFC .All rights reserved.</p>
		</div>
	</div>
	<!-- 登录模态框 -->
	<div class="modal fade" id="login" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" id="closeLogin"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-center" id="myModalLabel">用户登录</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="user_form" action="login.do"
						onsubmit="">
						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">
								用户名: </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="loginUserId"
									placeholder="请输入用户名" name="userId" />
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;码:</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password"
									placeholder="请输入密码" name="password" />
							</div>
						</div>
						<div>
							<span style="color: red;" id="message"></span>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="login()">登录</button>
					<button type="button" class="btn btn-success" data-toggle="modal"
						data-target="#addUser" onclick="closeLogin()">注册</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 注册模态框 -->
	<div class="modal fade" id="addUser" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" id="closeRegister"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-center" id="myModalLabel">用户注册</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="adduser_form" action="login.do"
						onsubmit="">
						<div class="form-group">
							<label for="addUserId" class="col-sm-2 control-label">
								用&nbsp;&nbsp;户&nbsp;&nbsp;名: </label>
							<div class="col-sm-10">
								<input type="text" required="required" class="form-control"
									id="addUserId" placeholder="请输入用户名" name="addUserId" />
							</div>
						</div>

						<div class="form-group">
							<label for="addPassword" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
							<div class="col-sm-10">
								<input type="password" required="required" class="form-control"
									id="addPassword" placeholder="请输入密码" name="addPassword" />
							</div>
						</div>
						<div class="form-group">
							<label for="checkPassword" class="col-sm-2 control-label">确&nbsp;认&nbsp;密&nbsp;码:</label>
							<div class="col-sm-10">
								<input type="password" required="required" class="form-control"
									id="checkPassword" placeholder="请确认密码" name="checkPassword" />
							</div>
						</div>

						<div>
							<span style="color: red;" id="addUserMessage"></span>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="addUser()">注册</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		//添加课程判断
		function checkLogin() {
			var a = $("#userName").text().replace(/(^\s*)|(\s*$)/g, "");
			if (a == "登录") {
				alert("请登录");

			} else {
				var userId = $("#userId").val();
				var courseId = $("#courseId").val();
				var teacherName = $("#teacherName").val();
				$("#addClass").attr(
						"href",
						"addStuCourse.do?studentId=" + userId + "&courseId="
								+ courseId);
			}
		}
		//登录验证
		function login() {

			var userId = $("#loginUserId").val();
			var password = $("#password").val();
			var params = {
				"userId" : userId,
				"password" : password
			};
			if (userId == "" || userId == null) {
				alert("请输入用户名");
			} else {
				if (password == "" || password == null) {
					alert("请输入密码");
				} else {
					$.ajax({
						url : "login.do",
						type : "post",
						data : params,
						success : function(data) {
							if (data == null || data == "") {
								$("#message").text("用户名或密码错误");
							} else {
								//alert(data.user);
								$("#test").text("123");
								if (data == 2) {
									//window.location.href = "index.jsp";
									window.location.reload()
								} else if (data == 1) {
									window.location.href = "teacherCenter.jsp";
								} else {
									window.location.href = "test.jsp";
								}

							}

						}
					})
				}

			}
		}

		//登录按钮功能判断
		function select() {
			var a = $("#userName").text().replace(/(^\s*)|(\s*$)/g, "");
			var flag = $("#flag").val();
			if (a != "登录") {
				if (flag == 0) {
					$("#userName").attr("href", "backstage.jsp");
					$("#userName").attr('data-target', "");
					$("#userName").attr('data-toggle', "");
				} else if (flag == 1) {
					$("#userName").attr("href", "teacherCenter.jsp");
					$("#userName").attr('data-target', "");
					$("#userName").attr('data-toggle', "");
				} else {
					$("#userName").attr("href", "userCenter.jsp");
					$("#userName").attr('data-target', "");
					$("#userName").attr('data-toggle', "");
				}
			}
		}
		//隐藏登录模态框
		function closeLogin() {
			$("#closeLogin").click();
		}

		//添加用户
		function addUser() {
			var addUserId = $("#addUserId").val();
			var addPassword = $("#addPassword").val();
			var checkPassword = $("#checkPassword").val();

			if (addUserId == "" || addUserId == null) {
				alert("请输入用户名");
			} else {
				if (addUserId.length > 10) {
					alert("用户名不能大于10个字符");
				} else {
					if (addPassword == "" || addPassword == null) {
						alert("请输入密码");
					} else {
						if (addPassword.length < 6) {
							alert("密码不能少于6个字符");
						} else {

							if (addPassword !== checkPassword) {
								alert("密码不一致");
								$("#checkPassword").val("");
							} else {
								var params = {
									"userId" : addUserId,
									"password" : addPassword
								};
								$
										.ajax({
											url : "addUser.do",
											type : "post",
											data : params,
											success : function(data) {
												if (data == 0) {
													$("#addUserMessage").text(
															"该用户名已存在");
												} else {
													alert("注册成功");
													document.getElementById(
															"adduser_form")
															.reset();
													$("#addUserMessage").text(
															"");
													//$('#addUser').modal('hide');
													$("#closeRegister").click();
													$('#addUser')
															.on(
																	'hidden.bs.modal',
																	function() {
																		document
																				.getElementById(
																						"adduser_form")
																				.reset();
																	});
													$("#addUserMessage").text(
															"");
													//document.get
												}
											}
										})
							}
						}

					}
				}

			}
		}
	</script>

</body>
</html>