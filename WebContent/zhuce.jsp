<%@ page import = "java.sql.*" language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>注册</title>
<script type="text/javascript" src="extended/jquery-2.1.1.min.js"></script>
</head>
<body>
 
<jsp:useBean id = "db" class = "bean.JBean" scope = "page" >
<%

	request.setCharacterEncoding("UTF-8");
	String username=request.getParameter("username");
	String password=request.getParameter("pwd");
	String name=request.getParameter("name");
	String peopleID=request.getParameter("peopleID");
	String jgname = request.getParameter("jigouname");
	String jgcode=request.getParameter("jigoucode");
	String usertype = request.getParameter("usertype");
	String querysql="";
	querysql = "Select * From UserLogin";


	ResultSet rs = db.executeQuery(querysql);
	boolean existname = true;
	while(rs.next())
	{

		if(jgcode.equals(rs.getString(1)))
		{
			existname = false;
			out.println("<script language='javaScript'> alert('机构代码已用，点击确定回到登录页面。');</script>");
			response.setHeader("refresh", "1;url=Login.jsp");
			break;
		}
		if(peopleID.equals(rs.getString(6)))
		{
			existname = false;
			out.println("<script language='javaScript'> alert('身份证号已用，点击确定回到登录页面。');</script>");
			response.setHeader("refresh", "1;url=Login.jsp");
			break;
		}
		if(username.equalsIgnoreCase(rs.getString(2)))
		{
			existname = false;
			out.println("<script language='javaScript'> alert('用户名重复，点击确定回到注册页面。');</script>");
			response.setHeader("refresh", "1;url=Register.jsp");
			break;
		}
	}
	if(existname)
	{
		String updatesql="";
		String updateJG="";
		String updateUser="";
		updateUser="insert into UserPeople values('" + username + "','" + password + "','com_user','')";
		updatesql = "insert into UserLogin values('"+jgcode+"','"+username+"','"+password+"','"+jgname+"','"+name+"','"+peopleID+"')";
		updateJG = "Insert Into JiGou Values('" + jgcode + "','" + jgname + "','" + "','"
				+ "','" + "','"  + "','" + "','" + "','" + "','" + "','"
				+ "','" + "','" + "','" + "','" + "')";
		int i=db.executeUpdate(updatesql);
		int j=db.executeUpdate(updateJG);
		int k=db.executeUpdate(updateUser);
		
		if(i==1&&j==1&&k==1)
		{
			out.println("<script language='javaScript'> alert('注册成功,点击确定跳转到登录页面!');</script>");
			response.setHeader("refresh","0;url=Login.jsp");
		}
		else
		{
			out.println("<script language='javaScript'> alert('注册失败，点击确定返回注册页面！');</script>");
			response.setHeader("refresh","0;url=Register.jsp");
		}
	}
	db.close();
%>
</jsp:useBean>
</body>
</html>