<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学科分类二级菜单</title>
</head>
<body>
<jsp:useBean id = "db" class = "bean.JBean" scope = "page" >
	<%
		request.setCharacterEncoding("UTF-8");
		String strcf1=request.getParameter("cf1");
		
		String strCF2="";
		String sql = "Select name From SubjectClassification where code like '11%00'";
		ResultSet rs = db.executeQuery(sql);
		while(rs.next())
		{
			strCF2 += rs.getString(1)+" ";
		}
		db.close();
	%>
</jsp:useBean>
</body>
</html>