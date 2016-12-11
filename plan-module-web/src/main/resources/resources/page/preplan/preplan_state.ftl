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
 			//数据表格
 			/*
 			$('#ppltt').datagrid({
 			    url:'queryPrivilege.action',
 			   	pagination:true,
 			   	rownumbers:true,
 			   	striped:true,
 			   	singleSelect:true, 			    
 			    columns:[[
 					{field:'id',title:'id',width:180,align:'center'},      
 					{field:'',title:'报警人',width:250,align:'center'},
 					{field:'',title:'报警时间',width:250,align:'center'},
 					{field:'',title:'事件描述',width:250,align:'center'},
 					{field:'',title:'具体位置',width:250,align:'center'},
 					{field:'',title:'操作',width:250,align:'center'}
 			    ]],
 			 	//数据表格  
 			   toolbar: [{
 					text:'查看用户',
 					iconCls: 'icon-users',
 					handler:function (){
 						
 						}
 				}]
				
 			});
 			*/
 			$('#pps_search_btn').linkbutton({    
			    iconCls: 'icon-add'   
			});
			$('#pps_input1').textbox({
				label: '任务名称：',                
				labelPosition: 'top',		
			    required:true,
			         
			});
			$('#pps_input2').textbox({
				label: '责 任 人：',                
				labelPosition: 'top',				    
			    required:true,
			    missingMessage:'此输入框不能为空！'      
			});
			$('#pps_input3').textbox({
				label: '任务描述：',                
				labelPosition: 'top',    
			    multiline:true,
			    required:true,
			    missingMessage:'此输入框不能为空！'    
			});  		 
 		});	
 		function addMisson(){			
				$('#pps_add_mission').window({    
				    width:420,    
				    height:250,    
				    modal:true,
				    title:'新增任务'   
				}); 
			}
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
    <!--表格-->
    <div class="top-area">
    	<p class="title">事件列表</p>
    	<table id="ppstt"></table>  
    </div>   
    <div class="btm-area">
    	<p class="title">预案执行情况</p>
    	<a id="pps_search_btn" href="#" onclick="addMisson()">新增任务</a>
    </div>
    
	<div id="pps_add_mission" style="display:none">
		<form id="pps_form">
			<div class="form">
				<input id="pps_input1" class="easyui-validatebox" type="text" name="pps_mission_name"/>
			</div>
			<div class="form">
				<input id="pps_input2" class="easyui-validatebox" type="text" name="pps_mission_person"/>
			</div>
			<div class="form">
				<input id="pps_input3" class="easyui-textbox" name="pps_mission_desc"/> 	
			</div>	
		</form>
	</div>  
</body>
</html>