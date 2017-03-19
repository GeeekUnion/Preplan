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
    	//查询所有权限
 		$(function (){
 			//数据表格
 			$('#ppltt').datagrid({
 			    url:'preplan_preplan_queryPreplanList.action',			   	
 			   	pagination:true,
				pageNumber:1,
				pageSize:20,
				pageList:[20,40,80,100],
				rownumbers:true,
 			   	striped:true,
 			   	singleSelect:true, 			    
 			    columns:[[    
 					{field:'preplanName',title:'预案名字',width:300,align:'center'},
 					{field:'responDept',title:'负责单位',width:300,align:'center'},
 					{field:'preplanType',title:'预案类型',width:300,align:'center'},
 					{field:'id',title:'操作',width:'150',align:'center',
 								 formatter:function(value,row,index){
 								 			var i = row.id;
		        		  					return "<a  href='#' onclick='detailView(" +i+ ")'  class='detail_view' >"+"查看预案详情"+"</a>";				        		
		        	}},
		        	{field:'preplanSn',title:'操作',width:'100',align:'center',
 								 formatter:function(value,row,index){
 								 			var j = row.id;
		        		  					return "<a  href='#' onclick='deletePp(" +j+ ")'  class='delete_Pp' >"+"删除"+"</a>";				        		
		        	}}
 			    ]],
 			    toolbar: [{
 			    	text:'修改预案属性',
					iconCls: 'icon-edit',
					handler: function(){
						var row =$('#ppltt').datagrid('getSelected');
						if(row != null){
							var rid=row.id;
							$('#ppl_updatePreplan').window({
								top:5,
								fit:true,
								loadingMessage:'正在加载，请稍后...',
								minimizable:false,
								collapsible:false,
								title:'修改预案属性',
								cache:false,
								content:'<iframe src="ppl_preplan_list_updatep.action?code=' +rid+ '" frameborder="0" width="90%" height="90%"/>'
							});
						}
						else{
							$.messager.alert('提示','您还为选择一行哦（PS：当一行背景变黄色时即为选中）','info');	
						}
						
					}
				},'-',{
					text:'修改任务资源',
					iconCls: 'icon-edit',
					handler: function(){
						var row =$('#ppltt').datagrid('getSelected');						
						if(row != null){						  
							var i =row.id; 
							$('#ppl_updateMisnSrc').window({
								top:5,
								fit:true,
								loadingMessage:'正在加载，请稍后...',
								minimizable:false,
								collapsible:false,
								title:'修改任务资源',
								cache:false,
								content:'<iframe src="ppl_preplan_list_updatemr.action?code=' +i+ '" frameborder="0" width="100%" height="100%"/>'
							});
						}
						else{
							$.messager.alert('提示','您还为选择一行哦（PS：当一行背景变黄色时即为选中）','info');	
						}
					}	
				},'-',{
					text:'新增任务资源',
					iconCls: 'icon-add',
					handler: function(){
						var row =$('#ppltt').datagrid('getSelected');						
						if(row != null){
							var rid=row.id;
							$('#ppl_updatePreplan').window({
								top:5,
								fit:true,
								loadingMessage:'正在加载，请稍后...',
								minimizable:false,
								collapsible:false,
								title:'新增任务资源',
								cache:false,
								content:'<iframe src="ppl_preplan_list_addm.action?code=' +rid+ '" frameborder="0" width="100%" height="100%"/>'
							});
						}
						else{
							$.messager.alert('提示','您还为选择一行哦（PS：当一行背景变黄色时即为选中）','info');	
						}
					}
				}],			    
 			    //成功加载出发
 			    onLoadSuccess:function(){
	 			    	$('.detail_view').linkbutton({    
						    iconCls: 'icon-search',
						    height:24   
						});
						$('.delete_Pp').linkbutton({    
						    iconCls: 'icon-cancel',
						    height:24   
						});  
	 			    }
 			});
 		});
 		//下拉搜索
		$(function (){
			$('#ppl_search').combobox({    
			    url:'preplan_domain_queryAllDomain.action',    
			    valueField:'id',    
			    textField:'domain_name'   
			});
			$('#ppl_search_btn').linkbutton({    
			    iconCls: 'icon-search'   
			});   
		})
 		
 		//下拉搜索预案列表
 		function searchPreplanList(){
 			//获得搜索值
 			var searchCode = $('#ppl_search').combobox('getValue');
 			console.log(searchCode);
 			var queryParams = {"code" :searchCode};
 			$('#ppltt').datagrid('load',queryParams);
 			
 		}
 		
 		//查看预案详情
 		function detailView(i){
 			$('#ppl_detail').window({
				top:5,
				fit:true,
				loadingMessage:'正在加载，请稍后...',
				minimizable:false,
				collapsible:false,
				title:'当前预案详情',
				cache:false,				
				content:'<iframe src="ppl_preplan_list_detail.action?code=' +i+ '" frameborder="0" width="100%" height="100%"/>'
			});
 		}
 		
 		
 		//删除预案
 		function deletePp(j){
			$.messager.confirm('确认删除','您确定要删除该预案？',
				function(r){
					if(r){
						//删除该预案
						$.ajax({
							type : "POST",
							url : "preplan_preplan_deletePreplan.action",
							dataType : "json",
							data : {
									code : j
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
						});		
					}
							
				}
			)
 		}
 		
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
    <!--表格-->
        
    <div class="top-area">
    	<p class="title"><strong>预案列表</strong></p>
    	<div class="title">
    		<input id="ppl_search" name="dept" value="选择预案类型">
    		<a id="ppl_search_btn" href="#" onclick="searchPreplanList()">搜索</a>
    	</div> 	
    	<table id="ppltt"></table>  
    </div>   
    <div class="btm-area">
		<div id="ppl_detail"></div>
		<div id="ppl_updatePreplan"></div>
		<div id="ppl_updateMisnSrc"></div>
		<div id="ppl_addMission"></div> 
    </div>

</body>
</html>