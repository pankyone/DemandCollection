<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>赋予权限</title>
</head>
<body>

<jsp:useBean id = "db" class = "bean.JBean" scope = "page" >
	<%
		request.setCharacterEncoding("UTF-8");
		String rolename = (String)session.getAttribute("rolename");
		String[] power_arr;
		power_arr = request.getParameterValues("powerlist");
		String power_list="";
		for(int i=0;i<power_arr.length-1;i++)
		{
			power_list += power_arr[i] + " ";
		}
		power_list+=power_arr[power_arr.length-1];
		String sql="";
		sql = "update UserRoles set power_list='" + power_list + "' where power_name = '" + rolename + "'";
		int i = db.executeUpdate(sql);
		
		if(i==1)
		{
			out.println("<script language='javaScript'> alert('角色权限修改成功');</script>");
		}
		else
		{
			out.println("<script language='javaScript'> alert('角色权限修改失败');</script>");
		}
		db.close();
	%>
</jsp:useBean>
</body>
</html>