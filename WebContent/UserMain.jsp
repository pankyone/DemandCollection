<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>河北省重大技术需求调查系统</title>
<link rel="SHORTCUT ICON" href="img/title.ico"/>
<link href="skins/sky/import_skin.css" rel="stylesheet" type="text/css" id="skin" themeColor="blue" />
<link rel="stylesheet" type="text/css" href="css/jquery-confirm.css" />
<script type="text/javascript" src="extended/jquery-2.1.1.min.js"></script>
<!--引入弹窗组件start-->
<script type="text/javascript" src="js/attention/zDialog/zDrag.js"></script>
<script type="text/javascript" src="js/attention/zDialog/zDialog.js"></script>
<script type="text/javascript" src="js/jquery-confirm.js"></script>
<!--引入弹窗组件end-->

</head>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragrma","no-cache"); 
response.setDateHeader("Expires",0); 
%>
<script type="text/javascript">
	$(document).ready(function(){
		
		var peoplename;
		$.ajax({   
	           type:"POST",  
	           url:"UserHello", 
	           async:false,
	           dataType: "text",
	           
	           //请求成功完成后要执行的方法  
	           success: function(msg){ 
	        	   if(msg!="null")
	        	   {
	        	   		peoplename = msg;
	        	   }
	        	   else
	        	   {
	        		   peoplename="";
	        	   }
	           }, 
	           error: function (response) {
	           }  
	       });
		$("#peoname").text(peoplename);
		
		$(".div2").click(function(){
			$(this).next("div").slideToggle("slow").siblings(
				".div3:visible").slideUp("slow");
		});
		
		var roleplay;
		$.ajax({   
	           type:"POST",  
	           url:"RolePlay", 
	           async:false,
	           data:{"username":peoplename},
	           dataType: "text",
	           
	           //请求成功完成后要执行的方法  
	           success: function(msg){ 
	        		   roleplay = msg;
	           }, 
	           error: function (response) {
	           }  
	       });
		
		var powerlist;
		$.ajax({   
	           type:"POST",  
	           url:"PowerSelect", 
	           async:false,
	           data:{"change":roleplay},
	           dataType: "text",
	           
	           //请求成功完成后要执行的方法  
	           success: function(msg){ 
	        	   powerlist = msg.split(" ");
	           }, 
	           error: function (response) {
	           }  
	       });
		
		if(roleplay=="admin")
		{
			$("#t1").show();
			$("#t2").show();
			$("#t3").show();
			$("#p1").show();
			$("#c1").show();
			$("#c2").show();
			$("#c3").show();
			$("#c4").show();
			$(".admin").show();
		}
		else
		{
			$(powerlist).each(function(i,dom){
			
				$("#"+dom).show();
			});
		}
		
		
		
	});
	function openurl(url) {
		var rframe = parent.document.getElementById("rightFrame");
		rframe.src = url;
	}
</script>
<style>
body {
	margin: 0;
	font-family: 微软雅黑;
	background-color: #DDDDDD;
}

li{list-style-type:none;color:blue;}
.title {
	float: left;
	margin: -40px 0px;
	margin-left:360px;
	font-size: 35px;
	color: #FFFFFF;
	font-height: 55px;
	font-family:"微软雅黑";
}

.top {
	position: absolute;
	top: 0px;
	width: 100%;
	height: 108px;
	text-align:center;
	background:url(img/mainframe/bs_bannercenter.jpg);
}
.top-bottom
{
	width:100%;
	height:25px;
	float:left;
	margin-top:-28px;
	font-size:12px;
	line-height:24px;
}
.top-bottom-time
{
	width:280px;
	margin-left:0px;
}
#peoname{color:red;padding:0px 5px;}
.bs_navright
{
	float:right;
	margin-right:10px;
	width:90px;
	margin-top:-23px;
}
.icon_no
{
	display:block;
	width:90px;
	text-align:center;
	background:url(img/mainframe/no.gif) no-repeat left center;
}
.hand{color:blue;}
.hand:hover
{
	cursor:pointer;
}
.top-logo
{
	float:left;
	width:64px;
	height:52px;
	margin-top:15px;
	margin-left:20px;
	background:url(img/mainframe/logo.jpg);
}
.top-title
{
	position: absolute;
	width:855px;
	height:72px;
	margin-left:90px;
	margin-top:-1px;
	background:url(img/mainframe/title.jpg);
	background-repeat:no-repeat;
}
.top-right
{
	margin-left:945px;
	height:108px;
	background:url(img/mainframe/bs_bannerright.jpg);
	background-repeat:no-repeat;
}
.left {
	position: absolute;
	left: 0px;
	top: 108px;
	width: 200px;
	height: 80%;
	border-right: 1px solid #9370DB;
	color: #000000;
	font-size: 20px;
	text-align: center;
	background-color:#E8F6FF;
}

.right {
	position: absolute;
	left: 200px;
	top: 108px;
	width: 1166px;
	height: 80%;
	border-top: 0px solid #484860;
	font-size: 14px;
	text-align: center;
	background-color: rgb(231, 239, 239);
}
.bottom
{
	position: absolute;
	bottom: 0px;
	width: 100%;
	height: 24px;
	text-align:center;
	background:url(img/mainframe/bs_footcenter.jpg);
}
.bottom-phone{font-size:12px;line-height:24px;color:#fff;}
.div1 {
	text-align: center;
	width: 200px;
	padding-top: 0px;
}

.div2 {
	height: 40px;
	line-height: 40px;
	cursor: pointer;
	font-size: 18px;
	position: relative;
	border-bottom: #ccc 1px solid;
}

.div3 {
	display: none;
	cursor: pointer;
	font-size: 15px;
}

.div3 ul {
	margin: 0;
	padding: 0;
}

.div3 li {
	height: 30px;
	line-height: 30px;
	list-style: none;
	text-align: left;
	background-color: rgb(231, 239, 239);
}
.div3 li:hover
{
	background-color:rgb(64, 136, 192);
}
.div3 li img
{
	width:24px;
	height:24px;
	float:left;
	margin-left:20px;
	margin-top:3px;
}
.a {
	margin-left:10px;
	text-decoration: none;
	color: #000000;
	font-size: 15px;
}
.a:hover{text-decoration: none;color:#000;}
.a1 {
	text-decoration: none;
	color: #000000;
	font-size: 18px;
}

#t1,#t2,#t3,#c1,#c2,#c3,#c4,#p1{display:none;}
.admin{display:none;}
</style>
</head>
<body> 
	<div class="top">
		
		<div class="top-logo">
		</div>
		<div class="top-title">
		</div>
		<div class="top-right">
		</div>
		<div class="top-bottom">
			<div class="top-bottom-time">
				<li>
                	<label id="peoname"></label>您好！今天是
                    <script>
                    	var weekDayLabels = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
                        var now = new Date();
                        var year = now.getFullYear();
                        var month = now.getMonth() + 1;
                        var day = now.getDate()
                        var currentime = year + "年" + month + "月" + day + "日 " + weekDayLabels[now.getDay()]
                        document.write(currentime)
                    </script>
            	</li>
			</div>
			<div class="bs_navright">
                <span class="icon_no hand" onclick='top.Dialog.confirm("确定要退出系统吗",function(){window.location="ExitServlet"});'>退出系统</span>             
            </div>
		</div>
		
	</div>

	<div class="left">
		<div class="div1">
			<div class="div2" id="c1">
				<div class="spgl"></div>
				需求征集
			</div>
			<div class="div3">
				<ul>
					<li>
					<img alt="" src="img/mainframe/form_add.png">
					<a class="a" style="" href="javascript:void(0);"
						onClick="openurl('Index.jsp');">征集表在线填报</a></li>
				</ul>
			</div>
			
			<div class="div2" id="c2">
				<div class="spgl"></div>
				需求管理
			</div>
			<div class="div3">
				<ul>
					<li>
					<img alt="" src="img/mainframe/online.png">
					<a class="a" href="javascript:void(0);"
						onClick="openurl('OnlineXiuGai.jsp');">征集表在线修改</a></li>
					<li>
					<img alt="" src="img/mainframe/form_find.png">
					<a class="a" href="javascript:void(0);"
						onClick="openurl('UserLook.jsp');">各项结果浏览</a></li>
				</ul>
			</div>
			<div class="div2" id="c3">
				<div class="yhgl"></div>
				用户信息
			</div>
			<div class="div3">
				<ul>
					<li>
					<img alt="" src="img/mainframe/user_info.png">
					<a class="a" href="javascript:void(0);"
						onClick="openurl('UserInfo.jsp');">申请人用户信息</a></li>
					<li>
					<img alt="" src="img/mainframe/company_info.png">
					<a class="a" href="javascript:void(0);"
						onClick="openurl('CompanyInfo.jsp');">单位信息</a></li>
				</ul>
			</div>
			<div class="div2" id="c4">
				<div class="spgl"></div>
				密码修改
			</div>
			<div class="div3">
				<ul>
					<li>
					<img alt="" src="img/mainframe/change_pwd.png">
					<a class="a" href="javascript:void(0);"
						onClick="openurl('MiMa.jsp');">修改密码</a></li>
				</ul>
			</div>
			<div class="div2" id="p1">
				<div class="spgl"></div>
				网络审核
			</div>
			<div class="div3">
				<ul>
					<li>
					<img alt="" src="img/mainframe/man.png">
					<a class="a" style="" href="javascript:void(0);"
						onClick="openurl('Auditing1.jsp');">部门审核</a></li>
				</ul>
			</div>
			<div class="div2" id="t1">
				<div class="spgl"></div>
				网络审核
			</div>
			<div class="div3">
				<ul>
					<li>
					<img alt="" src="img/mainframe/group_people.png">
					<a class="a" style="" href="javascript:void(0);"
						onClick="openurl('Auditing.jsp');">形式审核</a></li>
				</ul>
			</div>
			
			<div class="div2" id = "t2">
				<div class="spgl"></div>
				用户密码重置
			</div>
			<div class="div3">
				<ul>
					<li>
					<img alt="" src="img/mainframe/pwd_reset.png">
					<a class="a" style="" href="javascript:void(0);"
						onClick="openurl('MiMareset.jsp');">密码重置</a></li>
				</ul>
			</div>
			
			<div class="div2" id = "t3">
				<div class="spgl"></div>
				统计查询
			</div>
			<div class="div3">
				<ul>
					<li>
					<img alt="" src="img/mainframe/form_find.png">
					<a class="a" style="" href="javascript:void(0);"
						onClick="openurl('Search1.jsp');">分类检索</a></li>
					<li>
					<img alt="" src="img/mainframe/query_search.png">
					<a class="a" href="javascript:void(0);"
						onClick="openurl('Search2.jsp');">综合检索</a></li>
					<li>
					<img alt="" src="img/mainframe/chart.png">
					<a class="a" href="javascript:void(0);"
						onClick="openurl('StaticalChart.jsp');">统计图表</a></li>
				</ul>
			</div>
			<div class="div2 admin">
				<div class="spgl"></div>
				用户管理
			</div>
			<div class="div3">
				<ul>
					<li>
					<img alt="" src="img/mainframe/power.png">
					<a class="a" style="" href="javascript:void(0);"
						onClick="openurl('Powermanger.jsp');">权限管理</a></li>
					<li>
					<img alt="" src="img/mainframe/role.png">
					<a class="a" style="" href="javascript:void(0);"
						onClick="openurl('Rolemanger.jsp');">角色管理</a></li>
					<li>
					<img alt="" src="img/mainframe/user.png">
					<a class="a" style="" href="javascript:void(0);"
						onClick="openurl('Usermanger.jsp');">用户管理</a></li>
				</ul>
			</div>
			
			<div class="div2 all">
				<div class="yhgl"></div>
				辅助功能
			</div>
			<div class="div3">
				<ul>
					<li>
					<img alt="" src="img/mainframe/help_file.png">
					<a class="a" href="javascript:void(0);"
						onClick="openurl('Help.jsp');">帮助文件</a></li>
					<li>
					<img alt="" src="img/mainframe/exit.png">
					<a class="a" href="ExitServlet">注销</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="right" style="background:url(img/usermain.jpg);
background-repeat:no-repeat;
background-size:100% 100%;
background-attachment:fixed;">
		<iframe id="rightFrame" name="rightFrame" width="100%" height="100%" marginheight="0" 
		marginwidth="0" style="border: 0px solid #CCC; margin: 0; padding: 0;">
		</iframe>
	</div>
	
	<div class="bottom">
		<span class="bottom-phone">
			业务咨询电话：0311-1234567&nbsp;&nbsp;&nbsp;&nbsp;技术服务电话：15227196900
		</span>
	</div>
</body>
</html>