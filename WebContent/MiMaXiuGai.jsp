<%@ page import = "java.sql.*" language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>注册</title>
</head>
<body>
 
<jsp:useBean id = "db" class = "bean.JBean" scope = "page" >
<%
	request.setCharacterEncoding("UTF-8");
	String password=request.getParameter("pwd");
	String username = (String)session.getAttribute("user");
	String sql = "update UserLogin set psw = '" + password + "' where username = '" + username + "'";
	String sql1 = "update UserPeople set psw = '" + password + "' where username = '" + username + "'";
	int i = db.executeUpdate(sql);
	int j = db.executeUpdate(sql1);
	if(i==1&&j==1)
	{
		out.println("<script language='javaScript'> alert('修改成功!');</script>");
	}
	else
	{
		out.println("<script language='javaScript'> alert('修改失败!');</script>");
	}
	db.close();
%>
</jsp:useBean>
</body>
</html>