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
        function showResource(){
			var row = $('#dg').datagrid('getSelected');
			var sn=row.missionSn;	
				$.ajax({
					url:'preplan_resourceRecord_queryByPage.action',
					method:'POST',
					dataType:'json',
					data:{
					        missionSn:sn
					},
					success:function(str){
						$('#dg2').datagrid("loadData",str)
						
					}
				})
                               } 
         function addResource(){
			var row = $('#dg').datagrid('getSelected');
			var sn=row.missionSn;	
			$('#dlg').dialog('open').dialog('setTitle','添加资源');
			$('#ff').form('load',{
			 missionSn:sn
		})
                               }                       
    
    	$(function (){
    	 $('#dg').datagrid({    
  		 url:'preplan_mission_queryByPage2.action',    
  		 singleSelect:true,
  		 loadmsg:'请等待',
	     rownumbers:true,
  		 pagination:true,
		 pageNumber:1,
		 pageSize:15,
		 pageList:[15,30,50,100],
		 columns:[[    
    	 {field:'missionSn',title:'任务编号',width:100,align:'center'},   
        {field:'missionMethod',title:'方法安排',width:100,align:'center'},    
        {field:'missionStatus',title:'任务状态',width:100,align:'center'},    
        {field:'responDept',title:'负责部门',width:100,align:'center'},
        {field:'responPerson',title:'负责人',width:100,align:'center'},
         {field:'act',title:'查看资源调配',width:'100',align:'center',formatter:function(value,row,index){
		        		  return "<a  href='#' onclick='showResource()' data-options='iconCls:'icon-edit'' class='easyui-linkbutton' style='text-decoration:none'>"+"查看"+"</a>";				        		
		        	}},
         {field:'add',title:'增加资源',width:'100',align:'center',formatter:function(value,row,index){
		        		  return "<a  href='#' onclick='addResource()' data-options='iconCls:'icon-edit'' class='easyui-linkbutton' style='text-decoration:none'>"+"添加"+"</a>";				        		
		        	}}
		        	
		        	
              ]],
   		toolbar: [{
  			   	id:'add',
		    	text:'添加',
				iconCls: 'icon-add',
				handler: function(){	
					
					
					}	
                    }]
		  					 })
		  					 
		  					 
		  					
		  					
		  					 
		  	$('#dg2').datagrid({    
		     url:'', 
		  	 loadmsg:'请等待',
		     rownumbers:true,
	  		 pagination:true,
			 pageNumber:1,
			 pageSize:15,
			 pageList:[15,30,50,100],   
			 columns:[[    	
			 
			 {field:'id',title:'编号',width:100,align:'center',hidden:'true'},
			 {field:'missionSnR',title:'任务编号',width:100,align:'center'},   
			 {field:'resourceName',title:'调拨资源名称',width:100,align:'center'},    
       		 {field:'resourceNumber',title:'调拨资源数量',width:100,align:'center'},
       		 {field:'resourceUnit',title:'单位',width:100,align:'center'}		  
    ]],
            toolbar: [{
		   	id:'add',
	    	text:'添加',
			iconCls: 'icon-add',
			handler: function(){	
					
					
					}	
                    },
                   {
				id:'delete',
				iconCls:'icon-remove',
				text:'删除',
				handler:function(){
						var row=$("#dg2").datagrid("getSelected");
						if(row){
								$.messager.confirm('确认对话框', '您想要删除所选数据吗？', function(r){
									if (r){
										$.ajax({
											url:'preplan_resourceRecord_deleteRecord.action',
											method:'POST',
											dataType:'json',
											data:{'id':row.id},
											success:function(data){
												if(data.status=="ok"){
													$.messager.alert('我的提示','删除成功！','info');
													$("#dg2").datagrid("reload");						
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
					
				
			}
                    ]   
              
    
    
    
    
    
});  	 
		  					 
		  					 
		  					 
		  					 
		  					 
		  					 
		  					 
		  					 
		  					 
		  					 
		  					 
		  					 
		  					 
		  					 
		  					 
		  					 
		  					 
		  					 
		  					 
				  		//提交 
			$('#submit').click(function(){
				$("#ff").form("enableValidation");
				if($('#ff').form('validate')){
					$('#ff').form('submit', {    
					    url:'preplan_resourceRecord_saveRecord.action?supplyName=' + $('#cc').combobox('getText'),       
					    success:function(data){
					    	$("#ff").form("disableValidation");    
					    	var result = eval('(' + data + ')');
					    	if(result.status=='ok'){
					    		parent.$.messager.alert("提示信息","添加成功！");
								
								//刷新dg
								parent.$("#dg").datagrid("reload");
								       $("#dlg").dialog('close');    
						   	}else{
						   		parent.$.messager.alert("提示信息","添加失败！",'error');
							}
					    }    
					});
				}
			})	
			 
				//下拉框资源名字
			$('#cc').combobox({    
			    url:'preplan_supply_queryAllSupply.action',    
			    valueField:'supplySn',    
			    textField:'supplyName',
			    panelHeight:100,
			    width:160,
			    limitToList:true,
				
			});	 
		  			
		  			
		  			
		  			
		  			
		  			
		  			
		  					 
		  					 
		  					 
                         
    	              })
    	
    	
    	
    	
    	
    	
    	
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
   
  
   
   <table id="dg"></table>  
   <br>
   <br>
   <table id="dg2"></table>
   
   <div id="dlg" class="easyui-dialog"
		style="width: 400px; height: 280px; padding: 10px 20px" closed="true"
		buttons="#dlg-buttons" modal="true">

		<form id="ff" method="post">
		
		     <div class="fitem" >
				<label>missionSn:</label> <input name="missionSn" class="easyui-validatebox" type="text" 
					>
			</div>
			<div class="fitem">
				<label >资源名称:</label>
	    	<input id="cc" name="supplySn">
			</div>
			<div class="fitem" >
				<label>资源数量:</label> <input name="resourceNumber" class="easyui-validatebox"
					required="true">
			</div>
			<div class="fitem">
				<label>单位:&nbsp;&nbsp;&nbsp;</label> <input name="resourceUnit" class="easyui-validatebox"
					required="true">
			</div>
			
			  <div style="margin-top: 25px;text-align:center">
	    	<a id="submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
	    	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel"
					onclick="javascript:$('#dlg').dialog('close')">取消</a>
			</div>   
		</form>

	</div>
   
	
	
   
   
</body>
</html>