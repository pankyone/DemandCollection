<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改</title>
<link href="css/jPages.css" rel="stylesheet"/>
<script type="text/javascript" src="extended/jquery-2.1.1.min.js"></script>
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
	margin: 0px auto;
	width: 560px;
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
div
{
	width: 666px;
	height:550px;
	text-align: center;
	margin:40px 0px;
	margin-left:250px;
}
.reviewing{border:1px #ccc solid;background:#E8F6FF;}
span
{
display:block;
margin:20px 0;
}
label{font-size:20px;}
</style>
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
<div class="reviewing">
<span>
<label>未审核</label>
</span>
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
<tbody id = "movies">
<%
request.setCharacterEncoding("UTF-8");
String jgcode = (String) session.getAttribute("jgcode");
String sql="select * from XuQiu where (xqstatus1=2 or xqstatus1=0) and code='"+jgcode+"'";
ResultSet rs = db.executeQuery(sql);
String reviewed="";
while(rs.next())
{
	if(rs.getInt(18)==2)
	{
		reviewed = "保存未提交";
	}
	else if(rs.getInt(18)==0)
	{
		reviewed = "提交未审核";
	}
	else
	{
	}
	out.println("<tr><td>" + rs.getInt(1) + 
			"</td><td>" + rs.getString(2) +
			"</td><td>" + rs.getString(3) +
			"</td><td>" + rs.getString(4) +
			"</td><td>" + rs.getString(5) +
			"</td><td>" + reviewed +
			"</td><td><a href = 'Revise.jsp?id="+rs.getInt(1)
			+"'>详情</a></td></tr>");
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