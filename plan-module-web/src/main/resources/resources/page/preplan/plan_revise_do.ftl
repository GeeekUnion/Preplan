<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->

<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>预案管理系统</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
       	<#include "/decorators/plan_public_sources.ftl">       
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link rel="stylesheet" type="text/css" href="${getTheme('default','')}assets/global/plugins/datatables/datatables.min.css"/>
		<link rel="stylesheet" type="text/css" href="${getTheme('default','')}assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css"/>
        <!-- END PAGE LEVEL PLUGINS -->
    </head>
        
    <!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
        <#include "/decorators/plan_head.ftl">    
        <!-- BEGIN HEADER & CONTENT DIVIDER -->
        <div class="clearfix"> </div>
        <!-- END HEADER & CONTENT DIVIDER -->
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <#include "/decorators/plan_left_menu.ftl"> 
            <!-- BEGIN CONTENT 内容-->
            <div class="page-content-wrapper">
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content">
                    <!-- BEGIN PAGE HEADER-->
                    <!-- BEGIN PAGE BAR -->
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <a href="${pageContext.request.contextPath}/plan/preplan/plan_index.action">主页</a>
                                <i class="fa fa-circle"></i>
                            </li>
                            <li>
                                <span>预案修订</span>
                            </li>
                        </ul>
                    </div>
                    <!-- END PAGE BAR -->    
                    <!-- BEGIN PAGE TITLE-->
                    <h3 class="page-title"> 预案修订
                    </h3>
                    <!-- END PAGE TITLE-->
                    <!-- END PAGE HEADER-->
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box green">
					    <div class="portlet-title">
					        <div class="caption">
					            <i class="fa fa-globe"></i>预案修订
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
						                <th>版本号</th>
						                <th>日期 </th>                
						                <th>操作</th>
						            </tr>
						        </thead>
						
						    </table>
						</div>
							  
					    
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->                    
                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END CONTAINER -->
		<#include "/decorators/plan_footer.ftl"> 
        <!--[if lt IE 9]>
<script src="../assets/global/plugins/respond.min.js"></script>
<script src="../assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
       
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript" src="${getTheme('default','')}assets/global/scripts/datatable.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/datatables/datatables.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js"></script>        
        <!-- END PAGE LEVEL PLUGINS -->
        
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript" src="${getTheme('default','')}assets/pages/scripts/table-datatables-fixedheader.min.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
       	       	<script>         
			$(document).ready(function() {
				loadPlan()
			} );
			function loadPlan(){
				$('#planListTable').dataTable( {
					"ajax": {
					    "url": "${pageContext.request.contextPath}/plan/preplan/preplan_preplan_queryPreplanList.action",
					    "type": "POST",
					    "data":{
							"preplanStatus":"修订",
					    }
					},
				  	"deferRender": true,
				  	"searching": true,
				  	"autoWidth": true,
				  	"processing": true,
				  	"destroy": true,//如果需要重新加载的时候请加上这个
			        "columns": [
	                    { "data": "preplanUid",},
	                    { "data": "preplanName" },
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
			            	if(row.status=="修订中" || row.status=="修订未通过"){
			            		showHtml=showHtml+' '
	                                      +  	 '<button  class="btn blue"onclick="overPlan(\''+row.preplanSn+'\',0)">'
	                                      +  			'<i class="fa fa-check">提交审核</i>'
	                                      +      '</button>'
			            	}else if(row.status=="通过"){
			            		showHtml='<button  class="btn green"onclick="overPlan(\''+row.preplanSn+'\',1)">'
	                                      +  			'<i class="fa fa-check">申请修订</i>'
	                                      +      '</button>'
	                                      +      ' '
	                                      +  	 '<button  class="btn blue"onclick="getPlanDetail(\''+row.preplanSn+'\',\'detail\')">'
	                                      +  			'<i class="fa fa-search">查看详情</i>'
	                                      +      '</button>'
	                                      +      ' '
	                                      +  	 '<button  class="btn red"onclick="deletePlan('+row.id+')">'
	                                      +  			'<i class="fa fa-times">删除</i>'
	                                      +      '</button>'
			            	}else if(row.status=="待审核" || row.status=="申请修订" ||  row.status=="修订待审核"){
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
			
			
			
			
			//修订预案
			function alterPlan(planSn){
				location.href ="/plan/preplan/plan_revise_module.action?ppSn="+planSn.replace(/'/g,"")+"&code="+"0001";	
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
									text: '请确定您其他地方没有引用该预案，比如预案演练、执行！',
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
    			$(document.body).append(form);
			    form.submit();  
			    //return false自动刷新
			    return false;         
			}
			
			//改变预案状态
			function overPlan(planSn,status){
				var myStatus="";
				if(status===1){
					myStatus='申请修订';
					
				}else{
					myStatus='修订待审核';
				
				}	
				submitMyPlan(planSn,myStatus)	
			}
			
			//提交审核
        	function submitMyPlan(planSn,myStatus){  
				swal({    
				    title: "确认提交？",     
				    type: "warning",  
				    confirmButtonText:"确认", 
				    cancelButtonText :"取消", 
				    showCancelButton: true,    
				    closeOnConfirm: false,    
				    showLoaderOnConfirm: true,  
				    }, 
				    function(){    
				    	var ppSn=planSn.replace(/'/g,"");
				    	$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/plan/preplan/preplan_preplan_updatePreplanStatus.action",
							dataType : "json",
							data : {
								ppSn:ppSn,
								preplanStatus:myStatus
							},
							success : function(data) {								
								if(myStatus=="待审核"){
									changeVersion(ppSn);
									
								}else{
									loadPlan();
									successModal();
								}
			      				
							},
							error: function(){
								loadPlan();
								errorModal();
							}
						});		
				    }
				);
				        	       	        	 			        		
				
        	}
			
			//修改版本号
        	function changeVersion(ppSn){
        		$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/plan/preplan/preplan_preplan_changeVersion.action",
						dataType : "json",
						data : {
							ppSn:ppSn
						},
						success : function(data) {
							loadPlan();							
							changeLog(ppSn,data.preplanVersion)	
						},
						error: function(){
							loadPlan();
							errorModal();
						}
					});	
										
        	}
        	
        	//填写修改记录
        	function changeLog(ppSn,preplanVersion){
        		$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/plan/preplan/preplan_preplanLog_savePLLog.action",
						dataType : "json",
						data : {
							preplanSn:ppSn,
							version:preplanVersion
						},
						success : function(data) {						
		      				successModal()
						},
						error: function(){
							errorModal();
						}
					});						
        	}
        	
        	//成功提示
        	function successModal(){
        		swal({
						title: "提交成功!",
						text: '请等待审核！',
						type: "success",
						confirmButtonText: "确认"  
					});	
        	}
        	//错误提示
        	function errorModal(){
				swal({
					title: "提交失败!",
					text: '未知错误，请登录重试!',
					type: "error",
					confirmButtonText: "确认"  
				});
        	}
        </script>

    </body>

</html>