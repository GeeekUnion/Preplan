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
<link rel="stylesheet" type="text/css"
	href="${getTheme('default','')}assets/global/plugins/datatables/datatables.min.css" />
<link rel="stylesheet" type="text/css"
	href="${getTheme('default','')}assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" />
<!-- END PAGE LEVEL PLUGINS -->
<style type="text/css">

</style>
    <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/jquery-validation/js/additional-methods.min.js"></script>
    

     <script type="text/javascript" src="${getTheme('default','')}xhedit/xheditor-1.2.2.min.js"></script>   
     <script type="text/javascript" src="${getTheme('default','')}xhedit/xheditor_lang/zh-cn.js"></script> 
</head>

<!-- END HEAD -->

<body
	class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
	<#include "/decorators/plan_head.ftl">
	<!-- BEGIN HEADER & CONTENT DIVIDER -->
	<div class="clearfix"></div>
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
						<li><a
							href="${pageContext.request.contextPath}/plan/preplan/plan_index.action">主页</a>
							<i class="fa fa-circle"></i></li>
						<li><span>演练</span></li>
					</ul>
				</div>
				<!-- END PAGE BAR -->
				<!-- BEGIN PAGE TITLE-->
				<h3 class="page-title">预案演练记录</h3>
				<!-- END PAGE TITLE-->
				<!-- END PAGE HEADER-->
				<!--BEGIN MAP CONTENT-->
				<!--Content container-->
				               	<div class="portlet box green" id="drillDiv">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-globe"></i>应急队伍信息
						</div>
						<div class="actions">
							<a onClick="addDrill()"
								class="btn btn-default btn-sm btn-circle"> <i
								class="fa fa-plus"></i> 新增
							</a>
						</div>
					</div>

					<div class="portlet-body" id="">
						<table id="drillTable" class="display" cellspacing="0"
							width="100%">
							<thead>
								<tr><th>  </th>
								    <th>预案演练部门</th>
									<th>预案演练编号</th>
									<th>预案名称</th>
									<th>预案演练人数</th>
									<th>预案演练时间</th>
									<th>预案演练打分</th>
									<th>预案演练内容</th>
								</tr>
							</thead>

						</table>
					</div>

				</div> 

                  
    <!--Modals-->
               <div id="staticAdd" class="modal fade bs-modal-lg modal-scroll" tabindex="-1" data-backdrop="static" data-keyboard="false" >
                                            <div class="modal-dialog modal-lg" >
                                                <div class="modal-content">
                                                   <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                        <h4 class="modal-title"></h4>
                                                    </div>
                                                    <div class="modal-body">
<!-- BEGIN FORM-->
                                    <form id="staticAddForm" class="form-horizontal">
                                        <div class="form-body">
                                            <div class="alert alert-danger display-hide">
                                                <button class="close" data-close="alert"></button> 请按照要求填写预案基本信息。</div>
                                            <div class="alert alert-success display-hide">
                                                <button class="close" data-close="alert"></button> Your form validation is successful! </div> 
                                                
                                            <div class="form-group">
                                                <label class="control-label col-md-3">选择预案
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                       <select class="form-control" name="preplanSelect" id="preplanSelect">
                                                                <option value=""></option>                                                                                                                                  
			                                             </select>                                                       
                                                    </div>    
                                                </div>
                                            </div> 
                                            
                                            <span class="help-block"> 预案内容:</span>
                                           <textarea id="xheditor" class="xheditor {skin:'default'}">
				                          </textarea>       
                                           <div class="form-group">
                                                <label class="control-label col-md-3">预案演练人数
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <input type="text" id="drillNumOfParticipants" name="drillNumOfParticipants" data-required="1" class="form-control"  value=""/> 
                                                        <span class="help-block"> 不能为空，必须为整数。</span>
                                                    </div>   
                                                </div>
                                            </div>   
                                            <div class="form-group">
                                                <label class="control-label col-md-3">预案演练评估
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <textarea rows="5" cols="40" wrap="physical" id="drillAssessment" name="drillAssessment" data-required="1" class="form-control"  value=""/> 
                                                        </textarea>
                                                        <span class="help-block"> 不能为空</span>
                                                    </div>   
                                                </div>
                                            </div> 
                                              <div class="form-group">
                                                <label class="control-label col-md-3">预案演练打分
                                                    <span class="required"> * </span>
                                                </label>
                                                <div class="col-md-4">
                                                    <div class="input-icon right">
                                                        <i class="fa"></i>
                                                        <input type="text" id="drillScore" name="drillScore" data-required="1" class="form-control"  value=""/> 
                                                        <span class="help-block"> 不能为空，必须为数字，满分100</span>
                                                    </div>   
                                                </div>
                                            </div>    
                                            
                                        </div>
                                        <input id="id" type="text" style="display:none" value="">
                                        <input id="preplanId" type="text" style="display:none" value="">
                                        <hr>
						                <button type="button" data-dismiss="modal" class="btn dark btn-outline">取消</button>
                                        <button type="submit" class="btn green"> 提交</button>
                                    </form>
                                    <!-- END FORM-->                                                                                                
                                    </div>

                                </div>
                            </div>
                        </div>
              <!--End Modals-->    


				<!-- END MAP CONTENT-->
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
	<script type="text/javascript"
		src="${getTheme('default','')}assets/global/scripts/datatable.js"></script>
	<script type="text/javascript"
		src="${getTheme('default','')}assets/global/plugins/datatables/datatables.min.js"></script>
	<script type="text/javascript"
		src="${getTheme('default','')}assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->

	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script type="text/javascript"
		src="${getTheme('default','')}assets/pages/scripts/table-datatables-fixedheader.min.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<!--MAP PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/select2/js/select2.full.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/jquery-validation/js/additional-methods.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/pages/scripts/form-validation.min.js"></script>        
    <!-- END PAGE LEVEL PLUGINS -->
	<script type="text/javascript">
	//初始化preplanSn
	var preplanSn="";
	//编辑器
	$(function(){
  				$('#xheditor').xheditor({
  					tools:'Cut,Copy,Paste,Pastetext,Blocktag,Align,List,Outdent,Indent,Fullscreen,Img',
  					skin:'default',
  					html5Upload : false, //此属性必须为false 否则无法上传图片 
       				//onUpload : uploadImg,   
       				upImgUrl:"${pageContext.request.contextPath}/plan/preplan/preplan_picture_uploadImg.action",
       				upImgExt:"jpg,jpeg,gif,png"
  				})
  			})
  	//编辑器2,单独的用来修改内容的
	$(function(){
  				$('#xheditor2').xheditor({
  					tools:'Cut,Copy,Paste,Pastetext,Blocktag,Align,List,Outdent,Indent,Fullscreen,Img',
  					skin:'default',
  					html5Upload : false, //此属性必须为false 否则无法上传图片 
       				//onUpload : uploadImg,   
       				upImgUrl:"${pageContext.request.contextPath}/plan/preplan/preplan_picture_uploadImg.action",
       				upImgExt:"jpg,jpeg,gif,png"
  				})
  			})		
  			
  	    $.validator.setDefaults( {
			submitHandler: function () {
				alert( "submitted!" );
			}
		} );
      
	$(document).ready(function() {
				queryDrill();
			} );
	 function  queryDrill(){
	$('#drillTable').dataTable( {
					"ajax": {
					    "url": "${pageContext.request.contextPath}/plan/preplan/preplan_drill_queryDrillPage.action",
					    "type": "POST",
					    "data": function ( d ) {

					    }
					},
				  	"deferRender": true,
				  	"searching": true,
				  	"processing": true,
				  	"destroy": true,//如果需要重新加载的时候请加上这个
			        "columns": [
			            { "data": "id", "visible":false },
	                    { "data": "orgName", align:"center" },
	                    { "data": "drillSn" },
	                    { "data": "drillPreplanName" },
	                    { "data": "drillNumOfParticipants" },
	                    { "data": "drillTime" },
	                    { "data": "drillScore" },
	                    { "formatNumber": "preplanTime" }
	                ],
	                "columnDefs": [ {
			            "targets": -1,//最后一列
			            "data": null,
			            render: function(data, type, row, meta) {
				            return '<a  class="btn blue" onclick="alterDrill(\''+row.id+'\')">'
	                                      +          	'<i class="fa fa-edit">编辑 </i>'
	                                      +      '</a>'
	                                      + '<a  class="btn red" onclick="deleteDrill(\''+row.id+'\')">'
	                                      +          	'<i class="fa fa-delete">删除 </i>'
	                                      +      '</a>'
	                                     
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
			
		//查看并编辑演练内容	
		function alterDrill(id){
		console.log(id);
		var xhedit=$('#xheditor').xheditor();
		 $('#id').val(id);
		$.ajax({
		url:'${pageContext.request.contextPath}/plan/preplan/preplan_drill_queryDrillById.action',
		dataType:"json",	  
		method:"POST",
		data:{
	     id:id
	     },	 
		success:function(data){    
			   console.log(data);
			   xhedit.setSource(data.drillContent);
			   $('#preplanId').val(data.preplanId);
			   $('#drillNumOfParticipants').val(data.drillNumOfParticipants);
			   $('#drillScore').val(data.drillScore);
			   $('#drillAssessment').val(data.drillAssessment);
			   $.ajax({
						url:'${pageContext.request.contextPath}/plan/preplan/preplan_drill_queryPreplanList.action',
						dataType:"json",	  
						method:'POST',
						success:function(data){    
							    var html=""
							    for(var i=0;i<data.length;i++){
							      var preplanId=$('#preplanId').val();
							      var co=data[i];
							      console.log(data[i].id)
							      console.log(id+"!!!!!!!!!!!!!!!!!!!!!!!!!!!")
							      if(data[i].id==preplanId){
							       html=html+'<option value="'+co['preplanSn']+'" selected="selected">'+co['preplanName']+'</option>'
							      }else{
							        html=html+'<option value="'+co['preplanSn']+'">'+co['preplanName']+'</option>' 
							      }
							      
							    	   
							    }
							    $("#preplanSelect").html(html);
							}
						})
			}
		})
		$('#staticAdd').modal('show')
		}
		
        //删除事件drill的方法
    	function deleteDrill(id){
				swal({    
				    title: "确认删除该事件？",     
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
							url : "${pageContext.request.contextPath}/plan/preplan/preplan_drill_delete.action",
							dataType : "json",
							data : {
							id:id	
							},
							success : function(data) {
                                  if(data.status=="ok"){
                                swal({ 
								  title: "删除成功", 
								  timer: 2000
								  });
                                 queryDrill();
                                  }if(data.status=="nook"){
                                   swal({ 
									  title: "删除失败", 
									  text: "3秒后自动关闭。", 
									  timer: 3000
									});
                                  }
		 										
							},
							error: function(){
							 
																	
							}
						});	   
				    }
				);
				
			}
  
  
  
		
		//增加预案，生成表格
	function addDrill(){
	 $('#drillNumOfParticipants').val("");
	 $('#drillScore').val("");
	 $('#drillAssessment').val("");
	 $('#id').val(0);
	  var xhedit=$('#xheditor').xheditor();
	 xhedit.setSource("");
	 
	$.ajax({
	url:'${pageContext.request.contextPath}/plan/preplan/preplan_drill_queryPreplanList.action',
	dataType:"json",	  
	method:'POST',
	success:function(data){    
		    var html=""
		    for(var i=0;i<data.length;i++){
		    	var co=data[i];
		    	
		        html=html+'<option value="'+co['preplanSn']+'">'+co['preplanName']+'</option>'    
		    }
		    $("#preplanSelect").html(html);
		    $('#staticAdd').modal('show')
		}
	})
	               }
	         
	               
	
		
		//更新内容
	function updateDrill(){
	 var id= $('#id').val();
	 console.log();
	 var xhedit=$('#xheditor2').xheditor();
     var drillContent=xhedit.getSource();
	$.ajax({    
	url:'${pageContext.request.contextPath}/plan/preplan/preplan_drill_update.action',
	method:'POST',
	dataType:"json",
	data:{
	id:id,
	drillContent:drillContent
	     },	  
	success:function(data){    
	if(data.status=="ok"){
	swal("提交成功");
	}else{
	swal("提交失败");
	}
		                 }
	     })
	                     }	
	                     
	                     
	$(function(){			
				var form2 = $('#staticAddForm');
	            var error2 = $('.alert-danger', form2);
	            var success2 = $('.alert-success', form2);
	
	            form2.validate({
	                errorElement: 'span', //default input error message container
	                errorClass: 'help-block help-block-error', // default input error message class
	                focusInvalid: false, // do not focus the last invalid input
	                ignore: "",  // validate all fields including form hidden input
	                rules: {
	                    drillNumOfParticipants: {
	                        required: true,
	                        digits:true 
	                    },
	                    preplanSelect: {
	                        required: true
	                    },
	                    drillScore: {
	                        required: true,
	                        digits:true
	                    },
	                     drillAssessment: {
	                        required: true
	                    },
	                    
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
	                	preplanSn=$("#preplanSelect").val();
		                var drillNumOfParticipants=$("#drillNumOfParticipants").val();
		                var xhedit=$('#xheditor').xheditor();
		                var drillContent=xhedit.getSource();
		                var drillScore=$("#drillScore").val();
	                    var drillAssessment=$("#drillAssessment").val();
	                    var id=$("#id").val();
		            	$.ajax({    
		                        url:'${pageContext.request.contextPath}/plan/preplan/preplan_drill_save.action',
		                        method:'POST',
		                        dataType:"json",
		                        data:{
		                            preplanSn:preplanSn,
		                            drillNumOfParticipants :drillNumOfParticipants,
		                            drillContent:drillContent,
		                            drillScore:drillScore,
		                            drillAssessment:drillAssessment,
		                            id:id
		                            },	  
		                        success:function(data){    
		                                if(data.status=="ok"){
		                                queryDrill();
		                                swal("提交成功");
		                                $('#staticAdd').modal('hide');
		                                }else{
		                                swal("提交失败");
		                                }
				                }
			                })
	                 
		                	return false; // 阻止表单自动提交事件
		                
	                }
	            });
				
	        })                     
		
</script>
</body>


</html>