<!-- BEGIN THEME PANEL -->
<div class="theme-panel hidden-xs hidden-sm">
    <div class="toggler"> </div>
    <div class="toggler-close"> </div>
    <div class="theme-options">
        <div class="theme-option theme-colors clearfix">
            <span> 编制目录 </span>
        </div>
        <div class="theme-option">
	        <div class="portlet light bordered">
	            <div class="portlet-body">
	                <div id="pageTree" class="tree-demo">
						
	                </div>
	            </div>
	        </div>  
        </div>
    </div>
</div>
 <input id="planSn" type="hidden" value="${planSn}"> 
 <input id="moduleOrder" type="hidden" value="${moduleOrder}">
 <input id="moduleOrderNext" type="hidden" value="${moduleOrderNext}">
<!-- END THEME PANEL -->  

  <script>
  	  //获得树
	  $(function () {
	        $.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/plan/preplan/preplan_pageMsg_getTree.action",
				dataType : "json",
				data : {
	
				},
				success : function(data) {
					$('#pageTree').jstree({ 'core' : {
					    'data' : data
						} });
				},
				error: function(){
					sweetAlert("加载失败", "未知错误，请重试!", "error");									
				}
			});
			
	  });
	  
	  //获得模块内容
	  $(function () {
			var planSn=$('#planSn').val();
			var moduleOrder=$('#moduleOrder').val().replace(/'/g,"");
			if(planSn=="" || moduleOrder=="null" || moduleOrder==""){
				
			}else{
				getModuleContent(planSn,moduleOrder);
			}	
			
	  });
	  function getModuleContent(planSn,moduleOrder){
	  	$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/plan/preplan/preplan_module_getModuleByPpsnOrder.action",
				dataType : "json",
				data : {
					preplanSn:planSn,
					order:moduleOrder
				},
				success : function(data) {
					var xhedit=$('#xheditor').xheditor();
					xhedit.setSource(data.moduleContent);
				},
				error: function(){
					sweetAlert("加载失败", "未知错误，请重试!", "error");									
				}
			});		
	  }
	  
	  
	  //网页跳转中转
	  function changePage(orderId){
	  	var planSn=$('#planSn').val();
	  	if(orderId=="01"){	  		
	       	if(null === planSn || planSn=="") {
	       		location.href ="/plan/preplan/plan_edit_base_msg.action"; 			
			}        			        			
			else{
				location.href ="/plan/preplan/plan_edit_base_msg.action"+"?ppSn="+planSn; 			
			}
	  		
	  	}else{
	  		if(orderId.length>3){
	  			getPageMsg(orderId,planSn);		
	  		}	
	  	}

	  }
	  //网页跳转
	  function getPageMsg(orderId,planSn){
	  	if(null === planSn || planSn=="") {
	       		location.href ="/plan/preplan/plan_edit_module.action"+"?code="+orderId; 					
		}        			        			
		else{
			location.href ="/plan/preplan/plan_edit_module.action"+"?ppSn="+planSn+"&code="+orderId; 		
		}		
	  }
  </script>                        
