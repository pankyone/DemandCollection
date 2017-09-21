<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>单位信息</title>
</head>
<style type = "text/css">
body
{
	font:12px "微软雅黑", Helvetica, sans-serif;
	color: #000;
	background-color:#EEFFFB;
	margin: 0px;
}
table
{
	border-collapse: collapse;
	border: none;
	margin: 0px auto;
	width: 960px;
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
	width: 1066px;
	height:426px;
	text-align: center;
	margin:50px 0px;
	margin-left:50px;
	overflow-y:auto;
}
.reviewing{border:1px #ccc solid;}
span
{
display:block;
margin:20px 0;
}
label{font-size:20px;}
</style>
<body>

<jsp:useBean id="db" class = "bean.JBean" scope = "page">
<div class="reviewing">
<span>
<label>单位信息</label>
</span>
<table>
<tr>
<th>机构代码</th>
<th>机构全称</th>
<th>归口管理部门</th>
<th>通讯地址</th>
<th>所在地域</th>
<th>网址</th>
<th>电子信箱</th>
<th>法人代表</th>
<th>邮政编码</th>
<th>机构属性</th>
</tr>

<%
request.setCharacterEncoding("UTF-8");
String jgcode = (String)session.getAttribute("jgcode");
String sql="";
if(jgcode==null)
{
	jgcode="";
}
sql="select * from JiGou where code = '"+jgcode+"'";
ResultSet rs = db.executeQuery(sql);

while(rs.next())
{
	
	out.println("<tr><td>" + rs.getString(2)+ 
			"</td><td>" + rs.getString(3) +
			"</td><td>" + rs.getString(4) +
			"</td><td>" + rs.getString(5) +
			"</td><td>" + rs.getString(6) +
			"</td><td>" + rs.getString(7) +
			"</td><td>" + rs.getString(8) +
			"</td><td>" + rs.getString(9) +
			"</td><td>" + rs.getString(10) +
			"</td><td>" + rs.getString(10) +
			"</td></tr>");
}
db.close();
%>
</table>
</div>
</jsp:useBean>
</body>
</html>