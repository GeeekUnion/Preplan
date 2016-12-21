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
    	function addMis(){
			$('#win').window({
				width:780,
				height:550,
				title:'当前任务',
				cache:false,
				content:'<iframe src="preplan_state_add.action" frameborder="0" width="100%" height="100%"/>'
			});
			

			
} 
    	
    	
    	$(function (){
 			
 		 $('#dg').datagrid({    
  		 url:'preplan_mission_queryByPage.action',    
  		 singleSelect:true,
  		 loadmsg:'请等待',
	     rownumbers:true,
  		 pagination:true,
		 pageNumber:1,
		 pageSize:15,
		 pageList:[15,30,50,100],
		 
    	 columns:[[    
    	 {field:'ffffff',title:'事件名称',width:100,align:'center'},   
        {field:'preplanSn',title:'预案编号',width:100,align:'center'},    
        {field:'preplanName',title:'预案名称',width:100,align:'center'},    
        {field:'responDept',title:'负责部门',width:100,align:'center'},
        {field:'act',title:'操作',width:'100',align:'center',formatter:function(value,row,index){
		        		  return "<a  href='#' onclick='addMis()' data-options='iconCls:'icon-edit'' class='easyui-linkbutton' style='text-decoration:none'>"+"查看任务"+"</a>";				        		
		        	}}
        
   			 ]],
   		
	    
						});  
                        });
    	
    	
    	
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
   
   <div id="win" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div> 
   
   <table id="dg"></table>  
   
   
   
   
</body>
</html>