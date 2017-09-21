<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ page 
import = "java.sql.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>确认提交</title>
</head>
<body>
<jsp:useBean id = "db" class = "bean.JBean" scope = "page" >
	<%
		request.setCharacterEncoding("UTF-8");
		String xqID = (String) session.getAttribute("xqID");
		String code = (String) session.getAttribute("jgcode");
		String jgname = request.getParameter("jigouname");
		String jgdepartment = request.getParameter("department");
		String jgaddress = request.getParameter("address");
		String jglocal = request.getParameter("local");
		String jgwebkit = request.getParameter("webkit");
		String jgemail = request.getParameter("email");
		String jgcorporation = request.getParameter("corporation");
		String jgpostalcode = request.getParameter("postalcode");
		String jgpeople = request.getParameter("people");
		String jgphone = request.getParameter("phone");
		String jgtel = request.getParameter("tel");
		String jgfax = request.getParameter("fax");
		String jgins_att = request.getParameter("institution-attribute");
		String jgagencyprofile = request.getParameter("agencyprofile");
		
		String xqneedname = request.getParameter("needname");
		String xqtime_before = request.getParameter("time1");
		String xqtime_after = request.getParameter("time2");
		String xqsummary1 = request.getParameter("summary1");
		String xqsummary2 = request.getParameter("summary2");
		String xqsummary3 = request.getParameter("summary3");
		String[] arrkeywords = request.getParameterValues("keywords");
		String xqkeywords="";
		for(int i=0;i<arrkeywords.length;i++)
		{
			xqkeywords+=arrkeywords[i]+" ";
		}
		String xqstudy_type = request.getParameter("study-type");
		String xqclassification="";
		String xqtec_field="";
		String xqinstruction="";
		String xqtechnologyapplication="";
		if(!xqstudy_type.equals("基础研究"))
		{
			String[] tec_field_arr = request.getParameterValues("tec-field");
			xqinstruction = request.getParameter("instruction");
			String[] xqtech_arr = request.getParameterValues("technologyapplication");
			for(int i=0;i<tec_field_arr.length;i++)
			{
				xqtec_field+=tec_field_arr[i]+" ";
			}
			
			for(int i=0;i<xqtech_arr.length;i++)
			{
				xqtechnologyapplication+=xqtech_arr[i]+" ";
			}
		}
		else
		{
			String[] arrclassification = request.getParameterValues("classification");
			
			for(int i=0;i<arrclassification.length;i++)
			{
				xqclassification+=arrclassification[i]+" ";
			}
		}

		String xqcoo_model = request.getParameter("coo-model");

		String xqcooperative = request.getParameter("cooperative");
		String xqself_collected = request.getParameter("self-collected");

		if(jgdepartment==""||jgdepartment==null)
		{
			jgdepartment = "";
		}
		if(jgwebkit==""||jgwebkit==null)
		{
			jgwebkit = "";
		}
		if(jgpostalcode==""||jgpostalcode==null)
		{
			jgpostalcode = "";
		}
		if(jgphone==""||jgphone==null)
		{
			jgphone = "";
		}
		if(jgfax==""||jgfax==null)
		{
			jgfax = "";
		}
		if(xqself_collected==""||xqself_collected==null)
		{
			xqself_collected = "";
		}
		if(xqcooperative==""||xqcooperative==null)
		{
			xqcooperative = "";
		}
		if(xqinstruction==""||xqinstruction==null)
		{
			xqinstruction = "";
		}
		
		int xqstatus1=0;
		
		String CompanySQL = "Update JiGou set jgdepartment = '" + jgdepartment + "',jgaddress = '"
				+ jgaddress + "',jglocal = '"+ jglocal + "', jgwebkit= '" + jgwebkit + "',jgemail = '" 
				+ jgemail + "',jgcorporation='" + jgcorporation + "',jgpostalcode='" + jgpostalcode + "',jgpeople='" 
				+ jgpeople + "',jgphone='" + jgphone + "',jgtel='" + jgtel + "',jgfax='" + jgfax + "',jgins_att='" 
				+ jgins_att + "',jgagencyprofile='" + jgagencyprofile + "' where code = '"+code+"'";
				
		String NeedSQL = "Update XuQiu set xqneedname = '" + xqneedname + "',xqtime_before = '"
				+ xqtime_before + "',xqtime_after = '"+ xqtime_after + "', xqsummary1= '" + xqsummary1 + "',xqsummary2 = '" 
				+ xqsummary2 + "',xqsummary3='" + xqsummary3 + "',xqkeywords='" + xqkeywords + "',xqstudy_type='" 
				+ xqstudy_type + "',xqclassification='" + xqclassification + "',xqtec_field='" + xqtec_field + "',xqinstruction='" 
				+ xqinstruction + "',xqtechnologyapplication='" + xqtechnologyapplication + "',xqcoo_model='" 
				+ xqcoo_model + "',xqcooperative = '"+ xqcooperative +"',xqself_collected = '"+ xqself_collected +"',xqstatus1 = '"
				+ xqstatus1 +"' where xqID = '"+xqID+"'";
				
		int i = db.executeUpdate(CompanySQL);
		int j = db.executeUpdate(NeedSQL);

		if (i==1&&j==1){
			out.println("<script language='javaScript'> alert('提交成功，请等待审核，审核未通过前可以修改。');</script>");
		}
		else
		{
			out.println("<script language='javaScript'> alert('提交失败！');</script>");
		}
		
		db.close();
	%>
</jsp:useBean>
</body>
</html>