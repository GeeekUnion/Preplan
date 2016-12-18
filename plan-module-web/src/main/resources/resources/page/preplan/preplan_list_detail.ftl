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
			var pp_sn=document.getElementById("ppl_preplan_sn").value;
			$(function (){
 			//数据表格
 			$('#ppl_mission_dg').datagrid({
 			    url:'preplan_preplan_queryMissionByPpsn.action?ppSn='+pp_sn,			   	
				rownumbers:true,
 			   	striped:true,
 			   	singleSelect:true, 			    
 			    columns:[[    
 					{field:'missionName',title:'任务名字',width:250,align:'center'},
 					{field:'missionDept',title:'负责单位',width:250,align:'center'},
 					{field:'missionSn',title:'操作',width:'150',align:'center'}
 			    ]],
 			    //成功加载出发
 			    onLoadSuccess:function(){
	 			    	  
	 			    }
 			});
 		});
			  
		})
    	
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
   
  
   
   <div class="btm-area">
    	<p class="title"><strong>预案详情</strong></p>
    	<div id="ppl_preplan" class="pp_preplan">   
		    <div class="border">   
		       <span class="label_box"><label for="ppl_preplan_name" >预案名称:</label></span>  
		        <span>${pp_name}</span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppl_preplan_type">预案分类:</label></span>     
		        <span>${pp_type}</span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppl_preplan_dept">责任单位:</label></span>     
		        <span>${pp_dept}</span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppl_preplan_desc">预案描述:</label></span>		           
		        <span>${pp_desc}</span>
		    </div>
		    <div class="border">   
		        <div class="label_box"><label for="ppl_preplan_proce">预案流程:</label></div>     
		        <div>
		        	<table id="ppl_mission_dg"> </table> 
		        </div>
		    </div>
		    <div class="border">   
		        <div class="label_box"><label for="ppl_preplan_src">所需资源:</label></div>     
		        <div>
		        	<table id="ppl_src_dg"></table>  
		        </div>
		    </div>          
		</div> 
    </div>
   
   <input id="ppl_preplan_sn" type="hidden" value="${pp_sn}"/>
	
	
   
   
</body>
</html>