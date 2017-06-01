
<input id="detailPlanSn" type="hidden" value="${planSn}"> 
 <!-- BEGIN THEME PANEL -->
<div class="theme-panel hidden-xs hidden-sm" style="position:fixed">
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
					swal({title: '', text:'加载中，请稍后...<i class="fa fa-spinner fa-spin fa-fw"></i>',showConfirmButton: false, html: true   });
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
  			htmlMsg=htmlMsg+'<div class="portlet box green" id="planDetailHead'+oldDataObject.order+'">'
					+	    '<div class="portlet-title">'
					+	        '<div class="caption" >'
					+	        +oldDataObject.order+'. '+oldDataObject.title+'</div>'
					+	        '<div class="tools">'
					+	            '<a href="javascript:;" class="collapse"> </a>'
					+	        '</div>'
					+	    '</div>'
					+	    '<div class="portlet-body" id="planDetailContent'+oldDataObject.order+'">';
					
					if(oldDataObjectSonL>0){
						for(var j=0;j<oldDataObjectSonL;j++){
							htmlMsg=htmlMsg+'<div class="portlet" id="planDetailHead'+oldDataObject.son[j].order+'">'
								+			    '<div class="portlet-title">'
								+			        '<div class="caption" id="planSonDetailTitle'+oldDataObject.son[j].order+'"><h4>'
								+			            oldDataObject.son[j].title+'</h4></div>'
								+			        '<div class="tools">'
								+			            '<a href="javascript:;" class="collapse"> </a>'
								+			        '</div>'
								+			    '</div>'
								+			    '<div class="portlet-body" id="planSonDetailContent'+oldDataObject.son[j].order+'">'		
								+			    '</div>'
								+			'</div>'
						}
						
					}
															
					
					
				htmlMsg=htmlMsg+'</div>'
					+	'</div>';  		
					$('#planDetailPageMsg').append(htmlMsg);  		
	  	}
	  	
	  	getPageLayoutContent();
	  }
	  
	  function getPageLayoutContent(){
	  	var planSn=$('#detailPlanSn').val();
  		//获得布局内容
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/plan/preplan/preplan_module_queryModuleByPpsn.action",
			dataType : "json",
			data : {
				preplanSn:planSn
			},
			success : function(data) {
				setPageLayoutContent(data);	
			},
			error: function(){
				sweetAlert("加载失败", "未知错误，请重试!", "error");									
			}
		});
	  	
	  }
	  
	  function setPageLayoutContent(oldData){

	  	var oldDataLength=oldData.rows.length;
	  	
	  	for(var i=0;i<oldDataLength;i++){
	  		var htmlMsg='';
	  		var oldDataObject= oldData.rows[i];
	  		htmlMsg=htmlMsg+oldDataObject.content;
			var contentId='#planSonDetailContent'+oldDataObject.order;
			$(contentId).append(htmlMsg);  		
	  	}
	  	swal.close();
	  }
	  
	  //锚点
	  function changePage(order){	
	  	var divId="planDetailHead"+order;		
		document.getElementById(divId).scrollIntoView();	
	  }
   </script> 