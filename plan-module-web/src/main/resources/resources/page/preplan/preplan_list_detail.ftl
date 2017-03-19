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
 			//任务数据表格
 			$('#ppl_mission_dg').datagrid({
 			    url:'preplan_preplan_queryMissionByPpsn.action?ppSn='+pp_sn,			   	
				rownumbers:true,
 			   	striped:true,
 			   	singleSelect:true, 			    
 			    columns:[[    
 			    	{field:'missionOrder',title:'任务序号',width:60,align:'center'},
 					{field:'missionName',title:'任务名字',width:250,align:'center'},
 					{field:'missionDept',title:'负责单位',width:250,align:'center'},
 					{field:'missionId',title:'操作',width:'150',align:'center',
 									formatter:function(value,row,index){
 											//记得传ID
 								 			var i = row.id;
		        		  					return "<a  href='#' onclick='deleteMisn(" +i+ ")'  class='delete_misn' >"+"暂无"+"</a>";			        		
		        	}},
 			    ]],
 			    //加载成功
 			    onLoadSuccess:function(){
 			    	var rows = $("#ppl_mission_dg").datagrid("getRows"); //这段代码是获取当前页的所有行。
 			    	var misnSnArray = new Array();//传值数组
					for(var i=0;i<rows.length;i++){					
						//获取每一行的数据	
						 misnSnArray.push(rows[i].missionSn);					
					}
					$('.delete_misn').linkbutton({    
						    iconCls: 'icon-cancel',
						    height:24   
						});						
					//加载资源
					$.ajax({
						type : "POST",
						url : "preplan_preplan_querySrcByMisnSn.action",
						dataType : "json",
						traditional : true,
						data : {
								misnSnArray : misnSnArray
						},
						success : function(srcstr) {
								$("#ppl_src_dg").datagrid('loadData',srcstr); 								
						},
						error: function(){
								$.messager.alert('资源列表错误','资源列表加载出错！','error');								
						}
					});
	 			},
	 			//加载失败   
	 			onLoadError:function(){
	 			    	  $.messager.alert('任务列表错误','任务列表加载出错！','error');
	 			    	  
	 			    },   
 			});
 			
 			
 			//资源数据表格
			$('#ppl_src_dg').datagrid({			   	
				rownumbers:true,
			 	striped:true,
			 	singleSelect:true, 			    
			 	columns:[[    
			 		{field:'srcName',title:'资源名字',width:250,align:'center'},
			 		{field:'srcNumber',title:'资源数量',width:150,align:'center'},
			 		{field:'srcUnit',title:'资源单位',width:'150',align:'center'}, 					
			 	]], 			    
				//加载失败   
				onLoadError:function(){
				 	$.messager.alert('资源列表错误','资源列表加载出错！','error');
				 			    	  
				 	},   
			});
 			
 		});
			  
		})
    	
    	function deleteMisn(i){
    	
    	}
    	
    	//确认按钮
    	$(function (){
			$('#printBtn').linkbutton({    
			    iconCls: 'icon-ok',
			    width:250,
			    height:50,   
			});  			   
		});
    	
		function printme() 
		{
			var headstr = "<html><head><title></title></head><body>";  
			var footstr = "</body></html>";  
			var printData = document.getElementById("printArea").innerHTML; //获得 div 里的所有 html 数据
			var oldstr = document.body.innerHTML;  
			document.body.innerHTML = headstr+printData+footstr;  
			window.print();  	
			document.body.innerHTML = oldstr; 		
		}
    	
    </script>
    </head>
<body>
   
  
   
   <div class="btm-area" id="printArea">
    	<div id="ppl_preplan" class="pp_preplan">   
		    <div class="border">   
		       <span class="label_box"><label for="ppl_preplan_name" ><strong>预案名称:</strong></label></span>  
		        <span>${pp_name}</span>
		    </div>
		    <hr class="hidden-hr">
		    <div class="border">   
		        <span class="label_box"><label for="ppl_preplan_type"><strong>预案分类:</strong></label></span>     
		        <span>${pp_type}</span>
		    </div>
		    <hr class="hidden-hr">
		    <div class="border">   
		        <span class="label_box"><label for="ppl_preplan_dept"><strong>责任单位:</strong></label></span>     
		        <span>${pp_dept}</span>
		    </div>
		    <hr class="hidden-hr">
		    <div class="border">   
		        <span class="label_box"><label for="ppl_preplan_desc"><strong>预案描述:</strong></label></span>		           
		        <span>${pp_desc}</span>
		    </div>
		    <hr class="hidden-hr">
		    <div class="border">   
		        <div class="label_box"><label for="ppl_preplan_proce"><strong>预案流程:</strong></label></div>     
		        <div>
		        	<table id="ppl_mission_dg"> </table> 
		        </div>
		    </div>
		    <hr class="hidden-hr">
		    <div class="border">   
		        <div class="label_box"><label for="ppl_preplan_src"><strong>所需资源:</strong></label></div>     
		        <div>
		        	<table id="ppl_src_dg"></table>  
		        </div>
		    </div>          
		</div> 
    </div>
   <a id="printBtn" href="#" onclick="printme()" style="margin:20px auto">打印</a>
   <input id="ppl_preplan_sn" type="hidden" value="${pp_sn}"/>
	
	
   
   
</body>
</html>