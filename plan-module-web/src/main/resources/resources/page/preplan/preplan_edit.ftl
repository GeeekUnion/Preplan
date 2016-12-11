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
			$('#ppe_search').combobox({    
			    url:'queryPrivilege.action',    
			    valueField:'id',    
			    textField:'PrivilegeOperation'   
			})   
		})	
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
    <!--表格-->
    <div class="btm-area">
		<p class="title">预案定制</p>
    	<div id="ppe_preplan" class="pp_preplan">   
		    <div class="border">   
		       <span class="label_box"><label for="ppe_preplan_name" >预案名称:</label></span>  
		        <span> 
		        	<input class="easyui-validatebox" type="text" name="ppe_preplan_name" data-options="required:true" />   
		        </span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppe_preplan_type">预案分类:</label></span>     
		        <span><input id="ppe_search" name="ppe_preplan_type" value="选择预案类型"></span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppe_preplan_desc">预案描述:</label></span>
		        <input class="easyui-validatebox" type="text" name="ppe_preplan_desc" data-options="required:true" />      
		        <span></span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppl_preplan_proce">预案流程:</label></span>     
		        <span>
		        	<table id="ppemt"></table>
		        	<table id="ppest"></table>   
		        </span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppe_preplan_proce">所需资源:</label></span>     
		        <span>
		        	<table id="ppesrct"></table>  
		        </span>
		    </div>          
		</div> 
	
    </div>
	
</body>
</html>