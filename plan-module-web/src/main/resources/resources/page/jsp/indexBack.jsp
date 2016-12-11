<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>后台首页</title>

    <link rel="stylesheet" type="text/css" href="theme/default/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="theme/icon.css"/>
    <link rel="stylesheet" type="text/css" href="theme/esui.css"/>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/esui.js"></script>

    <script type="text/javascript">
 	
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body class="easyui-layout" scroll="no">

<!--1.1 egion="north"，指明高度，可以自适应-->
<div region="north" class="north" scroll="no">
    <div class="fl northLeft">
    	<a href="index">
	    	<img class="logoImg fl" src="images/icon/logo.jpg" alt="XX网" />	
	    </a>
		 <h3 class="fl mgl">权限管理系统</h3>
    </div>
   
	<div class="fr northRight">
		<span>欢迎您</span>
	</div>
</div>

<!--1.2 region="west",必须指明宽度-->
<div region="west" class="west"  title="导航菜单" split="true"  >
    <div class="easyui-accordion" >				
		<div title="基础信息管理" data-options="iconCls:'icon-man'" >
			<ul id="tt1" class="easyui-tree esuitree">
				<li data-options="iconCls:'icon-category'">><span><a href="#"  onclick="addTab('类别','user_menu1')">类别</a></span></li>
				<li data-options="iconCls:'icon-product'">><span><a href="#"  onclick="addTab('产品','user_menu1')">产品</a></span></li>							
				<li data-options="iconCls:'icon-provider'">><span><a href="#"  onclick="addTab('供应商','user_menu1')">供应商</a></span></li>							
				<li data-options="iconCls:'icon-staff'">><span><a href="#"  onclick="addTab('员工','user_menu1')">员工</a></span></li>														
			</ul>
		</div>
		<div title="客户管理" data-options="iconCls:'icon-customer'">
		
			<ul id="tt2" class="easyui-tree esuitree">			
				<li data-options="iconCls:'icon-customer2'"><span><a href="#"  onclick="addTab('客户','good_menu2')">客户</a></span></li>				
			</ul>
		</div>

		<div title="系统管理" data-options="iconCls:'icon-system'">
			<ul id="tt3" class="easyui-tree esuitree">
				<li data-options="iconCls:'icon-menu'">><span><a href="#"  onclick="addTab('菜单权限','privilege_menu1')">菜单权限</a></span></li>
				<li data-options="iconCls:'icon-center'">><span><a href="#"  onclick="addTab('权限中心','privilege_menu2')">权限中心</a></span></li>
				<li data-options="iconCls:'icon-datapri'">><span><a href="#"  onclick="addTab('数据权限','privilege_menu3')">数据权限</a></span></li>
				<li data-options="iconCls:'icon-setting'">><span><a href="#"  onclick="addTab('底层权限','privilege_menu4')">底层权限</a></span></li>			
			</ul>
		</div>

		<div title="订单管理" data-options="iconCls:'icon-myf'">
			<ul id="tt4" class="easyui-tree esuitree">		
				<li data-options="iconCls:'icon-order'"><span><a href="#"  onclick="addTab('订单','order_menu2')">订单</a></span></li>
				<li data-options="iconCls:'icon-see'"><span><a href="#"  onclick="addTab('托运人','order_menu1')">托运人</a></span></li>
			</ul>
		</div>
		<div title="组织架构" data-options="iconCls:'icon-organization'">
			<ul id="tt4" class="easyui-tree esuitree">		
				<li data-options="iconCls:'icon-department'"><span><a href="#"  onclick="addTab('部门','dept_menu')">部门</a></span></li>
				<li data-options="iconCls:'icon-customer2'"><span><a href="#"  onclick="addTab('角色','role_menu')">角色</a></span></li>
				<li data-options="iconCls:'icon-users'"><span><a href="#"  onclick="addTab('用户','user_menu')">用户</a></span></li>
			</ul>
		</div>	
	</div>
	
</div>

<!--1.3region="center",这里的宽度和高度都是由周边决定，不用设置-->
<div region="center" class="center">

<!--2. 对<div>标签引用'easyui-layout'类,fit="true"自动适应父窗口,这里我们指定了宽度和高度-->
<div id="tt" class="easyui-tabs" fit="true">
		<div title="Home">
			<center class="mgt fontBold">欢迎来到后台管理空间</center>
		</div>
	</div> 

</div>

<!--1.4 region="east",必须指明宽度-->
<div region="east" title="日历" split="true" class="east"><div class="easyui-calendar calendareast"></div></div>

<!--1.5 region="south"，指明高度，可以自适应-->
<div region="south" class="south" ><center> <p>&copy; 2016 | All Will Be Ok,Belive Youself Please | Designed by<a href="#">DKL</a></p></center></div>
</body>
</html>