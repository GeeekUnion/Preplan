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
    	
    	//下拉框       	
    	$(function (){
    		
    		//预案分类
			$('#ppe_search').combobox({    
			    url:'preplan_domain_queryAllDomain.action',    
			    valueField:'domain_sn',    
			    textField:'domain_name'   
			});
			//预案部门
			$('#ppe_dept_search').combobox({    
			    url:'preplan_department_queryAllDept.action',    
			    valueField:'id',    
			    textField:'DeptName'   
			});
			   
		});
		//输入框
		$(function (){
			$('#ppe_input1').textbox({	
				    required:true,
				    missingMessage:'此输入框不能为空！'			         
			});
			$('#ppe_input2').textbox({	
			    required:true,
			    multiline:true,
			    missingMessage:'此输入框不能为空！'			         
			});	
		});
		
		//确认按钮
    	$(function (){
			$('#submitBtn').linkbutton({    
			    iconCls: 'icon-ok',
			    width:250,
			    height:50,   
			});  			   
		});
		/*------------------分割线-----------------*/
				

		//数据网格
		//任务表格
		$(function (){
			$('#ppe_mission_dg').datagrid({
				rownumbers : true,
				singleSelect:true,       
			    columns:[[    
			        {field:'mission_sn',title:'任务序号',width:300},    
			        {field:'misssion_name',title:'任务名称',width:300},    
			        {field:'respon_dept',title:'责任单位',width:300,},
			        {field:'edit',title:'操作',width:150,align:'center'}    
			    ]],
			    toolbar: [{
			    	text:'新添一行',
					iconCls: 'icon-add',					
					handler: //任务表格添加新行
							function addNewRow(){
								var i=parseInt(document.getElementById('hiddenMisLength').value);
								var j=i+1;
								$('#ppe_mission_dg').datagrid('appendRow',{
									mission_sn:'<input id="mission_sn' + j + '" class="misinput" name="mission_sn" >',
									misssion_name:'<input id="mission_name' + j + '" class="misinput" name="mission_name" >',
									respon_dept:'<input id="respon_dept' + j + '" class="missearch" name="respon_dept" value="选择负责部门">',
									edit:'<a class="misbtn" onclick="addSrcRow(' + j + ')" href="#">分配资源</a>'
								});
								$('#respon_dept'+j).combobox({    
								    url:'preplan_department_queryAllDept.action',    
								    valueField:'id',    
								    textField:'DeptName'  
								});
									$('.misbtn').linkbutton({    
									iconCls: 'icon-add'   
								}); 
								$('.misinput').textbox({    
					      			required:true,
									missingMessage:'此输入框不能为空！'	
								})
																					
					 			document.getElementById('hiddenMisLength').value=j;			
							} 
				}],			    
			    data: [
					{mission_sn:'<input id="mission_sn1" class="misinput" name="misssion_sn">',
					misssion_name:'<input id="mission_name1" class="misinput" name="misssion_name">',
					respon_dept:'<input id="respon_dept1" class="missearch" name="respon_dept" value="选择负责部门">',
					edit:'<a class="misbtn" onclick="addSrcRow(1)" href="#">分配资源</a>'}
				],
				onLoadSuccess:function(){
					$('#respon_dept1').combobox({    
					    url:'preplan_department_queryAllDept.action',    
					    valueField:'id',   
					    textField:'DeptName'   
					});
					$('.misbtn').linkbutton({    
					    iconCls: 'icon-add'   
					});
					$('.misinput').textbox({    
		      			required:true,
						missingMessage:'此输入框不能为空！'	
					})  
				},							
		        
			}); 
		})
		
		/*------------------分割线-----------------*/
		//资源表格
		$(function (){
			$('#ppe_src_dg').datagrid({
				rownumbers:true,
				singleSelect:true,       
			    columns:[[     
			        {field:'src_name',title:'资源',width:300},    
			        {field:'src_number',title:'数量',width:300,},
			        {field:'src_unit',title:'单位',width:300}
			    ]],			    			   
		        
			}); 
		})
		
		//资源表格添加新行
		function addSrcRow(i){
			//存储资源对应的任务编号		
			var j=parseInt(document.getElementById('hiddenSrcLength').value);
			var k=j+1;
			document.getElementById('hiddenSrcLength').value=k;
			$('#ppe_src_dg').datagrid('appendRow',{
				src_name:'<input id="src_name' + j + '" class="srcsearch1" name="src_name' + i + '" value="选择资源">',
				src_number:'<input id="src_number' + i + '" class="srcinput" name="src_number' + i + '" class="easyui-textbox" value="">',
				src_unit:'<input id="src_unit' + i + '" class="srcinput" name="src_unit' + i + '" class="easyui-textbox" value="" >'
			});		
			$('#src_name'+j).combobox({
				url:'preplan_preplan_queryAllSrc.action',     					 
				valueField:'SrcName',    
				textField:'SrcName',
				groupField:'group'
					    
			});
				
		    $('.srcbtn').linkbutton({    
					iconCls: 'icon-add'   
			}); 
			
			$('.srcinput').textbox({    
		      			required:true,
						missingMessage:'此输入框不能为空！'	
					}) 
		}	
		/*------------------分割线-----------------*/
		function submitPreplan(){
		$.messager.defaults = { ok:"确定", cancel:"取消" , width:300 ,};
		//确认对话框		
		$.messager.confirm('确认提交','您确认填制好预案并提交？',
			function(r){
			//如果是，则提交    
		    if (r){ 
		       
		     		//----任务数据处理----		
					//获取存好的任务个数
					var x= parseInt(document.getElementById('hiddenMisLength').value);
					var misGroup = new Array();
					for(var a=1;a<=x;a++){
							
						//获取任务名字
						var misId1='mission_sn'+a;
						var misId2='mission_name'+a;
						var misId3='respon_dept'+a;			
						//任务存入数组
						misGroup.push(a);	
						misGroup.push($('#'+misId1).textbox('getValue'));
						misGroup.push($('#'+misId2).textbox('getValue'));
						misGroup.push($('#'+misId3).combobox('getValue'));			
			
					}
					
					
					
					//----资源数据处理----
					
					//获取存好的资源个数（对应的任务）
					var i= parseInt(document.getElementById('hiddenMisLength').value);
					var srcGroup = new Array();
					for(var j=1;j<=i;j++){
						var srcName1='src_name'+j;
						var srcName2='src_number'+j;
						var srcName3='src_unit'+j;
						//资源数组长度
						var l = document.getElementsByName(srcName3).length;
						//如果存在该资源长度，则取值
						if(l>0){
							for(var k=0;k<l;k++){				
							//资源存入数组
							srcGroup.push(j);			
							srcGroup.push(document.getElementsByName(srcName1)[k].value);
							srcGroup.push(document.getElementsByName(srcName2)[k].value);
							srcGroup.push(document.getElementsByName(srcName3)[k].value);
							
						}
						}			
					}
					//预案名字
					var preplanName=$('#ppe_input1').textbox('getValue');
					//预案描述
					var preplanDesc=$('#ppe_input2').textbox('getValue');
					//预案类型
					var preplanType=$('#ppe_search').combobox('getValue');
					//预案责任单位
					var preplanDept=$('#ppe_dept_search').combobox('getText');
					
					$.ajax({
						type : "POST",
						url : "preplan_preplan_savePreplan.action",
						dataType : "json",
						traditional : true,
						data : {
								ppName : preplanName,
								ppDesc : preplanDesc,
								ppType : preplanType,
								ppDept : preplanDept,
								misArray : misGroup,
								srcArray : srcGroup
								},
						success : function(jsonObject) {
							var pd=jsonObject;
							if(pd == "error"){
								$.messager.alert('提示','保存出错，请重试！','error');
							}
							else if(pd == "ok" ){
								$.messager.alert('提示','保存成功！','info',
									function() {
										window.location.reload()							
									});
							}
							else{
								$.messager.alert('提示','未知错误','error');
							}						
							
						}
						});      
		    }    
		});
							
		}	
		
		
		
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
    <!--表格-->
    <div class="btm-area">
		<p class="title">预案定制</p>
    	<div id="ppe_preplan" class="pp_preplan">   
		    <div class="border">   
		       <span class="label_box"><label for="ppe_preplan_name" >预案名称:</label></span>  
		        <span> 
		        	<input id="ppe_input1" class="easyui-validatebox" name="ppe_preplan_name" />   
		        </span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppe_preplan_type">预案分类:</label></span>     
		        <span><input id="ppe_search" name="ppe_preplan_type" value="请选择预案类型"></span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppe_preplan_dept">责任单位:</label></span>     
		        <span><input id="ppe_dept_search" name="ppe_preplan_dept" value="请选择责任单位"></span>
		    </div>
		    <div class="border">   
		        <span class="label_box"><label for="ppe_preplan_desc">预案描述:</label></span>
		        <input id="ppe_input2" class="easyui-validatebox" name="ppe_preplan_desc" />      
		        <span></span>
		    </div>
		    <div class="border">   
		        <div class="label_box"><label for="ppe_preplan_proce">预案流程:</label></div>     
		        <div>
		        	<table id="ppe_mission_dg"> </table> 
		        </div>
		    </div>
		    <div class="border">   
		        <div class="label_box"><label for="ppe_preplan_src">所需资源:</label></div>     
		        <div>
		        	<table id="ppe_src_dg"></table>  
		        </div>
		    </div>          
		</div> 
    </div>
	<input id="hiddenMisLength" type="hidden" value="1"/>
	<input id="hiddenSrcLength" type="hidden" value="0"/>
	<div style="width:100%">
		<a id="submitBtn" href="#" onclick="submitPreplan()" style="margin:20px auto">提交</a>
	</div>
	  
</body>
</html>