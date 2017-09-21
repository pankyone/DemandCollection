<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link href="css/jPages.css" rel="stylesheet"/>
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
	width: 800px;
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
	width: 880px;
	height:550px;
	text-align: center;
	margin-top:70px;
	margin-bottom:40px;
	margin-left:150px;
	overflow-y:auto;
	background:#E8F6FF;
}
span
{
display:inline-block;
}

#create_user_div{margin-top:20px;}
#create_user{border:none;background:red; padding:5px 6px;color:#fff;border-radius:5px;}
#create_user:hover{cursor:pointer;}

#user_div
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
#changerole
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
#role_div{margin-top:40px;}
#create_div{margin-top:40px;}

.button-style{margin-top:40px;margin-left:10px;border:none;background:red; padding:3px 6px;color:#fff;border-radius:5px;}
.button-style:hover{cursor:pointer;}
#roleselect{width:174px;}

.change{}
.del{margin-left:20px;}
</style>
<body>
<script src="extended/jquery-2.1.1.min.js"></script>
<script src="extended/jPages.js"></script>
<script type="text/javascript" src="extended/jquery.md5.js"></script>
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
		$(".roleselect").append("<option value='"+dom+"' >"+dom+"</option>");
	});
	
	$("#t_title").append("<tr><th>用户名</th><th>角色</th><th>权限</th><th>操作</th></tr>");
	UserLoad();
	
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
	
	$("#create_user").click(function(){
		$(".contain button").prop("disabled",true);
		$(".contain a").removeAttr("href");
		$(".contain a").removeAttr("onclick");
		$("#username").val("");
		$("#psw").val("");
		$("#roleselect").find("option[value='请选择']").prop("selected",true);
		$("#user_div").show();
		$("#username").focus();
	});
	$(".userbtn").click(function(){
		if($(this).val()=="quxiao")
		{
			$(".contain button").prop("disabled",false);
			$("#main-table a").attr("href","javascript:void(0)");
   			$(".del").attr("onclick","delClick(this);");
   			$(".change").attr("onclick","changeRole(this);");
			$("#user_div").hide();
		}
		if($(this).val()=="queding")
		{
			if($("#username").val()=="")
			{
				alert("请输入用户名称");
				$("#username").focus();
			}
			else if($("#psw").val()=="")
			{
				alert("请输入密码");
				$("#psw").focus();
			}
			else
			{
				$(".contain button").prop("disabled",false);
				$("#main-table a").attr("href","javascript:void(0)");
				$("#user_div").hide();
				var username = $("#username").val();
				var pwd = $("#psw").val();
				var psw = $.md5(pwd);
				var roleselect;
				if($("#roleselect").val()=="请选择")
				{
					roleselect = "";
				}
				else
				{
					roleselect = $("#roleselect").val();
				}
				$.ajax({   
	               type:"POST",  
	               url:"AddUser", 
	               async:false,
	               data:{"username":username,"psw":psw,"roleselect":roleselect},
	               dataType: "text",
	               
	               //请求成功完成后要执行的方法  
	               success: function(msg){ 
	            	   if(msg=="1")
	            	   {
	            		   alert("新建用户成功");
	            		   UserLoad();
	           			   $(".change").attr("onclick","changeRole(this);");
	           			   $(".del").attr("onclick","delClick(this);");
	            	   }
	            	   else
	            	   {
	            		   $(".change").attr("onclick","changeRole(this);");
		           		   $(".del").attr("onclick","delClick(this);");
	            		   alert("新建用户失败");
	            	   }
	               }, 
	               error: function (response) {
	               }  
	           });  
			}
		}
	});
});

function UserLoad()
{
	var stext;
	$.ajax({   
        type:"POST",  
        url:"UserSearch", 
        async:false,
        dataType: "text",
        
        //请求成功完成后要执行的方法  
        success: function(msg){   
        	stext = msg.split(" "); 
        }, 
        error: function (response) {
        	
        }  
    });
	$("#movies").empty();
	$(stext).each(function(i, dom){
		if(dom!=""&&dom!="null")
		{
			var tdtext = stext[i].split(",");
			
			var powers;
	        $.ajax({   
	            type:"POST",  
	            url:"PowerSelect", 
	            async:false,
	            data:{"change":tdtext[1]},
	            dataType: "text",
	            
	            //请求成功完成后要执行的方法  
	            success: function(msg){   
	            	powers = msg.split(" "); 
	            }, 
	            error: function (response) {
	            }  
	        });
	        
	        var powerlist="";
	        $(powers).each(function(j, dom1){
	        	
	        	$.ajax({   
		            type:"POST",  
		            url:"PowerName", 
		            async:false,
		            data:{"daihao":dom1},
		            dataType: "text",
		            
		            //请求成功完成后要执行的方法  
		            success: function(msg){   
		            	powerlist += msg + " "; 
		            }, 
		            error: function (response) {
		            }  
		        });
				
	        });
	        $("#movies").append(
					"<tr><td>" + tdtext[0] + 
					"</td><td>" + tdtext[1] +
					"</td><td>" + powerlist +
					"</td><td><a href='#' class='change' onclick='changeRole(this)'>" + "更改角色" + "</a>" +
					"<a href='javascript:void(0)' class='del' onclick='delClick(this)'>" + "删除" + "</a>" +
					"</td></tr>");
		}
    });
	
	$("div.holder").jPages({
	      containerID : "movies", //存放表格的窗口标签ID
	      previous : "←前一页", //指示首页的按钮
	      next : "后一页→",//指示尾页的按钮
	      perPage : 5,//每页显示表格的行数
	      delay : 0, //分页时动画持续时间，0表示无动画
	    });
}

function delClick(arg)
{
	var e = e || window.event;
	var target = e.target || e.srcElement;
	if(target.parentNode.tagName.toLowerCase() == "td")
	{
		var rowIndex = target.parentNode.parentNode.rowIndex;
	}
	
	var delname;
	delname = $(arg).parent().siblings('td').eq(0).text();
	var r=confirm("确认删除吗？")
	if (r==true)
	{
		$.ajax({   
            type:"POST",  
            url:"DeleteUser", 
            async:false,
            data:{"delname":delname},
            dataType: "text",
            
            //请求成功完成后要执行的方法  
            success: function(msg){
            	if(msg=="1")
            	{
            		alert("删除成功");
            		$("tr:eq('" + rowIndex + "')").remove();
            		UserLoad();
            	}
            	else
            	{
            		alert("删除失败");
            	}
            }, 
            error: function (response) {
            }  
     	});
	}
	else
	{
	}
}
function changeRole(arg)
{
	var e = e || window.event;
	var target = e.target || e.srcElement;
	if(target.parentNode.tagName.toLowerCase() == "td")
	{
		var rowIndex = target.parentNode.parentNode.rowIndex;
	}
	
	var changerole;
	var delname;
	delname = $(arg).parent().siblings('td').eq(0).text();
	$(".contain button").prop("disabled",true);
	$(".contain a").removeAttr("href");
	$(".contain a").removeAttr("onclick");
	$("#roleselect1").find("option[value='请选择']").prop("selected",true);
	$("#changerole").show();

	$(".rolebtn").unbind('click').click(function(){
		if($(this).val()=="quxiao")
		{
			$(".contain button").prop("disabled",false);
			$("#main-table a").attr("href","javascript:void(0)");
   			$(".del").attr("onclick","delClick(this);");
   			$(".change").attr("onclick","changeRole(this);");
			$("#changerole").hide();
		}
		if($(this).val()=="queding")
		{
			$(".contain button").prop("disabled",false);
			$("#main-table a").attr("href","javascript:void(0)");
			$("#changerole").hide();
			var roleselect;
			if($("#roleselect1").val()=="请选择")
			{
				alert("请选择用户的角色");
				$(".change").attr("onclick","changeRole(this);");
    			$(".del").attr("onclick","delClick(this);");
			}
			else
			{
				roleselect = $("#roleselect1").val();
			
				$.ajax({   
	               type:"POST",  
	               url:"UserRoleChange", 
	               async:false,
	               data:{"username":delname,"roleselect":roleselect},
	               dataType: "text",
	               
	               //请求成功完成后要执行的方法  
	               success: function(msg){ 
	            	   if(msg=="1")
	            	   {
	            		   changerole = roleselect;
	            		   alert("用户角色修改成功");
	            		   $(arg).parent().siblings('td').eq(1).text(changerole);
	           			   $(".change").attr("onclick","changeRole(this);");
	           			   $(".del").attr("onclick","delClick(this);");
	            	   }
	            	   else
	            	   {
	            		   $(".change").attr("onclick","changeRole(this);");
		           		   $(".del").attr("onclick","delClick(this);");
	            		   alert("用户角色修改失败");
	            	   }
	               }, 
	               error: function (response) {
	               }  
	        	}); 
			}
		}
	});
}
</script>

<div id="user_div">
	<div id = "create_div">
		<label>用户名：</label>&nbsp;<input name="username" id="username" type="text" />
		<br><br>
		<label>&nbsp;&nbsp;&nbsp;密码：</label>&nbsp;<input name="psw" id="psw" type="password" />
		<br><br>
		<label style="margin-left:-15px;">所属角色：</label>&nbsp;<select name="roleselect" id="roleselect" class = "roleselect">
			<option value="请选择" selected>请选择</option>
		</select>
		<br>
		<button class="button-style userbtn" type="button" value="queding">确定</button>
		<button class="button-style userbtn" type="button" value="quxiao">取消</button>
	</div>
</div>
<div id="changerole">
	<div id = "role_div">
		<label>请重新选择用户的角色：</label>
		<select name="roleselect1" id="roleselect1" class = "roleselect">
			<option value="请选择" selected>请选择</option>
		</select>
		<br>
		<button class="button-style rolebtn" type="button" value="queding">确定</button>
		<button class="button-style rolebtn" type="button" value="quxiao">取消</button>
	</div>
</div>
<div id="tab">
	<label id="tab_title">用户管理</label>
</div>
<div class="contain">
	<div id="create_user_div">
		<button name="create_user" id="create_user" value="createuser">新增用户</button>
	</div>
	<div id="table-div">
		<table id="main-table">
			<thead id="t_title"></thead>
			<tbody id="movies"></tbody>
		</table>
	</div>
	<div class="holder"></div>
	<div id="dialog_show"></div>
</div>
</body>
</html>