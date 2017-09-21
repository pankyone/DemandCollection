<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>密码修改</title>
<script type="text/javascript" src="extended/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="extended/jquery.md5.js"></script>
<style type="text/css">
body
{
	font:16px "微软雅黑", Helvetica, sans-serif;
	color: #000;
	background-color:#EEFFFB;
	margin: 0px;
}
.contain
{
	background:#E8F6FF;
	opacity:0.8;
	width:466px;
	height:368px;
	margin-left:350px;
	margin-top:100px;
	text-align:center;
}
h2{padding-top:30px;}
.form-input{margin-top:40px;}
.form-input input{margin-left:20px;}

.form-submit{margin-top:40px;}
#submit-style
{
	background:red; 
	width:60px; 
	height:30px; 
	color:#fff;
	border-radius:5px;
}
#submit-style:hover{color:#fff;cursor:pointer;}
</style>

<script type="text/javascript">

$(document).ready(function(){
	
	$("#submit-style").click(function(){
		if(validate())
		{
			var pwd = $("#newpsw").val();
			var password = $.md5(pwd);
			var path = "MiMaXiuGai.jsp?pwd="+password;  
		    $('#form1').attr("action", path).submit();
		}
	});
	
});

function validate()
{
 	if(document.form.newpsw.value==""){
    	window.alert("请输入您的新密码！");
    	$("#newpsw").focus();
    	return false;
	}
 	if(document.form.secondpsw.value==""){
  		window.alert("请再次输入！");
  		$("#secondpsw").focus();
  		return false;
  	}

  	return true;
}
</script>
</head>
<body>
	<div class="contain">
		<h2>密码修改</h2>
		<form method="post" name="form" id="form1" action="MiMaXiuGai.jsp">
			<div class="form-input">
				<label>新的密码:</label><input type="password" id="newpsw" name="newpsw" placeholder="6到20位字母和数字组成" required/>
				<br><br>
				<label>再次输入:</label><input type="password" id="secondpsw" name="secondpsw" placeholder="6到20位字母和数字组成" required />
			</div>
			<div class="form-submit">
				<input id="submit-style" type="button" name="sub" value="修改" />
			</div>
		</form>
	</div>
</body>
</html>