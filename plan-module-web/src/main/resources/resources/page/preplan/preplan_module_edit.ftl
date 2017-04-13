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
	    $.extend($.fn.validatebox.defaults.rules, {    
		    minLength: {    
		        validator: function(value, param){    
		            return value.length >= param[0];    
		        },    
		        message: '输入字符需大于5！'   
		    }    
		});
		
		
		var editor;
		$(function(){
			//初始化输入框
			resetInput();	
			
			//初始化富文本		
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					resizeType : 1,
					allowPreviewEmoticons : false,
					allowImageUpload : false,
					items : [
						'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', 'image', 'link']
				});
			});
			
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
		

		
		
    	function resetff(){
			$("#ff").form("reset");
			editor.html('');
			
		};
		
        //初始化输入框
		function resetInput(){			
			var moduleId=$('#moduleId').val();
			if(typeof(moduleId)==="undefined" || moduleId==0){				
				$('#title_input').textbox({	
				    required:true,
				    missingMessage:'此输入框不能为空！',
				    label: '标题:',                
				    labelPosition: 'top',			         
				});				
			}else{
				$.ajax({
					type : "POST",
					url:'${pageContext.request.contextPath}/plan/preplan/preplan_module_getModuleById.action',
					dataType : "json",
					data : {
							id : moduleId
					},
					success : function(data) {	
							$('#title_input').val(data.title);						
							$('#title_input').textbox({	
							    required:true,
							    missingMessage:'此输入框不能为空！',
							    label: '标题:',                
							    labelPosition: 'top',			         
							});							
							editor.appendHtml(data.content);														
					},
					error: function(){
							console.log("error")								
					}
				});
			}				
		}
		  
		function submitff(){
			$.messager.progress();	// 显示进度条
			$('#ff').form('submit', {
				url: '${pageContext.request.contextPath}/plan/preplan/preplan_module_saveOrUpdateModule.action',
				onSubmit: function(param){
					param.content=editor.html();
					var moduleId=$('#moduleId').val();
					if(typeof(moduleId)==="undefined"){
					
					}else{
						param.id= moduleId;
					}
					
					var isValid = $(this).form('validate');
					var isEmpty = editor.isEmpty();
					if (!isValid || isEmpty){
						$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
						if(isEmpty){
							contentIsEmpty()			
						}
						return false;	// 返回false终止表单提交
					}
					
				},
				success: function(){
					$.messager.progress('close');	// 如果提交成功则隐藏进度条									
					$.messager.alert('提示','保存成功！','info', 
						function(){
							getCloseModuleWin();					
						}											
					);
				}
			});
		}	
		
		function getCloseModuleWin(){  
			console.log(window.parent.closeModuleWin()); 
		}	
		function contentIsEmpty(){
			$('#contentTip').tooltip('show');
			setTimeout("$('#contentTip').tooltip('hide');",3000)	
		} 		
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
	<form id="ff" method="post" style="display:table;width:400px;margin:10px auto;"> 
	  <div style="display:table-cell;vertical-align: middle;">  
	    <div style="margin-top:25px;margin-bottom:15px">     
	        <input id="title_input" type="text" name="title" style="width:400px;" value=""/>   
	    </div>   
	    <div style="margin-bottom:15px;">   
	    	<label id="contentTip" for="content">内容:</label>   	    	  
	    	<textarea id="mul_input" name="content" style="width:600px;height:300px;visibility:hidden;display: block;"></textarea>       
	    </div>
	    <div style="margin-bottom:25px;text-align:center">	    	  
	    	<a id="reset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'" style="width:100px" onclick="resetff()">清空</a>
	    	<a id="submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"  style="width:100px" onclick="submitff()">确定</a>  
	    </div> 
	 </div>       
	</form> 
	<input id="moduleId" type="hidden" value="${moduleId}">
	
</body>

</html>