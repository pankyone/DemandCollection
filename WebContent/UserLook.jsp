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
	margin-left:26px;
	width: 666px;
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
div
{
	width: 720px;
	height:550px;
	text-align: center;
	margin:40px 0px;
	margin-left:250px;
}
.review{border:1px #ccc solid;background:#E8F6FF;}
span
{
display:block;
margin-bottom:20px;
}
label{font-size:20px;}
#newneed
{
border-style:none;
background:red;
border-radius:5px;
color:#fff;
line-height:28px;
padding:0px 10px;
font-family:"微软雅黑";
position:absolute;
top:56px;
right:208px;
}
#newneed:hover{cursor:pointer;}
</style>
<script type="text/javascript" src="extended/jquery-2.1.1.min.js"></script>
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
<body>

<jsp:useBean id="db" class = "bean.JBean" scope = "page">
<%
request.setCharacterEncoding("UTF-8");
String jgcode = (String) session.getAttribute("jgcode");
%>
<div class="review">
<span>
<label>审核管理</label>
</span>
<button id="newneed" type="button" value="新需求" onclick="window.location.href='Index.jsp'">
添加新需求
</button>
<table>
<thead>
<tr>
<th>编号</th>
<th>机构代码</th>
<th>需求名称</th>
<th>起始日期</th>
<th>截止日期</th>
<th>审核结果</th>
<th>人员操作</th>
</tr>
</thead>
<tbody id="movies">
<%
String sql="select * from XuQiu where (xqstatus1 = -1 or xqstatus2 = -1 or xqstatus2 = 1) and code = '" + jgcode + "'";
ResultSet rs = db.executeQuery(sql);
String reviewed="";
int status = 0;
while(rs.next())
{
	if(rs.getInt(20)==1)
	{
		reviewed = "审核通过";
		status = 1;
	}
	else if(rs.getInt(18)==-1)
	{
		reviewed = "形式审核未通过";
		status = -1;
	}
	else if(rs.getInt(20)==-1)
	{
		reviewed = "部门审核未通过";
		status = -2;
	}
	else
	{
		reviewed = "审核结果出错";
	}
	out.println("<tr><td>" + rs.getInt(1)+ 
			"</td><td>" + rs.getString(2) +
			"</td><td>" + rs.getString(3) +
			"</td><td>" + rs.getString(4) +
			"</td><td>" + rs.getString(5) +
			"</td><td>" + reviewed +
			"</td><td><a href = 'Detail_user.jsp?id="+rs.getInt(1)
			+"&xqstatus="+status+"'>详情</a></td></tr>");
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