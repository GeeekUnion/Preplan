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
                                        <span class="caption-subject font-green bold uppercase" style="font-size:25px">2.1编写目的</span>
                                    </div>
                                    <div class="actions">
                                        <div class="btn-group">
                                            
                                            <a class="btn green btn-outline btn-circle btn-sm" href="#editRequire"> 
                                                <i class="fa fa-info font-green"></i>&nbsp;编写要求  
                                            </a>
                                        </div>
                                    </div>
                               </div>                               
                                <div class="portlet-body">
                                    <!-- BEGIN FORM-->
                                    <form action="#" id="form_sample_2" class="form-horizontal">
                                        <div class="form-body">
                                            <textarea name="content" class="xheditor" style="width:100%;min-height: 450px; "></textarea>                                           
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
                                <p>应简要说明预案基于突发事件处置而预计达成的目标，可根据预案的类别及城镇的特点选取以下方面 </p>
                                <p>（1）受灾地区民众的生命、健康和财产安全保证；
                                <p>（2）城镇安全和经济社会发展秩序保证；
                                <p>（3）灾后秩序恢复保证；
                                <p>（4）救援人员的生命和健康安全保证；
                                <p>（5）业务连续性的保持；
                                <p>（6）财产、设施、设备、基础建设的保护；
                                <p>（7）环境的保护；
                                <p>（8）特定类型突发事件应对能力的提高，以及相应体制、机制的建立。
                                
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
        
    </body>

</html>