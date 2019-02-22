<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改登录信息</title>
<link
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
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
				<h3 class="panel-title">修改登录信息</h3>
			</div>
			<div class="panel-body">
				<form class="bs-example bs-example-form" role="form"
					action="changeUserInfo.do" id="formPD">
					<input type="hidden" name="userId"
						value="${sessionScope.user.getUserId()}"></input>
					<table>
						<tbody>
						<tr>
								<td>
									<div class="input-group">
										<span class="input-group-addon">用&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;名&nbsp;</span>
										<input type="text" class="form-control"
											placeholder="请输入用户名" name="username" id="userNameId" value="${sessionScope.user.getUsername() }">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-group">
										<span class="input-group-addon">原&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码&nbsp;</span>
										<input type="password" class="form-control"
											placeholder="请输入原密码" name="password" id="password">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="input-group">
										<span class="input-group-addon">新&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码&nbsp;</span>
										<input type="password" class="form-control"
											placeholder="请输入新密码" name="newPassword" id="newPD">
									</div>
								</td>
							</tr>

							<tr>
								<td>
									<div class="input-group">
										<div class="input-group">
											<span class="input-group-addon">确认新密码</span> <input
												type="password" class="form-control" placeholder="请确认新密码"
												name="newPassword1" id="newPD1">
										</div>
									</div>
								</td>
							</tr>


						</tbody>
					</table>
					<div style="text-align: center">
						<span style="color: red;" id="message">${msg}</span>
					</div>
					<div class="panel-heading text-center">
						<button type="button" class="btn btn-default" id="left save"
							style="margin-right: 130px;" onclick="check()">保存</button>
						<button type="button" class="btn btn-default" id="right clear">取消</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		function check() {
			var userName = $("#userNameId").val();
			var password = $("#password").val();
			var newPD = $("#newPD").val();
			var newPD1 = $("#newPD1").val();
			if(userName == ""){
				$("#message").text("用户名不能为空");
			}else if (password == "") {
				$("#message").text("原密码不能为空");
			} else if (password.length < 6){
				$("#message").text("原密码不足6位");
			} else if (newPD == "") {
				$("#message").text("新密码不能为空");
			} else if (newPD.length < 6) {
				$("#message").text("密码长度不足六位");
			} else if(password == newPD){
				$("#message").text("修改密码不能与原密码相同");
			} else if (newPD !== newPD1) {
				$("#message").text("密码不一致");
			} else {
				$("#formPD").submit();
			}
		}
	</script>
</body>
</html>