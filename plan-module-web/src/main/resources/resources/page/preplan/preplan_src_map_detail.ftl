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
	<script type="text/javascript" src="${getMC ("")}/js/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript">
 
    var hiddenId=parent.$("#hiddenId").val();
    
     var row=parent.$("#dg").datagrid("getSelected");
     if(row!=null){
      var code=row.inventorySn;
      }else{
      var code=hiddenId;
      }
      console.log(code+"666");
      
      
      $(function (){
      
       
      $('#dgDetail').datagrid({    
  		 url:'preplan_supply_queryByPage.action',    
  		 fitColumns:true,
  		 fit:true ,
  		 singleSelect:true,
  		 loadmsg:'请等待',
	     rownumbers:true,
  		 pagination:true,
		 pageNumber:1,
		 pageSize:15,
		 pageList:[15,30,50,100],
	     queryParams: {
			code: code
	             	},
    	 columns:[[    
    	{field:'id',title:'id',width:100,align:'center',hidden:'true'},
    	{field:'supplySn',title:'Sn',width:200,align:'center',hidden:'true'},    
        {field:'supplyName',title:'资源名称',width:200,align:'center'},    
        {field:'supplyNumber',title:'资源数量',width:200,align:'center'},    
        {field:'supplyUnit',title:'资源单位',width:200,align:'center'},    
     
   						 ]],
   		 toolbar: [{
  			   	id:'add',
		    	text:'添加',
				iconCls: 'icon-add',
				handler: function(){
					$('#winDetailAdd').window({
						width:400,
		 				height:230,
		 				title:'添加资源地',
		 				cache:false,
		 				content:'<iframe src="preplan_src_map_add.action" frameborder="0" width="100%" height="100%"/>'
					});
				
				}
			},{
				id:'delete',
				iconCls:'icon-remove',
				text:'删除',
				handler:function(){
						var row=$("#dgDetail").datagrid("getSelected");
						if(row){
								$.messager.confirm('确认对话框', '您想要删除所选数据吗？', function(r){
									if (r){
										$.ajax({
											url:'preplan_supply_delete.action',
											method:'POST',
											dataType:'json',
											data:{'id':row.id},
											success:function(data){
												if(data.status=="ok"){
													$.messager.alert('我的提示','删除成功！','info');
													$("#dgDetail").datagrid("reload");						
													
												}else{
													$.messager.alert('我的提示','删除失败！','error');
												
												}
											}
										})
									}
								});		
										
						}else{
							$.messager.show({
								title:'我的提示',
								msg:'请先选择一条记录！',
								timeout:1000,
								showType:'show',
								style:{
									right:'',
									top:document.body.scrollTop+document.documentElement.scrollTop+200,
									bottom:''
								}
							})
						}
					
				
					
				}
			},{
				id:'update',
				iconCls:'icon-edit',
				text:'修改',
				handler:function(){
					var row=$("#dgDetail").datagrid("getSelected");
					if(row){
								$('#winDetailUpdate').window({
					 				width:380,
					 				height:330,
					 				title:'信息修改',
					 				cache:false,
					 				content:'<iframe src="preplan_src_map_update.action" frameborder="0" width="100%" height="100%"/>'
					 			});
					}else{
						$.messager.show({
							title:'我的提示',
							msg:'请先选择一条记录！',
							timeout:1000,
							showType:'show',
							style:{
								right:'',
								top:document.body.scrollTop+document.documentElement.scrollTop+200,
								bottom:''
							}
						});
					} 

				
				}
			}],
			
 		
 		
 		
     });
						});  
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
 <table id="dgDetail"  ></table>  
  <div id="winDetailAdd"  data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div>  
    <div id="winDetailUpdate"  data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div>  
	
</body>
</html>