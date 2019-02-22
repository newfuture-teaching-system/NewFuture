<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>开始学习</title>
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
</style>
</head>
<body>
	<nav class=" navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<p class="navbar-brand " id="logo">NewFuture</p>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="first.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
				<li><a href="userCenter.jsp"><span class="glyphicon glyphicon-user"></span>
						${sessionScope.user.getUsername()}</a></li>
				<li><a href="logout.do"><span
						class="glyphicon glyphicon-log-out"></span> 退出登录</a></li>
			</ul>
		</div>
	</nav>
	<input type="hidden" id="flag" value="${sessionScope.user.getFlag()} ">
	<div class="container navbar" style="background: #B0C4DE;">
		<div class="row">
			<div class="col-xs-12" style="padding-top: 20px;">
				<div class="col-xs-12 navbar"
					style="background: #B0C4DE; height: auto;">
					<nav class="navbar navbar-default" role="navigation">
						<div class="container-fluid">
							<div class="navbar-header">
								<a class="navbar-brand" href="javascript:history.back(-1)">课程页面</a>
							</div>
							<div>
								<ul class="nav navbar-nav">
									<li class="pull-right"><a href="#">学习进度：${stuCourse.getCourseProgress()}</a></li>

								</ul>
							</div>
						</div>
					</nav>
				</div>

				<div class="col-xs-3">
					<div class="navbar" style="background: #B0C4DE;">
						<div class="panel-group" id="accordion">
							<div class="panel panel-default">

								<!-- 								主框 -->
								
								<c:forEach items="${listOne}" var="catalogOne"
									varStatus="o">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion"
												href="${catalogOne.getCatalogOneId()}"> <span
												class="glyphicon glyphicon-list-alt"></span>&nbsp;${catalogOne.getCatalogOneName()}
											</a>

										</h4>
									</div>
								<c:set value="${catalogOne.getCatalogOneTwoList()}" var="catalogOt"/>
								<!-- 								折叠框 -->
								<c:forEach
									items="${catalogOt}" 
 									var="catalogOt" varStatus="ot"> 
 									<c:if test="${catalogOt.getCatalogTwoName()!=null}">
									<div id="${catalogOne.getCatalogOneId()}" class="panel-collapse collapse in">
										<div class="panel-body">
										<a id="${catalogOt.getCatalogTwoId()}" style="text-decoration: none; color: black;" href="selectContent.do?courseId=${courseId}&oneId=${catalogOne.getCatalogOneId()}&twoId=${catalogOt.getCatalogTwoId()}" 
												target="rightframe">&nbsp;${catalogOt.getCatalogTwoName()}</a>
										</div>
									 </div>
									 </c:if>
								</c:forEach> 
								</c:forEach>
							</div>



						</div>
					</div>

				</div>

				<div class="col-xs-9">
					<div class="navbar"
						style="background: white; height: 800px; padding: 10px;">

						<iframe name="rightframe" src="" frameborder="0"
							noresize="noresize" width="100%" height="100%"></iframe>
					</div>

				</div>


			</div>
		</div>
	</div>

	<div class="container-fluid  navbar-default">
		<div class="text-center border-top"
			style="margin-top: 20px; margin-bottom: 20px">
			<p>Copyright 2019 by WFC .All rights reserved.</p>
		</div>
	</div>
<script type="text/javascript">
//登录按钮验证
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
</script>
</body>
</html>