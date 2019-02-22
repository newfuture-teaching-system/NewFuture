<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>提交作业</title>
<script type="text/javascript" src="html2canvas.js"></script>
</head>
<script type="text/javascript">
function takeScreenshot() {
  console.log('test');
    html2canvas(document.getElementById		
    		('view'), {
        onrendered: function(canvas) {
            document.body.appendChild(canvas);
        },
    });
}
</script>
<body>

	<div>
        <textarea id="view" rows="10" cols="100" placeholder="请输入作业代码"></textarea>
    </div>
    <input type="button" value="提交" onclick="takeScreenshot()">
	
</body>
</html>