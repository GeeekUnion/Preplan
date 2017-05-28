 <textarea name="editor1" class="xheditor" style="width:100%;min-height: 450px; " id="xheditor"></textarea>
  <script type="text/javascript">
  	        function saveModule(order){
        		console.log(order)
        	}        
        	function submitModule(order){
        		var xhedit=$('#xheditor').xheditor();
        		var planContent=xhedit.getSource();
        		var planSn=$('#planSn').val();
        		if(null===planContent || planContent===""){  
        			swal({   
        				title: "内容不能为空",   
        				timer: 1000,   
        				showConfirmButton: false 
        			});		
	
        		} else{
        		    if(null === planSn || planSn=="") {
        				swal('预案基本信息未编制', '要先编制预案基本信息才能编写该模块哦!', 'error');	 			
        			}        			        			
        			else{
        				submitModuleAjax(planContent,planSn,order);	
        			}
        		}	
        	}
        	
        	function submitModuleAjax(planContent,planSn,order){
        		var moduleOrder=$('#moduleOrder').val().replace(/'/g,"");
        		var moduleId=0;
        		$.ajax({
					type : "POST",
					url:'${pageContext.request.contextPath}/plan/preplan/preplan_module_saveOrUpdateModule.action',
					dataType : "json",
					data : {
							id : moduleId,
							order:moduleOrder,
							content:planContent,
							preplanSn:planSn
					},
					success : function(data) {	
						console.log(data.status);
						if(data=="\"error\""){
							swal('提交出错', '未知错误，请确定您已经登录!', 'error');	 	
						}else{
							getPageMsg(order,data.status)  	
						}													
					},
					error: function(){
							swal('提交出错', '未知错误，请确定您已经登录!', 'error');	 					
					}
				});
        	}
  </script>