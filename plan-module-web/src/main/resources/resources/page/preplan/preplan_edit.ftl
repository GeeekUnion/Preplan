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

	<link rel="stylesheet" type="text/css" href="${getTheme('default','')}/kindeditor/themes/default/default.css"/>
	<script type="text/javascript" src="${getTheme('default','')}kindeditor/kindeditor-min.js"></script>
	<script type="text/javascript" src="${getTheme('default','')}kindeditor/lang/zh_CN.js"></script>
	
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
			$('#orderVv').textbox({    
			    required: true, 		    					
				validType: 'onlyInteger', 
				width:150,
				     
			});
		});
    
    	//确认按钮
    	$(function (){
			$('.submitBtn').linkbutton({    
			    iconCls: 'icon-ok',
			    width:250,
			    height:50,   
			});
			$('.returnBtn').linkbutton({    
			    iconCls: 'icon-undo',
			    width:250,
			    height:50,   
			});  						   
		});
		
		//步数
		$(function (){
			$('#preplanStep').progressbar({ 
				value:45,
				text:'第一步：填写预案基本信息'
			}); 
		});
		$(function(){
			//初始化contentTip
			$('#contentTip').tooltip({   
				 position: 'right',    
				 content: '内容不能为空！',    
				 onShow: function(){        
				 	$(this).tooltip('tip').css({
					 	backgroundColor: '#FFFCCC',            
						borderColor: '#D8B157'        
					});    
				 }
				 
			});
		})		
	/*------------------编辑器初始化-----------------*/    	
	var editorDesc;		
	//初始化富文本		
	KindEditor.ready(function(K) {
		editorDesc = K.create('textarea[name="ppe_preplan_desc"]', {
			resizeType : 1,
			allowPreviewEmoticons : false,
			allowImageUpload : false,
			items : [
				'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'emoticons', 'image', 'link']
		});
	});
	
	
	

	/*------------------验证方法-----------------*/    
	$.extend($.fn.validatebox.defaults.rules, {    
	    onlyInteger: {    
	        validator: function(value, param){  
	        	var orderValArray=$('#orderVv').textbox('getValue').split("");
	        	for(var i=0;i<orderValArray.length;i++){
	        		var patt1=new RegExp(/^\d*$/);
		        	if(!patt1.test(orderValArray[i])){			        			        		
		        		return false;
		        	}
	        	}
	        	return true;		                
	        },    
	        message: '只能输入大于0的整数！'   
	    }    
	});
	
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
	
	//自定义显示不能为空
	function contentIsEmpty(){
		$('#contentTip').tooltip('show');
		setTimeout("$('#contentTip').tooltip('hide');",3000)	
	}

	/*------------------保存预案-----------------*/
			//保存预案
			function submitPreplan(){	
					var ppSn=document.getElementById("ppl_preplan_sn").value				       		
					//预案名字
					var preplanName=$('#ppe_input1').textbox('getValue');
					//预案描述
					var preplanDesc=editorDesc.html()
					//预案编号
					var preplanUid=$('#ppe_input3').textbox('getValue');
					//预案类型
					var preplanType=$('#ppe_search').combobox('getValue');
					//预案责任单位
					var preplanDept=$('#ppe_dept_search').combobox('getText');
					
					var isValid1 = $('#ppe_input1').textbox('isValid');
					var isValid2 = editorDesc.isEmpty();
					var isValid3 = $('#ppe_input3').textbox('isValid');
					var isValid4 = $('#ppe_search').combobox('isValid');
					var isValid5 = $('#ppe_dept_search').combobox('isValid');
					if(isValid1==false || isValid2==true || isValid3==false || isValid4==false || isValid5==false){
					    	if(isValid1==false){
					    		$("#ppe_input1").next('span').find('input').focus();
					    		return isValid1;
					    	};
					    	if(isValid2==true){
					    		contentIsEmpty();
					    		return false;
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
						if(typeof(ppSn)==="undefined" || ppSn==="" ){
							$.ajax({    //保存新预案
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
										$('#pleModule').show(); 
										showAddMis(pd);								
									}
									else{
										$.messager.alert('提示','未知错误','error');
									}						
		
								}
		
							})
						
						}else{						
							$.ajax({   //修改旧预案
								type : "POST",
								url : "preplan_preplan_saveOnlyPreplan.action",
								dataType : "json",
								traditional : true,
								data : {
										ppName : preplanName,
										ppDesc : preplanDesc,
										ppType : preplanType,
										ppDept : preplanDept,
										ppUid  : preplanUid,
										ppSn   : ppSn
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
										$('#pleModule').show(); 
										showAddMis(pd);								
									}
									else{
										$.messager.alert('提示','未知错误','error');
									}						
		
								}
		
							})						
						}
						
						
					}			      
		    }
		     
		    function returnPreplan(){
				$('#plePreplanMsg').show();
				$('#pleMisSrc').hide();
				$('#pleModule').hide();
		    }			    
		    	    
	/*------------------完成-----------------*/	    
		 function  submitPerfect(){
		 	$.messager.confirm('确认','您确认已经完成预案填制？',function(r){    
			    if (r){   
			    	$('#pleMisSrc').hide();
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
  <div class="btm-area" id="plePreplanMsg" style="margin-top:10px;">
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
		        <span class="label_box"><label for="ppe_preplan_desc" id="contentTip"><strong>预案描述:</strong></label></span>
		        <textarea id="ppe_input2" name="ppe_preplan_desc" style="width:600px;height:300px;visibility:hidden;display: block;"></textarea>		        
		        <span></span>
		    </div>         
		</div> 
		<div style="width:100%">
			<a class="submitBtn" href="javascript:void(0)" onclick="submitPreplan()" style="width:250px;margin:20px auto">下一步</a>
		</div>
    </div>
    
    <div class="btm-area" id="pleMisSrc" style="display:none;margin-top:10px" >
    	<div id="ppl_preplan" class="pp_preplan">   		    
		    <table id="missrctt" style="min-height:550px"></table>
		   <div>
		   		<a class="returnBtn" href="javascript:void(0)" onclick="returnPreplan()" style="width:250px;margin:20px auto">上一步</a>
				<a class="submitBtn" href="#pleModule" style="width:250px;margin:20px auto">添加其他模块</a>
			</div>      
			<div id="preplanModuleArea">
				<table id="preplanModuleList" style="min-height:550px"></table>
			</div>    
		</div> 
    </div>
    
     <div class="btm-area" id="pleModule" style="display:none">
    	<div>   	
    		<table id="modulett" style="min-height:550px"></table>	    
		   <div>
		   		<a class="returnBtn" href="#pleMisSrc" style="width:250px;margin:20px auto">填写任务资源</a>
				<a class="submitBtn" href="javascript:void(0)" onclick="submitPerfect()" style="width:250px;margin:20px auto">完成</a>
			</div>          
		</div> 
    </div>
    
	<div id="orderDialog" style="display:none">
		<input id="orderVv" value=""/>  
	</div>
   
    <div class="btm-area" id="plePerfect" style="display:none;margin-top:15px;">
    	<center>预案填制完成，<strong><a htef="javascript:void(0)" onclick="closeThisTab('预案编制')">点此返回</a></strong></center>
    </div>
   
   <input id="ppl_preplan_sn" type="hidden" value=""/>
  <script type="text/javascript"> 
 	function closeThisTab(title){  
		window.parent.tabsClose(title)  
	} 
	  
  	
    
    
    //全局顺序初始（任务及模块）
    var orderNum=1;  
  
    //显示列表
    function showAddMis(pp_sn){
    	$('#preplanStep').progressbar({ 
			value:85,
			text:'第二步：添加任务资源及模块'
		});		
		var rowEditing = false;
		var rowEditing2 = false;
        $('#missrctt').datagrid({ 
            title:'任务列表', 
            remoteSort:false, 
            singleSelect:true,
            rownumbers:true,
            idField:'missionId',
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
                        if( rowEditing == false ){
                    		$('#missrctt').datagrid('appendRow',{
                    				missionOrder:orderNum,
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
			    				required:true,
			                }
			            }
			        },			       
			        {field:'missionId',title:'操作',width:250,align:'center',
			            formatter:function(value,row,index){
			                if (row.editing){
			                    var s = '<a href="javascript:void(0)" onclick="saveParentRow('+index+',\'missionOrder\')">保存</a> |';
			                    var c = ' <a href="javascript:void(0)" onclick="cancelParentRow('+row.missionId+')">取消</a>';
			                    return s+c;
			                } else {
			                    var e = '<a href="javascript:void(0)" onclick="editParentRow('+row.missionId+',\'missionOrder\')">编辑</a> |';
			                    var d = ' <a href="javascript:void(0)" onclick="deleteParentRow('+row.missionId+','+index+')">删除</a>';
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
                    idField:'id',
                    rownumbers:true,
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
				                    var s = '<a href="javascript:void(0)" onclick="saveSonRow('+index+','+pIndex+')">保存</a> |';
				                    var c = ' <a href="javascript:void(0)" onclick="cancelSonRow('+row.id+','+pIndex+')">取消</a>';
				                    return s+c;
				                } else {
				                    var e = '<a href="javascript:void(0)" onclick="editSonRow('+row.id+','+pIndex+'\'resourceNumber\')">编辑</a> |';
				                    var d = ' <a href="javascript:void(0)" onclick="deleteSonRow('+index+','+pIndex+')">删除</a>';
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
        //显示模块
        showAddModule(pp_sn);   
    }
 
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
                                            rowEditing2 = false;                          
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
  		  
  		 if( misnOrder==="" || misnName==="" || typeof(misnDept) === "undefined" ||  misnDept==="" ){
			  	if(misnOrder===""){
					  editParentRow(id,"missionOrder");
					  return true;
				};
				if(misnName===""){
					editParentRow(id,"missionName");
					return true;
				};
				if( typeof(misnDept) === "undefined" || misnDept===""){
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
									misnName : misnName,//missionName
									misnDept : misnDept,//missionDept
									misnOrder: misnOrder,
									ppSn     : pp_sn,
							},
							success : function(data) {
									if(data==="new"){
										orderNum++;
									}
									$.messager.alert('提示','修改成功！','info',
										function() {
											$('#missrctt').datagrid('reload');
											$('#missrctt').datagrid('clearSelections');//取消选择行									
											rowEditing2 = false;
										}); 								
								},
							error: function(){
									$.messager.alert('错误','修改出错！请确保您已经完全填写任务内容！','error');								
							}
				  		})    
				   }     
				});
		  }	
  		  
  		                
    } 
        
    //取消编辑
    function cancelParentRow(mId){ 
    	var index=$('#missrctt').datagrid('getRowIndex',mId);
    	if(mId==-101){
    		$.messager.confirm('确认','该任务未保存，取消将删除该未保存任务，确认删除？',function(r){    
			    if (r){    
			    	$('#missrctt').datagrid('cancelEdit', index);
			        $('#missrctt').datagrid('deleteRow',index);   
			        rowEditing2 = false; 
			    }    
			});     		
    	}else{  
    		$.messager.confirm('确认','该任务未保存，取消将不保存修改，确认删除？',function(r){    
			    if (r){    
			       $('#missrctt').datagrid('cancelEdit', index);  
			       rowEditing2 = false;  
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
 
 		  if( typeof(srcName) === "undefined" ||  srcName==="" || srcNumber==="" || srcUnit===""){
			  	if(srcNumber===""){
					editSonRow(id,pIndex,"resourceNumber");
					return true;
				};
				if(srcUnit===""){
					editSonRow(id,pIndex,"resourceUnit");
					return true;
				};
			  	if( typeof(srcName) === "undefined" || srcName===""){
					editSonRow(id,pIndex,"resourceName");
					return true;
				};  
		  }else{	
 		  	$.messager.confirm('确认提交','您确认保存该资源？',function(r){     
			  if (r){			  
			  	 //保存新资源
			  	 if(id<0){	
				 	//获得Mission的Sn
				  	var fatherSn =prow.missionSn;
					if(typeof(fatherSn) === "undefined" || fatherSn===""){
						$.messager.alert('错误','该资源的任务还没有保存！','error');
						editSonRow(id,pIndex,"resourceNumber");	
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
									$.messager.alert('提示','保存成功！','info',
										function() {
											subCategory.datagrid('reload');
											subCategory.datagrid('clearSelections');//取消选择行								
										}); 								
								},
							error: function(){
									$.messager.alert('错误','保存出错！请确保您完全填写了资源内容！','error');								
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
								$.messager.alert('提示','保存成功！','info',
									function() {
										subCategory.datagrid('reload');
										subCategory.datagrid('clearSelections');//取消选择行								
									}); 								
							},
						error: function(){
								$.messager.alert('错误','保存出错！请确保您完全填写了资源内容！','error');								
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
    
    
    
    /*----------------查看该预案模块---------------*/	
 	function showAddModule(pp_sn){
			$(function (){
 			$('#modulett').datagrid({
 				title:'该预案模块列表',
			    iconCls:'icon-edit',
			    singleSelect:true,
			    loadMsg:'正在加载，请稍后...',
				striped:true,
				fitColumns:true,
			    url:'${pageContext.request.contextPath}/plan/preplan/preplan_module_queryModuleByPpsn.action?preplanSn='+pp_sn,
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
			        	formatter:function(value,row,index){
			        		if(row.expand){
			        			var d = '<a href="javascript:void(0)" onclick="colPmContentDetail('+index+')">关闭模块内容</a> ';
			            		return d;	
			        		}else{
			        			var e = '<a href="javascript:void(0)" onclick="getPmContentDetail('+index+')">查看模块内容</a> ';
			            		return e;
			        		}

			            }
			        },
			        {field:'idc',title:'操作',width:250,align:'center',
			            formatter:function(value,row,index){
			            	var u ='<a href="javascript:void(0)" onclick="updateModuleOrder('+row.id+')">修改顺序</a> |'				                
			                var d =' <a href="javascript:void(0)" onclick="deleteModule('+row.id+')">删除</a>';			                
			                return u+d;
			            }
			        },
			    ]],
			    toolbar:[
			    	{
			    		text:'添加模块',
						iconCls: 'icon-add',
						handler: function(){
							$('#preplanModuleArea').window({
								loadingMessage:'正在加载，请稍后...',
								minimizable:false,
								collapsible:false,
								maximizable:false,
								width:700,
								height:600,
								cache:false,
								draggable:false,
								title:'选择模块',								
							});		
							showModuleList();
							$('#preplanModuleArea').window('center');											
						}
					}
				],
				view: detailview, 
	            detailFormatter: function(rowIndex, rowData){ 
	            	//console.log(rowData);
	                return '<p><strong>模块内容：</strong>'+rowData.content+'</p>';
	            },            
	            onExpandRow: function(index,row){
	            	row.expand = true;
	            	$('#modulett').datagrid('refreshRow', index);
	                var subCategory = $(this).datagrid('getRowDetail',index).find('table.subCategory');
	                var pIndex=subCategory.datagrid('getParentRowIndex');//获得父亲Index
	                $('#modulett').datagrid('clearSelections');//取消选择行    
	                $('#modulett').datagrid('fixDetailRowHeight',index);
	            },
	            onCollapseRow: function(index,row){
	            	row.expand = false;
	            	$('#modulett').datagrid('refreshRow', index);
	                var subCategory = $(this).datagrid('getRowDetail',index).find('table.subCategory');
	                var pIndex=subCategory.datagrid('getParentRowIndex');//获得父亲Index
	                $('#modulett').datagrid('clearSelections');//取消选择行    
	                $('#modulett').datagrid('fixDetailRowHeight',index);
	            },
			});			
 		});					  
	}
	/*------------------模块编辑-----------------*/
	//修改模块顺序
	function updateModuleOrder(id){
	    $(function(){
			var spanNow=$("#orderVv").next('span');
	    	var inputNow=$("#orderVv").next('span').find('input:first-child');
	    	inputNow.css('height','20px');
	    	spanNow.css('margin','50px 63px');    	
		    $('#orderDialog').dialog({    
			    title: '请输入序号',    
			    width: 300,    
			    height: 200,                
			    modal: true,
			    buttons:[{
					text:'保存',
					iconCls:'icon-save',
					handler:function(){	
						var pd=$('#orderVv').textbox('isValid');
						if(pd===true){
							var newOrder=$('#orderVv').textbox('getValue');
							$.ajax({
								type : "POST",
								url: '${pageContext.request.contextPath}/plan/preplan/preplan_module_updateModuleOrder.action',
								dataType : "json",
								data : {
									id : id,
									order : newOrder,
								},
								success : function() {
											
										$.messager.alert('提示','保存成功！','info',
											function() {
												$('#modulett').datagrid('reload');
												$('#orderDialog').dialog('close')
											}); 																			
									},
								error: function(){
										$.messager.alert('错误','保存出错！请重试！','error');								
								}
					  		})	
						}else{					
						}
					}
				},{
					text:'取消',
					iconCls:'icon-cancel',
					handler:function(){
						$('#orderDialog').dialog('close')
					}
				}]
			       
			}); 
	    }) 	
	} 
	//删除模块
    function deleteModule(id){
    	$.messager.confirm('确认删除','您确定要删除该模块？',
				function(r){
					if(r){
						//删除该模块
						$.ajax({
							type : "POST",
							url:'${pageContext.request.contextPath}/plan/preplan/preplan_module_deleteModuleById.action',
							dataType : "json",
							data : {
									id : id
							},
							success : function() {
									$.messager.alert('提示','删除成功！','info',
										function() {
											$('#modulett').datagrid('reload');					
										}); 								
							},
							error: function(){
									$.messager.alert('错误','删除出错！','error',
										function() {
											$('#modulett').datagrid('reload');					
										}); 								
							}
						});		
					}
							
				})
 		}
       	
    //查看模块内容  	
    function getPmContentDetail(index){    	  	
    	$('#modulett').datagrid('expandRow',index);
    	$('#modulett').datagrid('fixDetailRowHeight',index);   	
    }  
    //关闭模块内容 
   function  colPmContentDetail(index){
   		$('#modulett').datagrid('collapseRow',index);
    	$('#modulett').datagrid('fixDetailRowHeight',index);  
   } 
    
    
    /*------------------查看所有模块-----------------*/
    
    //查看所有模块列表
	function showModuleList(){	    
 		$('#preplanModuleList').datagrid({
		    pagination:true,
		    rownumbers:true,
			pageNumber:1,
			pageSize:15,
			pageList:[15,40,80,100],
		    singleSelect:true,
		    loadMsg:'正在加载，请稍后...',
			striped:true,
			fitColumns:true,
		    url:'${pageContext.request.contextPath}/plan/preplan/preplan_module_queryModuleByPpsn.action',
	    	toolbar:[{
	    		text : '确认添加',
		    	iconCls: 'icon-ok',
		    	handler: function(){
		    		var row=$('#preplanModuleList').datagrid('getSelected');
	    			if(row != null){
	    				var preplanSn=$('#ppl_preplan_sn').val();
	    				var id=row.id;
	    				//console.log("preplanSn:"+preplanSn+"，id:"+id);
						$.ajax({
							type : "POST",
							url: '${pageContext.request.contextPath}/plan/preplan/preplan_module_saveOrUpdateModule.action',
							dataType : "json",
							data : {
								preplanSn : preplanSn,
								id : id,
								order : orderNum,
							},
							success : function() {
									$.messager.alert('提示','保存成功！','info',
										function() {
											$('#modulett').datagrid('reload');
											$('#preplanModuleList').datagrid('clearSelections');//取消选择行	
											orderNum++;							
										}); 
																		
								},
							error: function(){
									$.messager.alert('错误','保存出错！请重试！','error');								
							}
				  		})		
					}
					else{
						$.messager.alert('提示','您还没有选择一行哦（PS：当一行背景变黄色时即为选中）','info');	
					}
		    	}			    	
		    }],
		    columns:[[
		    	{field:'id',title:'模块id',width:100,align:'center'},
		        {field:'title',title:'模块标题',width:250,align:'center'},
		        {field:'content',title:'模块内容',width:250,align:'center',
		        	formatter:function(value,row,index){
		        		if(row.expand){
		        			var d = '<a href="javascript:void(0)" onclick="colContentDetail('+index+')">关闭模块内容</a> ';
		            		return d;	
		        		}else{
		        			var e = '<a href="javascript:void(0)" onclick="getContentDetail('+index+')">查看模块内容</a> ';
		            		return e;
		        		}

		            }
		        }
		    ]],
			view: detailview, 
            detailFormatter: function(rowIndex, rowData){ 
            	//console.log(rowData);
                return '<p><strong>模块内容：</strong>'+rowData.content+'</p>';
            },            
            onExpandRow: function(index,row){
            	row.expand = true;
            	$('#preplanModuleList').datagrid('refreshRow', index);
                var subCategory = $(this).datagrid('getRowDetail',index).find('table.subCategory');
                var pIndex=subCategory.datagrid('getParentRowIndex');//获得父亲Index
                $('#preplanModuleList').datagrid('clearSelections');//取消选择行    
                $('#preplanModuleList').datagrid('fixDetailRowHeight',index);
            },
            onCollapseRow: function(index,row){
            	row.expand = false;
            	$('#preplanModuleList').datagrid('refreshRow', index);
                var subCategory = $(this).datagrid('getRowDetail',index).find('table.subCategory');
                var pIndex=subCategory.datagrid('getParentRowIndex');//获得父亲Index
                $('#preplanModuleList').datagrid('clearSelections');//取消选择行    
                $('#preplanModuleList').datagrid('fixDetailRowHeight',index);
            },			     				    
		}); 
	}	
	
	//查看模块内容  	
    function getContentDetail(index){    	  	
    	$('#preplanModuleList').datagrid('expandRow',index);
    	$('#preplanModuleList').datagrid('fixDetailRowHeight',index);   	
    }  
    //关闭模块内容 
   function  colContentDetail(index){
   		$('#preplanModuleList').datagrid('collapseRow',index);
    	$('#preplanModuleList').datagrid('fixDetailRowHeight',index);  
   } 
</script>
 
</body>
</html>