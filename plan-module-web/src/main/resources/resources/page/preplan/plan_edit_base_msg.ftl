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
                            	<a href="${pageContext.request.contextPath}/plan/preplan/plan_edit_do.action">预案编制</a>
                                <i class="fa fa-circle"></i>
                            </li>
                            <li>
                                <span>预案基本信息填写</span>
                            </li>
                        </ul>
                    </div>
                    <!-- END PAGE BAR -->    
                    <!-- BEGIN PAGE TITLE-->
                    <h3 class="page-title"> 预案基本信息填写
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
                                            	<div class="mt-step-number bg-white font-grey">#</div>
                                                <div class="mt-step-title uppercase font-grey-cascade">预案基本信息</div>
                                                <div class="mt-step-content font-grey-cascade">（这里填写预案的基本信息）</div>
                                            </div>
                                            <div class="col-md-8 col-sm-6 col-xs-12">
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
                                <div class="portlet-body">
                                    <!-- BEGIN FORM-->
                                    <form id="baseMsgForm" class="form-horizontal">
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
                                                        <input type="text" class="form-control" name="preplanSn" id="preplanSn"/>
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
                                                        <input type="text" class="form-control" name="preplanName" id="preplanName"/>
                                                        <span class="help-block"> 请输入大于5个字的预案名称. </span>
                                                    </div>   
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">预案分类
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <select name="classify" id="classify_list" class="form-control">                                                       	
                                                            <option value=""></option>
                                                        </select>
                                                    </div>    
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3">灾害类型
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
                                                        <textarea class="form-control"  rows="4" name="preplanDesc" id="preplanDesc"></textarea>
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
                                                           
                                                        </select>
                                                    </div>    
                                                </div>
                                            </div> 
                                            <div class="form-group">
                                                <label class="control-label col-md-3">专家组
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <textarea class="form-control"  rows="4" name="preplanSpecialist" id="preplanSpecialist"></textarea>
                                                        <span class="help-block"> 专家组填写，可以为空。</span>
                                                    </div>    
                                                </div>
                                            </div>                                              
                                        </div>
                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-offset-3 col-md-9">
                                                	<button id="sava_base_msg_btn" type="submit" class="btn blue">保存</button>                                            
                                                    <button type="submit" class="btn green">保存并编制全案</button>
                                                    <input type="hidden" id="sava_base_msg_ipt" value="0"/>
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
				//绑定点击事件
				$("#sava_base_msg_btn").on("click",function(){
					$('#sava_base_msg_ipt').val(1);	
				});
				
				getPlanBaseMsg();//查询已有预案信息	
				

								
				var form2 = $('#baseMsgForm');
	            var error2 = $('.alert-danger', form2);
	            var success2 = $('.alert-success', form2);
	
	            form2.validate({
	                errorElement: 'span', //default input error message container
	                errorClass: 'help-block help-block-error', // default input error message class
	                focusInvalid: false, // do not focus the last invalid input
	                ignore: "",  // validate all fields including form hidden input
	                rules: {
	                    preplanSn: {
	                        required: true
	                    },
	                    preplanName: {
	                        required: true,
	                        minlength:5
	                    },
	                    domain: {
	                        required: true
	                    },
	                    classify:{
	                    	required: true
	                    },
	                    preplanDesc: {
	                        required: true,
	                        maxlength:500
	                    },
	                    reviewOrg: {
	                        required: true
	                    }
	                },
	
	                invalidHandler: function (event, validator) { //display error alert on form submit              
	                    success2.hide();
	                    error2.show();
	                    App.scrollTo(error2, -200);
	                },
	
	                errorPlacement: function (error, element) { // render error placement for each input type
	                    var icon = $(element).parent('.input-icon').children('i');
	                    icon.removeClass('fa-check').addClass("fa-warning");  
	                    icon.attr("data-original-title", error.text()).tooltip({'container': 'body'});
	                },
	
	                highlight: function (element) { // hightlight error inputs
	                    $(element)
	                        .closest('.form-group').removeClass("has-success").addClass('has-error'); // set error class to the control group   
	                },
	
	                unhighlight: function (element) { // revert the change done by hightlight
	                    
	                },
	
	                success: function (label, element) {
	                    var icon = $(element).parent('.input-icon').children('i');
	                    $(element).closest('.form-group').removeClass('has-error').addClass('has-success'); // set success class to the control group
	                    icon.removeClass("fa-warning").addClass("fa-check");
	                },
	
	                submitHandler: function (form) {
	                var ppName=$('#preplanName').val()
	                var ppDesc=$('#preplanDesc').val()
	                var ppUid=$('#preplanSn').val()
	                var ppType=$('#domain_list').val();
	                var classify=$('#classify_list').val();
	                var ppDept=$('#review_list').val();
	                var ppSn=$('#planSn').val();
	                var preplanSpecialist=$('#preplanSpecialist').val();

	                  $.ajax({  
		                    type: 'post',  
		                    url: "/plan/preplan/preplan_preplan_saveOnlyPreplan.action", 
		                    data:{
		                    	preplanSpecialist:preplanSpecialist,
		                    	ppName : ppName,
								ppDesc : ppDesc,
								ppType : ppType,
								ppDept : ppDept,
								ppUid  : ppUid,
								ppSn   : ppSn,
								classify:classify
								
	                        },
		                    success:function(data){
		                     	if(data=="\"error\""){
	                             	swal('提交出错', '未知错误，请确定您已经登录!', 'error');	   
	                            }else{
	                            	var myPd=$('#sava_base_msg_ipt').val();	
	                            	if(myPd==0){
	                            		var oooorder="0001";
	                            		getPageMsg(oooorder,data.replace(/\"/g,""))  
	                            	}else{   
	                            		var url=window.location.pathname;
	                            		url=url+"?ppSn="+data.replace(/\"/g,"");
	                            		history.replaceState(null, "", url);     
	                            		$('#sava_base_msg_ipt').val(0); 
	                            		$('#planSn').val(data.replace(/\"/g,""));//保存ppSn
	                            		swal({title: "保存成功!",type: "success",confirmButtonText: "确认"});                    			   	
	                            	}
	                            	
	                            }
	                        }   
		                }); 
		                return false; // 阻止表单自动提交事件
	                }
	            });
				
	        })
        	

				
        	
        	//查询已有预案
        	function getPlanBaseMsg(){
        		var preplanDomainId=0;
        		var preplanDeparmentId=0;
        		var preplanReviewOrg=0;
        		var planSn=$('#planSn').val();
        		
        		var titleName=localStorage.titleName;
				var classifyList=['综合','专项','部门'];//政府
				if(titleName=="企业"){
					classifyList=['综合','专项','现场处置方案'];//企业
				}

            	//查询预案基本信息
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/plan/preplan/preplan_preplan_getUniqueByPreplanSn.action",
					dataType : "json",
					data : {
						ppSn:planSn
					},
					success : function(data) {
						if(data.length>0){
							$('#preplanSn').val(data[0].preplanUID);//预案编号	
							$('#preplanName').val(data[0].preplanName);//预案名字
							$('#preplanDesc').val(data[0].preplanDesc);//预案描述
							$('#preplanSpecialist').val(data[0].preplanSpecialist);
							preplanDomainId=data[0].preplanDomain;
							preplanReviewOrg=data[0].preplanReviewOrg;
						} 
						
						//查询设置分类
						var myHtml='';                             
 						for(var i=0;i<classifyList.length;i++){
// 							if(classifyList[i]==data[0].preplanClassify){
// 								myHtml= myHtml+'<option value="'+data[i].id+'" selected="selected">'+data[i].domain_name+'</option>'
//							}else{
//								myHtml= myHtml+'<option value="'+data[i].id+'">'+data[i].domain_name+'</option>'
// 							}
							myHtml= myHtml+'<option value="'+classifyList[i]+'">'+classifyList[i]+'</option>'
						}
						 $('#classify_list').append(myHtml);		
						
						
						//查询所有灾害分类
			        	$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/plan/preplan/preplan_domain_queryAllDomain.action",
							dataType : "json",
							data : {
		
							},
							success : function(data) {
							    var html='';                             
		 						for(var i=0;i<data.length;i++){
		 							if(data[i].id==preplanDomainId){
		 								html= html+'<option value="'+data[i].id+'" selected="selected">'+data[i].domain_name+'</option>'
		 							}else{
		 								html= html+'<option value="'+data[i].id+'">'+data[i].domain_name+'</option>'
		 							}
									
								}	
								
		                        //document.write(html1+html+html2); 
		                        $('#domain_list').append(html);		
								//$('#planListBody').append(html1+html+html2);	
								//$("#planListBody").fadeIn('show');
							},
							error: function(){
													
							}
						});
						//查询审核部门
						$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/plan/preplan/preplan_department_getDepartment.action",
							dataType : "json",
							data : {
		
							},
							success : function(data) {
								console.log(data);
							    var html='';     
							    if(null != data){
							    	if(preplanReviewOrg>0){
							    		html= html+'<option value="'+data.orgCode+'" selected="selected">'+data.orgName+'</option>'
							    	}else{
							    		html= html+'<option value="'+data.orgCode+'">'+data.orgName+'</option>'
							    	}	
							    }                        						
		                        $('#review_list').append(html); 
			                        
							},
							error: function(){
																	
							}
						});	    
						                 
					},
					error: function(){
													
					}
				});	
	
        		
        		
				
        	}
        	

        	
        </script>
        
    </body>

</html>