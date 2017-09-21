<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>需求管理</title>
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
	margin-left:40px;
	width: 780px;
}
.review span{margin-top:15px;}
a{text-decoration:none;}
td
{
	border:1px #ccc solid;
	height: 28px;
	text-align: center;
	background:#fff;
}
th{border:1px #ccc solid;height: 30px;text-align: center;}
.review
{
	border:1px #ccc solid;
	width: 860px;
	height:550px;
	text-align: center;
	margin:40px 0px;
	margin-left:160px;
	overflow-y:auto;
	background:#E8F6FF;
}
span
{
display:block;
margin-bottom:20px;
}
label{font-size:16px;}
#search-div{margin-left:160px;margin-top:40px;}
#search-word{margin-left:20px;}
#search-submit{margin-left:25px;padding:0px 10px;}
</style>
<script src="extended/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var search="";
	var search1="";
	var search2="";
	var text="";
	
	$(".review").load("TableRef1.jsp",
	{
		"search":search,
		"search1":search1,
		"search2":search2,
		"text":text,
	});
	
	$("#search-submit").click(function(){
		if(validate())
		{
			var search=$(".search-select").val();
			var search1=$(".search1").val();
			var search2=$(".search2").val();
			var text=$("#search-word").val();
			
			$(".review").load("TableRef1.jsp",
			{
				"search":search,
				"search1":search1,
				"search2":search2,
				"text":text,
			});
		}
	});
});
function validate()
{
	var text = $("#search-word").val();
 	if(text==""){
    	alert("请输入查询内容！");
    	$("#search-word").focus();
    	return false;
	}
  	return true;
}
</script>
<body>

<div id="search-div">
	<span id="search-span">
		<label id="search-label">选择检索条件：</label>
	</span>
		<select class="search-select" name="search" id="search" style="width:160px;height:22px;">
			<option value="jgname" >机构全称</option>
			<option value="jgdepartment" >归口管理单位</option>
			<option value="jglocal">所在地域</option>
			<option value="jgcorporation">法人代表</option>
			<option value="jgpeople">联系人</option>
			<option value="jgins_att">机构属性</option>
			<option value="xqneedname">技术需求名称</option>
			<option value="xqkeywords">关键字</option>
			<option value="xqself_collected">拟投入资金总额</option>
			<option value="xqcoo_model">技术需求解决方式</option>
			<option value="xqstudy_type">科技活动类型</option>
			<option value="xqclassification">学科分类</option>
			<option value="xqtec_field">需求技术所属领域</option>
			<option value="xqtechnologyapplication">需求技术应用行业</option>
			<option value="xqdep">管理处室</option>
    	</select>
    	<input type="text" name="search-word" id="search-word"/>
    	<br><br>
    	<label>形式审核：</label>
    	<select name='search1' id="search1" class="search1" >
			<option value='pass' >通过</option>
			<option value='reject' >未通过</option>
		</select>
		<label style="margin-left:30px;">部门审核：</label>
		<select name='search2' id="search2" class="search2" >
			<option value='unknow' selected>请选择</option>
			<option value='pass' >通过</option>
			<option value='reject' >未通过</option>
		</select>
    	<input type="button" id="search-submit" value="查询" onclick="return validate()" />
</div>
<div class="review">

</div>
</body>
</html>