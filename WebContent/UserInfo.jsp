<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
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
	height:426px;
	text-align: center;
	margin:50px 0px;
	margin-left:250px;
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
<label>用户信息</label>
</span>
<table>
<tr>
<th>用户名</th>
<th>密码</th>
<th>机构全称</th>
<th>真实姓名</th>
<th>身份证号</th>
</tr>

<%
request.setCharacterEncoding("UTF-8");
String jgcode = (String)session.getAttribute("jgcode");
String sql="";
if(jgcode==null)
{
	jgcode="";
}

sql="select * from UserLogin where jgcode = '" + jgcode + "'";
ResultSet rs = db.executeQuery(sql);

while(rs.next())
{
	
	out.println("<tr><td>" + rs.getString(2)+ 
			"</td><td>" + "******" +
			"</td><td>" + rs.getString(4) +
			"</td><td>" + rs.getString(5) +
			"</td><td>" + rs.getString(6) +
			"</td></tr>");
}
db.close();
%>
</table>
</div>
</jsp:useBean>
</body>
</html>