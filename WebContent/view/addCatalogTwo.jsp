<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
td {
	text-align: center;
}

th {
	text-align: center;
}
</style>
</head>
<body style="text-align: center">
	<form action="addTwo.do" id="twoForm">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">录入二级目录</h3>
			</div>
			<div class="panel-body" style="text-align: center">


				<table class="table table-bordered table-condensed"
					style="width: 500px; margin: auto;">
					<thead>
						<tr class="info">
							<th>目录序号</th>
							<th>目录名称</th>
							<th>章节描述</th>
							<th>操&nbsp;&nbsp;&nbsp;&nbsp;作</th>
						</tr>
					</thead>
					<tbody id="tb">
						<tr>
							<td><input type="text" name="num" class="num"
								required="required"></td>
							<td><input type="text" name="catalogOneName"
								required="required"></td>
							<td><input type="text" name="content" required="required"></td>
							<td>&nbsp;&nbsp;<a onclick="addOne()"><span
									class="glyphicon glyphicon-plus-sign"></span></a>&nbsp;&nbsp;
							</td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
		<input type="hidden" value=${courseId } name="courseId"> <input
			type="hidden" value=${catalogOneId } name="catalogOneId">

	</form>
	<button type="button" class="btn btn-info" onclick="check()">提交</button>


	<script type="text/javascript">
		function addOne() {
			$("#tb")
					.append(
							'<tr><td><input type="text" name="num" class="num" required="required"></td><td><input type="text" name="catalogOneName"  required="required"></td><td><input type="text" name="content"  required="required"></td><td><a onclick="addOne()"><span class="glyphicon glyphicon-plus-sign"></span></a>&nbsp;&nbsp;&nbsp;<a onclick="reduceOne(this)"><span class="glyphicon glyphicon-minus-sign"></span></a></td></tr>');
		}
		function reduceOne(that) {
			$(that).parent().parent().remove();
		}
		function check() {
			var reg = /^\+?[1-9][0-9]*$/;

			var flag = 0;
			$("input").each(function() {
				if ($(this).val() == "" || $(this).val() == null) {
					alert("输入框不能为空！");
					flag = 1;
					return false;
				} else {
					flag = 2;
				}
			})
			if (flag == 2) {
				$(".num").each(function() {
					if (!reg.test($(this).val())) {
						alert("目录序号必须为数字！");
						flag = 3;
						return false;
					} else {
						flag = 4;

					}
				})
			}
			if (flag == 4) {
				if (hasRepeat() == false) {
					$("#twoForm").submit();
				} else {
					alert("目录序号不能重复！");
				}
			}
			function hasRepeat() {
				var arr = [];
				$(".num").each(function() {
					arr.push($(this).val());
				});
				if (arr.length == $.unique(arr).length) {
					return false;
				} else {
					return true;
				}
			}
		}
	</script>
</body>
</html>