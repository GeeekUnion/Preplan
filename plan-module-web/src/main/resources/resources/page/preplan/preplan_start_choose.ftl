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
	<!--为了使用detailview的插件-->
    <script type="text/javascript" src="${getMC ("")}/js/datagrid-detailview.js"></script>
    <script type="text/javascript">
          var row=parent.$("#dg").datagrid("getSelected");
    	 console.log(row);
    
     function Startup(index){
        $('#dgc').datagrid('selectRow',index);
        var row2=$("#dgc").datagrid("getSelected");  
        console.log(row2);
        $.ajax({
			url:'preplan_event_choosePre.action',
			method:'POST',
			dataType:'json',
			data:{'id2':row2.id,
			      'id'  :row.id
			
			},
			success:function(data){
				if(data.status=="ok"){
					$.messager.alert('我的提示','选择预案成功！','info');
					$("#dgc").datagrid("reload");						
				}else{
					$.messager.alert('我的提示','选择预案失败！','error');
				}
			}
		})
		
               
    }
    
    	$(function (){
    	
 		 $('#dgc').datagrid({    
  		 url:'preplan_preplan_queryPreplanList.action',    
  		 singleSelect:true,
  		 loadmsg:'请等待',
	     rownumbers:true,
  		 pagination:true,
		 pageNumber:1,
		 pageSize:15,
		 pageList:[15,30,50,100],
		 
    	 columns:[[    
        {field:'preplanSn',title:'预案编号',width:'10%',align:'center'},    
        {field:'preplanUID',title:'预案标识',width:'10%',align:'center'},  
        {field:'preplanDesc',title:'预案描述',width:'10%',align:'center'},  
        {field:'act',title:'操作',width:'100',align:'center',formatter:function(value,row,index){
		        		  return "<a  href='#' onclick='Startup(" + index +")' data-options='iconCls:'icon-edit'' class='easyui-linkbutton' style='text-decoration:none'>"+"启动"+"</a>";				        		
		        	}}
   						 ]], 
		view: detailview, 
		detailFormatter: function(rowIndex, rowData){ 
		return '<table><tr>' + 
		'<td rowspan=2 style="border:0"></td>' + 
		'<td style="border:0">' + 
		'<p>预案描述: ' + rowData.preplanDesc + '</p>' + 
		'</td>' + 
		'</tr></table>'; 
		} 
						 	 						 	 
						});  
 		});
 		
 		
 		
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
   
   <table id="dgc"></table>  
  
    
	
</body>
</html>