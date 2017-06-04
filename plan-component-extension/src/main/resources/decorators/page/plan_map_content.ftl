<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript">
    	//显示列表
	$(document).ready(function() {
				$('#inventoryTable').dataTable( {
					"ajax": {
					    "url": "${pageContext.request.contextPath}/plan/preplan/preplan_inventory_queryByPage.action",
					    "type": "POST",
					    "data": function ( d ) {

					    }
					},
				  	"deferRender": true,
				  	"searching": true,
				  	"processing": true,
			        "columns": [
	                    { "data": "sn", align:"center" },
	                    { "data": "name" },
	                    { "data": "longitude" },
	                    { "data": "latitude" },
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
    
   function hazardClick(clickType){
				$('#hazardTable').dataTable( {
					"ajax": {
					    "url": "${pageContext.request.contextPath}/plan/preplan/preplan_inventory_queryByPage.action",
					    "type": "POST",
					    "data": {
                         "clickType":clickType
					    }
					},
				  	"deferRender": true,
				  	"searching": true,
				  	"processing": true,
			        "columns": [
	                    { "data": "sn", align:"center" },
	                    { "data": "name" },
	                    { "data": "longitude" },
	                    { "data": "latitude" },
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
			} 	
    </script>
    </head>

<body>
  <div class="portlet box green">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-globe"></i>防控信息
						</div>
						<div class="actions">
							<a href=""
								class="btn btn-default btn-sm btn-circle"> <i
								class="fa fa-plus"></i> 新增
							</a>
						</div>
					</div>

					<div class="portlet-body" id="">
						<table id="inventoryTable" class="display" cellspacing="0"
							width="100%">
							<thead>
								<tr>
									<th>预案编号</th>
									<th>预案名称</th>
									<th>负责人</th>
									<th>负责人联系方式</th>
									<th>操作</th>
								</tr>
							</thead>

						</table>
					</div>

				</div>  
				
				<div class="portlet box green">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-globe"></i>危险源信息
						</div>
						<div class="actions">
							<a href="${pageContext.request.contextPath}/plan/preplan/"
								class="btn btn-default btn-sm btn-circle"> <i
								class="fa fa-plus"></i> 新增
							</a>
						</div>
					</div>

					<div class="portlet-body" id="">
						<table id="hazardTable" class="display" cellspacing="0"
							width="100%">
							<thead>
								<tr>
									<th>危险源编号</th>
									<th>危险源名称</th>
									<th>危险源经度</th>
									<th>危险源人纬度</th>
									<th>操作</th>
								</tr>
							</thead>

						</table>
					</div>

				</div>  
			
	
</body>
</html>