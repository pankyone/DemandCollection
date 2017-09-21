<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>需求管理</title>
<link href="css/jPages.css" rel="stylesheet"/>
<style type = "text/css">
body
{
	font:14px "微软雅黑", Helvetica, sans-serif;
	color: #000;
	background-color:#EEFFFB;
	margin: 0px;
}
#ref td
{
	border:1px #ccc solid;
	height: 28px;
	text-align: center;
	background:#fff;
}
#ref th{border:1px #ccc solid;height: 30px;text-align: center;}
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
</head>
<body>
<div>
<span>
<label>审核管理</label>
</span>
<jsp:useBean id="db" class = "bean.JBean" scope = "page">
<table id = "ref">
<thead>
<tr>
<th>编号</th>
<th>需求名称</th>
<th>机构名称</th>
<th>所在地域</th>
<th>归口管理部门</th>
<th>机构属性</th>
<th>科技活动类型</th>
<th>审核状态</th>
<th>人员操作</th>
</tr>
</thead>
<tbody id="movies">
<%
request.setCharacterEncoding("UTF-8");
String sql="";
String searcharr = request.getParameter("search");
String searcharr1 = request.getParameter("search1");
String searcharr2 = request.getParameter("search2");
String textarr = request.getParameter("text");
String search3 = request.getParameter("search3");
String search4 = request.getParameter("search4");
String[] searchword = searcharr.split(" ");
String[] searchtype1 = searcharr1.split(" ");
String[] searchtype2 = searcharr2.split(" ");
String[] text = textarr.split(" ");
String addsql="";

if(searcharr==""||textarr=="")
{
	addsql=" where xqstatus1 != 2 and xqstatus1!=0";
}
else
{
	addsql += " where ";
	if(searchword.length==1)
	{
		if(searchtype2[0].equals("mohu"))
		{
			addsql +=  searchword[0] + " like '%" + text[0] + "%'";
		}
		else
		{
			addsql +=  searchword[0] + " = '" + text[0] + "'";
		}
	}
	else
	{
		for(int i = 0;i<searchword.length-1;i++)
		{
			if(searchtype2[i].equals("mohu"))
			{
				addsql +=  searchword[i] + " like '%" + text[i] + "%' " + searchtype1[i] + " ";
			}
			else
			{
				addsql +=  searchword[i] + " = '" + text[i] + "' " + searchtype1[i] + " ";
			}
		}
		if(searchtype2[searchword.length-1].equals("mohu"))
		{
			addsql += searchword[searchword.length-1] + " like '%" + text[searchword.length-1] + "%'";
		}
		else
		{
			addsql += searchword[searchword.length-1] + " = '" + text[searchword.length-1] + "'";
		}
	}
	if(search3.equals("pass"))
	{
		if(search4.equals("pass"))
		{
			addsql += " and xqstatus2 = 1";
		}
		else if(search4.equals("reject"))
		{
			addsql += " and xqstatus2 = -1";
		}
		else
		{
			addsql += " and xqstatus1 = 1";
		}
	}
	else
	{
		addsql += " and xqstatus1 = -1";
	}
}
sql= "select * from JiGou join XuQiu on JiGou.code = XuQiu.code" + addsql;

ResultSet rs = db.executeQuery(sql);
String reviewed="";
int status = 0;
while(rs.next())
{
	if(rs.getInt(34)==1)
	{
		reviewed = "形式审核通过";
		status = 1;
	}
	else if(rs.getInt(34)==-1)
	{
		reviewed = "形式审核未通过";
		status = -1;
	}
	if(rs.getInt(36)==-1)
	{
		reviewed = "部门审核未通过";
		status = -2;
	}
	else if(rs.getInt(36)==1)
	{
		reviewed = "部门审核通过";
		status = 1;
	}
	out.println("<tr><td>" + rs.getInt(17) + 
			"</td><td>" + rs.getString(19) +
			"</td><td>" + rs.getString(3) +
			"</td><td>" + rs.getString(6) +
			"</td><td>" + rs.getString(4) +
			"</td><td>" + rs.getString(15) +
			"</td><td>" + rs.getString(26) +
			"</td><td>" + reviewed +
			"</td><td><a href = 'Detail_user.jsp?id="+rs.getInt(17)+
			"&xqstatus="+status+"'>详情</a></td></tr>");
}

db.close();
%>
</tbody>
</table>
<div class="holder"></div>
</jsp:useBean>
</div>
</body>
</html>