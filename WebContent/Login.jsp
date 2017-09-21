<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link rel="stylesheet" href="css/Login.css">
<script type="text/javascript" src="extended/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="extended/jquery.md5.js"></script>
<style type="text/css">
body
{
	margin:0;
	padding:0;
	font-family:微软雅黑;
	background:url(img/login.png);
}
.contain{width:440px;height:240px;margin-left:400px;margin-top:270px;text-align:left;}
label{width:80px;text-align:right;display:inline-block;}
.form-input input{margin-left:20px;}
.form-input .tip{width:120px;margin-left:10px;color:#fff;text-align:left;display:none;}
.form-submit{margin-top:56px;margin-left:96px;}

.form-submit a{margin-left:20px;font-size:12px;}
#submit-style
{
	background:red; 
	width:60px; 
	height:30px; 
	color:#fff;
	border-radius:5px;
}
#submit-style:hover{color:#fff;cursor:pointer;}
#CheckCode{width:70px;margin-right:0px;float:right;}
#code-img{width:70px;height:20px;float:right;margin-right:170px;margin-left:26px;}
#code-img:hover
{
	cursor:pointer;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	var rand = <%=(String)session.getAttribute("rand")%>;
	$("#username").blur(function(){
		if($("#username").val()==""){
	    	$("#lab1").show();
		}
		else
		{
			$("#lab1").hide();
		}
	});
	$("#psw").blur(function(){
		if($("#psw").val()==""){
	    	$("#lab2").show();
		}
		else
		{
			$("#lab2").hide();
		}
	});
	$("#CheckCode").blur(function(){
		if($("#CheckCode").val()==""){
	    	$("#lab3").show();
		}
		else
		{
			$("#lab3").hide();
		}
	});
	$("#submit-style").click(function(){
		if(validate())
		{
			var pwd = $("#psw").val();
			var password = $.md5(pwd);
			var path = "judge.jsp?pwd="+password;  
		    $('#form1').attr("action", path).submit();
		}
	});

});

function validate()
{
 	if($("#username").val()==""){
    	alert("用户名不能为空！");
    	$("#username").focus();
    	return false;
	}
 	if($("#psw").val()==""){
  		alert("密码不能为空！");
  		$("#psw").focus();
  		return false;
  	}

 	if($("#CheckCode").val()==""){
  		alert("请输入验证码！");
  		$("#CheckCode").focus();
  		return false;
  	}
  	return true;
}
</script>
</head>
<body>
	<div class="contain">
		<form name="form1" id="form1" method="post" action="judge.jsp">
			<div class="form-input">
				<label>用户名:</label><input type="text" id="username" name="username" placeholder="请输入用户名" required/>
				<label class="tip" id="lab1">用户名不能为空</label><br><br>
				<label>密码:</label><input type="password" id="psw" name="psw" placeholder="请输入密码" required />
				<label class="tip" id="lab2">密码不能为空</label><br><br>
				<label>验证码:</label>
				<img src="CheckCode.jsp" name="code-img" id="code-img" border="0" alt="刷新" title="看不清可单击图片刷新" onclick="this.src='CheckCode.jsp?d='+Math.random();"  />
				<input id="CheckCode" type="text" name="CheckCode" required />
				<label class="tip" id="lab3" style="float:left;margin-left:288px;margin-top:-23px;">验证码不能为空</label>
			</div>
			<div class="form-submit">
				<input id="submit-style" type="button" name="sub" value="登录"/>
				<a href="Register.jsp">注册</a>
			</div>
		</form>
	</div>
</body>
</html>