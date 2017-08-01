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
                                <a href="${pageContext.request.contextPath}/plan/preplan/planIndex.action">主页</a>
                                <i class="fa fa-circle"></i>
                            </li>
                            <li>
                            	<a href="${pageContext.request.contextPath}/plan/preplan/plan_revise_do.action">预案修订</a>
                                <i class="fa fa-circle"></i>
                            </li>
                            <li>
                                <span>全案修订</span>
                            </li>
                        </ul>
                    </div>
                    <!-- END PAGE BAR -->    
                    <!-- BEGIN PAGE TITLE-->
                    <h3 class="page-title"> 全案修订
                    </h3>
                    <!-- END PAGE TITLE-->
                    <!-- END PAGE HEADER-->
 					<!-- BEGIN : STEPS -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="portlet light portlet-fit bordered">
                                <div class="portlet-body">
                                    <div class="mt-element-step">
                                        <div class="row step-thin">
                                            <div class="col-md-4 col-sm-6 col-xs-12 bg-grey mt-step-col active">
                                                <div class="mt-step-number bg-white font-grey" id="supOrder"></div>
                                                <div class="mt-step-title uppercase font-grey-cascade" id="supTitle"></div>
                                                <div class="mt-step-content font-grey-cascade" id="supTitleDesc"></div>
                                            </div>
                                            <div class="col-md-8 col-sm-6 col-xs-12 pull-right">
                                            	<!-- BEGIN THEME PANEL -->
												<div class="theme-panel hidden-xs hidden-sm">
												    <div class="toggler"> </div>
												    <div class="toggler-close"> </div>
												    <div class="theme-options">
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
												 <input id="planSn" type="hidden" value="${planSn}"> 
												 <input id="moduleOrder" type="hidden" value="${moduleOrder}">
												 <input id="moduleOrderNext" type="hidden" value="${moduleOrderNext}">
												<!-- END THEME PANEL -->  
                                            </div>
                                        </div>                                     
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- BEGIN VALIDATION STATES-->
                            <div class="portlet light portlet-fit portlet-form bordered">    
                               <div class="portlet-title">
                                    <div class="caption">
                                        <span class="caption-subject font-green bold uppercase" style="font-size:25px" id="subTitle"></span>
                                    </div>
                                    <div class="actions">
                                        <div class="btn-group">
                                            
                                            <a class="btn green btn-outline btn-circle btn-sm" href="#editRequireP"> 
                                                <i class="fa fa-info font-green"></i>&nbsp;编写说明及示例 
                                            </a>
                                        </div>
                                    </div>
                               </div>                               
                                <div class="portlet-body">
                                    <!-- BEGIN FORM-->
                                    <form action="#" id="form_sample_3" class="form-horizontal">
                                        <div class="form-body">
                                        	<#include "/decorators/textarea.ftl">                                              
                                        </div>
                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-offset-3 col-md-9">
                                                	<button type="button" class="btn blue" onclick="saveModule(${moduleOrder})">保存</button>
                                                    <button id="submitModuleOver" type="button" class="btn green" onclick="submitModule(${moduleOrderNext})">下一步</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <!-- END FORM-->
                                </div>
                            </div>
                            <!-- END VALIDATION STATES-->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="note note-info">
                                <h3 >说明及要求</h3>
                                <p id="editRequireP"></P>
                                <hr>
                                <h3>示例</h3>
                                <p id="editExampleP"></p>
                                <hr>
                            </div>
                        </div>
                    </div>
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
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/select2/js/select2.full.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/jquery-validation/js/additional-methods.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/pages/scripts/form-validation.min.js"></script>                
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript" src="${getTheme('default','')}xhedit/xheditor-1.2.2.min.js"></script>   
        <script type="text/javascript" src="${getTheme('default','')}xhedit/xheditor_lang/zh-cn.js"></script>              
        <!-- END PAGE LEVEL SCRIPTS -->
        
        <script>
	  	  //获得树
		  $(function () {
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
				
		  });
		  
		  //获得模块内容
		  $(function () {
				var planSn=$('#planSn').val();
				var moduleOrder=$('#moduleOrder').val().replace(/'/g,"");
				if(planSn=="" || moduleOrder=="null" || moduleOrder==""){
					
				}else{
					getModuleContent(planSn,moduleOrder);
				}	
				
		  });
		  function getModuleContent(planSn,moduleOrder){
		  	$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/plan/preplan/preplan_module_getModuleByPpsnOrder.action",
					dataType : "json",
					data : {
						preplanSn:planSn,
						order:moduleOrder
					},
					success : function(data) {
						var xhedit=$('#xheditor').xheditor();
						xhedit.setSource(data.moduleContent);
					},
					error: function(){
						sweetAlert("加载失败", "未知错误，请重试!", "error");									
					}
				});		
		  }
		  
		  
		  //网页跳转中转
		  function changePage(orderId){
		  	var planSn=$('#planSn').val();
		  	if(orderId=="01"){	  				  		
		  	}else{
		  		if(orderId.length>3){
		  			getPageMsg(orderId,planSn);		
		  		}	
		  	}
	
		  }
		  //网页跳转
		  function getPageMsg(orderId,planSn){
		  	if(null === planSn || planSn=="") {
		       		location.href ="/plan/preplan/plan_revise_module.action"+"?code="+orderId; 					
			}        			        			
			else{
				location.href ="/plan/preplan/plan_revise_module.action"+"?ppSn="+planSn+"&code="+orderId; 		
			}		
		  }
	  </script>                    
        
        <script type="text/javascript">
        	$(function(){
        		var moduleOrder=$('#moduleOrder').val().replace(/'/g,"");
        		$.ajax({
					type : "POST",
					url:'${pageContext.request.contextPath}/plan/preplan/preplan_pageMsg_getPageMsgByOrder.action',
					dataType : "json",
					data : {
							order:moduleOrder
					},
					success : function(data) {	

						$('#supOrder').html(data.supModuleTitleNum);
						$('#supTitle').html(data.supTitle);
						$('#supTitleDesc').html(data.supTitleDesc);
						$('#subTitle').html(data.moduleTitleNum+' '+data.moduleTitle)

						if(data.isRequireCheck==true){
							$('#editRequireP').html(data.requireContent)
						}
						if(data.isExampleCheck==true){
							$('#editExampleP').html(data.exampleContent)							
						}

						//是否显示已完成
						console.log(moduleOrder)
						if(moduleOrder=="0039"){
							$('#submitModuleOver').text("完成修订");
						}
						
					},
					error: function(){
							swal('提交出错', '未知错误，请确定您已经登录!', 'error');	 					
					}
				});
        	})		        	
        </script>
        
    </body>

</html>