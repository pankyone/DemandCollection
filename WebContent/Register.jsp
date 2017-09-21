<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<script type="text/javascript" src="extended/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="extended/jquery.md5.js"></script>
<style type="text/css">
body
{
	margin:0;
	padding:0;
	font-family:"微软雅黑";
	background:url(img/Register.png);
}

.contain
{
width:500px;
margin-left:540px;
margin-top:230px;
text-align:left;
}
.form-input label{display:inline-block;width:90px;text-align:left; margin:5px 0px;}
.form-input .tip{width:140px;margin-left:40px;color:#fff;display:none;}
.form-input input{margin:5px 0px;margin-left:20px;}
.form-submit{margin:30px 0px;text-align:left;margin-left:100px;}
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
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#username").blur(function(){
		if($("#username").val()==""){
			$("#lab1").text("用户名不能为空！");
	    		$("#lab1").show();
		}
		else if(!IsUsername())
		{
			$("#lab1").text("6到20位数字或字母组成");
	    		$("#lab1").show();
		}
		else
		{
			$("#lab1").hide();
			$("#lab1").text("用户名不能为空！");
		}
	});
	$("#psw").blur(function(){
		if($("#psw").val()==""){
			$("#lab2").text("用户密码不能为空");
	    		$("#lab2").show();
		}
		else if(!IsPWD())
		{
			$("#lab2").text("用户密码为6位数字组成");
			$("#lab2").show();
		}
		else
		{
			$("#lab2").hide();
			$("#lab2").text("用户密码不能为空");
		}
	});
	$("#psw_real").blur(function(){
		if($("#psw_real").val()==""){
			$("#lab3").text("验证密码不能为空");
	    		$("#lab3").show();
		}
		else if($("#psw_real").val()!=$("#psw").val())
	 	{
			$("#lab3").text("密码不一致");
			$("#lab3").show();
	 	}
		else
		{
			$("#lab3").hide();
			$("#lab3").text("验证密码不能为空");
		}
	});
	$("#name").blur(function(){	
		if($("#name").val()==""){
	    	$("#lab4").show();
		}
		else
		{
			$("#lab4").hide();
		}
	});
	$("#peopleID").blur(function(){	
		if($("#peopleID").val()==""){
	    	$("#lab5").show();
		}
		else
		{
			$("#lab5").hide();
		}
	});
	$("#jigouname").blur(function(){	
		if($("#jigouname").val()==""){
	    	$("#lab6").show();
		}
		else
		{
			$("#lab6").hide();
		}
	});
	$("#jigoucode").blur(function(){
		if($("#jigoucode").val()==""){
	    	$("#lab7").show();
		}
		else
		{
			$("#lab7").hide();
		}
	});
	$("#submit-style").click(function(){
		if(validate())
		{
			var pwd = $("#psw").val();
			var password = $.md5(pwd);
			var path = "zhuce.jsp?pwd="+password;  
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
	if(!IsUsername())
	{
		alert("用户名为6到20位数字或字母组成！");
		$("#username").focus();
  		return false;
	}
 	if($("#psw").val()==""){
  		alert("密码不能为空！");
  		$("#psw").focus();
  		return false;
  	}

 	if($("#psw_real").val()==""){
  		alert("请再次输入密码！");
  		$("#psw_real").focus();
  		return false;
  	}
 	if($("#psw_real").val()!=$("#psw").val())
 	{
 		alert("密码不一致！");
  		$("#psw_real").focus();
  		return false;
 	}
	if(!IsPWD())
	{
		alert("密码为6位数字组成！");
		$("#psw").focus();
  		return false;
	}
 	if($("#name").val()==""){
  		alert("请输入真实姓名！");
  		$("#name").focus();
  		return false;
  	}
 	if($("#peopleID").val()==""){
  		alert("请输入身份证号！");
  		$("#peopleID").focus();
  		return false;
  	}
 	if($("#jigouname").val()==""){
  		alert("请输入机构全称！");
  		$("#jigouname").focus();
  		return false;
  	}
 	if($("#jigoucode").val()==""){
  		alert("请输入机构代码！");
  		$("#jigoucode").focus();
  		return false;
  	}
 	
  	return true;
}
function IsUsername()
{
	var obj=$("#username").val();
   	reg=/^[A-Za-z0-9]{6,20}$/;
  	 if((!reg.test(obj))&&(obj!="")){        
  	 	return false;
        }
	return true;
}
function IsPWD()
{

	var obj=$("#psw").val();
   	reg=/[0-9]{6}/;
   	if((!reg.test(obj))&&(obj!="")){        
        	return false;
       }
   	return true;
}
</script>

</head>
<body>
	<div class="contain">
		<form method="post" id="form1" action="">
			<div class="form-input">
				<label>*用户名:</label><input type="text" id="username" name="username" placeholder="6到20位字母和数字组成" required/>
				<label class="tip" id="lab1">用户名不能为空</label><br>
				<label>*用户密码:</label><input type="password" id="psw" name="psw" placeholder="6位数字组成" required />
				<label class="tip" id="lab2">用户密码不能为空</label><br>
				<label>*验证密码:</label><input type="password" id="psw_real" name="psw_real" placeholder="请再次输入密码" required />
				<label class="tip" id="lab3">验证密码不能为空</label><br>
				<label>*真实姓名:</label><input type="text" id="name" name="name" placeholder="请输入真实姓名" required/>
				<label class="tip" id="lab4">真实姓名不能为空</label><br>
				<label>*身份证号:</label><input type="text" id="peopleID" name="peopleID" placeholder="请输入身份证号" required/>
				<label class="tip" id="lab5">身份证号不能为空</label><br>
				<label>*机构全称:</label><input type="text" id="jigouname" name="jigouname" placeholder="请输入机构全称" required/>
				<label class="tip" id="lab6">机构全称不能为空</label><br>
				<label>*机构代码:</label><input type="text" id="jigoucode" name="jigoucode" placeholder="请输入机构代码" required/>
				<label class="tip" id="lab7">机构代码不能为空</label>
			</div>
			<div class="form-submit">
				<input id="submit-style" type="button" name="sub" value="注册" />
				<a href="Login.jsp">登录</a>
			</div>
		</form>
	</div>
</body>
</html>