<!-- BEGIN EXAMPLE TABLE PORTLET-->
<div class="portlet box green">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-globe"></i>预案审核列表</div>
        <div class="actions">


        </div>
    </div>
    
    <div class="portlet-body" id="">
		<table id="planListTable" class="display" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	                <th>预案编号</th>
	                <th>预案名称 </th>
	                <th>预案类别 </th>
	                <th>灾害类型 </th>
	                <th>负责部门</th>
	                <th>状态 </th>
	                <th>版本号 </th>
	                <th>日期 </th>                
	                <th>操作</th>
	            </tr>
	        </thead>
	
	    </table>
	</div>
		  
    
</div>
<!-- END EXAMPLE TABLE PORTLET-->  

       	<script>         
			$(document).ready(function() {
				loadPlan()
			} );
			function loadPlan(){
				$('#planListTable').dataTable( {
					"ajax": {
					    "url": "${pageContext.request.contextPath}/plan/preplan/preplan_preplan_queryPreplanReviewList.action",
					    "type": "POST",
					    "data": {
					    }
					},
				  	"deferRender": true,
				  	"searching": true,
				  	"processing": true,
				  	"destroy": true,//如果需要重新加载的时候请加上这个
			        "columns": [
	                    { "data": "preplanUid", align:"center" },
	                    { "data": "preplanName" },
	                    { "data": "preplanClassify" },
	                    { "data": "preplanType" },
	                    { "data": "responDept" },
	                    { "data": "status" },
	                    { "data": "preplanVersion" },
	                    { "data": "preplanTime" },
	                    { "formatNumber": "preplanTime" }	                    
	                ],
	                "columnDefs": [ {
			            "targets": -1,//最后一列
			            "data": null,
			            render: function(data, type, row, meta) {
			            	var myHtml="";
			            	 if(row.status=="待审核" || row.status=="修订待审核"){
			            	 	myHtml=myHtml+'<button  class="btn blue"onclick="getPlanDetail(\''+row.preplanSn+'\')">'
		                                      +  			'<i class="fa fa-search">审核</i>'
		                                      +      '</button>'
			            	 }else if(row.status=="申请修订"){
			            	 	myHtml=myHtml+'<button  class="btn green"onclick="checkPlanOk(\''+row.preplanSn+'\')">'
		                                      +  			'<i class="fa fa-check">同意修订</i>'
		                                      +      '</button>'	
		                                      +'<button  class="btn red"onclick="checkPlanReject(\''+row.preplanSn+'\')">'
		                                      +  			'<i class="fa fa-times">不同意修订</i>'
		                                      +      '</button>'		
			            	 }else{
			            	 
			            	 }
				             
							return 	myHtml;

				        }
			        } ],
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
			
			
			
			
			function getPlanDetail(ppSn,status){
				var urlFFF =window.location.pathname;
				var urlMsg='review';
				if(urlFFF.indexOf("plan_edit")>0){
					urlMsg='edit';	
				}
				//去掉单引号  取得要提交的参数
				var planSn=ppSn.replace(/'/g,"");
				var url='${pageContext.request.contextPath}/plan/preplan/plan_'+urlMsg+'_detail.action';
				// 创建Form  
			    var form = $('<form></form>');  
			    // 设置属性  
			    form.attr('action', url);  
			    form.attr('method', 'post');
			    form.attr('target', '_blank'); //空白打开  
			    // 创建Input  
    			var set_input = $('<input type="text" name="ppSn" />');
    			set_input.attr('value', planSn); 
    			// 附加到Form  
    			form.append(set_input);  
    			$(document.body).append(form);
    			// 提交表单  
			    form.submit();  
			    //return false自动刷新
			    return false;         
			}
			
			//同意申请
			function  checkPlanOk(planSn){
				swal({    
				    title: "确认同意该申请？",     
				    type: "warning",  
				    confirmButtonText:"确认", 
				    cancelButtonText :"取消", 
				    showCancelButton: true,    
				    closeOnConfirm: false,    
				    showLoaderOnConfirm: true,  
				    }, 
				    function(){    
				    	//修订
						$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/plan/preplan/preplan_preplan_updatePreplanStatus.action",
							dataType : "json",
							data : {
									ppSn:planSn.replace(/'/g,""),
									preplanStatus:"修订中"
							},
							success : function() {
		 						loadPlan();
		 						swal({
									title: "操作成功!",
									text: '',
									type: "success",
									timer: 2000, 
									confirmButtonText: "确认"  
								});				
							},
							error: function(){							
								swal({
									title: "操作失败!",
									text: '未知错误，请重试！',
									type: "error",
									timer: 2000, 
									confirmButtonText: "确认"  
								});									
							}
						});	   
				    }
				);
			}
			//不同意申请
			function checkPlanReject(planSn){
				//修订
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/plan/preplan/preplan_preplan_updatePreplanStatus.action",
					dataType : "json",
					data : {
							ppSn:planSn.replace(/'/g,""),
							preplanStatus:"通过"
					},
					success : function() {
 						loadPlan();
 						swal({
							title: "操作成功!",
							text: '',
							type: "success",
							timer: 2000, 
							confirmButtonText: "确认"  
						});				
					},
					error: function(){							
						swal({
							title: "操作失败!",
							text: '未知错误，请重试！',
							type: "error",
							timer: 2000, 
							confirmButtonText: "确认"  
						});									
					}
				});				
			}
        </script>