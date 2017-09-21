<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
</head>
<style type = "text/css">
body
{
	font:14px "微软雅黑", Helvetica, sans-serif;
	color: #000;
	background-color:#EEFFFB;
	margin: 0px;
}
table
{
	border-collapse: collapse;
	border: none;
	margin-top:20px;
	margin-left:40px;
	width: 700px;
}
a{text-decoration:none;}
td
{
	border:1px #ccc solid;
	height: 28px;
	text-align: center;
	background:#fff;
}
th{border:1px #ccc solid;height: 30px;text-align: center;}
#tab
{
position:absolute;
border:1px #ccc solid;
background:#E8F6FF;
width:80px;
text-align: center;
margin-left:550px;
margin-top:-31px;
border-bottom:1px #E8F6FF solid;
}
#tab_title{font-size:16px;color:blue;line-height:30px;}
.contain
{
	border:1px #ccc solid;
	width: 780px;
	height:550px;
	text-align: center;
	margin-top:70px;
	margin-bottom:40px;
	margin-left:200px;
	overflow-y:auto;
	background:#E8F6FF;
}
span
{
display:inline-block;
}
#search-div{margin-top:40px;}
#search-select{margin-left:20px;}
#submit-div{width:60px;margin-top:20px;float:right;margin-right:40px;}
#submit-style{width:60px;height:26px;font-family:"微软雅黑"}
#submit-style:hover{cursor:pointer;}

#create_role_div{margin-top:20px;}
#create_role{border:none;background:red; padding:5px 6px;color:#fff;border-radius:5px;}
#create_role:hover{cursor:pointer;}

#role_div
{
border:1px #ccc solid;
width:300px;
height:250px;
background:#eee;
position:absolute;
margin-left:440px;
margin-top:40px;
display:none;
text-align:center;
}

#create_div{margin-top:40px;}
.button-style{margin-top:40px;margin-left:10px;border:none;background:red; padding:3px 6px;color:#fff;border-radius:5px;}
.button-style:hover{cursor:pointer;}
</style>
<body>
<script src="extended/jquery-2.1.1.min.js"></script>
<script>
$(document).ready(function(){
	
	var roles;
	$.ajax({   
        type:"POST",  
        url:"RoleLoad", 
        async:false,
        dataType: "text",
        
        //请求成功完成后要执行的方法  
        success: function(msg){   
        	roles = msg.trim().split(" "); 
        }, 
        error: function (response) {
        	
        }  
    });
	$(roles).each(function(i,dom){
		
		$("#search").append("<option value='"+dom+"' >"+dom+"</option>");
	});
	
	var stext;
	$.ajax({   
        type:"POST",  
        url:"RoleSearch", 
        async:false,
        dataType: "text",
        
        //请求成功完成后要执行的方法  
        success: function(msg){   
        	stext = msg.trim().split(" "); 
        	$("#main-table").append("<tr><th>权限名称</th><th>权限说明</th><th>是否赋予</th></tr>");
        }, 
        error: function (response) {
        	
        }  
    });
	$(stext).each(function(i, dom){
		if(dom!=""&&dom!="null")
		{
			var tdtext = stext[i].split(",");
			$("#main-table").append(
					"<tr><td>" + tdtext[0] + 
					"</td><td>" + tdtext[1] +
					"</td><td>" + "<input type='checkbox' name='powerlist' value = '"+tdtext[2]+"' />" +
					"</td></tr>");
		}
    });
	
	$("#search").change(function(){

		$("input[type='checkbox'][name='powerlist']:checked").each(function(){
			$(this).prop("checked",false);
		});
		var me = $(this).val();
		
        var powerselect;
        $.ajax({   
            type:"POST",  
            url:"PowerSelect", 
            async:false,
            data:{"change":me},
            dataType: "text",
            
            //请求成功完成后要执行的方法  
            success: function(msg){   
            	powerselect = msg.split(" "); 
            }, 
            error: function (response) {
            }  
        });
        
        $(powerselect).each(function(j, dom1){
			$("input[type='checkbox'][value='" + dom1 + "']").prop("checked",true);
        });
    });
	
	$("#create_role").click(function(){
		
		$(".contain input").prop("disabled",true);
		$("#rolename").val("");
		$("#role_div").show();
		$("#rolename").focus();
	});
	$(".button-style").click(function(){
		if($(this).val()=="quxiao")
		{
			$(".contain input").prop("disabled",false);
			$("#role_div").hide();
		}
		if($(this).val()=="queding")
		{
			if($("#rolename").val()=="")
			{
				alert("请输入角色名称");
				$("#rolename").focus();
			}
			else
			{
				$(".contain input").prop("disabled",false);
				$("#role_div").hide();
				var rolename = $("#rolename").val();
			
				$.ajax({   
	               type:"POST",  
	               url:"AddRole", 
	               async:false,
	               data:{"rolename":rolename},
	               dataType: "text",
	               
	               //请求成功完成后要执行的方法  
	               success: function(msg){ 
	            	   if(msg=="1")
	            	   {
	            		   alert("新建角色成功");
	            		   $("#search").append("<option value='"+rolename+"' >"+rolename+"</option>");
	            	   }
	            	   else
	            	   {
	            		   alert("新建角色失败");
	            	   }
	               }, 
	               error: function (response) {
	               }  
	           });  
			}
		}
	});
});

function validate()
{
 	if($("#search").val()=="please"){
    	alert("请选择角色！");
    	$("#search").focus();
    	return false;
	}
  	return true;
}

</script>

<div id="role_div">
	<div id = "create_div">
		<label>角色名称：</label>&nbsp;<input name="rolename" id="rolename" type="text" />
		<br>
		<button class="button-style" type="button" value="queding">确定</button>
		<button class="button-style" type="button" value="quxiao">取消</button>
	</div>
</div>

<div id="tab">
	<label id="tab_title">角色管理</label>
</div>
<div class="contain">
	<div id="search-div">
		<label>请选择角色:</label>
		<span>&nbsp;&nbsp;&nbsp;</span>
		<select class="search-select" name="search" id="search" style="width:160px;height:22px;">
			<option value="please" selected>请选择角色</option>
    	</select>
	</div>
	<div id="create_role_div">
		<button name="create_role" id="create_role" value="createrole">新增角色</button>
	</div>
	<div id="table-div">
	  <form name="form1" id="needform" method="post" action="PowerAllot.jsp">
		<table id="main-table">
			
		</table>
		<div id="submit-div">
			<input id="submit-style" type="submit" value="确认" onclick="return validate()" />
		</div>
	  </form>
	</div>
</div>
</body>
</html>