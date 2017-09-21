<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>未审核</title>
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
	width: 700px;
}
.reviewing span{margin-top:15px;}
a{text-decoration:none;}
td
{
	border:1px #ccc solid;
	height: 28px;
	text-align: center;
	background:#fff;
}
th{border:1px #ccc solid;height: 30px;text-align: center;}
.reviewing
{
	border:1px #ccc solid;
	width: 780px;
	height:550px;
	text-align: center;
	margin:40px 0px;
	margin-left:200px;
	overflow-y:auto;
	background:#E8F6FF;
}
span
{
display:block;
margin-bottom:20px;
}
label{font-size:20px;}
#search-div{margin-left:200px;margin-top:40px;}
#search-word{margin-left:20px;}
#search-submit{margin-left:20px;padding:0px 10px;}
</style>

<script src="extended/jquery-2.1.1.min.js"></script>

<script src="extended/jPages.js"></script>
<script>
  $(function(){
    $(".holder").jPages({
      containerID : "movies", //存放表格的窗口标签ID
      previous : "←前一页", //指示首页的按钮
      next : "后一页→",//指示尾页的按钮
      perPage : 5,//每页显示表格的行数
      delay : 0 //分页时动画持续时间，0表示无动画
    });
  });
  </script>
<script type="text/javascript">

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

<jsp:useBean id="db" class = "bean.JBean" scope = "page">
<%
request.setCharacterEncoding("UTF-8");

String oldsearch = request.getParameter("search");
String oldtext = request.getParameter("search-word");
String sql = "";
String addsql = "";
if(oldtext=="null"||oldtext==null)
{
	oldtext="";
	sql="select * from JiGou join XuQiu on JiGou.code = XuQiu.code where xqstatus1=0 and xqstatus2=0";
}
else
{
	addsql=" and " + oldsearch + " like '%" + oldtext + "%'";
	sql="select * from JiGou join XuQiu on JiGou.code = XuQiu.code where xqstatus1=0 and xqstatus2=0" + addsql;
}
%>

<script>
function olddata()
{
	var oldsearch = '<%=oldsearch %>';
	$("#search").find("option[value='"+oldsearch+"']").prop("selected",true);
}
window.onload = olddata;
</script>

<div id="search-div">
	<span id="search-span">
		<label id="search-label">选择检索条件：</label>
	</span>
	<form method="post" action="Auditing.jsp">
		<select class="search-select" name="search" id="search" style="width:160px;height:22px;">
			<option value="jgname" >机构全称</option>
			<option value="jgdepartment" >归口管理单位</option>
			<option value="jglocal">所在地域</option>
			<option value="jgins_att">机构属性</option>
			<option value="xqneedname">技术需求名称</option>
			<option value="xqstudy_type">科技活动类型</option>
    	</select>
    	<input type="text" name="search-word" id="search-word" value = "<%=oldtext%>" />
    	<input type="submit" id="search-submit" value="查询" onclick="return validate()" />
	</form>
</div>

<div class="reviewing">
<span>
<label>审核</label>
</span>
<table>
<thead>
<tr>
<th>编号</th>
<th>需求名称</th>
<th>机构名称</th>
<th>所在地域</th>
<th>归口管理部门</th>
<th>机构属性</th>
<th>科技活动类型</th>
<th>人员操作</th>
</tr>
</thead>
<tbody id="movies">
<%

ResultSet rs = db.executeQuery(sql);

while(rs.next())
{
	
	out.println("<tr><td>" + rs.getInt(17) + 
			"</td><td>" + rs.getString(19) +
			"</td><td>" + rs.getString(3) +
			"</td><td>" + rs.getString(6) +
			"</td><td>" + rs.getString(4) +
			"</td><td>" + rs.getString(15) +
			"</td><td>" + rs.getString(26) +
			"</td><td><a href = 'Detail.jsp?id="+rs.getInt(17)
			+"&xqstatus=1"+"'>详情</a></td></tr>");
}
db.close();
%>
</tbody>
</table>
<div class="holder"></div>
</div>
</jsp:useBean>
</body>
</html>