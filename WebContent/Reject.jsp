<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>否决</title>
</head>
<body>
<jsp:useBean id = "db" class = "bean.JBean" scope = "page" >

<%
		request.setCharacterEncoding("UTF-8");
		String ID = request.getParameter("id");
		String xqreason = null;
		String status = request.getParameter("xqstatus");
		xqreason = new String(request.getParameter("xqreason").getBytes("iso8859-1"),"utf-8");

		String sql="";
		int xqstatus1 = 0;
		int xqstatus2 = 0;
		if(status.equals("1"))
		{
			xqstatus1=-1;
			sql = "update XuQiu set xqstatus1 = " + xqstatus1 + ",xqreason1 = '"+xqreason+"' where xqID = '" + ID + "'";
		}
		else if(status.equals("2"))
		{
			xqstatus2=-1;
			sql = "update XuQiu set xqstatus2 = " + xqstatus2 + ",xqreason2 = '"+xqreason+"' where xqID = '" + ID + "'";
		}
		else 
		{
			xqstatus1=-3;
			xqstatus2=-3;
			sql = "update XuQiu set xqstatus1 = " + xqstatus1 + ",xqstatus2 = "+xqstatus2+" where xqID = '" + ID + "'";
		}
		int i = db.executeUpdate(sql);
		if(i==1)
		{
			out.println("<script language='javaScript'> alert('" + ID + "需求表已否决退回');</script>");
			if(status.equals("1"))
			{
				response.setHeader("refresh", "0;url = Auditing.jsp");
			}
			else if(status.equals("2"))
			{
				response.setHeader("refresh", "0;url = Auditing1.jsp");
			}
			else{}
		}
		else
		{
			out.println("<script language='javaScript'> alert('审核程序出错');</script>");
			if(status.equals("1"))
			{
				response.setHeader("refresh", "0;url = Auditing.jsp");
			}
			else if(status.equals("2"))
			{
				response.setHeader("refresh", "0;url = Auditing1.jsp");
			}
			else{}
		}
		
		db.close();
	%>

</jsp:useBean>
</body>
</html>