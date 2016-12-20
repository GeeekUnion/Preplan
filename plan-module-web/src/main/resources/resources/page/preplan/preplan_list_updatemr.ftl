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
			    iconCls:'icon-edit',
			    singleSelect:true,
				striped:true,
			    url:'preplan_preplan_queryMissionByPpsn.action?ppSn='+pp_sn,
			    columns:[[
			        {field:'missionName',title:'任务名字',width:250,align:'center',editor:'text'},
			        {field:'missionDept',title:'负责单位',width:250,align:'center',			           
			            editor:{
			                type:'combobox',
			                options:{
								url:'preplan_department_queryAllDept.action',    
			    				valueField:'DeptName',    
			    				textField:'DeptName'
			                }
			            }
			        },			       
			        {field:'missionId',title:'操作',width:250,align:'center',
			            formatter:function(value,row,index){
			                if (row.editing){
			                    var s = '<a href="#" onclick="saverow('+index+')">保存</a> ';
			                    var c = '<a href="#" onclick="cancelrow('+index+')">取消</a>';
			                    return s+c;
			                } else {
			                    var e = '<a href="#" onclick="editrow('+index+')">编辑</a> ';
			                    var d = '<a href="#" onclick="deleterow('+row.missionId+')">删除</a>';
			                    return e+d;
			                }
			            }
			        }
			    ]],
			    onAfterEdit: function (rowIndex, rowData, changes) {  
			        //endEdit该方法触发此事件  
			        alert(changes);  
			        editRow = undefined;  
			    },  
			    onBeforeEdit: function (index, row) {  
			        row.editing = true;  
			        $('#ppl_mission_dg').datagrid('refreshRow', index);  
			    },  
			    onAfterEdit: function (index, row) {  
			        row.editing = false;  
			        $('#ppl_mission_dg').datagrid('refreshRow', index);  
			    },  
			    onCancelEdit: function (index, row) {  
			        row.editing = false;  
			        $('#ppl_mission_dg').datagrid('refreshRow', index);  
			    }
			});			
 		});					  
	})
	
	function editrow(index){     
		 $('#ppl_mission_dg').datagrid('beginEdit', index);     
	}     
	function deleterow(i){ 
		$.messager.confirm('确认提交','删除任务该任务的资源也将删除！您确认删除该任务？',function(r){     
			  if (r){     
			        //删除该任务资源
						$.ajax({
							type : "POST",
							url : "preplan_preplan_deleteMission.action",
							dataType : "json",
							data : {
									code : i
							},
							success : function() {
									$.messager.alert('提示','删除成功！','info',
										function() {
											window.location.reload()							
										}); 								
							},
							error: function(){
									$.messager.alert('错误','删除出错！','error');								
							}
			  		 	}) 
			  	}    
			});     
	}   
	//保存任务  
	function saverow(i){
	 	  
		  var rows = $('#ppl_mission_dg').datagrid('getRows');
  		  var row = rows[i];
  		  //前端先保存改好的数据  
  		  $('#ppl_mission_dg').datagrid('endEdit',i);
  		  var id=row.missionId;
  		  var misnName=row.missionName;
  		  var misnDept=row.missionDept;
  		  console.log(row.missionDept) 
		  $.messager.confirm('确认提交','您确认保存该任务？',function(r){     
			  if (r){     
			      //保存任务
					$.ajax({
						type : "POST",
						url : "preplan_preplan_updateMission.action",
						dataType : "json",
						data : {
								code : id,//missionId
								misnName : misnName,//missionName
								misnDept : misnDept,//missionDept
						},
						success : function() {
								$.messager.alert('提示','修改成功！','info',
									function() {
										window.location.reload()							
									}); 								
							},
						error: function(){
								$.messager.alert('错误','修改出错！','error');								
						}
			  		})    
			   }     
			});			  
	}     
	function cancelrow(index){     
		$('#ppl_mission_dg').datagrid('cancelEdit', index);     
	}  
    	
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
   
  
   
   <div class="btm-area">
    	<p class="title"><strong>${pp_name}任务资源修改</strong></p>
    	<div id="ppl_preplan" class="pp_preplan">   		    
		    <div class="border">   
		        <div class="label_box"><label for="ppl_preplan_proce"><strong>任务列表</strong></label></div>     
		        <div>
		        	<table id="ppl_mission_dg"> </table> 
		        </div>
		    </div>
		    <div class="border">   
		        <div class="label_box"><label for="ppl_preplan_src"><strong>资源列表</strong></label></div>     
		        <div>
		        	<table id="ppl_src_dg"></table>  
		        </div>
		    </div>          
		</div> 
    </div>
   
   <input id="ppl_preplan_sn" type="hidden" value="${pp_sn}"/>
	
	
   
   
</body>
</html>