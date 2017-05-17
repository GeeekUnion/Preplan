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
	<div class="header">
	    <div class="fl northLeft">
			 <h1 class="fl mgl" style="font-size:32px;">预警管理系统</h1>
	    </div>   
		<div class="fr northRight panel-title">
			<#if null != preplanUsername>
				<span>欢迎您：${preplanUsername}</span>
				<span>&nbsp;|&nbsp;</span>
				<span><a href="javascript:void(0)" onclick="loginOut()">退出系统</a></span>
			</#if>		
		</div>
	</div>
</div>
		
<!--1.2 region="west",必须指明宽度-->
<div region="west" class="west"  title="导航菜单" split="true"  >
    <div class="easyui-accordion" >				
		<div title="预案及模块管理" data-options="iconCls:'icon-product'" >
			<ul id="tt1" class="">		
				<#if hasPriv('preplan111-1')==true>
				   <li class="tree-title" style="display:list-item"><span><a href="javascript:void(0)"   onclick="addTab('预案列表','${pageContext.request.contextPath}/plan/preplan/preplan_list.action',${hasPriv('preplan111-1')})">预案列表</a></span></li>
				</#if>		
				<#if hasPriv('preplan111-2')==true>	
					<li class="tree-title" style="display:list-item"><span><a href="javascript:void(0)"  onclick="addTab('预案编制','${pageContext.request.contextPath}/plan/preplan/preplan_edit.action',${hasPriv('preplan111-2')})">预案编制</a></span></li>	
				</#if>	
				<#if hasPriv('preplan111-3')==true>	
					<li class="tree-title" style="display:list-item"><span><a href="javascript:void(0)"  onclick="addTab('模块编制','${pageContext.request.contextPath}/plan/preplan/preplan_module.action',${hasPriv('preplan111-3')})">模块编制</a></span></li>																		
				</#if>														
			</ul>
		</div>
		<div title="预案启动和执行" data-options="iconCls:'icon-menu'">
			<ul id="tt3" class="">
				<#if hasPriv('preplan112-1')==true>	
					<li class="tree-title" style="display:list-item"><span><a href="javascript:void(0)"  onclick="addTab('启动预案','${pageContext.request.contextPath}/plan/preplan/preplan_start.action',${hasPriv('preplan112-1')})">启动预案</a></span></li>
				</#if>
				<#if hasPriv('preplan112-2')==true>	
					<li class="tree-title" style="display:list-item"><span><a href="javascript:void(0)"  onclick="addTab('执行情况','${pageContext.request.contextPath}/plan/preplan/preplan_state.action',${hasPriv('preplan112-2')})">执行情况</a></span></li>			
				</#if>								
			</ul>
		</div>
		<div title="资源管理" data-options="iconCls:'icon-myf'">
			<ul id="tt3" class="">
				<#if hasPriv('preplan113-1')==true>	
					<li class="tree-title" style="display:list-item"><span><a href="javascript:void(0)"  onclick="addTab('资源列表','${pageContext.request.contextPath}/plan/preplan/preplan_src_map.action',${hasPriv('preplan113-1')})">资源列表</a></span></li>				
				</#if>				
			</ul>
		</div>
	</div>	
</div>

<!--1.3region="center",这里的宽度和高度都是由周边决定，不用设置-->
<div region="center" class="center">

<!--2. 对<div>标签引用'easyui-layout'类,fit="true"自动适应父窗口,这里我们指定了宽度和高度-->
<div id="ttab" class="easyui-tabs" fit="true" pill='true'>
		<div title="主页">
			<center class="mgt fontBold">欢迎来到预警管理系统</center>
		</div>
	</div> 

</div>

<!--1.4 region="east",必须指明宽度
<div region="east" title="日历" split="true" class="east"><div class="easyui-calendar calendareast"></div></div>
-->


<!--1.5 region="south"，指明高度，可以自适应-->
<div region="south" class="south" ><center> <p>&copy; 2016 | All Will Be Ok,Belive Youself Please | Designed by<a href="#">DKL</a></p></center></div>
>
<script type="text/javascript">
	function tabsClose(title){
		closeTab(title)
	}
	
	function loginOut(){
		$.ajax({
			url:'/plan/preplan/preplan_person_loginOut.action',
			method:'POST',
			dataType:'json',
			data:{
			},
			success:function(data){
				if(data=="ok"){
		        	location.href ="/plan/preplan/login.action";   
		        }else{
					$.messager.alert('提示','未知错误，请重试！','error');	
		        }
			}
		})
	}
	
</script>
	
</body>
</html>