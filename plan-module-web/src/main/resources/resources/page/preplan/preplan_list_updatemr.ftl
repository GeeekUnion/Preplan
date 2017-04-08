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
	<script type="text/javascript" src="${getMC ("")}/js/datagrid-detailview.js"></script>

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
    $(function(){
    	var pp_sn=document.getElementById("ppl_preplan_sn").value;
    	var rowEditing = false;
    	var rowEditing2 = false;
        $('#missrctt').datagrid({ 
            title:'任务列表', 
            remoteSort:false, 
            singleSelect:true,
            rownumbers:true,
            height:'auto',
            loadMsg:'加载中，请稍后...',
            nowrap:false, 
            striped:true,
            idField:'missionId',
            fitColumns:true, 
            showFooter:true,
            url:'${pageContext.request.contextPath}/plan/preplan/preplan_preplan_queryMissionByPpsn.action?ppSn='+pp_sn,
            toolbar: [{
                    text : '添加任务',
                    iconCls: 'icon-add',
                    handler: function(){
                    	if( rowEditing == false ){
                    		$('#missrctt').datagrid('appendRow',{
                                    missionName:'',
									missionDept:'',
									missionId:'-101',                              
                        	});
                        	editParentRow(-101,"missionOrder");
                    	}else{
                    		$.messager.alert('提示','新任务还未保存，请先保存再添加新任务行！','info');
                    	}
                           
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
			    				required: true,
								missingMessage:'此输入框不能为空！'
			                }
			            }
			        },			       
			        {field:'missionId',title:'操作',width:250,align:'center',
			            formatter:function(value,row,index){
			                if (row.editing){
			                    var s = '<a href="#" onclick="saveParentRow('+index+')">保存</a> |';
			                    var c = ' <a href="#" onclick="cancelParentRow('+row.missionId+')">取消</a>';
			                    return s+c;
			                } else {
			                    var e = '<a href="#" onclick="editParentRow('+row.missionId+',\'missionOrder\')">编辑</a> |';
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
                    striped:true,  
                    idField:'id',                 
                    loadMsg:'加载中，请稍后...',
                    height:'auto',
                    toolbar: [{
                        text : '添加资源',
                        iconCls: 'icon-add',
                        handler: function(){
                            if( rowEditing2 == false ){
                        	    subCategory.datagrid('appendRow',{
	                                    resourceName: '',
										resourceNumber: '',
										resourceUnit: '',
										id:'-101',                                                             
	                            });
	                            editSonRow(-101,pIndex,"resourceNumber");
                        	}else{
                        		$.messager.alert('提示','新资源还未保存，请先保存再添加新资源行！','info');
                        	}
                            
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
									groupField:'group',
									required: true,
                                    missingMessage:'此输入框不能为空！',
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
				                if (row.editing2){
				                    var s = '<a href="#" onclick="saveSonRow('+index+','+pIndex+')">保存</a> |';
				                    var c = ' <a href="#" onclick="cancelSonRow('+row.id+','+pIndex+')">取消</a>';
				                    return s+c;
				                } else {
				                    var e = '<a href="#" onclick="editSonRow('+row.id+','+pIndex+',\'resourceNumber\')">编辑</a> |';
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
                    	rowEditing2 = true;
                        row.editing2 = true;  
                        $(this).datagrid('refreshRow', index);  
                    },  
                    onAfterEdit: function (index, row) { 
                    	rowEditing2 = false; 
                        row.editing2 = false;  
                        $(this).datagrid('refreshRow', index);  
                    },  
                    onCancelEdit: function (index, row) {
                    	rowEditing2 = false;  
                        row.editing2 = false;  
                        $(this).datagrid('refreshRow', index);  
                    }
                });
                    $('#missrctt').datagrid('fixDetailRowHeight',index);
                },
                
                
               	onCollapseRow: function (index, row) { 
 					rowEditing2 = false;
                }, 
                onBeforeEdit: function (index, row) { 
                	rowEditing = true; 
                    row.editing = true;  
                    $('#missrctt').datagrid('refreshRow', index);  
                },  
                onAfterEdit: function (index, row) {
                  	rowEditing = false;
                    row.editing = false;  
                    $('#missrctt').datagrid('refreshRow', index);  
                },  
                onCancelEdit: function (index, row) {
                	rowEditing = false;  
                    row.editing = false;  
                    $('#missrctt').datagrid('refreshRow', index);  
                }
        });    
    })
 
    /*------------------父类行编辑begin-----------------*/
    //开始编辑
    function editParentRow(mId,fieldName){ 
        var index=$('#missrctt').datagrid('getRowIndex',mId);
        $('#missrctt').datagrid('beginEdit', index);
        var ed = $('#missrctt').datagrid('getEditor', {index:index,field:fieldName});
        $(ed.target).focus();
        
    }    
    //删除行
    function deleteParentRow(i,index){ 
       	if(typeof(i)==="undefined"){
    		//删除选中行
			$('#missrctt').datagrid('deleteRow',index);
    	}else{
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
          $('#missrctt').datagrid('endEdit',i);
          var rows = $('#missrctt').datagrid('getRows');
          var row = rows[i];
          var id=row.missionId;
  		  var misnName=row.missionName;
  		  var misnDept=row.missionDept;
  		  var misnOrder=row.missionOrder;
  		  console.log(misnOrder+':'+misnName+':'+misnDept)
		  if( misnOrder==="" || misnName==="" || misnDept===""){
			  	if(misnOrder===""){
					  editParentRow(id,"missionOrder");
					  return true;
				};
				if(misnName===""){
					editParentRow(id,"missionName");
					return true;
				};
				if(misnDept===""){
					editParentRow(id,"missionDept");
					return true;
				};  
		  }else{
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
									misnOrder: misnOrder,
									misnName : misnName,//missionName
									misnDept : misnDept,//missionDept
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
									$.messager.alert('错误','修改出错！请确保您完全填写了任务内容！','error');								
							}
						})    
				}     
			}); 	
		  }	             
    }     
    //取消编辑
    function cancelParentRow(mId){ 
    	var index=$('#missrctt').datagrid('getRowIndex',mId);
    	if(mId == -101){
    		$.messager.confirm('确认','该任务未保存，取消将删除该未保存任务，确认删除？',function(r){    
			    if (r){    
			    	$('#missrctt').datagrid('cancelEdit', index);
			        $('#missrctt').datagrid('deleteRow',index);    
			    }    
			});     		
    	}else{  
    		$.messager.confirm('确认','该任务未保存，取消将不保存修改，确认删除？',function(r){    
			    if (r){    
			       $('#missrctt').datagrid('cancelEdit', index);    
			    }    
			});  		        	
    	}         
    }  
    
    /*------------------父类行编辑end-----------------*/  
    
    /*------------------子类行编辑begin-----------------*/ 
    //开始编辑
    function editSonRow(sId,pIndex,filedName){     
        var subCategory = $('#missrctt').datagrid('getRowDetail',pIndex).find('table.subCategory');
        var index=subCategory.datagrid('getRowIndex',sId);
        subCategory.datagrid('beginEdit', index);
        var ed = subCategory.datagrid('getEditor', {index:index,field:filedName});
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
          var prows = $('#missrctt').datagrid('getRows');
          var prow = prows[pIndex]; 
  		  var id=row.id;
  		  var srcName=row.resourceName;
  		  var srcNumber=row.resourceNumber;
  		  var srcUnit =row.resourceUnit;
 		  console.log(srcName+':'+srcNumber+':'+srcUnit)	
 		  if( srcName==="" || srcNumber==="" || srcUnit===""){
 		  		if(srcNumber===""){
					editSonRow(id,pIndex,"resourceNumber");
					return true;
				};
				if(srcUnit===""){
					editSonRow(id,pIndex,"resourceUnit");
					return true;
				};
			  	if(srcName===""){
					editSonRow(id,pIndex,"resourceName");
					return true;
				};  
		  }else{
 		  	  $.messager.confirm('确认提交','您确认保存该资源？',function(r){     
			  if (r){			  
			  	 //保存新资源
			  	 if(id < 0){	
				 	//获得Mission的Sn
				  	var fatherSn =prow.missionSn;
					if(fatherSn == ""){
						$.messager.alert('错误','该资源的任务还没有保存！','error');	
					}else{
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
									$.messager.alert('提示','修改成功！','info',
										function() {
											subCategory.datagrid('reload');
											subCategory.datagrid('clearSelections');//取消选择行								
										}); 								
								},
							error: function(){
									$.messager.alert('错误','修改出错！请确保您完全填写了资源内容！','error');								
							}
				  		})
					}	
			  	 }else{
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
								$.messager.alert('错误','修改出错！请确保您完全填写了资源内容！','error');								
						}
			  		})	
			  	 }	     
    
			   }     
			});
 		  }	
 
		                
    } 
     //取消编辑
        function cancelSonRow(sId,pIndex){       	
            var subCategory = $('#missrctt').datagrid('getRowDetail',pIndex).find('table.subCategory');
            var index=subCategory.datagrid('getRowIndex',sId);
            if(sId == -101){
            	$.messager.confirm('确认','该资源未保存，取消将删除该未保存资源，确认删除？',function(r){    
				    if (r){    
				    	subCategory. datagrid('cancelEdit', index); 
				        subCategory.datagrid('deleteRow',index);    
				    }    
				});	
            }else{
            	subCategory. datagrid('cancelEdit', index); 
            }            
        }
    /*------------------子类行编辑end-----------------*/ 
 
 
    
</script>
</head>
<body>
<table id="missrctt" style="min-height:600px"></table>
<input id="ppl_preplan_sn" type="hidden" value="${pp_sn}"/>
</body>
</html>
