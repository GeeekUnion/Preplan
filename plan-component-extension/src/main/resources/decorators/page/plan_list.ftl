<div class="portlet-body" id="planListBody">

</div>
       	<script>         
			$(function(){
			   
	        	var department="all";
	        	$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/plan/preplan/preplan_preplan_queryPreplanList.action",
					dataType : "json",
					data : {
							ppDept:department
					},
					success : function(data) {
					    var planList=data.rows;
					    var html='';
					    var html1='<table class="table table-striped table-bordered table-hover table-header-fixed" id="sample_2">'
	                              +  '<thead>'
	                              +      '<tr>'
	                              +          '<th> 预案编号 </th>'
	                              +          '<th> 预案名称 </th>'
	                              +          '<th> 类别 </th>'
	                              +          '<th> 负责部门 </th>'
	                              +          '<th> 日期 </th>'
	                              +          '<th> 操作 </th>'
	                              +      '</tr>'
	                              +  '</thead>'
	                              +  '<tbody >' ;

                              
 						for(var i=0;i<planList.length;i++){
							html= html+'<tr>'
                                      +'<td>'+planList[i].preplanUid+'</td>'  
                                      +'<td>'+planList[i].preplanName+'</td>'
									  +'<td>'+planList[i].preplanType+'</td>'
									  +'<td>'+planList[i].responDept+'</td>'
									  +'<td>'+planList[i].preplanTime+'</td>'  
									  +'<td>'	
                                      +  	'<a href="javascript:;" class="btn blue" onclick="alterPlan('+planList[i].id+')">'
                                      +          	'<i class="fa fa-edit">编制 </i>'
                                      +      '</a>'
                                      +  	'<a href="javascript:;" class="btn red"onclick="deletePlan('+planList[i].id+')">'
                                      +  			'<i class="fa fa-times">删除</i>'
                                      +      '</a>'
                                      + '</td>'
                                    +'</tr>'
						}	
						var html2='</tbody>'
                            		+'</table>';
                        //document.write(html1+html+html2); 
                        $('#planListBody').html(html1+html+html2) 		
						//$('#planListBody').append(html1+html+html2);	
						//$("#planListBody").fadeIn('show');
					},
					error: function(){
						sweetAlert("加载失败", "未知错误，请重试!", "error");									
					}
				});
	        })
        
        </script>