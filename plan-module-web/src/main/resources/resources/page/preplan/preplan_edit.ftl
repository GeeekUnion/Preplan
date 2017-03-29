<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel = "stylesheet" href="${getTheme('default','')}default/easyui.css" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="${getTheme('default','')}/icon.css"/>
    <link rel="stylesheet" type="text/css" href="${getTheme('default','')}/esui.css"/>
	<script type="text/javascript" src="${getMC ("")}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${getMC ("")}/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${getMC ("")}/js/easyui-lang-zh_CN.js"></script>   
	<script type="text/javascript" src="${getMC ("")}/js/esui.js"></script>

    <script type="text/javascript">
    	var orderUnique=false;
    	//自定义验证规则
		$.extend($.fn.validatebox.defaults.rules, {    
		    unique: {    
		        validator: function(value, param){   
		        	console.log(value); 
		            return true;    
		        },    
		        message: '该属性需唯一！'   
		    }    
		});    
    
        //下拉框       	
    	$(function (){
    		
    		//预案分类
			$('#ppe_search').combobox({    
			    url:'preplan_domain_queryAllDomain.action',    
			    valueField:'domain_sn',    
			    textField:'domain_name'   
			});
			//预案部门
			$('#ppe_dept_search').combobox({    
			    url:'preplan_department_queryAllDept.action',    
			    valueField:'id',    
			    textField:'DeptName'   
			});
			   
		});
    
    	//输入框
		$(function (){
			$('#ppe_input1').textbox({	
				    required:true,
				    missingMessage:'此输入框不能为空！'			         
			});
			$('#ppe_input3').textbox({	
				    required:true,
				    missingMessage:'此输入框不能为空！'			         
			});
			$('#ppe_input2').textbox({	
			    required:true,
			    multiline:true,
			    missingMessage:'此输入框不能为空！',
			    width:500,			         
			});	
		});
    
    	//确认按钮
    	$(function (){
			$('.submitBtn').linkbutton({    
			    iconCls: 'icon-ok',
			    width:250,
			    height:50,   
			});  			   
		});
		
		//步数
		$(function (){
			$('#preplanStep').progressbar({ 
				value:45,
				text:'第一步'
			}); 
		});
    /*------------------分割线-----------------*/
 	function showAddMis(pp_sn){
 			$('#preplanStep').progressbar({ 
				value:85,
				text:'第二步'
			});
			$(function (){
 			//任务数据表格
 			$('#ppl_mission_dg').datagrid({
			    iconCls:'icon-edit',
			    singleSelect:true,
			    loadMsg:'正在加载，请稍后...',
				striped:true,
			    url:'preplan_preplan_queryMissionByPpsn.action?ppSn='+pp_sn,
			    columns:[[
			    	{field:'missionOrder',title:'任务序号',width:100,align:'center',
			        	editor:{
			                type:'validatebox',
			                options:{
								required: true,
								missingMessage:'此输入框不能为空！',
								validType:'unique',
								validateOnBlur:true,    
			                }
			            }
			        },
			        {field:'missionName',title:'任务名字',width:250,align:'center',
			        	editor:{
			                type:'validatebox',
			                options:{
								required: true,
								missingMessage:'此输入框不能为空！',    
			                }
			            }
			        },
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
			        },
			        {field:'missionSn',title:'操作',width:'100',align:'center',
 								 formatter:function(value,row,index){
 								 			var j = row.missionSn; 								 			
		        		  					return "<a  href='#' onclick=\"showSrc('"+j+"')\"  class='delete_Pp' >"+"添加资源"+"</a>";				        		
		        	}}
			    ]],
			    toolbar:[
			    	{
			    		text:'添加任务行',
						iconCls: 'icon-add',
						handler: function(){
							$('#ppl_mission_dg').datagrid('appendRow',{
								missionName:'',
								missionDept:'选择负责单位',
								missionId:'',								
							});
						}
					}
				],			    
			    onAfterEdit: function (rowIndex, rowData, changes) {  
			        //endEdit该方法触发此事件  
			        //alert(changes);  
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
	}
	/*------------------分割线-----------------*/
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
  		  var misnOrder=row.missionOrder;
  		  var ppSn = $('#ppl_preplan_sn').val();
		  $.messager.confirm('确认提交','您确认保存该任务？',function(r){     
			  if (r){     
			      //保存任务
					$.ajax({
						type : "POST",
						url : "preplan_preplan_updateMission.action",
						dataType : "json",
						data : {
								ppSn : ppSn,//preplanSn
								code : id,//missionId
								misnName : misnName,//missionName
								misnDept : misnDept,//missionDept
								misnOrder: misnOrder,
						},
						success : function() {
								$.messager.alert('提示','修改成功！','info',
									function() {
										$('#ppl_mission_dg').datagrid('reload');
										$('#ppl_mission_dg').datagrid('clearSelections');//取消选择行							
									}); 								
							},
						error: function(){
								$.messager.alert('错误','修改出错！','error');
								$('#ppl_mission_dg').datagrid('clearSelections');//取消选择行								
						}
			  		})    
			   }     
			});			  
	}     
	function cancelrow(index){     
		$('#ppl_mission_dg').datagrid('cancelEdit', index);     
	}  
    
    /*------------------分割线-----------------*/   
     
    //根据任务SN查看资源
     function showSrc(i){
     	$('#ppl_src_dg').datagrid({
			  toolbar: [{
			    	text:'添加资源',
					iconCls: 'icon-add',					
					handler: //资源表格添加新行
							function(){
								$('#ppl_src_dg').datagrid('appendRow',{
									resourceName: '',
									resourceNumber: '',
									resourceUnit: '',
									id:'',
								});
						}

				}]
		});

     	
		
			var sn=i;	
				$.ajax({
					url:'preplan_resourceRecord_queryByPage.action',
					method:'POST',
					dataType:'json',
					data:{
					        missionSn:sn
					},
					success:function(str){
						$('#ppl_src_dg').datagrid("loadData",str)
						
					}
				})
	}
	$(function (){
 			//资源数据表格
 			$('#ppl_src_dg').datagrid({
			    iconCls:'icon-edit',
			    singleSelect:true,
			    loadingMessage:'正在加载，请稍后...',
				striped:true,			 
			    columns:[[
			        {field:'resourceName',title:'资源名字',width:250,align:'center',
			        	editor:{
			                type:'combobox',
			                options:{
								url:'preplan_preplan_queryAllSrc.action',     					 
								valueField:'SrcName',    
								textField:'SrcName',
								groupField:'group'
			                }
			            }			        				        					
			        },
			        {field:'resourceNumber',title:'资源数量',width:200,align:'center',editor:'text'},	
			        {field:'resourceUnit',title:'资源单位',width:200,align:'center',editor:'text'},		       
			        {field:'id',title:'操作',width:200,align:'center',
			            formatter:function(value,row,index){
			                if (row.editing){
			                    var s = '<a href="#" onclick="saverow2('+index+')">保存</a> ';
			                    var c = '<a href="#" onclick="cancelrow2('+index+')">取消</a>';
			                    return s+c;
			                } else {
			                    var e = '<a href="#" onclick="editrow2('+index+')">编辑</a> ';
			                    var d = '<a href="#" onclick="deleterow2('+index+')">删除</a>';
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
			        $('#ppl_src_dg').datagrid('refreshRow', index);  
			    },  
			    onAfterEdit: function (index, row) {  
			        row.editing = false;  
			        $('#ppl_src_dg').datagrid('refreshRow', index);  
			    },  
			    onCancelEdit: function (index, row) {  
			        row.editing = false;  
			        $('#ppl_src_dg').datagrid('refreshRow', index);  
			    }
			});			
 		});					  
	
	
	function editrow2(index){     
		 $('#ppl_src_dg').datagrid('beginEdit', index);     
	}     
	function deleterow2(a){
		//根据index选中行
		var choserow=$('#ppl_src_dg').datagrid('selectRow',a);
		//获得选择行数据
		var row=$('#ppl_src_dg').datagrid('getSelected');
		//获得id
		var i=row.id;
		//如果有id则删除该记录
		if(i != ""){
			$.messager.confirm('确认提交','您确认删除该资源？',function(r){     
			  if (r){     
			        //删除该任务资源
						$.ajax({
							type : "POST",
							url : "preplan_resourceRecord_deleteSrc.action",
							dataType : "json",
							data : {
									code : i
							},
							success : function() {
									$.messager.alert('提示','删除成功！','info',
										function() {
											$('#ppl_src_dg').datagrid('reload');
											$('#ppl_src_dg').datagrid('clearSelections');//取消选择行							
										}); 								
							},
							error: function(){
									$.messager.alert('错误','删除出错！','error');								
							}
			  		 	}) 
			  	}    
			}); 
		}
		else{
			//删除选中行
			$('#ppl_src_dg').datagrid('deleteRow',a);   				
		} 
		    
	}   
	//保存
	function saverow2(i){
	 	  
		  var rows = $('#ppl_src_dg').datagrid('getRows');
  		  var row = rows[i];
  		  //前端先保存改好的数据  
  		  $('#ppl_src_dg').datagrid('endEdit',i);
  		  var id=row.id;
  		  var srcName=row.resourceName;
  		  var srcNumber=row.resourceNumber;
  		  var srcUnit =row.resourceUnit;
 
		  $.messager.confirm('确认提交','您确认保存该资源？',function(r){     
			  if (r){			  
			  	 //如果id不为空
			  	 if(id != ""){	
			  	 	//更新任务		  	 				      
					$.ajax({
						type : "POST",
						url : "preplan_resourceRecord_updateSrc.action",
						dataType : "json",
						data : {
								code : id,//srcId
								resourceName : srcName,//资源Name
								resourceNumber : srcNumber,//资源数量
								resourceUnit : srcUnit,//资源单位
						},
						success : function() {
								$.messager.alert('提示','修改成功！','info',
									function() {
										$('#ppl_src_dg').datagrid('reload');
										$('#ppl_src_dg').datagrid('clearSelections');//取消选择行							
									}); 								
							},
						error: function(){
								$.messager.alert('错误','修改出错！','error');								
						}
			  		})
			  	 }
			  	 //保存新任务
			  	 else{
			  	 	//获得Mission的Sn
			  	 	var fatherRow = $('#ppl_mission_dg').datagrid('getSelected')
			  	 	var fatherSn =fatherRow.missionSn;
			  	 	$.ajax({
						type : "POST",
						url : "preplan_resourceRecord_saveSrc.action",
						dataType : "json",
						data : {
								code : fatherSn, //资源Name
								resourceName : srcName,//资源Name
								resourceNumber : srcNumber,//资源数量
								resourceUnit : srcUnit,//资源单位
						},
						success : function() {
								$.messager.alert('提示','修改成功！','info',
									function() {
										$('#ppl_src_dg').datagrid('reload');
										$('#ppl_src_dg').datagrid('clearSelections');//取消选择行							
									}); 								
							},
						error: function(){
								$.messager.alert('错误','修改出错！','error');								
						}
			  		})
			  	 }	     
    
			   }     
			});			  
	}     
	function cancelrow2(index){     
		$('#ppl_src_dg').datagrid('cancelEdit', index);     
	}	
	
	
	/*------------------分割线-----------------*/
			//保存预案
			function submitPreplan(){		       		
					//预案名字
					var preplanName=$('#ppe_input1').textbox('getValue');
					//预案描述
					var preplanDesc=$('#ppe_input2').textbox('getValue');
					//预案编号
					var preplanUid=$('#ppe_input3').textbox('getValue');
					//预案类型
					var preplanType=$('#ppe_search').combobox('getValue');
					//预案责任单位
					var preplanDept=$('#ppe_dept_search').combobox('getText');
					$.ajax({
						type : "POST",
						url : "preplan_preplan_saveOnlyPreplan.action",
						dataType : "json",
						traditional : true,
						data : {
								ppName : preplanName,
								ppDesc : preplanDesc,
								ppType : preplanType,
								ppDept : preplanDept,
								ppUid  : preplanUid
								},
						success : function(jsonObject) {
							var pd=jsonObject;
							if(pd == "error"){
								$.messager.alert('提示','保存出错，请重试！','error');
							}
							else if(pd.length > 0){
								$('#ppl_preplan_sn').val(pd);
								$('#plePreplanMsg').hide();
								$('#pleMisSrc').show();
								showAddMis(pd);								
							}
							else{
								$.messager.alert('提示','未知错误','error');
							}						

						}

					})			      
		    } 
		    
	/*------------------完成-----------------*/	    
		 function  submitMisSrc(){
		 	$.messager.confirm('确认','您确认已经完成预案填制？',function(r){    
			    if (r){   
			    	$('#pleMisSrc').hide();
					$('#plePerfect').show(); 
					$('#preplanStep').progressbar({ 
						value:100,
						text:'完成'
					});  					 
			    }    
			});  		 
		 }												
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
   <div class="btm-area">
		<div id="preplanStep" style="width:400px;margin:0 auto;"></div> 
   </div>		
  <div class="btm-area" id="plePreplanMsg">
  		<p class="title"><strong>预案基本信息</strong></p>
    	<div id="ppe_preplan" class="pp_preplan">    		  
		    <div class="border">   
		       <span class="label_box"><label for="ppe_preplan_name" ><strong>预案名称:</strong></label></span>  
		        <span> 
		        	<input id="ppe_input1" class="easyui-validatebox" name="ppe_preplan_name" />   
		        </span>
		    </div>
		    <div class="border">   
		       <span class="label_box"><label for="ppe_preplan_uid" ><strong>预案编码:</strong></label></span>  
		        <span> 
		        	<input id="ppe_input3" class="easyui-validatebox" name="ppe_preplan_uid" />   
		        </span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppe_preplan_type"><strong>预案分类:</strong></label></span>     
		        <span><input id="ppe_search" name="ppe_preplan_type" value="请选择预案类型"></span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppe_preplan_dept"><strong>责任单位:</strong></label></span>     
		        <span><input id="ppe_dept_search" name="ppe_preplan_dept" value="请选择责任单位"></span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppe_preplan_desc"><strong>预案描述:</strong></label></span>
		        <input id="ppe_input2" name="ppe_preplan_desc"  style="height:100px">  
		        <span></span>
		    </div>         
		</div> 
		<div style="width:100%">
			<a class="submitBtn" href="#" onclick="submitPreplan()" style="width:250px;margin:20px auto">下一步</a>
		</div>
    </div>
   
   <div class="btm-area" id="pleMisSrc" style="display:none">
    	<p class="title"><strong>${pp_name}添加任务资源</strong></p>
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
		   <div>
				<a class="submitBtn" href="#" onclick="submitMisSrc()" style="width:250px;margin:20px auto">完成</a>
			</div>          
		</div> 
    </div>
   
    <div class="btm-area" id="plePerfect" style="display:none;margin-top:15px;">
    	<p style="width:400px;margin:0 auto;">预案填制完成，<strong><a htef="index.action">点此返回</a></strong></p>
    </div>
   
   <input id="ppl_preplan_sn" type="hidden" value=""/>
 
</body>
</html>