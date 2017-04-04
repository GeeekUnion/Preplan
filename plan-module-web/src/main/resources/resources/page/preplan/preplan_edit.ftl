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
    <script type="text/javascript" src="${getMC ("")}/js/datagrid-detailview.js"></script>  
	<script type="text/javascript" src="${getMC ("")}/js/esui.js"></script>

    <script type="text/javascript">       
        //下拉框       	
    	$(function (){    		
    		//预案分类
			$('#ppe_search').combobox({    
			    url:'preplan_domain_queryAllDomain.action',    
			    valueField:'domain_sn',    
			    textField:'domain_name',
			    required:true,    
			});
			//预案部门
			$('#ppe_dept_search').combobox({    
			    url:'preplan_department_queryAllDept.action',    
			    valueField:'id',    
			    textField:'DeptName',
			    required:true,   
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
				value:25,
				text:'第一步：填写预案基本信息'
			}); 
		});

	/*------------------保存预案-----------------*/
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
					
					var isValid1 = $('#ppe_input1').textbox('isValid');
					var isValid2 = $('#ppe_input2').textbox('isValid');
					var isValid3 = $('#ppe_input3').textbox('isValid');
					var isValid4 = $('#ppe_search').combobox('isValid');
					var isValid5 = $('#ppe_dept_search').combobox('isValid');
					if(isValid1==false || isValid2==false || isValid3==false || isValid4==false || isValid5==false){
					    	if(isValid1==false){
					    		$("#ppe_input1").next('span').find('input').focus();
					    		return isValid1;
					    	};
					    	if(isValid2==false){
					    		$("#ppe_input2").next('span').find('textarea').focus();
					    		return isValid2;
					    	};
					    	if(isValid3==false){
					    		$("#ppe_input3").next('span').find('input').focus();
					    		return isValid3;
					    	};
					    	if(isValid4==false){
					    		$("#ppe_search").next('span').find('input').focus();
					    		return isValid4;
					    	};
					    	if(isValid5==false){
					    		$("#ppe_dept_search").next('span').find('input').focus();
					    		return isValid5;
					    	};										
					}else{
						
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
		    }
	/*------------------其他模块-----------------*/	    
		 function  submitMisSrc(){
		 	$.messager.confirm('确认','您确认已经完成任务及资源的填制？',function(r){    
			    if (r){   
			    	$('#pleMisSrc').hide();
					$('#pleModule').show(); 
					$('#preplanStep').progressbar({ 
						value:85,
						text:'第三步：添加其他模块'
					}); 
					var pp_sn=document.getElementById("ppl_preplan_sn").value;
					showAddModule(pp_sn);				 
			    }    
			});  		 
		 }			     
		    
			    
		    	    
	/*------------------完成-----------------*/	    
		 function  submitPerfect(){
		 	$.messager.confirm('确认','您确认已经完成预案填制？',function(r){    
			    if (r){   
			    	$('#pleModule').hide();
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
		        <span><input id="ppe_search" name="ppe_preplan_type"></span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppe_preplan_dept"><strong>责任单位:</strong></label></span>     
		        <span><input id="ppe_dept_search" name="ppe_preplan_dept"></span>
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
    	<div id="ppl_preplan" class="pp_preplan">   		    
		    <table id="missrctt" style="min-height:550px"></table>
		   <div>
				<a class="submitBtn" href="#" onclick="submitMisSrc()" style="width:250px;margin:20px auto">添加其他模块</a>
			</div>          
		</div> 
    </div>
    
     <div class="btm-area" id="pleModule" style="display:none">
    	<div>   	
    		<table id="modulett" style="min-height:550px"></table>	    
		   <div>
				<a class="submitBtn" href="#" onclick="submitPerfect()" style="width:250px;margin:20px auto">完成</a>
			</div>          
		</div> 
    </div>
    
   
    <div class="btm-area" id="plePerfect" style="display:none;margin-top:15px;">
    	<p style="width:400px;margin:0 auto;">预案填制完成，<strong><a htef="index.action">点此返回</a></strong></p>
    </div>
   
   <input id="ppl_preplan_sn" type="hidden" value=""/>
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
  
    //显示列表
    function showAddMis(pp_sn){
    	$('#preplanStep').progressbar({ 
			value:55,
			text:'第二步：添加任务资源'
		});
        $('#missrctt').datagrid({ 
            title:'任务列表', 
            remoteSort:false, 
            singleSelect:true,
            rownumbers:true,
            height:'auto',
            loadMsg:'加载中，请稍后...',
            nowrap:false, 
            fitColumns:true, 
            showFooter:true,
            url:'${pageContext.request.contextPath}/plan/preplan/preplan_preplan_queryMissionByPpsn.action?ppSn='+pp_sn,
            toolbar: [{
                    text : '添加任务',
                    iconCls: 'icon-add',
                    handler: function(){
                        $('#missrctt').datagrid('appendRow',{                      
                                    missionName:'',
									missionDept:'',
									missionSn:'',                               
                        });                        
                        //editParentRow($('#missrctt').datagrid('getFooterRows')); 
                        console.log($('#missrctt').datagrid('getFooterRows'))   
                    }
            }],
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
								url:'${pageContext.request.contextPath}/plan/preplan/preplan_department_queryAllDept.action',    
			    				valueField:'DeptName',    
			    				textField:'DeptName',
			    				required:true,
			                }
			            }
			        },			       
			        {field:'missionSn',title:'操作',width:250,align:'center',
			            formatter:function(value,row,index){
			                if (row.editing){
			                    var s = '<a href="#" onclick="saveParentRow('+index+')">保存</a> |';
			                    var c = ' <a href="#" onclick="cancelParentRow('+index+')">取消</a>';
			                    return s+c;
			                } else {
			                    var e = '<a href="#" onclick="editParentRow('+index+')">编辑</a> |';
			                    var d = ' <a href="#" onclick="deleteParentRow('+row.missionId+','+index+')">删除</a>';
			                    return e+d;
			                }
			            }
			        },
            ]], 
            view: detailview, 
            detailFormatter: function(rowIndex, rowData){ 
                return '<table class="subCategory"></table>'; 
            },
            
            onExpandRow: function(index,row){
                var subCategory = $(this).datagrid('getRowDetail',index).find('table.subCategory');
                var pIndex=subCategory.datagrid('getParentRowIndex');//获得父亲Index
                $('#missrctt').datagrid('clearSelections');//取消选择行    
                subCategory.datagrid({
                	title:'资源列表',
                    url:'${pageContext.request.contextPath}/plan/preplan/preplan_resourceRecord_queryByPage.action?missionSn='+row.missionSn,
                    fitColumns:true,
                    singleSelect:true,
                    rownumbers:true,
                    loadMsg:'加载中，请稍后...',
                    height:'auto',
                    toolbar: [{
                        text : '添加资源',
                        iconCls: 'icon-add',
                        handler: function(){
                            subCategory.datagrid('appendRow',{
                                    resourceName: '',
									resourceNumber: '',
									resourceUnit: '',
									id:'',                                                             
                            });
                            //editSonRow(0,pIndex);
                        }
                    }],
                    columns:[[
                        {field:'resourceName',title:'资源名字',width:250,align:'center',
				        	editor:{
				                type:'combobox',
				                options:{
									url:'${pageContext.request.contextPath}/plan/preplan/preplan_preplan_queryAllSrc.action',     					 
									valueField:'SrcName',    
									textField:'SrcName',
									groupField:'group'
				                }
				            }			        				        					
				        },
				        {field:'resourceNumber',title:'资源数量',width:200,align:'center',
	              			editor:{
	                                type:'validatebox',
	                                options:{
	                                    required: true,
	                                    missingMessage:'此输入框不能为空！', 
	                                }
	                         }                
	                    }, 	
				        {field:'resourceUnit',title:'资源单位',width:200,align:'center',
	              			editor:{
	                                type:'validatebox',
	                                options:{
	                                    required: true,
	                                    missingMessage:'此输入框不能为空！', 
	                                }
	                         }                
	                    }, 		       
				        {field:'id',title:'操作',width:200,align:'center',
				            formatter:function(value,row,index){
				                if (row.editing){
				                    var s = '<a href="#" onclick="saveSonRow('+index+','+pIndex+')">保存</a> |';
				                    var c = ' <a href="#" onclick="cancelSonRow('+index+','+pIndex+')">取消</a>';
				                    return s+c;
				                } else {
				                    var e = '<a href="#" onclick="editSonRow('+index+','+pIndex+')">编辑</a> |';
				                    var d = ' <a href="#" onclick="deleteSonRow('+index+','+pIndex+')">删除</a>';
				                    return e+d;
				                }
				            }
				        }
    
                    ]],
                    onResize:function(){
                        $('#missrctt').datagrid('fixDetailRowHeight',index);
                    },
                    onLoadSuccess:function(){
                        $('#missrctt').datagrid('fixDetailRowHeight',index);
                    },
                    onBeforeEdit: function (index, row) {  
                        row.editing = true;  
                        $(this).datagrid('refreshRow', index);  
                    },  
                    onAfterEdit: function (index, row) {  
                        row.editing = false;  
                        $(this).datagrid('refreshRow', index);  
                    },  
                    onCancelEdit: function (index, row) {  
                        row.editing = false;  
                        $(this).datagrid('refreshRow', index);  
                    }
                });
                    $('#missrctt').datagrid('fixDetailRowHeight',index);
                },
                
                onBeforeEdit: function (index, row) {  
                    row.editing = true;  
                    $('#missrctt').datagrid('refreshRow', index);  
                },  
                onAfterEdit: function (index, row) {  
                    row.editing = false;  
                    $('#missrctt').datagrid('refreshRow', index);  
                },  
                onCancelEdit: function (index, row) {  
                    row.editing = false;  
                    $('#missrctt').datagrid('refreshRow', index);  
                }
        });    
    }
 
    /*------------------父类行编辑begin-----------------*/
    //开始编辑
    function editParentRow(index){     
        $('#missrctt').datagrid('beginEdit', index);
        var ed = $('#missrctt').datagrid('getEditor', {index:index,field:'missionName'});
        $(ed.target).focus();
    }    
    //删除行
    function deleteParentRow(i,index){ 
    	if(typeof(i)==="undefined"){
    		//删除选中行
			$('#missrctt').datagrid('deleteRow',index);
    	}
    	else{
    	      $.messager.confirm('确认提交','删除该类则该类的子类也将删除！您确认删除？',function(r){     
              if (r){     
                    //删除
                        $.ajax({
                            type : "POST",
                            url : '${pageContext.request.contextPath}/plan/preplan/preplan_preplan_deleteMission.action',
                            dataType : "json",
                            data : {
                                code : i
                            },
                            success : function() {
                                    $.messager.alert('提示','删除成功！','info',
                                        function() {
                                            $('#missrctt').datagrid('reload');                            
                                        });                                 
                            },
                            error: function(){
                                    $.messager.alert('错误','删除出错！','error');                                
                            }
                           }) 
                  }    
            });
    	}
     
    }   
    //保存修改  
    function saveParentRow(i){           
          //前端先保存改好的数据  
          var rows = $('#missrctt').datagrid('getRows');
          var row = rows[i];
          $('#missrctt').datagrid('endEdit',i);
          var id=row.missionId;
  		  var misnName=row.missionName;
  		  var misnOrder=row.missionOrder;
  		  var misnDept=row.missionDept; 
  		  var pp_sn=document.getElementById("ppl_preplan_sn").value;
		  $.messager.confirm('确认提交','您确认保存该任务？',function(r){     
			  if (r){     
			      //保存任务
					$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/plan/preplan/preplan_preplan_updateMission.action",
						dataType : "json",
						data : {
								code : id,//missionId
								misnName : misnName,//missionName
								misnDept : misnDept,//missionDept
								misnOrder: misnOrder,
								ppSn     : pp_sn,
						},
						success : function() {
								$.messager.alert('提示','修改成功！','info',
									function() {
										$('#missrctt').datagrid('reload');
										$('#missrctt').datagrid('clearSelections');//取消选择行									
									}); 								
							},
						error: function(){
								$.messager.alert('错误','修改出错！请确保您已经完全填写任务内容！','error');								
						}
			  		})    
			   }     
			});              
    }     
    //取消编辑
    function cancelParentRow(index){     
        $('#missrctt').datagrid('cancelEdit', index);     
    }  
    
    /*------------------父类行编辑end-----------------*/  
    
    /*------------------子类行编辑begin-----------------*/ 
    //开始编辑
    function editSonRow(index,pIndex){ 
        var subCategory = $('#missrctt').datagrid('getRowDetail',pIndex).find('table.subCategory');
        subCategory.datagrid('beginEdit', index);
        var ed = subCategory.datagrid('getEditor', {index:index,field:'resourceNumber'});
        $(ed.target).focus();
    }    
    //删除行
    function deleteSonRow(index,pIndex){ 
        var subCategory = $('#missrctt').datagrid('getRowDetail',pIndex).find('table.subCategory');
        //根据index选中行
		var choserow=subCategory.datagrid('selectRow',index);
		//获得选择行数据
		var row=subCategory.datagrid('getSelected');
		//获得id
		var i=row.id;
        if(i != ""){
			$.messager.confirm('确认提交','您确认删除该资源？',function(r){     
			  if (r){     
			        //删除该任务资源
						$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/plan/preplan/preplan_resourceRecord_deleteSrc.action",
							dataType : "json",
							data : {
									code : i
							},
							success : function() {
									$.messager.alert('提示','删除成功！','info',
										function() {
											subCategory.datagrid('reload'); 
											subCategory.datagrid('clearSelections');//取消选择行							
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
			subCategory.datagrid('deleteRow',index);   				
		}     
    }   
    //保存修改  
    function saveSonRow(index,pIndex){     
          var subCategory = $('#missrctt').datagrid('getRowDetail',pIndex).find('table.subCategory');
          //前端先保存改好的数据  
          subCategory.datagrid('endEdit',index);
          var rows = subCategory.datagrid('getRows');
          var row = rows[index];
          console.log(row);          
          var prows = $('#missrctt').datagrid('getRows');
          var prow = prows[pIndex]; 
  		  var id=row.id;
  		  var srcName=row.resourceName;
  		  var srcNumber=row.resourceNumber;
  		  var srcUnit =row.resourceUnit;
 
		  $.messager.confirm('确认提交','您确认保存该资源？',function(r){     
			  if (r){			  
			  	 //如果id不为空
			  	 if(id != ""){	
			  	 	//更新资源	  	 				      
					$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/plan/preplan/preplan_resourceRecord_updateSrc.action",
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
										subCategory.datagrid('reload');
										subCategory.datagrid('clearSelections');//取消选择行								
									}); 								
							},
						error: function(){
								$.messager.alert('错误','修改出错！请确保您已经完全填写资源内容！','error');								
						}
			  		})
			  	 }
			  	 //保存新资源
			  	 else{
			  	 	//获得Mission的Sn
				  	var fatherSn =prow.missionSn;
					if(fatherSn == ""){
						$.messager.alert('错误','该资源的任务还没有保存！','error');	
					}
					else{

				  	 	$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/plan/preplan/preplan_resourceRecord_saveSrc.action",
							dataType : "json",
							data : {
									code : fatherSn, //资源Name
									resourceName : srcName,//资源Name
									resourceNumber : srcNumber,//资源数量
									resourceUnit : srcUnit,//资源单位
							},
							success : function() {
									$.messager.alert('提示','保存成功！','info',
										function() {
											subCategory.datagrid('reload');
											subCategory.datagrid('clearSelections');//取消选择行								
										}); 								
								},
							error: function(){
									$.messager.alert('错误','保存出错！请确保您已经完全填写资源内容！','error');								
							}
				  		})
					}	
			  	 }	     
    
			   }     
			});              
    } 
     //取消编辑
        function cancelSonRow(index,pIndex){
            var subCategory = $('#missrctt').datagrid('getRowDetail',pIndex).find('table.subCategory');
            subCategory. datagrid('cancelEdit', index); 
        }
    /*------------------子类行编辑end-----------------*/
    
    
    
    /*------------------子类行编辑end-----------------*/	
 	function showAddModule(pp_sn){
			$(function (){
 			$('#modulett').datagrid({
 				title:'该预案模块列表',
			    iconCls:'icon-edit',
			    singleSelect:true,
			    loadMsg:'正在加载，请稍后...',
				striped:true,
				fitColumns:true,
			    url:'${pageContext.request.contextPath}/plan/preplan/preplan_module_queryModuleByPpsn.action?ppSn='+pp_sn,
			    columns:[[
			    	{field:'order',title:'模块顺序',width:100,align:'center',
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
			        {field:'title',title:'模块标题',width:250,align:'center',
			        	editor:{
			                type:'validatebox',
			                options:{
								required: true,
								missingMessage:'此输入框不能为空！',    
			                }
			            }
			        },
			        {field:'content',title:'模块内容',width:250,align:'center',
			        	editor:{
			                type:'validatebox',
			                options:{
								required: true,
								missingMessage:'此输入框不能为空！',    
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
			                    var d = '<a href="#" onclick="deleterow('+row.moduleId+')">删除</a>';
			                    return e+d;
			                }
			            }
			        },
			    ]],
			    toolbar:[
			    	{
			    		text:'添加模块',
						iconCls: 'icon-add',
						handler: function(){
						}
					}
				],
				view: detailview, 
	            detailFormatter: function(rowIndex, rowData){ 
	                return '<table class="subCategory"></table>'; 
	            },            
	            onExpandRow: function(index,row){
	                var subCategory = $(this).datagrid('getRowDetail',index).find('table.subCategory');
	                var pIndex=subCategory.datagrid('getParentRowIndex');//获得父亲Index
	                $('#modulett').datagrid('clearSelections');//取消选择行    
	                $('#modulett').datagrid('fixDetailRowHeight',index);
	            },			     
			    onBeforeEdit: function (index, row) {  
			        row.editing = true;  
			        $('#modulett').datagrid('refreshRow', index);  
			    },  
			    onAfterEdit: function (index, row) {  
			        row.editing = false;  
			        $('#modulett').datagrid('refreshRow', index);  
			    },  
			    onCancelEdit: function (index, row) {  
			        row.editing = false;  
			        $('#modulett').datagrid('refreshRow', index);  
			    }
			});			
 		});					  
	}
	/*------------------模块编辑-----------------*/
	function editrow(index){     
		 $('#modulett').datagrid('beginEdit', index);     
	}     
	function deleterow(i){ 
     
	}   
	//保存任务  
	function saverow(i){
	 	  
		  var rows = $('#modulett').datagrid('getRows');
  		  var row = rows[i];
  		  //前端先保存改好的数据  
  		  $('#modulett').datagrid('endEdit',i);
  		  var ppSn = $('#ppl_preplan_sn').val();
			  
	}     
	function cancelrow(index){     
		$('#modulett').datagrid('cancelEdit', index);     
	}  
    
    /*------------------分割线-----------------*/
    
</script>
 
</body>
</html>