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
        $(function(){
        
        //重置
	$("#reset").click(function(){
		$("#ff").form("reset");
	});
	//提交 
	$('#submit').click(function(){
			$('#ff').form('submit', {    
			    url:'preplan_event_save.action',       
			    success:function(data){
			    	var result = eval('(' + data + ')');
			    	if(result.status=='ok'){
			    		parent.$.messager.alert("提示信息","添加成功！");
						$("#ff").form("reset");
						//关闭窗体
						parent.$("#win").window("close");
						//刷新dg
						parent.$("#dg").datagrid("reload");
				   	}else{
				   		parent.$.messager.alert("提示信息","添加失败！",'error');
					}
			    }    
			});
		
	})
        
        
        
        
        
        
        })
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
   <form id="ff" method="post">   
	    <div style="margin: 15px;">   
	        <label for="eventName">事件名称:&nbsp;&nbsp;</label>   
	        <input id="eventName" class="easyui-textbox" type="text" name="eventName" data-options="required:true" />   
	    </div>   
	    <div style="margin: 15px;">   
	        <label for="eventOccurPlace">发生地:&nbsp;&nbsp;</label>   
	        <input class="easyui-textbox" type="text" name="eventOccurPlace" data-options="required:true" />   
	    </div>
	      
	    <div style="margin-top: 25px;text-align:center">
	    	<a id="submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
	    	<a id="reset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a>  
	    </div>      
	</form> 	
 
    
	
</body>
</html>