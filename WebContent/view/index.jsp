<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--  <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<title>NewFuture Teaching System</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="css/jquery.slideBox.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="js/jquery.slideBox.js" type="text/javascript"></script>

<script>
	jQuery(function($) {

		$('#demo1').slideBox();

		$('#demo2').slideBox({

			direction : 'top',//left,top#方向

			duration : 0.3,//滚动持续时间，单位：秒

			easing : 'linear',//swing,linear//滚动特效

			delay : 5,//滚动延迟时间，单位：秒

			startIndex : 1
		//初始焦点顺序

		});

		$('#demo3').slideBox({

			duration : 0.3,//滚动持续时间，单位：秒

			easing : 'linear',//swing,linear//滚动特效

			delay : 5,//滚动延迟时间，单位：秒

			hideClickBar : false,//不自动隐藏点选按键

			clickBarRadius : 10

		});

		$('#demo4').slideBox({

			hideBottomBar : true
		//隐藏底栏

		});

	});
</script>
<style>
.fakeimg {
	height: 430px;
	background: #aaa;
}

#slideboxdemo {
	height: 430px;
	background: white;
}

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

.modal-content {
	margin-left: 50px;
	margin-top: 100px;
	width: 550px;
}
</style>
</head>
<body>
	<nav class="navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<p class="navbar-brand" id="logo">NewFuture</p>
			</div>
			<ul class="nav navbar-nav navbar-right">
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

	<nav class="navbar">
		<div class="navbar">
			<div class="pull-left">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab">主页</a></li>
					<li class="dropdown"><a href="#" id="myTabDrop1"
						class="dropdown-toggle" data-toggle="dropdown">前端 <b
							class="caret"></b>
					</a>
						<ul class="dropdown-menu"  role="menu" aria-labelledby="myTabDrop2">
						<c:forEach items="${oneCourses }" var="course">
						<li><a href="getCourseMessage.do?courseId=${course.courseId }" tabindex="-1" >${course.courseName}</a></li>
						</c:forEach>
						</ul></li>
					<li class="dropdown"><a href="#" id="myTabDrop2"
						class="dropdown-toggle" data-toggle="dropdown">后端 <b
							class="caret"></b>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop2">
							<c:forEach items="${twoCourses }" var="course">
						<li><a href="getCourseMessage.do?courseId=${course.courseId }" tabindex="-1">${course.courseName}</a></li>
						</c:forEach>
						</ul></li>
					<li class="dropdown"><a href="#" id="myTabDrop3"
						class="dropdown-toggle" data-toggle="dropdown">数据库 <b
							class="caret"></b>
					</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop3">
						<c:forEach items="${threeCourses }" var="course">
						<li><a href="getCourseMessage.do?courseId=${course.courseId }" tabindex="-1">${course.courseName}</a></li>
						</c:forEach>
						</ul></li>
				</ul>
			</div>
			<input type="hidden" id="flag" value="${sessionScope.user.getFlag()} ">
			<form class="navbar-form navbar-right" role="search"
				action="search.do" id="searchForm">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="课程搜索"
						name="searchMessage" id="searchMessage">
				</div>
				<button type="button" class="btn btn-default" placeholder="请输入课程" onclick="checkSearch()">搜索</button>
			</form>
		</div>
	</nav>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade in active navbar container" id="home">

			<div class="col-sm-12">
				<div id="slideboxdemo">
					<div id="demo1" class="slideBox" style="margin: 0 auto">

						<ul class="items">

							<li><a href="#" title="JAVA"><img src="img/1.jpg"></a></li>

							<li><a href="#" title="Java Script"><img src="img/2.jpg"></a></li>

							<li><a href="#" title="HTML"><img src="img/3.jpg"></a></li>

						</ul>

					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 登录模态框 -->
	<div class="modal fade" id="login" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" id="closeLogin" data-dismiss="modal"
						aria-label="Close">
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
								<input type="text" class="form-control" id="userId"
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
					<button type="button" class="close" id="closeRegister" data-dismiss="modal"
						aria-label="Close">
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
	<div class="container-fluid navbar-default">
		<div class="text-center border-top"
			style="margin-top: 20px; margin-bottom: 20px">
			<p>Copyright 2019 by WFC .All rights reserved.</p>
		</div>
	</div>
	<script type="text/javascript">

	//搜索验证
	function checkSearch() {
		var condition = $("#searchMessage").val();
		if(condition == "" || condition == null){
			alert("请输入检索内容");
		}else{
			$("#searchForm").submit();
		}
	}
		//登录验证
		function login() {

			var userId = $("#userId").val();
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
									window.location.href = "first.jsp";
									//window.location.reload()
								} else if (data == 1) {
									window.location.href = "teacherCenter.jsp";
								} else {
									window.location.href = "backstage.jsp";
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
				if(flag==0){
					$("#userName").attr("href", "backstage.jsp");
					$("#userName").attr('data-target', "");
					$("#userName").attr('data-toggle', "");
				}else if(flag == 1){
					$("#userName").attr("href", "teacherCenter.jsp");
					$("#userName").attr('data-target', "");
					$("#userName").attr('data-toggle', "");
				}else{
				$("#userName").attr("href", "userCenter.jsp");
				$("#userName").attr('data-target', "");
				$("#userName").attr('data-toggle', "");}
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
													$('#addUser').on('hidden.bs.modal',
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
