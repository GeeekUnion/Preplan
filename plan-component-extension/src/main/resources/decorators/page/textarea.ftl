 <textarea name="editor1" class="xheditor" style="width:100%;min-height: 450px; " id="xheditor"></textarea>
 <input id="planSn" type="hidden" value="${planSn}"> 
  <script type="text/javascript">
  	        function saveModule(){
        	
        	}        
        	function submitModule(url,order){
        		var xhedit=$('#xheditor').xheditor();
        		var planContent=xhedit.getSource();
        		var planSn=$('#planSn').val();
        		if(null===planContent || planContent===""){  
        			swal({   
        				title: "内容不能为空",   
        				timer: 2000,   
        				showConfirmButton: false 
        			});		
	
        		} else{
        		    if(null === planSn || planSn=="") {
        				swal('预案基本信息未编制', '要先编制预案基本信息才能编写该模块哦!', 'error');	 			
        			}        			        			
        			else{
        				submitModuleAjax(planContent,planSn,order,url);	
        			}
        		}	
        	}
        	
        	function submitModuleAjax(planContent,planSn,order,url){
        		var moduleId=0;
        		$.ajax({
					type : "POST",
					url:'${pageContext.request.contextPath}/plan/preplan/preplan_module_saveOrUpdateModule.action',
					dataType : "json",
					data : {
							id : moduleId,
							order:order,
							content:planContent,
							preplanSn:planSn
					},
					success : function(data) {	
						console.log(data.status);
						if(data=="\"error\""){
							swal('提交出错', '未知错误，请确定您已经登录!', 'error');	 	
						}else{
							location.href ="/plan/preplan/"+url+"?ppSn="+data.status.replace(/\"/g,"");     
						}													
					},
					error: function(){
							swal('提交出错', '未知错误，请确定您已经登录!', 'error');	 					
					}
				});
        	}
  </script>