<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>需求管理</title>
</head>
<style type = "text/css">
body
{
	font:14px "微软雅黑", Helvetica, sans-serif;
	color: #000;
	background-color:#EEFFFB;
	margin: 0px;
}
table
{
	border-collapse: collapse;
	border: none;
	margin-left:40px;
	width: 700px;
}
.review span{margin-top:15px;}
a{text-decoration:none;}
td
{
	border:1px #ccc solid;
	height: 28px;
	text-align: center;
	background:#fff;
}
th{border:1px #ccc solid;height: 30px;text-align: center;}
span
{
display:block;
margin-bottom:20px;
}
label{font-size:20px;}
#label1{font-size:14px;}
#search-div{width:780px;margin-left:200px;margin-top:40px;border:1px #ccc solid;}
#search-table
{
	border-collapse: collapse;
	border: none;
	margin-left:40px;
	width: 700px;
	background:#E8F6FF;
}
#search-table input{margin-left:15px;}
#search-table th,td{border: none;background:#E8F6FF;text-align: left;}
#tongji-select,.search-select,#chart_type{width:160px;height:22px;}
.search1{margin-left:35px;}
.search2{margin-left:15px;}
#addRow{margin-left:40px;margin-top:20px;font:12px "微软雅黑";background:blue;color:#fff;border:none;}
#search-submit
{
float:right;
margin-right:40px;
margin-top:20px;
width:60px;
height:26px;
background:blue;
color:#fff;
border:none;
}
#addRow:hover{cursor:pointer;}
#search-submit:hover{cursor:pointer;}
.htmleaf-content{width:400px;margin-top:80px;margin-left:400px;}
#canvas-holder{border:1px #999 solid;width:300px;height:300px;margin-left:50px;}

#chart_div{margin-top:30px;}
</style>
<script src="extended/jquery-2.1.1.min.js"></script>
<script src="extended/chart.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#addRow").click(function(){
		
		var len = $("#search-table tr").length;
		
		if(len >= 14)
		{
			alert("最多14项");
		}
		else
		{
		$("#search-table #last_tr").before("<tr><td width='52px'>"+
				"<select name='search1' class='search1'>" +
				"<option value='and' >并含</option>" +
				"<option value='or' >或含</option>" +
				"</select></td><td>"+
				"<select class='search-select' name='search'>"+
				"<option value='jgname' >机构全称</option>"+
				"<option value='jgdepartment' >归口管理单位</option>"+
				"<option value='jglocal'>所在地域</option>"+
				"<option value='jgcorporation'>法人代表</option>"+
				"<option value='jgpeople'>联系人</option>"+
				"<option value='jgins_att'>机构属性</option>"+
				"<option value='xqneedname'>技术需求名称</option>"+
				"<option value='xqkeywords'>关键字</option>"+
				"<option value='xqself_collected'>拟投入资金总额</option>"+
				"<option value='xqcoo_model'>技术需求解决方式</option>"+
				"<option value='xqstudy_type'>科技活动类型</option>"+
				"<option value='xqclassification'>学科分类</option>"+
				"<option value='xqtec_field'>需求技术所属领域</option>"+
				"<option value='xqtechnologyapplication'>需求技术应用行业</option>"+
				"<option value='xqdep'>管理处室</option>" +
		    	"</select>"+
		    	"<input type='text' class='search-word' name='search-word'/>"+
				"<select name='search2' class='search2'>" +
				"<option value='mohu' >模糊查询</option>" +
				"<option value='jingque' >精确查询</option>" +
				"</select>"+
				"<input type='button' name='delRow' id='delRow' value='删除' onclick='DeleteRow()'/>"+
				"</td></tr>");
		}
	});
	
	$("#search-submit").click(function(){
		if(validateText())
		{
			var search="";
			var search1="";
			var search2="";
			var text="";
			$(".search-select").each(function(){
				search+=$(this).val()+" ";
			});
			$(".search1").each(function(){
				search1+=$(this).val()+" ";
			});
			$(".search2").each(function(){
				search2+=$(this).val()+" ";
			});
			$(".search-word").each(function(){
				text+=$(this).val()+" ";
			});
			var tongji=$("#tongji-select").val();
			
			var chart_type = $("#chart_type").val();
			
			var tmp = $("#chart-area").clone();
			$("#chart-area").remove();
			$("#canvas-holder").prepend(tmp);
			var ctx = $("#chart-area").get(0).getContext("2d");
			var myNewChart = new Chart(ctx);
			
			$.ajax({   
   	            type:"POST",  
   	            url:"ChartServlet", 
   	            async:false,
   	            data:{"search":search,"search1":search1,"search2":search2,"text":text,"tongji":tongji},
   	            dataType: "json",
   	            
   	            //请求成功完成后要执行的方法  
   	            success: function(msg){
   	            	if(chart_type=="pie")
   	            	{
   	            		myNewChart.Pie(msg.pieResult);
   	            	}
   	            	else if(chart_type=="doughnut")
   	            	{
   	            		myNewChart.Doughnut(msg.pieResult, {responsive : true});
   	            	}
   	            	else if(chart_type=="bar")
   	            	{
   	            		var barlabels=[];
   	            		var bardatasets=[];
   	            		for(var i = 0;i<msg.pieResult.length;i++)
           			    {
   	            			
   	            			barlabels.push(msg.pieResult[i].label);
   	            			bardatasets.push(msg.pieResult[i].value);
           			    }
   	            		var data = {
   	 						labels : barlabels,
   	 						datasets : [
   	 							{
   	 								fillColor : "rgba(0,220,220,0.5)",
   	 								strokeColor : "rgba(220,220,220,1)",
   	 								data : bardatasets
   	 							}
   	 						]
   	 					}
   	 					myNewChart.Bar(data, {responsive : true});
   	            	}
   	            	else if(chart_type=="line")
   	            	{
   	            		var linelabels=[];
   	            		var linedatasets=[];
   	            		for(var i = 0;i<msg.pieResult.length;i++)
           			    {
   	            			
   	            			linelabels.push(msg.pieResult[i].label);
   	            			linedatasets.push(msg.pieResult[i].value);
           			    }
   	            		var data = {
   	            				labels : linelabels,
   	            				datasets : [
   	            					{
   	            						label: "My First LineChart",
   	            						fillColor : "rgba(220,220,220,0.2)",
   	            						strokeColor : "rgba(220,220,220,1)",
   	            						pointColor : "rgba(220,220,220,1)",
   	            						pointStrokeColor : "#fff",
   	            						pointHighlightFill : "#fff",
   	            						pointHighlightStroke : "rgba(220,220,220,1)",
   	            						data : linedatasets
   	            					}
   	            					]
   	            		}
   	            		myNewChart.Line(data, {responsive : true});
   	            	}
   	            	else
   	            	{
   	            		alert("图表生成错误！");
   	            	}
   	            }, 
   	            error: function (response) {
   	            }  
   	        });
		}
	});
});

function validateText()
{
	
	var m=document.getElementsByName("search-word");
	for(var i=0;i<m.length;i++)
	{
		if(m[i].value==""||m[i].value==null)
		{
			alert("请填写完整！");
			m[i].focus();
			return false;
		}
	}
	
	var flag=false;  
    var array = [];  
  
      $("select[name='search']").each(function(index, item) {
      	if(isExist($(item).val(),array)) {  
        	flag=true;  
        } 
      	else 
      		array.push($(item).val());  
      });  
      if(flag==true)
      {
    	  alert("有重复");
    	  return false;
      }
      return true;
}

function isExist(val, arr){
    for(var i=0, len=arr.length; i<len; i++){
        if(val === arr[i]){
        	return true;
        }
    }
    return false;
}
function DeleteRow()
{
	var e = e || window.event;
	var target = e.target || e.srcElement;
	if(target.parentNode.tagName.toLowerCase() == "td")
	{
		var rowIndex = target.parentNode.parentNode.rowIndex;
	}
	$("tr:eq('" + rowIndex + "')").remove();
}

</script>
<body>

<div id="search-div">
	<span id="search-span">
		<label id="search-label">选择检索条件：</label>
	</span>
	<table id="search-table">
		<tr>
		<td width="52px"></td>
		<td>
		<select class="search-select" name="search" id="search">
			<option value="jgname" >机构全称</option>
			<option value="jgdepartment" >归口管理单位</option>
			<option value="jglocal">所在地域</option>
			<option value="jgcorporation">法人代表</option>
			<option value="jgpeople">联系人</option>
			<option value="jgins_att">机构属性</option>
			<option value="xqneedname">技术需求名称</option>
			<option value="xqkeywords">关键字</option>
			<option value="xqself_collected">拟投入资金总额</option>
			<option value="xqcoo_model">技术需求解决方式</option>
			<option value="xqstudy_type">科技活动类型</option>
			<option value="xqclassification">学科分类</option>
			<option value="xqtec_field">需求技术所属领域</option>
			<option value="xqtechnologyapplication">需求技术应用行业</option>
			<option value="xqdep">管理处室</option>
    	</select><input type="text" class="search-word" name="search-word" /><select name='search2' class='search2' >
			<option value='mohu' >模糊查询</option>
			<option value='jingque' >精确查询</option>
		</select>
    	</td>
    	</tr>
    	<tr id="last_tr">
    		<td width="100px"><label id="label1">选择统计字段</label></td>
			
    		<td>
				<select name='tongji' id='tongji-select' >
					<option value='jgins_att' >机构属性</option>
					<option value='xqstudy_type' >科技活动类型</option>
					<option value='xqcoo_model' >技术需求解决方式</option>
					<option value="jgdepartment" >归口管理部门</option>
					<option value="jglocal">所在地域</option>
					<option value="xqclassification">学科分类</option>
					<option value="xqtechnologyapplication">需求技术应用行业</option>
					<option value="xqdep">管理处室</option>
				</select>
    		</td>
    	</tr>
	</table>
	<input type="button" name="addRow" id="addRow" value = "添加" />（最多14项）
	<div id="chart_div">
		<label>图表样式：</label>
		<select name='chart_type' id='chart_type' >
			<option value='pie' >饼图</option>
			<option value='doughnut' >环形图</option>
			<option value='bar' >柱状图</option>
			<option value='line' >线性图</option>
		</select>
	</div>
	<input type="button" id="search-submit" value="生成图表"/>   	
</div>

<div class="htmleaf-content">
	<label>图表：</label>
	<div id="canvas-holder">
		<canvas id="chart-area" width="300" height="300"/>
	</div>
</div>

</body>
</html>