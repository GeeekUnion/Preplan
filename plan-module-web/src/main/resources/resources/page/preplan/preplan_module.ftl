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
				    singleSelect:true,
				    loadMsg:'正在加载，请稍后...',
					striped:true,
					fitColumns:true,
				    url:'${pageContext.request.contextPath}/plan/preplan/preplan_module_queryModuleByPpsn.action',
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
								addModule()
							}
						}
					],
					view: detailview, 
		            detailFormatter: function(rowIndex, rowData){ 
		                return '<table><tr>'/  
							  +'<td style="border:0">'/  
							  +'<p>rowData.content'</p>'/  
							  +'</td>'/  
							  +'</tr></table>'; 
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
		})
		/*------------------模块编辑-----------------*/
		function editrow(index){     
			 $('#modulett').datagrid('beginEdit', index);     
		}     
		function deleterow(i){ 
	     
		}   
		//保存
		function saverow(i){
		 	  
			  var rows = $('#modulett').datagrid('getRows');
	  		  var row = rows[i];
	  		  //前端先保存改好的数据  
	  		  $('#modulett').datagrid('endEdit',i);	  		  
				  
		}     
		function cancelrow(index){     
			$('#modulett').datagrid('cancelEdit', index);     
		}  
	    
    /*------------------分割线-----------------*/ 
    
	function addModule(){
		$('#addModuleWin').window({
			top:5,
			loadingMessage:'正在加载，请稍后...',
			minimizable:false,
			collapsible:false,
			draggable:false,
			width:700,
			height:550,
			title:'添加模块',
			cache:false,
			content:'<iframe src="preplan_module_edit.action" frameborder="0" width="100%" height="100%"/>'
		});								
	}
       		
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
<table id="modulett" style="min-height:550px"></table>	  
<div id="addModuleWin"></div>	
</body>
</html>