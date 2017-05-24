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
                                <span>预案编制</span>
                            </li>
                        </ul>
                    </div>
                    <!-- END PAGE BAR -->    
                    <!-- BEGIN PAGE TITLE-->
                    <h3 class="page-title"> 预案编制
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
                                                <div class="mt-step-number bg-white font-grey">2</div>
                                                <div class="mt-step-title uppercase font-grey-cascade">总则</div>
                                                <div class="mt-step-content font-grey-cascade">（填写总则信息）</div>
                                            </div>
                                            <div class="col-md-8 col-sm-6 col-xs-12 pull-right">
                                            	<#include "/decorators/edit_right_menu.ftl"> 
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
                                        <span class="caption-subject font-green bold uppercase" style="font-size:25px">2.3适用范围</span>
                                    </div>
                                    <div class="actions">
                                        <div class="btn-group">
                                            
                                            <a class="btn green btn-outline btn-circle btn-sm" href="#editRequire"> 
                                                <i class="fa fa-info font-green"></i>&nbsp;编写要求及示例 
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
                                                	<button type="button" class="btn blue" onclick="saveModule()">保存</button>
                                                    <button type="button" class="btn green" onclick="submitModule()">下一步</button>
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
                                <h3 id="editRequire">编写要求</h3>
                                <p>应明确界定本预案所适用的区域、突发事件类型以及对象，必要时，可指出本预案不适用的界限。适用范围应使用如下表述方式：</p>
                                <p>（1）“本预案适用于……”；</p>
								<p>（2）“本预案不适用于……”；</p>
							 	<p>（3）“本预案指导……”；</p>
							 	<p>（4）“……可参照适用本预案”。</p>

                                <h3>示例</h3>
                                <p>本预案适用于发生在本市的台风、暴雨、高潮、洪水、灾害性海浪和风暴潮灾害，以及损害防汛设施等突发事件的应急处置。</p>
                                
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
        <script type="text/javascript">
        	function saveModule(){
        	
        	}        
        	function submitModule(){
        		var xhedit=$('#xheditor').xheditor();
        		var planContent=xhedit.getSource();
        		var planSn=$('#planSn').val();
        		if(null===planContent || planContent===""){  
        			swal({   
        				title: "内容不能为空",   
        				timer: 2000,   
        				showConfirmButton: false 
        			});		
	
        		} else{
        		    if(null === planSn || planSn=="") {
        				swal('预案基本信息未编制', '要先编制预案基本信息才能编写该模块哦!', 'error');	 			
        			}        			        			
        			else{
        				submitModuleAjax(planContent,planSn);	
        			}
        		}	
        	}
        	
        	function submitModuleAjax(planContent,planSn){
        		var moduleId=0;
        		var order="0103";
        		$.ajax({
					type : "POST",
					url:'${pageContext.request.contextPath}/plan/preplan/preplan_module_saveOrUpdateModule.action',
					dataType : "json",
					data : {
							id : moduleId,
							order:order,
							content:planContent,
							preplanSn:planSn
					},
					success : function(data) {	
						console.log(data);
						if(data=="\"error\""){
							swal('提交出错', '未知错误，请确定您已经登录!', 'error');	 	
						}else{							
							location.href ="/plan/preplan/plan_edit_work_principle.action"+"?ppSn="+data.status.replace(/\"/g,"");     
						}													
					},
					error: function(){
							swal('提交出错', '未知错误，请确定您已经登录!', 'error');	 					
					}
				});
        	}           	     	        	
        </script>
        
    </body>

</html>