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
                                <a href="${pageContext.request.contextPath}/plan/preplan/plan_edit_do.action">预案编制</a>
                                <i class="fa fa-circle"></i>
                            </li>
                            <li>
                                <span>预案详情</span>
                            </li>
                        </ul>
                    </div>
                    <!-- END PAGE BAR -->    
                    <!-- BEGIN PAGE TITLE-->
                    <h3 class="page-title"> 预案详情
                    </h3>
                    <!-- END PAGE TITLE-->
                    <div class="portlet light bordered" style="margin-bottom:0px">
                        <div class="portlet-title" style="margin-bottom:0px;border-bottom:0px solid #ffffff">
                            <div class="caption">
                                <span class="caption-subject font-dark bold uppercase">预案基本信息</span>                               
                            </div>
                           <div class="actions">
                                <a role="button" class="btn blue-hoki btn-outline sbold uppercase "  href="javascript:;" onclick="printPlanOne(1)"> 
                                	<i class="fa fa-print"></i>打印全案
                                </a>                          		
                           		
                           		<a role="button" class="btn green-haze btn-outline sbold uppercase"  href="javascript:;" onclick="printPlanTwo(2)"> 
                                	<i class="fa fa-print"></i>打印简案
                                </a>
                           		
                                <a role="button" class="btn red btn-sm btn-outline " data-toggle="modal" href="#largeReview"> 
                                	<i class="fa fa-sticky-note-o"></i>查看意见
                                </a>
                            </div>
                        </div>
                        
                    </div>                    
                    <!-- END PAGE HEADER-->
					<#include "/decorators/plan_detail.ftl">                   
                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END CONTAINER -->
        
        <!-- .modal -->
        <div class="modal fade bs-modal-lg" id="largeReview" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">审核意见</h4>
                    </div>
                    <div class="modal-body" id="reviewContent"></div>
                    <div class="modal-footer">
                        <button type="button" class="btn red btn-outline" data-dismiss="modal">关闭</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        
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
       	<!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/bootstrap-tabdrop/js/bootstrap-tabdrop.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
		<script type="text/javascript"> 
			$(function(){
				var preplanSn=$('#detailPlanSn').val();
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/plan/preplan/preplan_review_getReviewByPlanSn.action",
					dataType : "json",
					data : {
						preplanSn:preplanSn
					},
					success : function(data) {									
						$('#reviewContent').html(data.reviewOpinion)	
						
					},
					error: function(){
							
					}
				});
				 
			})
		
		//打印全案	
		function printPlanOne(pageMsgType){
			printPlan(pageMsgType)
		}	
		
		//打印简案
		function printPlanTwo(pageMsgType){
			printPlan(pageMsgType)
		}
			
		//打印预案		
		function printPlan(pageMsgType){
			swal({title: '', text:'打印中，请稍后...<i class="fa fa-spinner fa-spin fa-fw"></i>',showConfirmButton: false, html: true   });
			var preplanSn=$('#detailPlanSn').val();
	  		$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/plan/preplan/preplan_preplan_uploadPlanPdf.action",
				dataType : "json",
				data : {
					ppSn:preplanSn,
					pageMsgType:pageMsgType
				},
				success : function(data) {	
					var msg=data.status;
					if(msg=="error"){
						swal({title: "打印失败!",text: '未知错误，请重试',type: "error",confirmButtonText: "确认" });			
						
					}else{
						getPdfByUrl(msg);
						swal.close();
						/*
						swal({
							title: "打印成功!",
							text:'路径为：'+msg,
							type: "success",
							confirmButtonText: "确认"
						});
						*/ 
					}								
					  	
					
				},
				error: function(){
					swal({title: "打印失败!",text: '未知错误，请重试',type: "error",confirmButtonText: "确认" });							
				}
			});
	  }
			
		//下载预案		
		function getPdfByUrl(url){			
				// 创建Form  
			    var form = $('<form></form>');  
			    
			    // 设置属性  
			    form.attr('action', "${pageContext.request.contextPath}/plan/preplan/plan_download.action");  
			    form.attr('method', 'post');
			    
			    // 创建Input  
    			var set_input = $('<input type="text" name="downloadFileName" />');
    			set_input.attr('value', url); 
	    		
    			// 附加到Form  
    			form.append(set_input);  
    			
    			// 提交表单  
    			$(document.body).append(form);
			    form.submit();  
			    //return false自动刷新
			    return false;  	
		}
			
		</script>
    </body>

</html>