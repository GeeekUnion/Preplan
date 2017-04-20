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
	<script type="text/javascript" src="${getMC ("")}/js/esui.js"></script>
	
	<link rel="stylesheet" type="text/css" href="${getTheme('default','')}/kindeditor/themes/default/default.css"/>
	<script type="text/javascript" src="${getTheme('default','')}kindeditor/kindeditor-min.js"></script>
	<script type="text/javascript" src="${getTheme('default','')}kindeditor/lang/zh_CN.js"></script>

    <script type="text/javascript">
 	//下拉框       	
    	$(function (){
    		
    		//预案分类
			$('#ppl_domain_search').combobox({    
			    url:'preplan_domain_queryAllDomain.action',    
			    valueField:'domain_sn',    
			    textField:'domain_name'   
			});
			//预案部门
			$('#ppl_dept_search').combobox({    
			    url:'preplan_department_queryAllDept.action',    
			    valueField:'DeptName',    
			    textField:'DeptName'   
			});
			   
		});
		//输入框
		$(function (){
			$('#ppl_input1').textbox({	
				    required:true,
				    missingMessage:'此输入框不能为空！'			         
			});
			$('#ppe_input3').textbox({	
				    required:true,
				    missingMessage:'此输入框不能为空！'			         
			});
		});
		
		//确认按钮
    	$(function (){
			$('#pplSubmitBtn').linkbutton({    
			    iconCls: 'icon-ok',
			    width:250,
			    height:50,   
			});  			   
		});
    	
    	$(function(){
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
    	
    	//自定义显示不能为空
		function contentIsEmpty(){
			$('#contentTip').tooltip('show');
			setTimeout("$('#contentTip').tooltip('hide');",3000)	
		}
    	
    	/*------------------编辑器初始化-----------------*/    	
		var editorDesc;		
		//初始化富文本		
		KindEditor.ready(function(K) {
			editorDesc = K.create('textarea[name="ppe_preplan_desc"]', {
				resizeType : 1,
				allowPreviewEmoticons : false,
				allowImageUpload : false,
				items : [
					'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
					'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
					'insertunorderedlist', '|', 'emoticons', 'image', 'link']
			});
		});
    	
    	function updatePreplanMsg(){
    		var id=document.getElementById('ppl_ppId').value;//id
    		var ppl_preplan_name=document.getElementById('ppl_input1').value;//预案名称
    		var preplanUid=$('#ppe_input3').textbox('getValue');//预案编号
    		var ppl_preplan_desc=editorDesc.html();//预案描述
    		var ppl_preplan_dept=$('#ppl_dept_search').textbox('getValue');//预案负责单位
    		var pd=document.getElementById('ppl_preplan_typepd').value;//初始预案分类
    		var ppl_preplan_type=$('#ppl_domain_search').textbox('getValue');//提交时预案分类
    		var type="空值";
    		if(pd != ppl_preplan_type){
    			var type=ppl_preplan_type;
    		}
    		
	    	var isValid1 = $('#ppl_input1').textbox('isValid');
			var isValid2 = editorDesc.isEmpty();
			var isValid3 = $('#ppe_input3').textbox('isValid');
			var isValid4 = $('#ppl_domain_search').combobox('isValid');
			var isValid5 = $('#ppl_dept_search').combobox('isValid');
    		
    		if(isValid1==false || isValid2==true || isValid3==false || isValid4==false || isValid5==false){
		    	if(isValid1==false){
		    		$("#ppe_input1").next('span').find('input').focus();
		    		return isValid1;
		    	};
		    	if(isValid2==true){
		    		contentIsEmpty();
		    		return false;
		    	};
		    	if(isValid3==false){
		    		$("#ppe_input3").next('span').find('input').focus();
		    		return isValid3;
		    	};
		    	if(isValid4==false){
		    		$("#ppe_search").next('span').find('input').focus();
		    		return isValid4;
		    	};
		    	if(isValid5==false){
		    		$("#ppe_dept_search").next('span').find('input').focus();
		    		return isValid5;
		    	};										
			}else{
				$.messager.confirm('确认提交','确认修改？',function(r){     
				  if (r){     
				      //保存任务基础信息
						$.ajax({
							type : "POST",
							url : "preplan_preplan_updatePreplanMsg.action",
							dataType : "json",
							data : {
									code :id,//预案ID
									ppName : ppl_preplan_name,//预案名称
									ppDesc : ppl_preplan_desc,//预案描述
									ppDept : ppl_preplan_dept,//预案描述
									ppUid  : preplanUid,//预案编码
									ppType : type //预案描述
									
							},
							success : function() {
									$.messager.alert('提示','修改成功！','info',
										function() {
											window.location.reload()							
										}); 								
								},
							error: function(){
									$.messager.alert('错误','修改出错！','error');								
							}
				  		})    
				   }
				})
			}   
    	}
    	
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
   
  
<div class="btm-area">
    	<div id="ppe_preplan" class="pp_preplan">   
		    <div class="border">   
		       <span class="label_box"><label for="ppe_preplan_name" ><strong>预案名称:</strong></label></span>  
		        <span> 
		        	<input id="ppl_input1" name="ppl_preplan_name" value="${pp_name}"/>   
		        </span>
		    </div>
		    <div class="border">   
		       <span class="label_box"><label for="ppe_preplan_uid" ><strong>预案编码:</strong></label></span>  
		        <span> 
		        	<input id="ppe_input3" class="easyui-validatebox" name="ppe_preplan_uid" value="${pp_uid}"/>   
		        </span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppe_preplan_type"><strong>预案分类:</strong></label></span>     
		        <span><input id="ppl_domain_search" name="ppl_preplan_type" value="${pp_type}"></span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppe_preplan_dept"><strong>责任单位:</strong></label></span>     
		        <span><input id="ppl_dept_search" name="ppl_preplan_dept" value="${pp_dept}"></span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppe_preplan_desc" id="contentTip"><strong>预案描述:</strong></label></span>		            
		        <span>
		        	<textarea id="ppe_input2" name="ppe_preplan_desc" style="width:600px;height:300px;visibility:hidden;display: block;">${pp_desc}</textarea>		        
		        </span>
		    </div>        
		</div>
		<div style="width:100%">
			<a id="pplSubmitBtn" href="#" onclick="updatePreplanMsg()" style="margin:20px auto">提交</a>
		</div> 
</div>	
		<input id="ppl_ppId" type="hidden" value="${pp_id}">
		<input id="ppl_preplan_typepd" type="hidden" value="${pp_type}">
   
   
</body>
</html>