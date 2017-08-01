
<input id="detailPlanSn" type="hidden" value="${planSn}"> 
 <!-- BEGIN THEME PANEL -->
<div class="portlet light bordered" id="blockui_sample_1_portlet_body">
	<div class="portlet-title" id="planDetailHead01">
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
			<div class="col-md-4 col-sm-6 col-xs-12">
				<p>
					<strong>
						<a  data-toggle="modal" href="#largeLog">
	                		<i class="fa fa-search"></i> 查看编制历史
	                	</a>
                	</strong>	
                </p>
			</div>
			<div class="col-xs-12">
				<p><strong>专家组：</strong><span id="preplanSpecialistSpan"></span></p>
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
					<div class="theme-panel hidden-xs hidden-sm">
					    <div class="toggler" style="position:fixed;top:30%;right:15px"> </div>
					    <div class="toggler-close" style="position:fixed;top:30%"> </div>
					    <div class="theme-options" style="position:fixed;top:30%">
					        <div class="theme-option theme-colors clearfix">
					            <span> 目录 </span>
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
		            
		        </div>
			</div>
		</div>
	</div> 
</div>


         <!-- .modal -->
        <div class="modal fade bs-modal-lg" id="largeLog" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">修订历史</h4>
                    </div>
                    <div class="modal-body">
						
						<table id="myLogListTable" class="display" cellspacing="0" width="100%">
					        <thead>
					            <tr>
					                <th>预案版本号</th>
					                <th>修订时间 </th>
					                <th>修订人 </th>
					            </tr>
					        </thead>
					
					    </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn red btn-outline" data-dismiss="modal">关闭</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->


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
					$('#preplanSpecialistSpan').append(obj.preplanSpecialist);													
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
			var planSn=$('#detailPlanSn').val();
			//查询修改历史
			queryLog(planSn);
			//获取流程图
			setflowChartLayoutContent(planSn);
									
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
	  		var showOrder=oldDataObject.titleNum;
	  		if(oldDataObjectOrder!=="01"){
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
							var oldDataObjectSon=oldDataObject.son[j];
							htmlMsg=htmlMsg+'<div class="portlet" id="planDetailHead'+oldDataObjectSon.order+'">'
								+			    '<div class="portlet-title">'
								+			        '<div class="caption" id="planSonDetailTitle'+oldDataObjectSon.order+'"><h4>'
								+			            +oldDataObjectSon.titleNum+'. '+oldDataObjectSon.title+'</h4></div>'
								+			        '<div class="tools">'
								+			            '<a href="javascript:;" class="collapse"> </a>'
								+			        '</div>'
								+			    '</div>'
								+			    '<div class="portlet-body" id="planSonDetailContent'+oldDataObjectSon.order+'">'		
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
	  
	  
	  //****************流程图Begin**************************************************
	  function setflowChartLayoutContent(planSn){
			$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/plan/preplan/preplan_flowChartContent_getFlowChartContentByPreplanSn.action",
					dataType : "json",
					data : {
						preplanSn:planSn						
					},
					success : function(data) {
						$('#flowChartDetailPageMsg').html(data.content);	      
					},
					error: function(){
							
					}
					
			});	
	
			 		
	  }
	  //****************流程图End**************************************************
	  
	  //锚点
	  function changePage(order){	
	  	var divId="planDetailHead"+order;		
		document.getElementById(divId).scrollIntoView();	
	  }
	 
    //获取修改记录
	function queryLog(planSn){		
		 $('#myLogListTable').dataTable( {
					"ajax": {
					    "url": "${pageContext.request.contextPath}/plan/preplan/preplan_preplanLog_queryListByPreplanSn.action",
					    "type": "POST",
					    "data":{
							"preplanSn":planSn
					    }
					},
				  	"deferRender": true,
				  	"searching": true,
				  	"autoWidth": true,
				  	"processing": true,
				  	"destroy": true,//如果需要重新加载的时候请加上这个
			        "columns": [
	                    
	                    { "data": "preplanVersion" },
	                    { "data": "preplanLogTime"},
	                    { "data": "personName"}                  
	                ],			        
			        "oLanguage": {
			            "sLengthMenu": "每页显示 _MENU_ 条",
			            "sZeroRecords": "没有找到符合条件的数据",
			            "sInfo": "当前第 _START_ - _END_ 条　共计 _TOTAL_ 条",
			            "sInfoEmpty": "没有记录",
			            "sInfoFiltered": "(从 _MAX_ 条记录中过滤)",
			            "sSearch": "搜索",
			            "sProcessing": "数据加载中...",
			            "oPaginate": {
			                "sFirst": "首页",
			                "sPrevious": "上一页",
			                "sNext": "下一页",
			                "sLast": "尾页"
			            }
			        }
				});		
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