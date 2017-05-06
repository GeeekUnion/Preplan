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
    //获得父类的父类iId属性，实际上是inventory的iId
     var row=parent.parent.$("#dg").datagrid("getSelected");
    var code=row.inventorySn;
    var idInventory=row.id;
     console.log(code);
     console.log(idInventory);
     
        $(function(){
        
        //重置
	$("#reset").click(function(){
		$("#ff").form("reset");
	});
	//提交 
	$('#submit').click(function(){
			$('#ff').form('submit', {    
			    url:'preplan_supply_save.action',  
                queryParams:{ code: code,
                              idInventory:idInventory,  
                 }, 
			    success:function(data){
			    	var result = eval('(' + data + ')');
			    	if(result.status=='ok'){
			    		parent.$.messager.alert("提示信息","添加成功！");
						$("#ff").form("reset");
						//关闭窗体
						parent.$("#winDetailAdd").window("close");
						//刷新dg
						parent.$("#dgDetail").datagrid("reload");
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
	        <label for="supplyName">资源名称:&nbsp;</label>   
	        <input id="supplyName" class="easyui-textbox" type="text" name="supplyName" data-options="required:true" />   
	    </div>   
	    <div style="margin: 15px;">   
	        <label for="supplyNumber">资源数量:&nbsp;</label>   
	        <input class="easyui-textbox" type="text" name="supplyNumber" data-options="required:true" />   
	    </div>
	    <div style="margin: 15px;">   
	        <label for="supplyUnit">资源单位:&nbsp;</label>   
	        <input class="easyui-textbox" type="text" name="supplyUnit" data-options="required:true" />   
	    </div>
	   
	      
	    <div style="margin-top: 25px;text-align:center">
	    	<a id="submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
	    	<a id="reset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a>  
	    </div>      
	</form> 	
 
    
	
</body>
</html>