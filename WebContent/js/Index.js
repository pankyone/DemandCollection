$(document).ready(function(e)
{

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
					$("#technologyapplication").val("");
					$("#technologyapplication").attr("disabled",true);
					$("#classification").attr("disabled",false);
				}
				else
				{
					$("#classification").val("");
					$("#classification").attr("disabled",true);
					$("#technologyapplication").attr("disabled",false);
					$("input[type='checkbox'][name='tec-field']").each(function(){
						$(this).attr("disabled",false);
					});
				}
		}
	});
	$("input[type='checkbox'][name='tec-field']").click(function(){
		
		if(this.checked)
		{
			if($(this).val()=="其他技术")
			{
				$("#instruction").show();
				$("#instruction").attr("disabled",false);
			}
		}
		else
		{
			if($(this).val()=="其他技术")
			{
				$("#instruction").hide();
				$("#instruction").attr("disabled",true);
				$("#instruction").val("");	
			}
		}
	});
	
	$("input[type='radio'][name='coo-model']").click(function(){
		
		if(this.checked)
		{
			if($(this).val()=="独立开发")
			{
				$("#cooperative").val("");
				$("#cooperative").prop("disabled","disabled");
			}
			else
			{
				$("#cooperative").removeAttr("disabled"); 
			}
		}
		
	});
	
	$("#submit-style").click(function()
	{
		var i=0;
		var flag=true;
		$("#mytab").find(":input").each(function()
	    {
			if($.trim($(this).val()) == ""&&(!$(this).prop("disabled")))
			{
				if($(this).prop("name")!="cooperative")
				{
					flag=false;
					alert("请输入完全");
					$(this).focus();
					return false;
				}
			}
			else
			{
			    i++;
			}
			if(($("input[type='radio'][name='institution-attribute']:checked").length==0)&&(i==9))
			{
				flag=false;
			    alert("机构属性不能为空");
			    $("#ins-att1").focus();
			    return false;
			}
			if(($("input[type='checkbox'][name='study-type']:checked").length==0)&&(i==18))
			{
				flag=false;
				alert("研究类型不能为空");
			    $("#study-type").focus();
			    return false;
			}
			if(($("input[type='checkbox'][name='tec-field']:checked").length==0)&&(i==24)&&(!$("input[type='checkbox'][name='tec-field']").prop("disabled")))
			{
				flag=false;
			    alert("需求技术所属领域不能为空");
			    $("#tec-field").focus();
			    return false;
			}
			if(($("input[type='radio'][name='coo-model']:checked").length==0)&&(i==36))
			{
				flag=false;
			    alert("技术需求合作模式不能为空");
			    $("#coo-model1").focus();
			    return false;
			}
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
		var maxnumber=200;
		var tlength = $.trim($("#agencyprofile").val()).length;
		if(tlength >= maxnumber)
		{
			var num = $.trim($("#agencyprofile").val()).substr(0,maxnumber-1);
			$("#agencyprofile").val(num);
			tlength=maxnumber;
		}
		var text = tlength + "/200";
		$("#max200").text(text);
	});
	$("#summary").keyup(function()
			{
				var maxnumber=200;
				var tlength = $.trim($("#summary").val()).length;
				if(tlength >= maxnumber)
				{
					var num = $.trim($("#summary").val()).substr(0,maxnumber-1);
					$("#summary").val(num);
					tlength=maxnumber;
				}
				var text = tlength + "/500";
				$("#max500").text(text);
			});
});




