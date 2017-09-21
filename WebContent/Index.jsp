<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>需求征集系统</title>
<script src="js/jquery-ui.js" type="text/javascript"></script>
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body
{
	margin:0;padding:0;
	font-family:微软雅黑;
	background-color:#EEFFFB;
}
.title-div{text-align:center;padding-top:10px;}
table{margin-top:30px;margin-left:250px;text-align:left;}
.table-name{text-align:center;font-family:"黑体";font-size:14px;}
textarea{overflow:auto;resize:none;}
input,textarea{width:99%; height:100%;}
#keywords,#instruction{border-style:solid; border-color:#ccc;}
textarea{width:99%;}
.summary-div textarea{height:200px;}

.keywords-div{margin-top:30px;text-align:left;}
.keywords-div input{width:92%;}
#people{line-height:45px;}
.style{width:auto; height:auto;}
#instruction{height:16px;display:none;}
#cf-tr,#tf-tr,#tg-tr{display:none;}
.submit-div{text-align:center;}
.submit-style,#reset-style{background:red; width:60px; height:30px; margin:20px 10px;color:#fff;border-radius:5px;}
#reset-style{border-style:none;}
.submit-style:hover{color:#FF8C00;cursor:pointer;}
#reset-style:hover{color:#FF8C00;cursor:pointer;}
.max200-div{text-align:right;height:30px;}
.max500-div{text-align:right;height:30px;}
.dep
{
width:250px;
height:150px;
position:absolute;
background:#fff; 
left:756px;
top:150px;
z-index:1;
overflow-y:auto;
}
li{list-style-type:none;}
li:hover{background:blue;cursor:pointer;}
#jigouname{background:#ccc;border-color:#ccc;}
</style>
<jsp:useBean id = "cf" class = "bean.GetClassification" scope = "page">
</jsp:useBean>
<jsp:useBean id = "db" class = "bean.JBean" scope = "page">
</jsp:useBean>
<script src="extended/jquery-2.1.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
			var date = new Date();

    		var day = date.getDate();
    		var month = date.getMonth() + 1;
    		var year = date.getFullYear();

    		if (month < 10) 
    			month = "0" + month;
    		if (day < 10) 
    			day = "0" + day;

    		var today = year + "-" + month + "-" + day; 
    		var tomorrow = year + 1 + "-" + month + "-" + day;
    		$("#time1").attr("value", today);
    		$("#time2").attr("value", tomorrow);
    
			jQuery('input:text:first').focus();  
			var $inp = jQuery('.tabs');  
		    $inp.bind('keydown', function (e) {  
		        var key = e.which;  
		        if (key == 13) {
		            e.preventDefault();  
		            var nxtIdx = $inp.index(this) + 1;
		            if($(this).get(0).tagName!="TEXTAREA")
		            {
		            	jQuery(".tabs:eq(" + nxtIdx + ")").focus();
		            } 
		            else
		            {
		            	if($(this).val()=="")
		            	{
		            		jQuery(".tabs:eq(" + nxtIdx + ")").focus();
		            	}
		            	else
		            	{
		            		$(this).val($(this).val()+"\n");
		            	}
		            }
		        }
		        if(key == 40)
		        {
		        	e.preventDefault();  
		            var nxtIdx = $inp.index(this) + 1;  
		            jQuery(".tabs:eq(" + nxtIdx + ")").focus();  
		        }
		        if (key == 38) {  
		            e.preventDefault();  
		            var nxtIdx = $inp.index(this) - 1;  
		            jQuery(".tabs:eq(" + nxtIdx + ")").focus();  
		        }
		        if(nxtIdx==$inp.length)
		        {
		        	e.preventDefault(); 
		            jQuery("#sub").focus();  
		        }
		    });
		    
		    
		    
			$("input[type='radio'][name='study-type']").click(function()
			{
				if(this.checked)
				{
						if($(this).val()=="基础研究")
						{
							$("#tech1").val("");
							$("#tech2 option:not(:first)").remove();
							$("#tech3 option:not(:first)").remove();
							$("#tg-tr").hide();
							$("#tf-tr").hide();
							$("#instruction").hide();
							$("#instruction").val("");
							$("input[type='checkbox'][name='tec-field']").each(function(){
								$(this).attr("checked",false);
							});
							$("#cf-tr").show();
						}
						else
						{
							$("#instruction").hide();
							$("#instruction").val("");
							$("#cf1").val("");
							$("#cf2 option:not(:first)").remove();
							$("#cf3 option:not(:first)").remove();
							$("#cf-tr").hide();
							$("#tg-tr").show();
							$("#tf-tr").show();
						}
				}
			});
			$("input[type='checkbox'][name='tec-field']").click(function(){
				
				if(this.checked)
				{
					if($(this).val()=="其他")
					{
						$("#instruction").show();
					}
				}
				else
				{
					if($(this).val()=="其他")
					{
						$("#instruction").hide();
						$("#instruction").val("");	
					}
				}
			});
			
		    $("#agencyprofile").keyup(function()
			{
				var maxnumber=500;
				var tlength = $.trim($("#agencyprofile").val()).length;
				if(tlength >= maxnumber)
				{
					alert("字数达到上限！");
					var num = $.trim($("#agencyprofile").val()).substr(0,maxnumber-1);
					$("#agencyprofile").val(num);
					tlength=maxnumber;
				}
				var text = tlength + "/500";
				$("#max200").text(text);
			});
			$(".summary").keyup(function()
			{
						var maxnumber=500;
						var tlength = $.trim($(this).val()).length;
						if(tlength >= maxnumber)
						{
							alert("字数达到上限！");
							var num = $.trim($(this).val()).substr(0,maxnumber-1);
							$(this).val(num);
							tlength=maxnumber;
						}
						var text = tlength + "/500";
						if($(this).prop("id")=="summary1")
							$("#1max500").text(text);
						if($(this).prop("id")=="summary2")
							$("#2max500").text(text);
						if($(this).prop("id")=="summary3")
							$("#3max500").text(text);
			});
			
			$("input[type='text'][name='keywords']").bind('input propertychange', function(){
				var len=0;
				if($(this).val()!="")
				{
					if($(this).attr('id')=="keywords1")
						$("#keywords2").show();
					if($(this).attr('id')=="keywords2")
						$("#keywords3").show();
					if($(this).attr('id')=="keywords3")
						$("#keywords4").show();
					if($(this).attr('id')=="keywords4")
						$("#keywords5").show();
				}
				else	
				{
					$("input[type='text'][name='keywords']").each(function(){
						if(($(this).val()=="")&&(!$(this).is(":hidden")))
						{
							len++;
						}
					});
					if($(this).attr('id')=="keywords1")
					{		
						
						$(this).val($("#keywords2").val());
						$("#keywords2").val($("#keywords3").val());
						$("#keywords3").val($("#keywords4").val());
						$("#keywords4").val($("#keywords5").val());
						$("#keywords5").val("");

						if(len==2)
						{
							if((!$("#keywords5").is(":hidden"))&&($("#keywords5").val()==""))
								$("#keywords5").hide();
							else if((!$("#keywords4").is(":hidden"))&&($("#keywords4").val()==""))
								$("#keywords4").hide();
							else if((!$("#keywords3").is(":hidden"))&&($("#keywords3").val()==""))
								$("#keywords3").hide();
							else if((!$("#keywords2").is(":hidden"))&&($("#keywords2").val()==""))
								$("#keywords2").hide();
							else
							{
								
							}
						}
					}
					if($(this).attr('id')=="keywords2")
					{
						$(this).val($("#keywords3").val());
						$("#keywords3").val($("#keywords4").val());
						$("#keywords4").val($("#keywords5").val());
						$("#keywords5").val("");
						
						if(len==2)
						{
							if((!$("#keywords5").is(":hidden"))&&($("#keywords5").val()==""))
								$("#keywords5").hide();
							else if((!$("#keywords4").is(":hidden"))&&($("#keywords4").val()==""))
								$("#keywords4").hide();
							else if((!$("#keywords3").is(":hidden"))&&($("#keywords3").val()==""))
								$("#keywords3").hide();
							else
							{
								
							}
						}
					}
					if($(this).attr('id')=="keywords3")
					{
						
						$(this).val($("#keywords4").val());
						$("#keywords4").val($("#keywords5").val());
						$("#keywords5").val("");

						if(len==2)
						{
							if((!$("#keywords5").is(":hidden"))&&($("#keywords5").val()==""))
								$("#keywords5").hide();
							else if((!$("#keywords4").is(":hidden"))&&($("#keywords4").val()==""))
								$("#keywords4").hide();
							else
							{
								
							}
						}
					}
					if($(this).attr('id')=="keywords4")
					{
						
						$(this).val($("#keywords5").val());
						$("#keywords5").val("");

						if(len==2)
						{
							if((!$("#keywords5").is(":hidden"))&&($("#keywords5").val()==""))
								$("#keywords5").hide();
							else
							{
							}
						}
					}
					if($(this).attr('id')=="keywords5")
					{
					}
					
				}
			});
			
			$("input[type='text'][name='department']").keyup(function(){
				   
			       $("#dep").show();
			       var department=$("#department").val();
			       if(department!=null&&department!="")
			       {
			       $.ajax({
					   type: "POST",
					   url:"Department",
					   async:false,
					   data:{"department":department},
					   success: function(msg) 
					   {
						   $("#dep").html("");
						   var tagvalue=msg.split(" ");
						   $(tagvalue).each(function(i, dom){
							    $("#dep").append("<li value='"+dom+"'>" + dom + "</li>");
						   });
						   
						},
					   error: function(error)
					   {
						   alert(error);
						}
					});
			       }
			       else
			       {
			    	   $("#dep").hide();
			    	}
			   });
			$("#dep").on("click","li", function() {
	   	     	var text=$(this).html();
	   	     	$("#department").val(text);
	   	     	$("#dep").hide();
	   	 	});
			$("#department").blur(function(){
				setTimeout(function(){
					$("#dep").hide();
				},150);
			});
			
			$("#reset-style").click(function(){
				if(confirm("重置会清空技术需求信息"))
				{
					$("#needname").val("");
					
		    		$("#time1").attr("value", today);
		    		$("#time2").attr("value", tomorrow);
		    		
		    		$("#summary").val("");
		    		
		    		$("input[type='text'][name='keywords']").each(function(){
		    			$(this).val();
						if($(this).attr('id')!="keywords1")
						{
							$(this).hide();
						}
					});
		    		
		    		$("input[type='radio'][name='study-type']").each(function(){
		    			$(this).attr("checked",false);
					});
		    		
		    		$("#cf1").val("");
					$("#cf2 option:not(:first)").remove();
					$("#cf3 option:not(:first)").remove();
		    		
					$("input[type='checkbox'][name='tec-field']").each(function(){
						$(this).attr("checked",false);
					});
					
					$("#tech1").val("");
					$("#tech2 option:not(:first)").remove();
					$("#tech3 option:not(:first)").remove();
					
					$("input[type='text'][name='coo-model']").each(function(){
						$(this).val("");
					});
					
		    		$("#cooperative").val("");
		    		
		    		$("#totalmoney").val("");
		    		
		    		$("#self-collected").val("");
				}
				else
				{
					$("#submit-style").focus();
				}
			});
	});
/*
function isName(th)
{ 
	obj=th.value;
	 reg=/^([\u4E00-\u9FA5]{2,15})$/g;
	 if((!reg.test(obj))&&(obj!="")){   
        //alert("请输入正确的机构名称");
        th.style="color:red;";
    }
	 else{  
		 th.style="color:#000;";
    }   
}

function isAddress(th)
{
	obj=th.value;
	 reg=/^[A-Za-z0-9\u4e00-\u9fa5]+$/;
	 if((!reg.test(obj))&&(obj!="")){        
        //alert("请输入正确的通讯地址");
		 th.style="color:red;";
    }
	 else{ 
		 th.style="color:#000;";
    } 
}
function isUri(th){ 
	obj=th.value;
    reg=/(http|https):\/\/((\w+(-\w+)*)\.)+(com|cn|edu|org|info)(\/)?((\w+(-\w+)*)(\/)?)*(\.html|\.htm|\.jsp)?$/;   
    if((!reg.test(obj))&&(obj!="")){   
    	//alert("请输入正确的inernet地址"); 
    	th.style="color:red;";
    }
    else{    
    	th.style="color:#000;";
    }   
}
   function isEmail(th){ 
	   obj=th.value;
       reg=/^\w{3,}@\w+(\.\w+)+$/;   
       if((!reg.test(obj))&&(obj!="")){        
           //alert("请输入正确的邮箱地址");   
    	   th.style="color:red;";
       }
       else{   
    	   th.style="color:#000;";
       }   
   }
   function isPeopleName(th)
   {
	   obj=th.value;
   	reg=/^([\u4E00-\u9FA5]{2,6})$/g;
  	 	if((!reg.test(obj))&&(obj!="")){        
           //alert("请输入正确的姓名");
  	 		th.style="color:red;";
       }
  	 	else
       {    
  	 		th.style="color:#000;";
       }    	
   }
   function isPostalCode(th)
   {
	   obj=th.value;
   	reg=/[0-9]{6}/;
   	if((!reg.test(obj))&&(obj!="")){        
           //alert("请输入正确邮政编码");
   			th.style="color:red;";
       }
   	else{    
   		th.style="color:#000;";
       }
   }

   function isMobile(th){  
	   obj=th.value;
       reg=/^(\+\d{2,3}\-)?\d{11}$/;
       reg1=/^(\d{3,4}\-)?[1-9]\d{6,7}$/;
       if((!reg.test(obj))&&(!reg1.test(obj))&&(obj!="")){   
       	//alert("请输入正确的电话号码或手机号！"); 
    	   th.style="color:red;";
       }
       else{  
    	   th.style="color:#000;";
       }   
   }
   function isFax(th)
   {
	   obj=th.value;
   	reg=/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
   	if((!reg.test(obj))&&(obj!="")){   
       	//alert("请输入正确的传真号");  
   		th.style="color:red;";
       }
   	else{ 
   		th.style="color:#000;";
       }  
   }
   function isDepartment(th)
   {
	   obj=th.value;
   	   reg=/^([\u4E00-\u9FA5]{1,15})$/g;
  	 	if((!reg.test(obj))&&(obj!="")){        
           //alert("请输入正确的归口管理部门");
           th.style="color:red;";
       }
  	 	else{  
  	 		th.style="color:#000;";
       } 
   }
   function isNeedname(th)
   {
	   obj=th.value;
   	reg=/^([\u4E00-\u9FA5]{2,15})$/g;
  	 	if((!reg.test(obj))&&(obj!="")){        
  	 		th.style="color:red;";
        }
   	 	else{  
   	 		th.style="color:#000;";
        } 
   }
   
   function isKeywords(th)
   {
	   	obj=th.value;
   		reg=/^[A-Za-z0-9\u4E00-\u9FA5]{2,6}$/;
  	 	if((!reg.test(obj))&&(obj!="")){        
  	 		th.style="color:red;width:80px;height:20px;";
        }
   	 	else{  
   	 		th.style="color:#000;width:80px;height:20px;";
        } 
   }
   
   function isInstruction(th)
   {
	   obj=th.value;
   	reg1=/^[A-Za-z0-9]+$/;
   	reg2=/^([\u4E00-\u9FA5]{0,25})$/g;
  	 	if((!reg1.test(obj))&&(!reg2.test(obj))&&(obj!="")){        
  	 		th.style="color:red;";
        }
   	 	else{  
   	 		th.style="color:#000;";
        } 
   }
   
   
   function isNumber(th)
   {
	   	obj = th.value;
	   	var obj1=$("#totalmoney").val();
	   	var obj2=$("#self-collected").val();
   		reg=/^[1-9][0-9]*(\.\d+)?$/; 
   		reg1=/^0(\.\d+)?$/;
       	if((!reg.test(obj))&&(!reg1.test(obj))&&(obj!="")){   
    	   	th.style="color:red;";
       	}
  	 	else{  
  	 		th.style="color:#000;";
       	}
       	if(obj1<obj2)
       	{
       		th.style="color:red;";
       	}
       	else{  
       		$("#totalmoney").css("color","#000");
 		   	$("#self-collected").css("color","#000");
       	}
   }
   */

   function isRealTime(th)
   {
	   var date=th.value;
	   var today = $("#time1").val();
	   var tomorrow=$("#time2").val();
	   var today_date = today.split("-");
	   var tomorrow_date = tomorrow.split("-");
	   if(tomorrow_date[0]<today_date[0])
	   {
		   th.style="color:red;";
		   return;
	   }
	   else if(tomorrow_date[1]<today_date[1]&&tomorrow_date[0]<=today_date[0])
	   {
		   th.style="color:red;";
		   return;
	   }

	   else if(tomorrow_date[2]<=today_date[2]&&tomorrow_date[1]<=today_date[1]&&tomorrow_date[0]<=today_date[0])
		{
		   th.style="color:red;";
			return;
		}
	   else
		{
		   $("#time1").css("color","#000");
		   $("#time2").css("color","#000");
		}
   }
   
   
   function saveform()
   {
	   var val = $("#save").val();
	   document.getElementById("needform").action = "tijiao.jsp?val="+val;
	   document.getElementById("needform").submit();
   }
   function submitform()
   {
	   
	   if(isNull())
	   {
		   var r=confirm("需求信息审核后不能修改！确认提交吗？")
		   if (r==true)
		   {
			   var val = $("#sub").val();
			   document.getElementById("needform").action = "tijiao.jsp?val="+val;
			   document.getElementById("needform").submit();
		   }
		   else
		   {
		       return false;
		   } 
	   }
   }
   
   function isNull()
   {
	    var flag = true;
		$(".isnull").each(function(){
			
			if($.trim($(this).val()) == ""&&(!$(this).prop("disabled")))
			{
				var col = $(this).parent().index(); // 列位置
				var tdtext = $(this).parent().parent().children().eq(col-1).text();
				flag=false;
				alert(tdtext+"不能为空");
				$(this).focus();
				return false;
			}
			
			if($(this).attr("id")=="local"&&$(this).val()=="请选择")
			{
				var col = $(this).parent().index(); // 列位置
				var tdtext = $(this).parent().parent().children().eq(col-1).text();
				flag=false;
				alert(tdtext+"不能为空");
				$(this).focus();
				return false;
			}
		});
		
		if(flag == false)
		{
			return false;
		}
		else
		{}
		
		if($("input[type='radio'][name='institution-attribute']:checked").length==0)
		{
		    alert("机构属性不能为空");
		    $("#ins-att1").focus();
		    return false;
		}
		else if($("input[type='radio'][name='coo-model']:checked").length==0)
		{
		    alert("技术需求解决方式不能为空");
		    $("#coo-model1").focus();
		    return false;
		}
		else if($("input[type='radio'][name='study-type']:checked").length==0)
		{
			alert("科技活动类型不能为空");
		    $("#study-type").focus();
		    return false;
		}
		
		else if(!$("#cf-tr").is(":hidden"))
		{
			if($("#cf1").val()=="")
			{
				alert("学科分类不能为空");
			    $("#cf1").focus();
			    return false;
			}
		}
		else if((!$("#tf-tr").is(":hidden"))&&(!$("#tg-tr").is(":hidden")))
		{
			if($("input[type='checkbox'][name='tec-field']:checked").length==0)
			{
			    alert("需求技术所属领域不能为空");
			    $("#tec-field").focus();
			    return false;
			}
			else if($("#tech1").val()=="")
			{
				alert("需求技术应用行业不能为空");
			    $("#tech1").focus();
			    return false;
			}
			else
			{}
		}
		else
		{}
		
		return true;
   }
   
   var selectlocal;
   jQuery(function($){    
       $.ajax({   
           type:"POST",  
           url:"SelectLocal", 
           async:false,
           dataType: "text",
           
           //请求成功完成后要执行的方法  
           success: function(msg){
        	   if(msg!="null")
        	   {
        	   		selectlocal = msg;
        	   }
        	   else
        	   {
        		   selectlocal = "请选择";
        	   }
           }, 
           error: function (response) {
           }  
       });
   });

   var local;
   jQuery(function($){
       var l1 = $("#local");
       l1.append("<option value='"+selectlocal+"' selected>" + selectlocal + "</option>");
       
       $.ajax({   
           type:"POST",  
           url:"Localservlet", 
           async:false,
           dataType: "text",
           
           //请求成功完成后要执行的方法  
           success: function(msg){  
        	   local = msg.split(" ");
           }, 
           error: function (response) {
           }  
       });
       $(local).each(function(i, dom){
    	   if(dom!=""&&dom!=selectlocal)
    	   {
    	   		l1.append("<option value='"+dom+"'>" + dom + "</option>");
    	   }
       });
   });
   
   var str = '<%=cf.getCF()%>';
   var cf1 = str.split(" ");
   var cf2;
   var cf3;
   jQuery(function($){
       var a = $("#cf1"),
               b = $("#cf2"),
               c = $("#cf3");
       a.append("<option value=''>请选择</option>");
       b.append("<option value=''>请选择</option>");
       c.append("<option value=''>请选择</option>");
       $(cf1).each(function(i, dom){
           a.append("<option value='"+dom+"'>" + dom + "</option>");
       });
       
       var beforestr;
       a.change(function(){
           var me = $(this).val();
           beforestr=me;
           $.ajax({   
               type:"POST",  
               url:"CFservert", 
               async:false,
               data:{"cf1":me},
               dataType: "text",
               
               //请求成功完成后要执行的方法  
               success: function(msg){  
                       cf2 = msg.split(" "); 
               }, 
               error: function (response) {
               }  
           });  
           
           if(beforestr == me){
               b.html("").append("<option value=''>请选择</option>");
               c.html("").append("<option value=''>请选择</option>");
               $(cf2).each(function(i, dom){
                   b.append("<option value='"+dom+"'>" + dom + "</option>");
               });
           }else{
               b.html("").append("<option value=''>请选择</option>");
               c.html("").append("<option value=''>请选择</option>");
           }
       });
       b.change(function(){
           var me = $(this).val(),str;
           
           $.ajax({   
               type:"POST",  
               url:"CFservertlast", 
               async:false,
               data:{"cf2":me,"beforestr":beforestr},
               dataType: "text",
               
               //请求成功完成后要执行的方法  
               success: function(msg){   
                       cf3 = msg.split(" "); 
               }, 
               error: function (response) {
               }  
           });
           
           if(str = me){
               c.html("").append("<option value=''>请选择</option>");
               $(cf3).each(function(i, dom){
                   c.append("<option value='"+dom+"'>" + dom + "</option>");
               });
           }else{
               c.html("").append("<option value=''>请选择</option>");
           }
       });
   });
   
   var tech1;
   var tech2;
   var tech3;
   jQuery(function($){
       var t1 = $("#tech1"),
               t2 = $("#tech2"),
               t3 = $("#tech3");
       t1.append("<option value=''>请选择</option>");
       t2.append("<option value=''>请选择</option>");
       t3.append("<option value=''>请选择</option>");
       
       $.ajax({   
           type:"POST",  
           url:"Techservlet1", 
           async:false,
           dataType: "text",
           
           //请求成功完成后要执行的方法  
           success: function(msg){  
        	   tech1 = msg.split(" ");
           }, 
           error: function (response) {
           }  
       });
       $(tech1).each(function(i, dom){
    	   t1.append("<option value='"+dom+"'>" + dom + "</option>");
       });
       
       var beforestr;
       t1.change(function(){
           var me = $(this).val();
           beforestr=me;
           $.ajax({   
               type:"POST",  
               url:"Techservlet2", 
               async:false,
               data:{"tech1":me},
               dataType: "text",
               
               //请求成功完成后要执行的方法  
               success: function(msg){  
            	   tech2 = msg.split(" ");
               }, 
               error: function (response) {
               }  
           });  
           
           if(beforestr == me){
        	   t2.html("").append("<option value=''>请选择</option>");
        	   t3.html("").append("<option value=''>请选择</option>");
               $(tech2).each(function(i, dom){
            	   t2.append("<option value='"+dom+"'>" + dom + "</option>");
               });
           }else{
        	   t2.html("").append("<option value=''>请选择</option>");
        	   t3.html("").append("<option value=''>请选择</option>");
           }
       });
       t2.change(function(){
           var me = $(this).val(),str;
           
           $.ajax({   
               type:"POST",  
               url:"Techservlet3", 
               async:false,
               data:{"tech2":me,"tech1":beforestr},
               dataType: "text",
               
               //请求成功完成后要执行的方法  
               success: function(msg){  
            	   tech3 = msg.split(" ");
               }, 
               error: function (response) {
               }  
           });
           
           if(str = me){
        	   t3.html("").append("<option value=''>请选择</option>");
               $(tech3).each(function(i, dom){
            	   t3.append("<option value='"+dom+"'>" + dom + "</option>");
               });
           }else{
        	   t3.html("").append("<option value=''>请选择</option>");
           }
       });
   });
   
</script>

</head>
<body>
<jsp:useBean id = "db1" class = "bean.JBean" scope = "page">
<%
request.setCharacterEncoding("UTF-8");
String user = (String) session.getAttribute("user");
String jgcode = (String) session.getAttribute("jgcode");
String sql = "";

sql = "select * from JiGou where code='"+jgcode+"'";
ResultSet rs = db1.executeQuery(sql);

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
int len = 0;

int i = 2;
if(rs.next())
{
	jgname=rs.getString(++i);
	jgdepartment=rs.getString(++i);
	jgaddress=rs.getString(++i);
	jglocal=rs.getString(++i);
	session.setAttribute("jglocal", jglocal);
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
	len = jgagencyprofile.length();
}
db1.close();
%>
<div class="title-div">
	<h1>河北省重大需求征集表</h1>
</div>
<div class="table-explain" style="width:200px;margin-left:250px;margin-bottom:-20px;">
<label style="color:red;font-size:14px;">填表说明:表中带*的为必填项</label>
</div>
<div class="dep" id="dep" style="display:none;">
</div>
<form name="needform" id="needform" method="post" action="">
<table width="666" border="1" id="mytab" style="opacity:0.8;">
  <tr>
    <td width="111" class="table-name">*机构全称</td>
    <td colspan="2"><input class="tabs isnull" type="text" name="jigouname" id="jigouname" onblur="isName(this)" value="<%=jgname%>" readonly/></td>
    <td class="table-name">归口管理部门</td>
    <td colspan="2">
    	<input class="tabs" type="text" name="department" id="department" onblur="isDepartment(this)" value="<%=jgdepartment%>" />
    </td>
  </tr>
  <tr>
    <td class="table-name">*通讯地址</td>
    <td colspan="2">
    	<input class="tabs isnull" type="text" name="address" id="address" onblur="isAddress(this)" value="<%=jgaddress%>" />
    </td>
    <td class="table-name">*所在地域</td>
    <td colspan="2">
    	<select class="tabs isnull" name="local" id="local" style="width:100%;height:20px;">
    	</select>
    </td>
  </tr>
  <tr>
    <td class="table-name">网址</td>
    <td colspan="2">
    	<input class="tabs" type="text" name="webkit" id="webkit" onblur="isUri(this)" value="<%=jgwebkit%>" />
    </td>
    <td width="130" class="table-name">*电子信箱</td>
    <td width="129">
    	<input class="tabs isnull" type="text" name="email" id="email"  onblur="isEmail(this)" value="<%=jgemail%>" />
   </td>
  </tr>
  <tr>
    <td class="table-name">*法人代表</td>
    <td colspan="2">
    	<input class="tabs isnull" type="text" name="corporation" id="corporation" onblur="isPeopleName(this)" value="<%=jgcorporation%>" />
    </td>
    <td class="table-name">邮政编码</td>
    <td>
    	<input class="tabs" type="text" name="postalcode" id="postalcode" onblur="isPostalCode(this)" value="<%=jgpostalcode%>" />
    </td>
  </tr>
  <tr>
    <td class="table-name">*联 系 人</td>
    <td colspan="2">
    	<input class="tabs isnull" type="text" name="people" id="people" onblur="isPeopleName(this)" value="<%=jgpeople%>" />
    </td>
    <td class="table-name">固定电话</td>
    <td>
    	<input class="tabs" type="text" name="phone" id="phone" value="<%=jgphone%>" />
    </td>
  </tr>
  <tr>
    <td class="table-name">*手机</td>
    <td colspan="2">
    	<input class="tabs isnull" type="text" name="tel" id="tel" onblur="isMobile(this)" value="<%=jgtel%>" />
    </td>
    <td class="table-name">传  真</td>
    <td>
    	<input class="tabs" type="text" name="fax" id="fax" onblur="isFax(this)" value="<%=jgfax%>" />
    </td>
  </tr>
  <tr>
    <td height="49" class="table-name">*机构属性</td>
    <td colspan="4">
    	<input type="radio" name="institution-attribute" class="style tabs" id="ins-att1" value="企业" <%=jgins_att.equals("企业")?"checked":""%> /> 企业
  		<input type="radio" name="institution-attribute" class="style tabs" id="ins-att2" value="高等院校" <%=jgins_att.equals("高等院校")?"checked":""%> />高等院校
  		<input type="radio" name="institution-attribute" class="style tabs" id="ins-att3" value="研究机构" <%=jgins_att.equals("研究机构")?"checked":""%> />研究机构
  		<input type="radio" name="institution-attribute" class="style tabs" id="ins-att4" value="其他" <%=jgins_att.equals("其他")?"checked":""%> />其他
	</td>
  </tr>
  <tr>
    <td height="117" colspan="5">
    	<div class="summary-div">
    		<textarea class="tabs isnull" name="agencyprofile" id="agencyprofile" placeholder="*机构简介（主要包括基本情况、现有研究基础等，限500字以内）"><%=jgagencyprofile%></textarea>
    	</div>
    	<div class="max200-div">
    		<label id="max200"><%=len %>/500</label>
    	</div>
    </td>
  </tr>
  <tr>
    <td width="30" class="table-name">*技术需求名称</td>
    <td>
    	<input class="tabs isnull" type="text" name="needname" id="needname" onblur="isNeedname(this)" />
    </td>
    <td class="table-name">*需求时限</td>
    <td>
    	<input class="tabs isnull" type="date" name="time1" id="time1" onblur="isRealTime(this)" />
    </td>
    <td>
    	<input class="tabs isnull" type="date" name="time2" id="time2" onblur="isRealTime(this)" />
    </td>
  </tr>
  <tr>
    <td height="136" colspan="5">
    	<div class="summary-div">
    		*技术需求概述<br>
    		主要问题（需要解决的重大技术问题，限500字以内）
    		<textarea class="tabs summary isnull" name="summary1" id="summary1" placeholder="主要问题（需要解决的重大技术问题，限500字以内）"></textarea>
    		<div class="max500-div">
    			<label id="1max500">0/500</label>
    		</div>
    		技术关键（所需的关键技术、主要指标，限500字以内）
    		<textarea class="tabs summary isnull" name="summary2" id="summary2" placeholder="技术关键（所需的关键技术、主要指标，限500字以内）"></textarea>
    		<div class="max500-div">
    			<label id="2max500">0/500</label>
    		</div>
    		预期目标（技术创新性、经济社会效益，限500字以内）
    		<textarea class="tabs summary isnull" name="summary3" id="summary3" placeholder="预期目标（技术创新性、经济社会效益，限500字以内）"></textarea>
    		<div class="max500-div">
    			<label id="3max500">0/500</label>
    		</div>
    	</div>
    	
        <div class="keywords-div">
        	*关键字：<input style="width:80px;height:20px;" class="tabs keyword isnull" type="text" name="keywords" id="keywords1" onblur="isKeywords(this)" />
        	<input style="width:80px;height:20px;display:none;" class="tabs keyword" type="text" name="keywords" id="keywords2" onblur="isKeywords(this)" />
        	<input style="width:80px;height:20px;display:none;" class="tabs keyword" type="text" name="keywords" id="keywords3" onblur="isKeywords(this)" />
        	<input style="width:80px;height:20px;display:none;" class="tabs keyword" type="text" name="keywords" id="keywords4" onblur="isKeywords(this)" />
        	<input style="width:80px;height:20px;display:none;" class="tabs keyword" type="text" name="keywords" id="keywords5" onblur="isKeywords(this)" />
        </div>
    </td>
  </tr>
  <tr>
    <td class="table-name">拟投入资金总额(万元)</td>
    <td colspan="4">
    	<input class="tabs" type="text" name="self-collected" id="self-collected" onblur="isNumber(this)" />
	</td>
  </tr>
  <tr>
    <td rowspan="2" class="table-name">*技术需求解决方式</td>
    <td colspan="4">
    	<input name="coo-model" type="radio" class="style tabs" id="coo-model1" value="独立研发" />独立研发
  		<input name="coo-model" type="radio" class="style tabs" id="coo-model2" value="委托研发" />委托研发
  		<input name="coo-model" type="radio" class="style tabs" id="coo-model4" value="合作研发" />合作研发
		<input name="coo-model" type="radio" class="style tabs" id="coo-model5" value="其他" />其他
	</td>
  </tr>
  <tr>
  	<td class="table-name">合作意向单位</td>
  	<td colspan="3">
    	<input type="text" name="cooperative" id="cooperative" style="width:260px;" onblur="isName(this)" placeholder="合作意向单位" />
    	<label>（选填）</label>
    </td>
  </tr>
  
  <tr>
    <td height="50" class="table-name">*科技活动类型</td>
    <td colspan="4">
    	<input name="study-type" type="radio" class="style tabs" id="study-type" value="基础研究" />基础研究
  		<input name="study-type" type="radio" class="style tabs" id="study-type" value="应用研究" />应用研究
  		<input name="study-type" type="radio" class="style tabs" id="study-type" value="试验发展" />试验发展
  		<input name="study-type" type="radio" class="style tabs" id="study-type" value="研究发展与成果应用" />研究发展与成果应用
		<input name="study-type" type="radio" class="style tabs" id="study-type" value="技术推广与科技服务" />技术推广与科技服务
		<input name="study-type" type="radio" class="style tabs" id="study-type" value="生产性活动" />生产性活动
	</td>
  </tr>
  <tr id="cf-tr">
    <td height="50" class="table-name">*学科分类（限基础研究填写）</td>
    <td colspan="4">
    	<select style="width:160px; margin-left:16px;" name="classification" class="classification" id="cf1"> 
		</select>
		<select style="width:160px;" name="classification" class="classification" id="cf2">  
		</select>
		<select style="width:160px;" name="classification" class="classification" id="cf3">  
		</select>
	</td>
  </tr>
  <tr id="tf-tr">
    <td height="80" class="table-name">*需求技术所属领域（非基础研究填写）</td>
    <td colspan="4">
    	<input name="tec-field" type="checkbox" class="style" id="tec-field" value="电子信息" />电子信息
  		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="光机电一体化" />光机电一体化
  		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="生物技术与制药" />生物技术与制药
		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="新材料及应用" />新材料及应用
  		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="现代农业" />现代农业
  		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="新能源与高效节能" />新能源与高效节能
		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="资源与环境" />资源与环境
		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="高技术服务业" />高技术服务业
		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="海洋" />海洋
		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="社会公共事业" />社会公共事业
		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="医疗卫生" />医疗卫生
  		<input name="tec-field" type="checkbox" class="style" id="tec-field" value="其他" />其他（注明）
  		<input type="text" name="instruction" id="instruction"  placeholder="请详细注明!" onblur="isInstruction(this.value)" />
	</td>
  </tr>
  <tr id="tg-tr">
    <td height="50" class="table-name">*需求技术应用行业（非基础研究填写）
	</td>
    <td colspan="4">
    	<select style="width:160px;margin-left:16px;" name="technologyapplication" class="technologyapplication" id="tech1"> 
		</select>
		<select style="width:160px;" name="technologyapplication" class="technologyapplication" id="tech2">  
		</select>
		<select style="width:160px;" name="technologyapplication" class="technologyapplication" id="tech3">  
		</select>
	</td>
  </tr>
</table>
<div class="submit-div">
<button id="reset-style" type="button" value="重置">重置</button>
<input class="submit-style" type="button" id="save" name="save" value="保存" onclick="saveform()" />
<input class="submit-style" type="button" id="sub" name="sub" value="提交" onclick="submitform()" />
</div>
</form>
</jsp:useBean>
</body>
</html>