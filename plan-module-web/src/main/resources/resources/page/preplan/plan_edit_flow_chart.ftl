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
                                <span>流程图上传</span>
                            </li>
                        </ul>
                    </div>
                    <!-- END PAGE BAR -->    
                    <!-- BEGIN PAGE TITLE-->
                    <h3 class="page-title"> 流程图上传
                    </h3>
                    <!-- END PAGE TITLE-->
                    <!-- END PAGE HEADER-->
					<div class="portlet light bordered">
						<div class="portlet-title">
							<div class="caption" >
								上传图片
							</div>
						</div>
			            <div class="portlet-body">
							<textarea name="editor1" style="width:100%;min-height: 400px;" id="xheditor"></textarea>    	                        
				            <hr/>
				            <center>
		                        <a role="button" href="javascript:;" onclick="submitOpinion(0)" class="btn blue"><i class="fa fa-check"></i> 确认上传 </a>                                                  	
		                    </center>
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
        <script type="text/javascript" src="${getTheme('default','')}assets/global/scripts/datatable.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/datatables/datatables.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js"></script>        
        <!-- END PAGE LEVEL PLUGINS -->
        
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript" src="${getTheme('default','')}assets/pages/scripts/table-datatables-fixedheader.min.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript" src="${getTheme('default','')}xhedit/xheditor-1.2.2.min.js"></script>   
        <script type="text/javascript" src="${getTheme('default','')}xhedit/xheditor_lang/zh-cn.js"></script>              
        <!-- END PAGE LEVEL SCRIPTS -->
       	<script type="text/javascript">
       	
       		$(function(){
       			$('#xheditor').xheditor({
       				tools:'Img',
       				skin:'vista',
       				html5Upload : false, //此属性必须为false 否则无法上传图片 
       				onUpload : uploadImg,   
       				upImgUrl:"${pageContext.request.contextPath}/plan/preplan/preplan_picture_uploadImg.action",
       				upImgExt:"jpg,jpeg,gif,png"
       			});	
       			function uploadImg(data) {  
		            //...回调函数  
		        } 
       			
       		})
       	
       		function submitOpinion(pd){
       			var xhedit=$('#xheditor').xheditor();
       			var opContent=xhedit.getSource();
       			var msg="";
       			if(pd==0){
       				msg="通过";
       			}else{
       				msg="未通过";
       			}
       			if(null===opContent || opContent===""){
       				swal({    
	       					title: "内容为空！",    
	       					text: "确定提交？",    
	       					type: "warning",   
	       					showCancelButton: true,    
	       					confirmButtonColor: "#DD6B55",   
	       					confirmButtonText: "确定",    
	       					cancelButtonText: "取消",   
	       					closeOnConfirm: false,    
	       					closeOnCancel: false	 
       					}, 
       					function(isConfirm){    
   							if (isConfirm) {      
   								swal.close();//确认	
   								overReview(msg,opContent)
   							} else {      
   								swal.close();		  
   							}  
       					});
       			}else{
       				overReview(msg,opContent)
       			}

       		}
       	
			//意见提交完成
        	function overReview(msg,opContent){  
        		/* 
        		var planSn=$('#detailPlanSn').val();  		    		        		
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/plan/preplan/preplan_review_saveOrUpdateReview.action",
					dataType : "json",
					data : {
						preplanSn:planSn,
						preplanStatus:msg,
						opinion:opContent
					},
					success : function(data) {
						console.log(data.status)
		                swal({       
							title:"",
							text: '完成编制,2秒后跳转回预案审核...如果没有跳转<a href="${pageContext.request.contextPath}/plan/preplan/plan_review_do.action" style="color:#F8BB86">请点击此处跳转</a>',          
							showConfirmButton: false,
							html: true   
							} 
			    		); 
			    		setTimeout(function(){
	                       location.href ="/plan/preplan/plan_review_do.action"; 
	                    },2000)       
					},
					error: function(){
						sweetAlert("加载失败", "未知错误，请登录重试!", "error");									
					}
					
				});	
				*/
        	}
        	</script>
    </body>

</html>