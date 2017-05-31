
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
	            <div class="portlet-title">
	            </div>
	            <div class="portlet-body">
	                <div id="pageTree" class="tree-demo">
						
	                </div>
	            </div>
	        </div>  
        </div>
    </div>
</div>

<!-- BEGIN UNORDERED LISTS PORTLET-->
<div id="planDetailPageMsg"></div>
<!-- END UNORDERED LISTS PORTLET-->
 
 


	<script>
	
	  $(function () {
	  		//获得树
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
			//获得布局
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/plan/preplan/preplan_pageMsg_getOrderPageMsg.action",
				dataType : "json",
				data : {
	
				},
				success : function(data) {
					getPageLayout(data)	
				},
				error: function(){
					sweetAlert("加载失败", "未知错误，请重试!", "error");									
				}
			});
			
	  });
	  
	  function getPageLayout(oldData){	  	  	  
	  	var oldDataLength=oldData.length;
	  	
	  	for(var i=0;i<oldDataLength;i++){
	  		var htmlMsg='';
	  		var oldDataObject= oldData[i];
	  		var oldDataObjectSonL=oldDataObject.son.length;
  			htmlMsg=htmlMsg+'<div class="portlet box green">'
					+	    '<div class="portlet-title">'
					+	        '<div class="caption" id="planDetailTitle'+oldDataObject.order+'">'
					+	        +oldDataObject.order+'. '+oldDataObject.title+'</div>'
					+	        '<div class="tools">'
					+	            '<a href="javascript:;" class="collapse"> </a>'
					+	        '</div>'
					+	    '</div>'
					+	    '<div class="portlet-body" id="planDetailContent'+oldDataObject.order+'">';
					
					if(oldDataObjectSonL>0){
						for(var j=0;j<oldDataObjectSonL;j++){
							htmlMsg=htmlMsg+'<div class="portlet">'
								+			    '<div class="portlet-title">'
								+			        '<div class="caption" id="planDetailTitle'+oldDataObject.son[j].order+'"><h4>'
								+			            oldDataObject.son[j].title+'</h4></div>'
								+			        '<div class="tools">'
								+			            '<a href="javascript:;" class="collapse"> </a>'
								+			        '</div>'
								+			    '</div>'
								+			    '<div class="portlet-body" id="planDetailContent'+oldDataObject.son[j].order+'">'		
								+			    '</div>'
								+			'</div>'
						}
						
					}
															
					
					
				htmlMsg=htmlMsg+'</div>'
					+	'</div>';  		
					$('#planDetailPageMsg').append(htmlMsg);  		
	  	}
	  	
	  	//getPageLayoutContent();
	  }
	  
	  //锚点
	  function changePage(order){	
	  	var divId="#planDetailTitle"+order;		
		//document.getElementById(divId).scrollIntoView(true);	
	  }
   </script> 