<!-- BEGIN EXAMPLE TABLE PORTLET-->
<div class="portlet box green">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-globe"></i>预案列表 </div>
        <div class="actions">
            <a href="${pageContext.request.contextPath}/plan/preplan/plan_edit_base_msg.action" class="btn dark btn-outline sbold uppercase">
                <i class="fa fa-plus"></i> 新增预案 </a>
        </div>
    </div>
    
    <div class="portlet-body" id="">
		<table id="planListTable" class="display" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	                <th>预案编号</th>
	                <th>预案名称 </th>
	                <th>类别 </th>
	                <th>负责部门</th>
	                <th>状态 </th>
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
					    "url": "${pageContext.request.contextPath}/plan/preplan/preplan_preplan_queryPreplanList.action",
					    "type": "POST",
					    "data": function ( d ) {

					    }
					},
				  	"deferRender": true,
				  	"searching": true,
				  	"autoWidth": false,
				  	"processing": true,
				  	"destroy": true,//如果需要重新加载的时候请加上这个
			        "columns": [
	                    { "data": "preplanUid",},
	                    { "data": "preplanName" },
	                    { "data": "preplanType" },
	                    { "data": "responDept" },
	                    { "data": "status" },
	                    { "data": "preplanTime" },
	                    { "formatNumber": "preplanTime" }	                    
	                ],
	                "columnDefs": [ {
			            "targets": -1,//最后一列
			            "data": null,
			            render: function(data, type, row, meta) {
			            var showHtml='<button class="btn  green" onclick="alterPlan(\''+row.preplanSn+'\')">'
	                                      +          	'<i class="fa fa-edit">全案 </i>'
	                                      +      '</button>'
	                                      +      ' '
	                                      +  	 '<button  class="btn green"onclick="getPlanDetail(\''+row.preplanSn+'\',\'simple_plan\')">'
	                                      +  			'<i class="fa fa-edit">简案</i>'
	                                      +      '</button>'
	                                      +      ' '
	                                      +  	 '<button  class="btn green"onclick="getPlanDetail(\''+row.preplanSn+'\',\'flow_chart\')">'
	                                      +  			'<i class="fa fa-edit">流程图</i>'
	                                      +      '</button>'
	                                      +      ' '
	                                      +  	 '<button  class="btn red"onclick="deletePlan('+row.id+')">'
	                                      +  			'<i class="fa fa-times">删除</i>'
	                                      +      '</button>'            
			            	if(row.status=="待完成"){
			            		showHtml=showHtml+' '
	                                      +  	 '<button  class="btn blue"onclick="overPlan(\''+row.preplanSn+'\')">'
	                                      +  			'<i class="fa fa-check">提交审核</i>'
	                                      +      '</button>'
			            	}else if(row.status=="通过"){
			            		showHtml=showHtml+' '
	                                      +  	 '<button  class="btn blue"onclick="getPlanDetail(\''+row.preplanSn+'\',\'detail\')">'
	                                      +  			'<i class="fa fa-search">详情</i>'
	                                      +      '</button>'
			            	}else if(row.status=="待审核"){
			            		showHtml='';
			            	}else{
			            	
			            	}
			            
				            return showHtml;

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
			
			//编辑预案
			function alterPlan(planSn){
				location.href ="/plan/preplan/plan_edit_base_msg.action"+"?ppSn="+planSn.replace(/'/g,""); 		
			}
			
			//删除预案
			function deletePlan(id){
				swal({    
				    title: "确认删除该预案？",     
				    type: "warning",  
				    confirmButtonText:"确认", 
				    cancelButtonText :"取消", 
				    showCancelButton: true,    
				    closeOnConfirm: false,    
				    showLoaderOnConfirm: true,  
				    }, 
				    function(){    
				    	//删除该预案
						$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/plan/preplan/preplan_preplan_deletePreplan.action",
							dataType : "json",
							data : {
									code : id
							},
							success : function() {
		 						loadPlan();
		 						swal({
									title: "删除成功!",
									text: '',
									type: "success",
									timer: 2000, 
									confirmButtonText: "确认"  
								});				
							},
							error: function(){							
								swal({
									title: "删除失败!",
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
			
			function getPlanDetail(ppSn,urlMsg){
				//去掉单引号  取得要提交的参数
				var planSn=ppSn.replace(/'/g,"");
				urlMsg=urlMsg.replace(/'/g,"");
				var url='${pageContext.request.contextPath}/plan/preplan/plan_edit_'+urlMsg+'.action';
				// 创建Form  
			    var form = $('<form></form>');  
			    // 设置属性  
			    form.attr('action', url);  
			    form.attr('method', 'post');
			    form.attr('target', '_blank'); //空白打开  
			    // 创建Input  
    			var set_input = $('<input type="text" name="ppSn" />');
    			set_input.attr('value', planSn); 
    			if(urlMsg=="simple_plan"){
    				// 创建Input2  
	    			var set_input2 = $('<input type="text" name="code" />');
	    			set_input2.attr('value','1001'); 
	    			form.append(set_input2);     			
	    		}
    			// 附加到Form  
    			form.append(set_input);  
    			// 提交表单  
			    form.submit();  
			    //return false自动刷新
			    return false;         
			}
			
			
			//提交审核
        	function overPlan(planSn){   			        		
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/plan/preplan/preplan_preplan_updatePreplanStatus.action",
					dataType : "json",
					data : {
						ppSn:planSn.replace(/'/g,""),
						preplanStatus:"待审核"
					},
					success : function(data) {
						loadPlan();
	      				swal({
							title: "提交成功!",
							text: '请等待审核！',
							type: "success",
							confirmButtonText: "确认"  
						});	
					},
					error: function(){
						loadPlan();
						 swal({
							title: "提交失败!",
							text: '未知错误，请登录重试!',
							type: "error",
							confirmButtonText: "确认"  
						});							
					}
				});	
        	}
			
			
        </script>