<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帮助文件</title>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/custom.css" rel="stylesheet">
<link href="css/prettify.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/default.css">
<script type="text/javascript" src="extended/jquery-2.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/jquery.bootstrap.wizard.js"></script>
<script src="js/prettify.js"></script>
</head>
<style type = "text/css">
body
{
	font:16px "微软雅黑", Helvetica, sans-serif;
	color: #000;
	background-color:#EEFFFB;
	margin: 0px;
}
label{font-size:18px;font-weight:bold;}
b{color:red;text-decoration:underline;text-decoration-color:red;}
#contain,#mainbody{padding-left:30px;}
.pager_div{margin-top:40px;}
.pager{width:476px;}
.tab-content{margin-top:30px;}
</style>

<script>
	$(document).ready(function() {
	  	$('#rootwizard').bootstrapWizard({'tabClass': 'bwizard-steps'});
		window.prettyPrint && prettyPrint()
	});
</script>
<body>
<div id="contain">
<br><br>
<label>管理部门</label>
<label>联系方式：</label>
<b>15227196900</b>
<br><br>
<label>填报流程图:</label>
<br><br>
	<div id="mainbody">
		<div id="rootwizard">
			<ul>
				<li>
					<a href="#tab1" data-toggle="tab">
						<span class="label">1</span>
						First
					</a>
				</li>
				<li>
					<a href="#tab2" data-toggle="tab">
						<span class="label">2</span>
						Second
					</a>
				</li>
				<li>
					<a href="#tab3" data-toggle="tab">
						<span class="label">3</span>
						Third
					</a>
				</li>
				<li>
					<a href="#tab4" data-toggle="tab">
						<span class="label">4</span>
						Forth
					</a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane" id="tab1">
				用户登录到系统 → 点击左侧栏中的<b>需求征集</b> → 再点击二级菜单中的<b>征集表在线填报</b>选项 → 开始填报;
				</div>
				<div class="tab-pane" id="tab2">
				填报完成后 → 点击<b>提交</b>按钮或者<b>保存</b>按钮 → 提交完成或保存完成;
				</div>
				<div class="tab-pane" id="tab3">
				修改未审核的需求征集表→ 点击左侧栏中的<b>需求管理</b> → 再点击二级菜单中的<b>征集表在线修改</b>选项 → 修改需求征集表;
				</div>
				<div class="tab-pane" id="tab4">
				查看审核结果 → 点击左侧栏中的<b>需求管理</b> → 再点击二级菜单中的<b>各项结果浏览</b>选项 → 查看需求审核结果;
				</div>
				<div class="pager_div">
				  <ul class="pager wizard">
					<li class="previous first" style="display:none;">
						<a href="#">First</a>
					</li>
					<li class="previous">
						<a href="#">Previous</a>
					</li>
					<li class="next last" style="display:none;">
						<a href="#">Last</a>
					</li>
					<li class="next">
						<a href="#">Next</a>
					</li>
				  </ul>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>