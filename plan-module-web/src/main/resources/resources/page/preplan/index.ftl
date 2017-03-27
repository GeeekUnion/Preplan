<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>后台首页</title>
	<link rel = "stylesheet" href="${getTheme('default','')}default/easyui.css" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="${getTheme('default','')}/icon.css"/>
    <link rel="stylesheet" type="text/css" href="${getTheme('default','')}/esui.css"/>
	<script type="text/javascript" src="${getMC ("")}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${getMC ("")}/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${getMC ("")}/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${getMC ("")}/js/esui.js"></script>
	<script type="text/javascript" src="${getMC ("")}/js/raphael-min.js"></script>
	<script type="text/javascript" src="${getMC ("")}/js/flowchart.min.js"></script>
 
    </head>
<!--1. 在整个页面创建布局面板-->
<body class="easyui-layout" scroll="no">

<!--1.1 egion="north"，指明高度，可以自适应-->
<div region="north" class="north" scroll="no">
    <div class="fl northLeft">
    	<a href="index">
	    	<img class="logoImg fl" src="#" alt="XX网" />	
	    </a>
		 <h3 class="fl mgl">预警管理系统</h3>
    </div>
   
	<div class="fr northRight">
		<span>欢迎您</span>
	</div>
</div>

<!--1.2 region="west",必须指明宽度-->
<div region="west" class="west"  title="导航菜单" split="true"  >
    <div class="easyui-accordion" >				
		<div title="预案管理" data-options="iconCls:'icon-man'" >
			<ul id="tt1" class="easyui-tree esuitree">
				<li data-options="iconCls:'icon-category'">><span><a href="#"  onclick="addTab('预案列表','preplan_list.action')">预案列表</a></span></li>
				<li data-options="iconCls:'icon-product'">><span><a href="#"  onclick="addTab('预案定制','preplan_edit.action')">预案定制</a></span></li>																				
			</ul>
		</div>
		<div title="预案启动和执行" data-options="iconCls:'icon-system'">
			<ul id="tt3" class="easyui-tree esuitree">
				<li data-options="iconCls:'icon-menu'">><span><a href="#"  onclick="addTab('启动预案','preplan_start.action')">启动预案</a></span></li>
				<li data-options="iconCls:'icon-center'">><span><a href="#"  onclick="addTab('执行情况','preplan_state.action')">执行情况</a></span></li>			
			</ul>
		</div>
	</div>
	
</div>

<!--1.3region="center",这里的宽度和高度都是由周边决定，不用设置-->
<div region="center" class="center">

<!--2. 对<div>标签引用'easyui-layout'类,fit="true"自动适应父窗口,这里我们指定了宽度和高度-->
<div id="tt" class="easyui-tabs" fit="true">
		<div title="Home">
			<center class="mgt fontBold">欢迎来到预警管理系统</center>
		</div>
	</div> 

</div>

<!--1.4 region="east",必须指明宽度-->
<div region="east" title="日历" split="true" class="east"><div class="easyui-calendar calendareast"></div></div>

<!--1.5 region="south"，指明高度，可以自适应-->
<div region="south" class="south" ><center> <p>&copy; 2016 | All Will Be Ok,Belive Youself Please | Designed by<a href="#">DKL</a></p></center></div>
</body>
</html>