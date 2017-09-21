<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>详情</title>
</head>
<style type="text/css">
body
{
	margin:0;padding:0;
	font-family:微软雅黑;
	background-color:#EEFFFB;
}
.title-div{text-align:center;padding-top:10px;}
table{margin-top:30px;margin-left:250px;text-align:left;}
.table-name{text-align:center;}
textarea{overflow:auto;resize:none;}
input,textarea{width:99%; height:100%;background-color:#EEFFFB;}
#keywords,#instruction{border-style:solid; border-color:#EEFFFB;}
.summary-div textarea{height:200px;}

.keywords-div{margin-top:30px;text-align:left;}
.keywords-div input{width:92%;}
#people{line-height:45px;}
.style{width:auto; height:auto;}
#instruction{height:16px;}
.max200-div{text-align:right;height:30px;}
.max500-div{text-align:right;height:30px;}

.a-div{text-align:center;margin:30px 0px;}
#pass-style,#reject-style{background:red; padding:5px 15px; margin:0px 10px;color:#fff;border-radius:5px;}
#pass-style,#reject-style{text-decoration:none;}
#pass-style:hover{color:#FF8C00;cursor:pointer;}
#reject-style:hover{color:#FF8C00;cursor:pointer;}

.select-style{width:120px;margin-left:10px;}
</style>
<body>
<jsp:useBean id="db" class = "bean.JBean" scope = "page">
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String xqstatus = request.getParameter("xqstatus");
String sql = "select * from JiGou join XuQiu on JiGou.code = XuQiu.code where XuQiu.xqId = " + id;
ResultSet rs = db.executeQuery(sql);
int jgID=0;
String jgname = "";
String jgdepartment = "";
String jgaddress = "";
String jglocal = "";
String jgwebkit = "";
String jgemail = "";
String jgcorporation = "";
String jgpostalcode = "";
String jgpeople = "";
String jgphone = "";
String jgtel = "";
String jgfax ="";
String jgins_att = "";
String jgagencyprofile = "";
int len1 = 0;
int len2 = 0;
int len3 = 0;
int len4 = 0;

int xqID=0;
String xqneedname = "";
String xqtime_before = "";
String xqtime_after = "";
String xqsummary1 = "";
String xqsummary2 = "";
String xqsummary3 = "";
String xqkeywords="";
String[] arr;
String[] keywords_arr = new String[5];
for(int m=0;m<5;m++)
{
	keywords_arr[m]="";
}
String xqstudy_type = "";
String xqclassification="";
String[] xqarr;
String[] xqcf_arr=new String[3];
for(int m=0;m<3;m++)
{
	xqcf_arr[m]="";
}
String xqtec_field="";
String[] tecfield_arr;
String[] tfcheck=new String[12];
for(int m=0;m<12;m++)
{
	tfcheck[m]="";
}
String xqinstruction="";
String xqtechnologyapplication="";
String[] tgarr;
String[] xqtg_arr=new String[3];
for(int m=0;m<3;m++)
{
	xqtg_arr[m]="";
}
String xqcoo_model = "";
String xqcooperative = "";
String xqself_collected = "";
int i = 2;
if(rs.next())
{
	
	jgname=rs.getString(++i);
	jgdepartment=rs.getString(++i);
	jgaddress=rs.getString(++i);
	jglocal=rs.getString(++i);
	jgwebkit=rs.getString(++i);
	jgemail=rs.getString(++i);
	jgcorporation=rs.getString(++i);
	jgpostalcode=rs.getString(++i);
	jgpeople=rs.getString(++i);
	jgphone = rs.getString(++i);
	jgtel=rs.getString(++i);
	jgfax=rs.getString(++i);
	jgins_att=rs.getString(++i);
	jgagencyprofile=rs.getString(++i);
	len1 = jgagencyprofile.length();
		
	xqID=rs.getInt(++i);
	++i;
	xqneedname=rs.getString(++i);
	xqtime_before=rs.getString(++i);
	xqtime_after=rs.getString(++i);
	xqsummary1=rs.getString(++i);
	xqsummary2=rs.getString(++i);
	xqsummary3=rs.getString(++i);
	len2 = xqsummary1.length();
	len3 = xqsummary2.length();
	len4 = xqsummary3.length();
	xqkeywords=rs.getString(++i);
	arr = xqkeywords.split(" ");
	for(int n=0;n<arr.length;n++)
	{
		keywords_arr[n]=arr[n];
	}
	xqstudy_type=rs.getString(++i);
	xqclassification=rs.getString(++i);
	xqarr=xqclassification.split(" ");
	for(int n=0;n<xqarr.length;n++)
	{
		xqcf_arr[n]=xqarr[n];
	}
	xqtec_field=rs.getString(++i);
	tecfield_arr=xqtec_field.split(" ");
	for(int n=0;n<tecfield_arr.length;n++)
	{
		if(tecfield_arr[n].equalsIgnoreCase("电子信息"))
			tfcheck[0]="checked";
		if(tecfield_arr[n].equalsIgnoreCase("光机电一体化"))
			tfcheck[1]="checked";
		if(tecfield_arr[n].equalsIgnoreCase("生物技术与制药"))
			tfcheck[2]="checked";
		if(tecfield_arr[n].equalsIgnoreCase("新材料及应用"))
			tfcheck[3]="checked";
		if(tecfield_arr[n].equalsIgnoreCase("现代农业"))
			tfcheck[4]="checked";
		if(tecfield_arr[n].equalsIgnoreCase("新能源与高效节能"))
			tfcheck[5]="checked";
		if(tecfield_arr[n].equalsIgnoreCase("资源与环境"))
			tfcheck[6]="checked";
		if(tecfield_arr[n].equalsIgnoreCase("高技术服务业"))
			tfcheck[7]="checked";
		if(tecfield_arr[n].equalsIgnoreCase("海洋"))
			tfcheck[8]="checked";
		if(tecfield_arr[n].equalsIgnoreCase("社会公共事业"))
			tfcheck[9]="checked";
		if(tecfield_arr[n].equalsIgnoreCase("医疗卫生"))
			tfcheck[10]="checked";
		if(tecfield_arr[n].equalsIgnoreCase("其他"))
			tfcheck[11]="checked";
	}
	xqinstruction=rs.getString(++i);
	xqtechnologyapplication=rs.getString(++i);
	tgarr=xqtechnologyapplication.split(" ");
	for(int n=0;n<tgarr.length;n++)
	{
		xqtg_arr[n]=tgarr[n];
	}
	xqcoo_model=rs.getString(++i);
	xqcooperative=rs.getString(++i);	
	xqself_collected=rs.getString(++i);
}
db.close();
%>
<script src="extended/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function()
{
	var partload;
	
	$.ajax({   
        type:"POST",  
        url:"PartLoad", 
        async:false,
        dataType: "text",
        
        //请求成功完成后要执行的方法  
        success: function(msg){  
        	partload = msg.trim().split(" ");
        }, 
        error: function (response) {
        }  
    });
    $(partload).each(function(i, dom){
 	   	$("#part").append("<option value='"+dom+"'>" + dom + "</option>");
    });
	
	$('input,select,textarea').prop('readonly',true);
	$('#reason').prop('readonly',false);
	$('input:radio,input:checkbox').prop('disabled',true);
	$("#pass-style").click(function(){
		$("#reason-div").hide();
		$("#reason").val("");
	});
});

function depPass()
{
	var status = <%=xqstatus%>;
	if(status == "1")
	{
		$("#reason-div").hide();
		$("#reason-div").val("");
		$("#pass-div").show();
		if(($("#part").val()=="请选择")&&(!$("#pass-div").prop("disabled")))
		{
			$("#part").focus();
			alert("请选择提交的管理处室");
			$('html,body').animate({scrollTop:$('#part').offset().top}, 800);
		}
		else
		{
			var part = $("#part").val();
			window.location.href = "Pass.jsp?id=<%=xqID%>&xqstatus=<%=xqstatus%>&part="+part;
		}
	}
	else if(status == "2")
	{
		part=null;
		window.location.href = "Pass.jsp?id=<%=xqID%>&xqstatus=<%=xqstatus%>&part="+part;
	}
	else
	{
	}
}
function Reason()
{
	$("#pass-div").hide();
	$("#pass-div").find("option[value='请选择']").prop("selected",true);
	$("#reason-div").show();
	if(($("#reason").val()=="")&&(!$("#reason-div").prop("disabled")))
	{
		$("#reason").focus();
		alert("请输入不通过原因");
		$('html,body').animate({scrollTop:$('#reason').offset().top}, 800);
	}
	else
	{
		var reason = $("#reason").val();
		window.location.href = "Reject.jsp?id=<%=xqID%>&xqstatus=<%=xqstatus%>&xqreason="+reason;
	}
		
}
</script>
<div class="title-div">
	<h1>河北省重大需求征集表</h1>
</div>
<div class="table-explain" style="width:200px;margin-left:250px;margin-bottom:-20px;">
<label style="color:red;font-size:14px;">填表说明:表中带*的为必填项</label>
</div>
<table width="666" border="1" id="mytab" style="opacity:0.8;">
  <tr>
    <td width="111" class="table-name">*机构全称</td>
    <td colspan="2"><input type="text" name="jigouname" id="jigouname" value="<%=jgname%>" /></td>
    <td class="table-name">归口管理部门</td>
    <td colspan="2">
    	<input type="text" name="department" id="department" value="<%=jgdepartment%>" />
    </td>
  </tr>
  <tr>
    <td class="table-name">*通讯地址</td>
    <td colspan="2">
    	<input type="text" name="address" id="address" value="<%=jgaddress%>" />
    </td>
    <td class="table-name">*所在地域</td>
    <td colspan="2">
    	<input type="text" name="local" id="local" value="<%=jglocal%>" />
    </td>
  </tr>
  <tr>
    <td class="table-name">网址</td>
    <td colspan="2">
    	<input type="text" name="webkit" id="webkit" value="<%=jgwebkit%>" />
    </td>
    <td width="130" class="table-name">*电子信箱</td>
    <td width="129">
    	<input type="text" name="email" id="email" value="<%=jgemail%>" />
   </td>
  </tr>
  <tr>
    <td class="table-name">*法人代表</td>
    <td colspan="2">
    	<input type="text" name="corporation" id="corporation" value="<%=jgcorporation%>" />
    </td>
    <td class="table-name">邮政编码</td>
    <td>
    	<input type="text" name="postalcode" id="postalcode" value="<%=jgpostalcode%>" />
    </td>
  </tr>
  <tr>
    <td class="table-name">*联 系 人</td>
    <td colspan="2">
    	<input class="tabs" type="text" name="people" id="people" onblur="isPeopleName(this)" value="<%=jgpeople%>" />
    </td>
    <td class="table-name">固定电话</td>
    <td>
    	<input class="tabs" type="text" name="phone" id="phone" value="<%=jgphone%>" />
    </td>
  </tr>
  <tr>
    <td class="table-name">*手机</td>
    <td colspan="2">
    	<input class="tabs" type="text" name="tel" id="tel" onblur="isMobile(this)" value="<%=jgtel%>" />
    </td>
    <td class="table-name">传  真</td>
    <td>
    	<input class="tabs" type="text" name="fax" id="fax" onblur="isFax(this)" value="<%=jgfax%>" />
    </td>
  </tr>
  <tr>
    <td height="49" class="table-name">*机构属性</td>
    <td colspan="4">
    	<input type="radio" name="institution-attribute" class="style" id="ins-att1" value="企业" <%=jgins_att.equals("企业")?"checked":""%> /> 企业
  		<input type="radio" name="institution-attribute" class="style" id="ins-att2" value="高等院校" <%=jgins_att.equals("高等院校")?"checked":""%> />高等院校
  		<input type="radio" name="institution-attribute" class="style" id="ins-att3" value="研究机构" <%=jgins_att.equals("研究机构")?"checked":""%> />研究机构
  		<input type="radio" name="institution-attribute" class="style" id="ins-att4" value="其他" <%=jgins_att.equals("其他")?"checked":""%> />其他
	</td>
  </tr>
  <tr>
    <td height="117" colspan="5">
    	<div class="summary-div">
    		<textarea name="agencyprofile" id="agencyprofile" placeholder="*机构简介（主要包括基本情况、现有研究基础等，限500字以内）"><%=jgagencyprofile%></textarea>
    	</div>
    	<div class="max200-div">
    		<label><%=len1 %>/500</label>
    	</div>
    </td>
  </tr>
  <tr>
    <td width="30" class="table-name">*技术需求名称</td>
    <td>
    	<input type="text" name="needname" id="needname" value="<%=xqneedname%>" />
    </td>
    <td class="table-name">*需求时限</td>
    <td>
    	<input type="date" name="time1" id="time1" value="<%=xqtime_before%>" />
    </td>
    <td>
    	<input type="date" name="time2" id="time2" value="<%=xqtime_after%>" />
    </td>
  </tr>
  <tr>
    <td height="136" colspan="5">
    	<div class="summary-div">
    		*技术需求概述<br>
    		主要问题（需要解决的重大技术问题，限500字以内）
    		<textarea name="summary1" id="summary1" placeholder="主要问题（需要解决的重大技术问题，限500字以内）"><%=xqsummary1%></textarea>
    		<div class="max500-div">
    			<label><%=len2 %>/500</label>
    		</div>
    		技术关键（所需的关键技术、主要指标，限500字以内）
    		<textarea name="summary2" id="summary2" placeholder="技术关键（所需的关键技术、主要指标，限500字以内）"><%=xqsummary2%></textarea>
    		<div class="max500-div">
    		<label><%=len3 %>/500</label>
    	</div>
    		预期目标（技术创新性、经济社会效益，限500字以内）
    		<textarea name="summary3" id="summary3" placeholder="预期目标（技术创新性、经济社会效益，限500字以内）"><%=xqsummary3%></textarea>
    		<div class="max500-div">
    			<label><%=len4 %>/500</label>
    		</div>
    	</div>
    	
        <div class="keywords-div">
        	*关键字：<input style="width:80px;height:20px;" class="keyword" type="text" name="keywords" id="keywords1" value="<%=keywords_arr[0] %>" />
        	<input style="width:80px;height:20px;" class="keyword" type="text" name="keywords" id="keywords2" value="<%=keywords_arr[1] %>" />
        	<input style="width:80px;height:20px;" class="keyword" type="text" name="keywords" id="keywords3" value="<%=keywords_arr[2] %>" />
        	<input style="width:80px;height:20px;" class="keyword" type="text" name="keywords" id="keywords4" value="<%=keywords_arr[3] %>" />
        	<input style="width:80px;height:20px;" class="keyword" type="text" name="keywords" id="keywords5" value="<%=keywords_arr[4] %>" />
        </div>
    </td>
  </tr>
  
  <tr>
    <td class="table-name">拟投入资金总额(万元)</td>
    <td colspan="4">
    	<input type="text" name="self-collected" id="self-collected" value="<%=xqself_collected %>" />
	</td>
  </tr>
  
  <tr>
    <td rowspan="2" class="table-name">*技术需求解决方式</td>
    <td colspan="4">
    	<input name="coo-model" type="radio" class="style" id="coo-model1" value="独立研发" <%=xqcoo_model.equals("独立研发")?"checked":""%> />独立研发
  		<input name="coo-model" type="radio" class="style" id="coo-model2" value="委托研发" <%=xqcoo_model.equals("委托研发")?"checked":""%> />委托研发
  		<input name="coo-model" type="radio" class="style" id="coo-model4" value="合作研发" <%=xqcoo_model.equals("合作研发")?"checked":""%> />合作研发
		<input name="coo-model" type="radio" class="style" id="coo-model5" value="其他" <%=xqcoo_model.equals("其他")?"checked":""%> />其他
	</td>
  </tr>
  <tr>
  	<td class="table-name">合作意向单位</td>
  	<td colspan="3">
    	<input type="text" name="cooperative" id="cooperative" style="width:260px;" placeholder="合作意向单位" value="<%=xqcooperative%>" />
    	<label>（选填）</label>
    </td>
  </tr>
  
  <tr>
    <td height="50" class="table-name">*科技活动类型</td>
    <td colspan="4">
    	<input name="study-type" type="radio" class="style" id="study-type" value="基础研究" <%=xqstudy_type.equals("基础研究")?"checked":""%> />基础研究
  		<input name="study-type" type="radio" class="style" id="study-type" value="应用研究" <%=xqstudy_type.equals("应用研究")?"checked":""%> />应用研究
  		<input name="study-type" type="radio" class="style" id="study-type" value="试验发展" <%=xqstudy_type.equals("试验发展")?"checked":""%> />试验发展
  		<input name="study-type" type="radio" class="style" id="study-type" value="研究发展与成果应用" <%=xqstudy_type.equals("研究发展与成果应用")?"checked":""%> />研究发展与成果应用
		<input name="study-type" type="radio" class="style" id="study-type" value="技术推广与科技服务" <%=xqstudy_type.equals("技术推广与科技服务")?"checked":""%> />技术推广与科技服务
		<input name="study-type" type="radio" class="style" id="study-type" value="生产性活动" <%=xqstudy_type.equals("生产性活动")?"checked":""%> />生产性活动
	</td>
  </tr>
  <tr>
    <td class="table-name">*学科分类（限基础研究填写）</td>
    <td colspan="4" style="position:relative;">
    	<input type="text" style="width:160px;height:20px;margin-left:20px;" name="classification" class="classification" id="cf1" value="<%=xqcf_arr[0] %>" /> 
		<input type="text" style="width:160px;height:20px;" name="classification" class="classification" id="cf2" value="<%=xqcf_arr[1] %>" />  
		<input type="text" style="width:160px;height:20px;" name="classification" class="classification" id="cf3" value="<%=xqcf_arr[2] %>" />  
	</td>
  </tr>
  <tr>
    <td height="80" class="table-name">*需求技术所属领域（非基础研究填写）</td>
    <td colspan="4">
    	<input name="tec-field" type="checkbox" class="style" id="tec-field" value="电子信息" <%=tfcheck[0]%> />电子信息
  		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="光机电一体化" <%=tfcheck[1]%> />光机电一体化
  		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="生物技术与制药" <%=tfcheck[2]%> />生物技术与制药
		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="新材料及应用" <%=tfcheck[3]%> />新材料及应用
  		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="现代农业" <%=tfcheck[4]%> />现代农业
  		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="新能源与高效节能" <%=tfcheck[5]%> />新能源与高效节能
		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="资源与环境" <%=tfcheck[6]%> />资源与环境
		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="高技术服务业" <%=tfcheck[7]%> />高技术服务业
		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="海洋" <%=tfcheck[8]%> />海洋
		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="社会公共事业" <%=tfcheck[9]%> />社会公共事业
		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="医疗卫生" <%=tfcheck[10]%> />医疗卫生
  		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="其他" <%=tfcheck[11]%> />其他（注明）
  		<input type="text" name="instruction" id="instruction"  placeholder="请详细注明!" value="<%=xqinstruction%>" />
	</td>
  </tr>
  <tr>
    <td height="50" class="table-name">*需求技术应用行业（非基础研究填写）
	</td>
    <td colspan="4">
    	<input type="text" style="width:160px;height:20px;margin-left:20px;" name="technologyapplication" class="technologyapplication" id="tech1" value="<%=xqtg_arr[0] %>" /> 
		<input type="text" style="width:160px;height:20px;" name="technologyapplication" class="technologyapplication" id="tech2" value="<%=xqtg_arr[1] %>" />  
		<input type="text" style="width:160px;height:20px;" name="technologyapplication" class="technologyapplication" id="tech3" value="<%=xqtg_arr[2] %>" />  
	</td>
  </tr>
</table>

<div id="pass-div" style="margin:20px; margin-left:250px;display:none;">
	<label>请选择提交的管理处室:</label>
	<select class="select-style" id="part">
		<option value="请选择" selected>请选择</option>
	</select>
</div>

<div id="reason-div" style="margin:20px; margin-left:250px;display:none;">
	<label>请填写理由</label><br>
	<textarea id = "reason" style="background-color:#fff;width:666px;height:100px;margin-top:10px;"></textarea>
</div>

<div class="a-div">
<a id="pass-style" href = 'javascript:void(0)' onclick="depPass()">通过</a>
<a id="reject-style" href ='javascript:void(0)' onclick="Reason()">否决</a>
</div>
</jsp:useBean>
</body>
</html>