<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>密码修改</title>
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
	height:300px;
	margin-left:350px;
	margin-top:100px;
	text-align:center;
}
.main{width:256px;margin-left:100px;text-align:left;}
h2{padding-top:30px;}
.style-select{width:165px;height:22px;}
.btn-div{margin-top:60px;}
#pwd{color:#999;}
.btn-style
{
	background:red; 
	width:60px; 
	height:30px; 
	color:#fff;
	border-radius:5px;
}

.btn-style:hover{color:#fff;cursor:pointer;}
</style>
<script src="extended/jquery-2.1.1.min.js"></script>
<script src="extended/jquery.md5.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	var userlist;
	$.ajax({   
        type:"POST",  
        url:"UserLoad", 
        async:false,
        dataType: "text",
        
        //请求成功完成后要执行的方法  
        success: function(msg){   
        	userlist = msg.trim().split(" "); 
        }, 
        error: function (response) {
        	
        }  
    });
	
	$(userlist).each(function(i,dom){
		$("#user-select").append("<option value='"+dom+"' >"+dom+"</option>");
	});
	
	$("#btn").click(function(){
		
		var userselect = $("#user-select").val();
		var psw = $("#pwd").text();
		var pwd = $.md5(psw);
		if(userselect=="请选择")
		{
			alert("请选择用户");
		}
		else
		{
			var r = confirm("是否重置密码？");
			if(r == true)
			{
			$.ajax({   
		        type:"POST",  
		        url:"PWDreset", 
		        async:false,
		        data:{"userselect":userselect,"pwd":pwd},
		        dataType: "text",
		        
		        //请求成功完成后要执行的方法  
		        success: function(msg){   
		        	if(msg=="1")
		        	{
		        		var alt = "用户 "+userselect+" 的密码以重置为 "+psw
		        		alert(alt);
		        	}
		        	else
		        	{
		        		alert("密码重置出错！");
		        	}
		        }, 
		        error: function (response) {
		        	
		        }  
		    });
			}
		}
	});
	
});
</script>
</head>
<body>
	<div class="contain">
		<h2>用户密码重置</h2>
		<div class="main">
			<label>选择用户：</label>
			<select class="style-select" name="user-select" id="user-select">
				<option value = "请选择" selected>请选择</option>
			</select>
			<br><br>
			<label>初始密码：</label>
			<label id="pwd">123456</label>
		</div>
		<div class="btn-div">
			<input class="btn-style" type="button" name="btn" id="btn" value="重置" onclick="return validate()" />
		</div>
	</div>
</body>
</html>