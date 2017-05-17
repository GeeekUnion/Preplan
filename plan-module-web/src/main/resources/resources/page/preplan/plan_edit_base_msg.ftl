<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>预案管理系统-预案基础信息编制</title>
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
                                                <div class="mt-step-title uppercase font-grey-cascade">预案基本信息填写</div>
                                                <div class="mt-step-content font-grey-cascade">（这里填写预案的基本信息）</div>
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
                                <div class="portlet-body">
                                    <!-- BEGIN FORM-->
                                    <form action="${pageContext.request.contextPath}/plan/preplan/plan_edit_general_rule.action" id="form_sample_2" class="form-horizontal">
                                        <div class="form-body">
                                            <div class="alert alert-danger display-hide">
                                                <button class="close" data-close="alert"></button> 请按照要求填写预案基本信息。</div>
                                            <div class="alert alert-success display-hide">
                                                <button class="close" data-close="alert"></button> Your form validation is successful! </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">预案编号
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <input type="text" class="form-control" name="preplanSn" />
                                                        <span class="help-block"> 请输入预案编号。</span>
                                                    </div>   
                                                </div>
                                            </div>    
                                            <div class="form-group">
                                                <label class="control-label col-md-3">预案名称
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <input type="text" class="form-control" name="preplanName" />
                                                        <span class="help-block"> 请输入大于5个字的预案名称. </span>
                                                    </div>   
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">预案类别
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <select name="domain" id="domain_list" class="form-control">                                                       	
                                                            <option value=""></option>
                                                            
                                                        </select>
                                                    </div>    
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">预案描述
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <textarea class="form-control"  rows="4" name="preplanDesc"></textarea>
                                                        <span class="help-block"> 请输入小于500字的预案描述</span>
                                                    </div>    
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">审核部门
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <select name="reviewOrg" id="review_list" class="form-control">
                                                            <option value=""></option>
                                                            
                                                            <option value="AL">Albania</option>
                                                            <option value="DZ">Algeria</option>
                                                            <option value="AS">American Samoa</option>
                                                            <option value="AD">Andorra</option>
                                                            <option value="AO">Angola</option>
                                                            <option value="AI">Anguilla</option>
                                                            <option value="AR">Argentina</option>
                                                            <option value="AM">Armenia</option>
                                                            <option value="AW">Aruba</option>
                                                            <option value="AU">Australia</option>
                                                        
                                                            <option value="EH">Western Sahara</option>
                                                            <option value="YE">Yemen</option>
                                                            <option value="ZM">Zambia</option>
                                                            <option value="ZW">Zimbabwe</option>
                                                        </select>
                                                    </div>    
                                                </div>
                                            </div>                                               
                                        </div>
                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-offset-3 col-md-9">
                                                <a href="planEditGeneralRule .html" class="btn green" role="button">下个页面</a>
                                                    <button type="submit" class="btn green">下一步</button>
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
                </div>
                <!-- END CONTENT BODY -->
            </div>
        <!-- END CONTENT -->
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
        <script>         
			$(function(){
	        	$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/plan/preplan/preplan_domain_queryAllDomain.action",
					dataType : "json",
					data : {

					},
					success : function(data) {
					    var html='';                             
 						for(var i=0;i<data.length;i++){
							html= html+'<option value="'+data[i].id+'">'+data[i].domain_name+'</option>'
						}	
						
                        //document.write(html1+html+html2); 
                        $('#domain_list').append(html) 		
						//$('#planListBody').append(html1+html+html2);	
						//$("#planListBody").fadeIn('show');
					},
					error: function(){
						sweetAlert("加载失败", "未知错误，请重试!", "error");									
					}
				});
	        })
        
        </script>
    </body>

</html>