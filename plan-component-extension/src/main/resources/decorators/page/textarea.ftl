 <textarea name="editor1" class="xheditor" style="width:100%;min-height: 450px; " id="xheditor"></textarea>
  <script type="text/javascript">
  	        function saveModule(order){
        		submitModule(order)//此处order为此页面order
        	}  
        	//此处order为下页面order，传入此页面则不进入下页面      
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
						//console.log(data.status);
						if(data=="\"error\""){
							swal({    title: "提交出错!",    text: "未知错误，请确定您已经登录!",   type: "error",    confirmButtonText: "确认"  });	
						}else{
							if(order==moduleOrder){
							    var url=window.location.pathname;
                        		url=url+"?ppSn="+data.status+"&code="+moduleOrder;
                        		history.replaceState(null, "", url);     
                        		swal({title: "保存成功!",type: "success",confirmButtonText: "确认"});
							}else{
								//判断是否为末尾
								if(order=="0033"){
									//触发完成编制事件
									overPlan(planSn);			
								}else{
									getPageMsg(order,data.status)  	
								}	
							}														
						}													
					},
					error: function(){
							swal({    title: "提交出错!",    text: "未知错误，请确定您已经登录!",   type: "error",    confirmButtonText: "确认"  });				
					}
				});
        	}
        	
        	//编制完成
        	function overPlan(planSn){     		
        		swal({title: "编制设置中，请勿关闭页面...", type: "info", showConfirmButton: false  });        		        		
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/plan/preplan/preplan_preplan_updatePreplanStatus.action",
					dataType : "json",
					data : {
						ppSn:planSn,
						preplanStatus:"待审核"
					},
					success : function(data) {
		                swal({       
							title:"",
							text: '完成编制,2秒后跳转回首页...如果没有跳转<a href="${pageContext.request.contextPath}/plan/preplan/plan_index.action" style="color:#F8BB86">请点击此处跳转</a>',          
							showConfirmButton: false,
							html: true   
							} 
			    		); 
			    		setTimeout(function(){
	                       location.href ="/plan/preplan/plan_index.action"; 
	                    },2000)       
					},
					error: function(){
						sweetAlert("加载失败", "未知错误，请登录重试!", "error");									
					}
				});	
        	}
  </script>