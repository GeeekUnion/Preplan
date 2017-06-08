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
	<script type="text/javascript">
	$(document).ready(function() {
	
	
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
			        "columns": [
	                    { "data": "drillSn", align:"center" },
	                    { "data": "drillPreplanName" },
	                    { "data": "drillNumOfParticipants" },
	                    { "data": "drillContent" },
	                    { "formatNumber": "preplanTime" }
	                ],
	                "columnDefs": [ {
			            "targets": -1,//最后一列
			            "data": null,
			            render: function(data, type, row, meta) {
				            return '<a href="javascript:;" class="btn blue" onclick="alterPlan('+row.id+')">'
	                                      +          	'<i class="fa fa-edit">编制 </i>'
	                                      +      '</a>'
	                                      +  	'<a href="javascript:;" class="btn red"onclick="deletePlan('+row.id+')">'
	                                      +  			'<i class="fa fa-times">删除</i>'
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
			} );
</script>
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
							href="${pageContext.request.contextPath}/plan/preplan/planIndex.action">主页</a>
							<i class="fa fa-circle"></i></li>
						<li><span>演练</span></li>
					</ul>
				</div>
				<!-- END PAGE BAR -->
				<!-- BEGIN PAGE TITLE-->
				<h3 class="page-title">预案演练</h3>
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
							<a href="${pageContext.request.contextPath}/plan/preplan/"
								class="btn btn-default btn-sm btn-circle"> <i
								class="fa fa-plus"></i> 新增
							</a>
						</div>
					</div>

					<div class="portlet-body" id="">
						<table id="drillTable" class="display" cellspacing="0"
							width="100%">
							<thead>
								<tr>
									<th>预案演练编号</th>
									<th>预案名称</th>
									<th>预案演练人数</th>
									<th>预案演练内容</th>
									<th>操作</th>
								</tr>
							</thead>

						</table>
					</div>

				</div> 




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

</body>


</html>