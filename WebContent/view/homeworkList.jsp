<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>作业列表</title>
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
	text-align: center;
}

table td, table th {
	border: 1px solid #cad9ea;
	color: #666;
	height: 30px;
	width: 150px;
	text-align: center;
}

table thead th {
	background-color: #E6E6FA;
	width: 100px;
}

table tr:nth-child(odd) {
	background: #fff;
}

table tr:nth-child(even) {
	background: #F5FAFA;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<table class="table table-bordered table-striped" border="1"
					align="center">
					<caption>
						<h1>作业查看<button type="button" class="btn btn-info pull-right" onclick="history.back(-1)">返回</button></h1>
						
					</caption>
					<thead>
						<tr>
							<th>编号</th>
							<th>作业提交时间</th>
							<th>是否已批改</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${workList}" var="work" varStatus="w"> 
							<tr>
								<td>${w.count }</td>
								<td>${work.workSubmitTime }</td>
								<td>${work.workState==0?"未批改":"已批改"}</td>
								<td><a href="checkStudentWork.do?workId=${work.workId }&studentId=${studentId}&courseId=${courseId}" class="btn btn-primary btn-lg btn-sm"><span class="glyphicon glyphicon-edit"></span>&nbsp;批改作业</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>

	</div>
	<script type="text/javascript">
	
	</script>
</body>
</html>