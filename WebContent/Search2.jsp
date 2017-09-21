<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>需求管理</title>
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
#search-div{width:780px;margin-left:160px;margin-top:40px;}
#search-table
{
	border-collapse: collapse;
	border: none;
	margin-left:40px;
	width: 700px;
}
#search-table input{margin-left:15px;}
#search-table th,td{border: none;background-color:#EEFFFB;text-align: left;}
.search-select{width:160px;height:22px;margin-left:15px;}
.search2{margin-left:15px;}
#addRow{margin-top:20px;font:12px "微软雅黑";background:blue;color:#fff;border:none;}
#search-submit
{
float:right;
margin-top:30px;
margin-right:-80px;
width:60px;
height:26px;
background:blue;
color:#fff;
border:none;
}
#addRow:hover{cursor:pointer;}
#search-submit:hover{cursor:pointer;}
</style>
<script src="extended/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var search="";
	var search1="";
	var search2="";
	var text="";
	var search3="";
	var search4="";
	
	$(".review").load("TableRef.jsp",
	{
		"search":search,
		"search1":search1,
		"search2":search2,
		"text":text,
		"search3":search3,
		"search4":search4,
	});
	
	$("#addRow").click(function(){
		
		var len = $("#search-table tr").length;
		
		if(len >= 14)
		{
			alert("最多14项");
		}
		else
		{
		$("#search-table tr:last").after("<tr><td width='52px'>"+
				"<select name='search1' class='search1'>" +
				"<option value='and' >并含</option>" +
				"<option value='or' >或含</option>" +
				"</select></td><td>"+
				"<select class='search-select' name='search'>"+
				"<option value='jgname' >机构全称</option>"+
				"<option value='jgdepartment' >归口管理单位</option>"+
				"<option value='jglocal'>所在地域</option>"+
				"<option value='jgcorporation'>法人代表</option>"+
				"<option value='jgpeople'>联系人</option>"+
				"<option value='jgins_att'>机构属性</option>"+
				"<option value='xqneedname'>技术需求名称</option>"+
				"<option value='xqkeywords'>关键字</option>"+
				"<option value='xqself_collected'>拟投入资金总额</option>"+
				"<option value='xqcoo_model'>技术需求解决方式</option>"+
				"<option value='xqstudy_type'>科技活动类型</option>"+
				"<option value='xqclassification'>学科分类</option>"+
				"<option value='xqtec_field'>需求技术所属领域</option>"+
				"<option value='xqtechnologyapplication'>需求技术应用行业</option>"+
				"<option value='xqdep'>管理处室</option>" +
		    	"</select>"+
		    	"<input type='text' class='search-word' name='search-word'/>"+
				"<select name='search2' class='search2'>" +
				"<option value='mohu' >模糊查询</option>" +
				"<option value='jingque' >精确查询</option>" +
				"</select>"+
				"<input type='button' name='delRow' id='delRow' value='删除' onclick='DeleteRow()'/>"+
				"</td></tr>");
		}
	});
	
	$("#search-submit").click(function(){
		if(validateText())
		{
			var search="";
			var search1="";
			var search2="";
			var text="";
			$(".search-select").each(function(){
				search+=$(this).val()+" ";
			});
			$(".search1").each(function(){
				search1+=$(this).val()+" ";
			});
			$(".search2").each(function(){
				search2+=$(this).val()+" ";
			});
			$(".search-word").each(function(){
				text+=$(this).val()+" ";
			});
			
			var search3=$(".search3").val();
			var search4=$(".search4").val();
			
			$(".review").load("TableRef.jsp",
			{
				"search":search,
				"search1":search1,
				"search2":search2,
				"text":text,
				"search3":search3,
				"search4":search4,
			});
		}
	});
});

function validateText()
{
	
	var m=document.getElementsByName("search-word");
	for(var i=0;i<m.length;i++)
	{
		if(m[i].value==""||m[i].value==null)
		{
			alert("请填写完整！");
			m[i].focus();
			return false;
		}
	}
	
	var flag=false;  
    var array = [];  
  
      $("select[name='search']").each(function(index, item) {
      	if(isExist($(item).val(),array)) {  
        	flag=true;  
        } 
      	else 
      		array.push($(item).val());  
      });  
      if(flag==true)
      {
    	  alert("有重复");
    	  return false;
      }
      return true;
}

function isExist(val, arr){
    for(var i=0, len=arr.length; i<len; i++){
        if(val === arr[i]){
        	return true;
        }
    }
    return false;
}
function DeleteRow()
{
	var e = e || window.event;
	var target = e.target || e.srcElement;
	if(target.parentNode.tagName.toLowerCase() == "td")
	{
		var rowIndex = target.parentNode.parentNode.rowIndex;
	}
	$("tr:eq('" + rowIndex + "')").remove();
}
</script>
<body>

<div id="search-div">
	<span id="search-span">
		<label id="search-label">选择检索条件：</label>
	</span>
	<table id="search-table">
		<tr>
		<td width="52px"></td>
		<td>
		<select class="search-select" name="search" id="search">
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
    	</select><input type="text" class="search-word" name="search-word" /><select name='search2' class='search2' >
			<option value='mohu' >模糊查询</option>
			<option value='jingque' >精确查询</option>
		</select>
    	</td>
    	</tr>
	</table>
		<input type="button" name="addRow" id="addRow" value = "添加" />（最多14项）
		
		<br><br>
    	<label>形式审核：</label>
    	<select name='search3' id="search3" class="search3" >
			<option value='pass' >通过</option>
			<option value='reject' >未通过</option>
		</select>
		<label style="margin-left:20px;">部门审核：</label>
		<select name='search4' id="search4" class="search4" >
			<option value='unknow' selected>请选择</option>
			<option value='pass' >通过</option>
			<option value='reject' >未通过</option>
		</select>
    	<input type="button" id="search-submit" value="查询"/>   	
</div>
<div class="review">

</div>

</body>
</html>