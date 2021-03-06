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
					type:2
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
	  
	  
	  
	  
	  //网页跳转中转
	  function changePage(orderId){
	  	var planSn=$('#planSn').val();
	  	getPageMsg(orderId,planSn);		
	  }
	  //网页跳转
	  function getPageMsg(orderId,planSn){
	  	if(null === planSn || planSn=="") {
	       		location.href ="/plan/preplan/plan_edit_simple_plan.action"+"?code="+orderId; 					
		}        			        			
		else{
			location.href ="/plan/preplan/plan_edit_simple_plan.action"+"?ppSn="+planSn+"&code="+orderId; 		
		}		
	  }
  </script>                        
