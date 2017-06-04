
<input id="detailPlanSn" type="hidden" value="${planSn}"> 
 <!-- BEGIN THEME PANEL -->
<div class="portlet light bordered" id="blockui_sample_1_portlet_body">
	<div class="portlet-title">
		<div class="row">
			<div class="col-md-4 col-sm-6 col-xs-12">
				<p><strong>预案名字：</strong><span id="preplanNameSpan"></span></p>
			</div>
			<div class="col-md-4 col-sm-6 col-xs-12">
				<p><strong>预案编号：</strong><span id="preplanUIDSpan"></span></p>
			</div>
			<div class="col-md-4 col-sm-6 col-xs-12">
				<p><strong>预案分类：</strong><span id="preplanDomainNameSpan"></span></p>
			</div>
			<div class="col-md-4 col-sm-6 col-xs-12">
				<p><strong>编制时间：</strong><span id="preplanTimeSpan"></span></p>
			</div>
			<div class="col-md-4 col-sm-6 col-xs-12">
				<p><strong>编制部门：</strong><span id="preplanOrgSpan"></span></p>
			</div>
			<div class="col-xs-12">
				<p><strong>预案描述：</strong><span id="preplanDescSpan"></span></p>
			</div>
		</div>	
	</div>
	<div class="portlet-body">
		<div class="tabbable-line nav-justified">
		    <ul class="nav nav-tabs nav-justified">
		        <li class="active">
		            <a href="#planDetailPageMsg" data-toggle="tab"> 全案详情 </a>
		        </li>
		        <li>
		            <a href="#simplePlanDetailPageMsg" data-toggle="tab"> 简案详情 </a>
		        </li>
		        <li>
		            <a href="#flowChartDetailPageMsg" data-toggle="tab"> 流程图详情 </a>
		        </li>
		    </ul>                                        
			<div class="tab-content">
				<div class="tab-pane active" id="planDetailPageMsg">
					<div class="theme-panel hidden-xs hidden-sm" style="position:fixed">
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
				</div>
		       	<div class="tab-pane" id="simplePlanDetailPageMsg">
		        </div>
		        <div class="tab-pane" id="flowChartDetailPageMsg">
		            <p> Howdy, I'm in Section 3. </p>
		        </div>
			</div>
		</div>
	</div> 
</div>


 
 	
	

	<script>
	
	  $(function () {
	  		swal({title: '', text:'加载中，请稍后...<i class="fa fa-spinner fa-spin fa-fw"></i>',showConfirmButton: false, html: true   });
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
			//获得预案基本信息
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/plan/preplan/preplan_preplan_getUniqueByPreplanSn.action",
				dataType : "json",
				data : {
					ppSn:$('#detailPlanSn').val()
				},
				success : function(data) {	
					var obj=data[0];
					$('#preplanNameSpan').append(obj.preplanName);	
					$('#preplanUIDSpan').append(obj.preplanUID);		
					$('#preplanDomainNameSpan').append(obj.preplanDomainName);
					$('#preplanDescSpan').append(obj.preplanDesc);
					$('#preplanTimeSpan').append(obj.preplanTime);									
					getOrg(obj.preplanOrgId)
					
				},
				error: function(){
					sweetAlert("加载失败", "未知错误，请重试!", "error");									
				}
			});
			//获得全案布局
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/plan/preplan/preplan_pageMsg_getOrderPageMsg.action",
				dataType : "json",
				data : {
	
				},
				success : function(data) {					
					getPageLayout(data,1)	
				},
				error: function(){
					sweetAlert("加载失败", "未知错误，请重试!", "error");									
				}
			});
									
	  });
	 //****************全案Begin**************************************************
	  //全案    pd=1全案，pd=2简案
	  function getPageLayout(oldData,pd){	  	  	  
	  	var oldDataLength=oldData.length;
	  	
	  	for(var i=0;i<oldDataLength;i++){
	  		var htmlMsg='';
	  		var oldDataObject= oldData[i];
	  		var oldDataObjectSonL=oldDataObject.son.length;
	  		var oldDataObjectOrder=oldDataObject.order;
	  		var showOrder=oldDataObjectOrder.charAt(oldDataObjectOrder.length - 1);
  			htmlMsg=htmlMsg+'<div class="portlet box green" id="planDetailHead'+oldDataObjectOrder+'">'
					+	    '<div class="portlet-title">'
					+	        '<div class="caption" >'
					+	        +showOrder+'. '+oldDataObject.title+'</div>'
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
				if(pd==1){
					$('#planDetailPageMsg').append(htmlMsg);  	
				}else if(pd==2){
					$('#simplePlanDetailPageMsg').append(htmlMsg);  	
				}else{
				}		
					
	  	}
	  	getPageLayoutContent(pd)
	  	
	  }
	  //全案/简单预案 pd控制
	  function getPageLayoutContent(pd){
	  	var planSn=$('#detailPlanSn').val();
  		//获得布局内容
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/plan/preplan/preplan_module_queryModuleByPpsn.action",
			dataType : "json",
			data : {
				preplanSn:planSn,
				type:pd
			},
			success : function(data) {
				if(pd==1){//全案
					setPageLayoutContent(data);
				}else if(pd==2){//简案
					setSimplePageLayoutContent(data)
				}else{
				
				}					
			},
			error: function(){
				sweetAlert("加载失败", "未知错误，请重试!", "error");									
			}
		});
	  	
	  }
	  //全案
	  function setPageLayoutContent(oldData){

	  	var oldDataLength=oldData.rows.length;
	  	
	  	for(var i=0;i<oldDataLength;i++){
	  		var htmlMsg='';
	  		var oldDataObject= oldData.rows[i];
	  		htmlMsg=htmlMsg+oldDataObject.content;
			var contentId='#planSonDetailContent'+oldDataObject.order;
			$(contentId).append(htmlMsg);  		
	  	}
	  	//全案结束获得简案布局
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/plan/preplan/preplan_pageMsg_getOrderPageMsg.action",
			dataType : "json",
			data : {
				type:2
			},
			success : function(data) {	
				getPageLayout(data,2)		
			},
			error: function(){
				sweetAlert("加载失败", "未知错误，请重试!", "error");									
			}
		});
	  	
	  }
	  //****************全案End**************************************************
	  
	  //****************简单预案Begin**************************************************
	  function setSimplePageLayoutContent(oldData){

	  	var oldDataLength=oldData.rows.length;
	  	
	  	for(var i=0;i<oldDataLength;i++){
	  		var htmlMsg='';
	  		var oldDataObject= oldData.rows[i];
	  		htmlMsg=htmlMsg+oldDataObject.content;
			var contentId='#planDetailContent'+oldDataObject.order;
			$(contentId).append(htmlMsg);  		
	  	}
	  	swal.close();
	  
	  }
	  //****************简单预案End**************************************************
	  
	  //锚点
	  function changePage(order){	
	  	var divId="planDetailHead"+order;		
		document.getElementById(divId).scrollIntoView();	
	  }
	  
	  function getOrg(orgCode){
	  		$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/plan/preplan/preplan_department_getUniqueOrg.action",
				dataType : "json",
				data : {
					orgCode:orgCode
				},
				success : function(data) {									
					$('#preplanOrgSpan').append(data.orgName)
					
				},
				error: function(){
					sweetAlert("加载失败", "未知错误，请重试!", "error");									
				}
			});
	  }
	  
   </script> 