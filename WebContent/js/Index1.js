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
		        if (key == 13||key == 40) {
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
		            var nxtIdx = 0;  
		            jQuery(".tabs:eq(" + nxtIdx + ")").focus();  
		        }
		    });
		    
		    
		    
		    
			$("input[type='checkbox'][name='tec-field']").each(function(){
				$(this).attr("disabled",true);
			});
			$("input[type='radio'][name='study-type']").click(function()
			{
				if(this.checked)
				{
						if($(this).val()=="基础研究")
						{
							$("#tech1 option:first").prop("selected",true);
							$("#tech2 option:not(:first)").remove();
							$("#tech3 option:not(:first)").remove();
							$(".technologyapplication").attr("disabled",true);
							$("input[type='checkbox'][name='tec-field']").each(function(){
								$(this).attr("checked",false);
								$(this).attr("disabled",true);
							});
							$("#input-select").attr("disabled",false);
							$(".classification").attr("disabled",false);
						}
						else
						{
							$("#cf1 option:first").prop("selected",true);
							$("#cf2 option:not(:first)").remove();
							$("#cf3 option:not(:first)").remove();
							$(".classification").attr("disabled",true);
							$("#input-select").val("请选择");
							$("#input-select").attr("disabled",true);
							$(".technologyapplication").attr("disabled",false);
							$("input[type='checkbox'][name='tec-field']").each(function(){
								$(this).attr("disabled",false);
							});
						}
				}
			});
			$("input[type='checkbox'][name='tec-field']").click(function(){
				
				if(this.checked)
				{
					if($(this).val()=="其他")
					{
						$("#instruction").attr("disabled",false);
					}
				}
				else
				{
					if($(this).val()=="其他")
					{
						$("#instruction").attr("disabled",true);
						$("#instruction").val("");	
					}
				}
			});
			
			
			//$("input[type='checkbox'][name='coo-model']").click(function(){
				
				//if(this.checked)
				//{
					//if($(this).val()=="独立开发")
					//{
						//$("#cooperative").val("");
						//$("#cooperative").prop("disabled","disabled");
					//}
					//else
					//{
						//$("#cooperative").removeAttr("disabled"); 
					//}
				//}	
			//});
			
			$("#submit-style").click(function()
			{
				var i=0;
				var flag=true;
				$("#mytab").find(":input").each(function()
			    {
					if($.trim($(this).val()) == ""&&(!$(this).prop("disabled")))
					{
						if(($(this).prop("name")!="cooperative")&&($(this).prop("id")!="cf3"))
						{
							if(($(this).prop("name")!="keywords")||($(this).prop("id")=="keywords1"))
							{
								flag=false;
								alert("请输入完全");
								$(this).focus();
								return false;
							}
						}
					}
					else
					{
					    i++;
					}
					/*
					if(($("input[type='radio'][name='institution-attribute']:checked").length==0)&&(i==9))
					{
						flag=false;
					    alert("机构属性不能为空");
					    $("#ins-att1").focus();
					    return false;
					}
					if(($("input[type='radio'][name='study-type']:checked").length==0)&&(i==18))
					{
						flag=false;
						alert("研究类型不能为空");
					    $("#study-type").focus();
					    return false;
					}
					if(($("input[type='checkbox'][name='tec-field']:checked").length==0)&&(i==26)&&(!$("input[type='checkbox'][name='tec-field']").prop("disabled")))
					{
						flag=false;
					    alert("需求技术所属领域不能为空");
					    $("#tec-field").focus();
					    return false;
					}
					if(($("input[type='checkbox'][name='coo-model']:checked").length==0)&&(i==40))
					{
						flag=false;
					    alert("技术需求合作模式不能为空");
					    $("#coo-model1").focus();
					    return false;
					}
					*/
				});
				
				if(flag==false)
				{
					return false;
				}
				else 
					return true;
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
				   //var tagvalue = $("#department").val().split(',');
			       //$("#tags").autocomplete({ source: tagvalue });
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