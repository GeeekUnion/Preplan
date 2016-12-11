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
    	//查询所有权限
 		$(function (){
 			//数据表格
 			$('#ppltt').datagrid({
 			    url:'preplan_ppl_queryPrivilege.action',			   	
 			   	pagination:true,
				pageNumber:1,
				pageSize:20,
				pageList:[20,40,80,100],
				rownumbers:true,
 			   	striped:true,
 			   	singleSelect:true, 			    
 			    columns:[[
 					{field:'id',title:'id',width:180,align:'center'},      
 					{field:'PrivilegeOperation',title:'权限名',width:250,align:'center'},
 					{field:'RecordStatus',title:'编码',width:250,align:'center'},
 					{field:'ParentID',title:'上级',width:250,align:'center'}
 			    ]],
 			 	//数据表格  
 			   toolbar: [{
 					text:'查看用户',
 					iconCls: 'icon-users',
 					handler:function (){
 						
 						}
 				}]

 			});
 		});
 		//下拉搜索
		$(function (){
			$('#ppl_search').combobox({    
			    url:'preplan_pplqueryPrivilege.action',    
			    valueField:'id',    
			    textField:'PrivilegeOperation'   
			});
			$('#ppl_search_btn').linkbutton({    
			    iconCls: 'icon-search'   
			});   
		})
 		
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
    <!--表格-->
    <input id="ppl_search" name="dept" value="选择预案类型">
    <a id="ppl_search_btn" href="#">搜索</a>
    <div class="top-area">
    	<p class="title">预案列表</p>
    	<table id="ppltt"></table>  
    </div>   
    <div class="btm-area">
    	<p class="title">预案详情</p>
    	<div id="ppl_preplan" class="pp_preplan">   
		    <div class="border">   
		       <span class="label_box"><label for="ppl_preplan_name" >预案名称:</label></span>  
		        <span></span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppl_preplan_type">预案分类:</label></span>     
		        <span></span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppl_preplan_desc">预案描述:</label></span>     
		        <span></span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppl_preplan_proce">预案流程:</label></span>     
		        <span>
		        	<table id="pplmt"></table>
		        	<table id="pplst"></table>   
		        </span>
		    </div>         
		</div> 
    </div>
	
</body>
</html>