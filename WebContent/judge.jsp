<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆判断</title>
<script type="text/javascript" src="extended/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="extended/jquery.md5.js"></script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String rand = (String)session.getAttribute("rand"); 
String CheckCode = request.getParameter("CheckCode"); 
if(!(rand.equals(CheckCode))) 
{
 	response.sendRedirect("Login.jsp"); 
}
%>

<jsp:useBean id = "db" class = "bean.JBean" scope = "page" >
	<%
		String user = request.getParameter("username");
		String password = request.getParameter("pwd");
		String sql="";
		sql = "Select * From UserPeople";
		ResultSet rs = db.executeQuery(sql);
		boolean userFlag = false;
		boolean pwFlag = false;
		while(rs.next())
		{
			if(user.equals(rs.getString(2)))
			{
				userFlag = true;
				if(password.equals(rs.getString(3)))
				{
					
					pwFlag = true;
					String sqlcode = "Select jgcode From UserLogin where username = '"+user+"'";
					ResultSet rscode = db.executeQuery(sqlcode);

					if(rscode.next())
					{
						session.setAttribute("jgcode", rscode.getString(1));
					}
					out.println("<script language='javaScript'> alert('登录成功！');</script>");
					session.setAttribute("user", user);
					response.setHeader("refresh", "0;url = UserMain.jsp");
					break;
				}
			}
		}
		if(!userFlag)
		{
			out.println("<script language='javaScript'> alert('用户不存在，请注册');</script>");
			response.setHeader("refresh", "0;url = Login.jsp");
		}
		else if(!pwFlag)
		{
			out.println("<script language='javaScript'> alert('密码错误');</script>");
			response.setHeader("refresh", "0;url = Login.jsp");
		}
		else
		{
		}
		db.close();
	%>
</jsp:useBean>
</body>
</html>