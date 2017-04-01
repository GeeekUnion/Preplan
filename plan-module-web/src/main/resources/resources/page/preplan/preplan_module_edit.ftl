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
	    $.extend($.fn.validatebox.defaults.rules, {    
		    minLength: {    
		        validator: function(value, param){    
		            return value.length >= param[0];    
		        },    
		        message: '输入字符需大于5！'   
		    }    
		});
    	function resetff(){
			$("#ff").form("reset");
		};
        //多行输入框
		$(function (){
			$('#mul_input').textbox({	
			    validType:'minLength[5]',
			    multiline:true,
			    label: '内容:',                
			    labelPosition: 'top',			         
			});
			$('#title_input').textbox({	
			    required:true,
			    missingMessage:'此输入框不能为空！',
			    label: '标题:',                
			    labelPosition: 'top',			         
			});				
		});  
		function submitff(){
			$.messager.progress();	// 显示进度条
			$('#ff').form('submit', {
				url: '${pageContext.request.contextPath}/plan/preplan/preplan_module_queryModuleByPpsn.action',
				onSubmit: function(){
					var isValid = $(this).form('validate');
					if (!isValid){
						$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
					}
					return isValid;	// 返回false终止表单提交
				},
				success: function(){
					$.messager.progress('close');	// 如果提交成功则隐藏进度条
				}
			});
		}		 		
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
	<form id="ff" method="post" style="display:table;width:400px;margin:10px auto;"> 
	  <div style="display:table-cell;vertical-align: middle;">  
	    <div style="margin-top:25px;margin-bottom:15px">     
	        <input id="title_input" type="text" name="title" style="width:400px;"/>   
	    </div>   
	    <div style="margin-bottom:15px;">     
	        <input id="mul_input" type="text" name="content" style="height:150px;width:400px;"/>   
	    </div>
	    <div style="margin-bottom:25px;text-align:center">	    	  
	    	<a id="reset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'" style="width:100px" onclick="resetff()">重置</a>
	    	<a id="submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  style="width:100px" onclick="submitff()">确定</a>  
	    </div> 
	 </div>       
	</form> 
</body>
</html>