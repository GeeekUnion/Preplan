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
        $('#missrctt').datagrid({ 
            title:'任务列表', 
            remoteSort:false, 
            singleSelect:true,
            rownumbers:true,
            height:'auto',
            loadMsg:'加载中，请稍后...',
            nowrap:false, 
            striped:true,
            fitColumns:true, 
            showFooter:true,
            url:'${pageContext.request.contextPath}/plan/preplan/preplan_preplan_queryMissionByPpsn.action?ppSn='+pp_sn,
            toolbar: [{
                    text : '添加任务',
                    iconCls: 'icon-add',
                    handler: function(){
                        $('#missrctt').datagrid('appendRow',{
                                    missionName:'预案任务',
									missionDept:'负责单位',
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
			    				textField:'DeptName'
			                }
			            }
			        },			       
			        {field:'missionSn',title:'操作',width:250,align:'center',
			            formatter:function(value,row,index){
			                if (row.editing){
			                    var s = '<a href="#" onclick="saveParentRow('+index+')">保存</a> ';
			                    var c = '<a href="#" onclick="cancelParentRow('+index+')">取消</a>';
			                    return s+c;
			                } else {
			                    var e = '<a href="#" onclick="editParentRow('+index+')">编辑</a> ';
			                    var d = '<a href="#" onclick="deleteParentRow('+row.missionId+','+index+')">删除</a>';
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
				                    var s = '<a href="#" onclick="saveSonRow('+index+','+pIndex+')">保存</a> ';
				                    var c = '<a href="#" onclick="cancelSonRow('+index+','+pIndex+')">取消</a>';
				                    return s+c;
				                } else {
				                    var e = '<a href="#" onclick="editSonRow('+index+','+pIndex+')">编辑</a> ';
				                    var d = '<a href="#" onclick="deleteSonRow('+index+','+pIndex+')">删除</a>';
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
    })
 
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
								$.messager.alert('错误','修改出错！请确保您完全填写了资源内容！','error');								
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
    
			   }     
			});              
    } 
     //取消编辑
        function cancelSonRow(index,pIndex){
            var subCategory = $('#missrctt').datagrid('getRowDetail',pIndex).find('table.subCategory');
            subCategory. datagrid('cancelEdit', index); 
        }
    /*------------------子类行编辑end-----------------*/ 
 
 
    
</script>
</head>
<body>
<table id="missrctt" style="min-height:600px"></table>
<input id="ppl_preplan_sn" type="hidden" value="${pp_sn}"/>
</body>
</html>
