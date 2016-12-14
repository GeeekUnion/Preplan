<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel = "stylesheet" href="${getTheme('default','')}default/easyui.css" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="${getTheme('default','')}/icon.css"/>
    <link rel="stylesheet" type="text/css" href="${getTheme('default','')}/esui.css"/>
	<script type="text/javascript" src="${getMC ("")}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${getMC ("")}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${getMC ("")}/js/esui.js"></script>

    <script type="text/javascript">
    	$(function (){
    	 $('#dg').datagrid({    
  		 url:'preplan_mission_queryByPage2.action',    
  		 singleSelect:true,
  		 loadmsg:'请等待',
	     rownumbers:true,
  		 pagination:true,
		 pageNumber:1,
		 pageSize:15,
		 pageList:[15,30,50,100],
		 columns:[[    
    	 {field:'missionSn',title:'任务编号',width:100,align:'center'},   
        {field:'missionMethod',title:'方法安排',width:100,align:'center'},    
        {field:'missionStatus',title:'任务状态',width:100,align:'center'},    
        {field:'responDept',title:'负责部门',width:100,align:'center'},
        {field:'responPerson',title:'负责人',width:100,align:'center'}
      
        
   			     ]],
   		
		 
		 
		 
		 
		 
		  					 })
		 
    	              })
    	
    	
    	
    	
    	
    	
    	
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
   
  
   
   <table id="dg"></table>  
   
   
	
	
   
   
</body>
</html>