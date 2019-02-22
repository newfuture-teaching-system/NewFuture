<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">

td{
    text-align:center;
}
th{
	text-align:center;
}
</style>
</head>
<body style="text-align: center">
	<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">请选择</h3>
	</div>
	<div class="panel-body"  style="text-align:center">
		 <input type="hidden" value = ${courseId } name="courseId">
    
        <table class="table table-bordered table-hover  table-condensed" style="width: 500px;margin: auto;">
			<thead>
				<tr class="info">
					<th>一级目录</th>
					<th style="width: 80px;">操&nbsp;&nbsp;&nbsp;作</th>
				</tr>
			</thead>
			<tbody id="tb">
			<c:forEach items="${course.catalogOneList }" var="catalogOne">
			<tr>
					<td >${catalogOne.catalogOneName }</td>
					<td><a  href="turnToAddTwo.do?courseId=${catalogOne.courseId }&catalogOneId=${catalogOne.catalogOneId}" class="btn btn-info btn-sm">录入</a></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
     	
	</div>
</div>
       
            

      
        <script type="text/javascript">
       
        </script>
</body>
</html>
</body>
</html>