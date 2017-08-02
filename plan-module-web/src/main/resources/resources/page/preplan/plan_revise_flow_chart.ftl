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
                                <a href="${pageContext.request.contextPath}/plan/preplan/plan_revise_do.action">预案修订</a>
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
		                        <a role="button" href="javascript:;" onclick="submitPicture()" class="btn blue"><i class="fa fa-check"></i> 确认上传 </a>                                                  	
		                    </center>
			            </div>
			        </div>  
					
                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
        </div>
        <input id="imgUrlInput" type="hidden" value="">
        <input id="planSn" type="hidden" value="${planSn}"> 
        
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
       			
       		})
       	
   		    function uploadImg(msg) { 
   		    	var imgUrl= msg.toString();//获得路径
   		    	$('#imgUrlInput').val(imgUrl);
	        } 
       		
       		//保存图片
       		function submitPicture(){
       			var xheditor=$('#xheditor').xheditor()
       			//var imgUrl=$('#imgUrlInput').val();	
       			var planSn=$('#planSn').val();
				if(typeof(planSn)!="undefined" || planSn.length>0){
					$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/plan/preplan/preplan_flowChartContent_saveFlowChartContent.action",
						dataType : "json",
						data : {
							preplanSn:planSn,
							content:xheditor.getSource()
						
						},
						success : function(data) {
			                swal({       
								title:"",
								text: '上传成功,2秒后跳转回预案列表...如果没有跳转<a href="${pageContext.request.contextPath}/plan/preplan/plan_revise_do.action" style="color:#F8BB86">请点击此处跳转</a>',          
								showConfirmButton: false,
								html: true   
								} 
				    		); 
				    		setTimeout(function(){
		                       location.href ="/plan/preplan/plan_revise_do.action"; 
		                    },2000)       
						},
						error: function(){
							swal({
								title: "上传失败!",
								text: '未知错误，请刷新页面重试',
								type: "error",
								confirmButtonText: "确认"  
							});								
						}
						
					});	
				}else{
					swal({
						title: "上传失败!",
						text: '未知错误，请刷新页面重试',
						type: "error",
						confirmButtonText: "确认"  
					});
				}
       			

       		}
       	
			$(function(){
				var xheditor=$('#xheditor').xheditor()
				var planSn=$('#planSn').val();
				if(typeof(planSn)!="undefined" || planSn.length>0){
					$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/plan/preplan/preplan_flowChartContent_getFlowChartContentByPreplanSn.action",
							dataType : "json",
							data : {
								preplanSn:planSn						
							},
							success : function(data) {
								xheditor.setSource(data.content);	      
							},
							error: function(){
							
							}
							
					});	
				}	
			
			})
        	</script>
    </body>

</html>