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
    
	 	$(function(){
				$(function (){
	 			$('#modulett').datagrid({
	 				title:'预案模块列表',
				    iconCls:'icon-edit',
				    pagination:true,
				    rownumbers:true,
					pageNumber:1,
					pageSize:20,
					pageList:[20,40,80,100],
				    singleSelect:true,
				    loadMsg:'正在加载，请稍后...',
					striped:true,
					fitColumns:true,
				    url:'${pageContext.request.contextPath}/plan/preplan/preplan_module_queryModuleByPpsn.action',
				    columns:[[
				    	{field:'id',title:'模块id',width:100,align:'center'},
				        {field:'title',title:'模块标题',width:250,align:'center'},
				        {field:'content',title:'模块内容',width:250,align:'center',
				        	formatter:function(value,row,index){
				        		if(row.expand){
				        			var d = '<a href="#" onclick="colContentDetail('+index+')">关闭模块内容</a> ';
				            		return d;	
				        		}else{
				        			var e = '<a href="#" onclick="getContentDetail('+index+')">查看模块内容</a> ';
				            		return e;
				        		}

				            }
				        },
				        {field:'order',title:'操作',width:250,align:'center',
				            formatter:function(value,row,index){				                
				                var u = '<a href="#" onclick="updateModule('+row.id+')">修改</a> |';
				                var d = ' <a href="#" onclick="deleteModule('+row.id+')">删除</a>';
				                return u+d;
				            }
				        },
				    ]],
				    toolbar:[
				    	{
				    		text:'添加模块',
							iconCls: 'icon-add',
							handler: function(){
								addModule()
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
		})
	
    
    
  
	    
    /*------------------模块编辑-----------------*/
    
    function closeModuleWin(){
    	$('#addModuleWin').window('close')
    	return '返回父页面属性';
    }
    
    //新添模块
	function addModule(){
		$('#addModuleWin').window({
			loadingMessage:'正在加载，请稍后...',
			minimizable:false,
			collapsible:false,
			draggable:false,
			width:700,
			height:550,
			title:'添加模块',
			cache:false,
			onClose: function(){
				$('#modulett').datagrid('reload');	
			},
			content:'<iframe src="preplan_module_edit.action" frameborder="0" width="100%" height="100%"/>'
		});								
	}
	//修改模块
	function updateModule(id){
		$('#addModuleWin').window({
			loadingMessage:'正在加载，请稍后...',
			minimizable:false,
			collapsible:false,
			draggable:false,
			width:700,
			height:550,
			title:'添加模块',
			cache:false,
			onClose: function(){
				$('#modulett').datagrid('reload');	
			},
			content:'<iframe src="${pageContext.request.contextPath}/plan/preplan/preplan_module_getUpdateFtl.action?id='+id+'" frameborder="0" width="100%" height="100%"/>'
		});								
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
							
				}
			)
 		}
       	
    //查看模块内容  	
    function getContentDetail(index){    	  	
    	$('#modulett').datagrid('expandRow',index);
    	$('#modulett').datagrid('fixDetailRowHeight',index);   	
    }  
    //关闭模块内容 
   function  colContentDetail(index){
   		$('#modulett').datagrid('collapseRow',index);
    	$('#modulett').datagrid('fixDetailRowHeight',index);  
   } 		
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
<table id="modulett" style="min-height:550px"></table>	  
<div id="addModuleWin"></div>	
</body>
</html>