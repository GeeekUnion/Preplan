<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript">
    //删除方法
    	function deleteInventory(id){
    	console.log(id);
				swal({    
				    title: "确认删除该资源点？",     
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
							url : "${pageContext.request.contextPath}/plan/preplan/preplan_inventory_deleteInventory.action",
							dataType : "json",
							data : {
									"code" : id
							},
							success : function() {
		 						
		 						swal.close();				
							},
							error: function(){
								swal.close();									
							}
						});	   
				    }
				);
				
			}
    
    
    
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
			            {"data": "id"},
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
	                                      +  	'<a href="javascript:;" class="btn red"onclick="deleteInventory(\''+row.id+'\')">'
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
   console.log(clickType);
  
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
				  	"destroy": true,
			        "columns": [
			            {"data": "id"},
	                    { "data": "sn",
	                     "align":"center" 
	                    },
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
			
			
	 function emergencyResponseTeamClick(clickType){
     console.log(clickType);
  
				$('#emergencyResponseTeamTable').dataTable( {
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
				  	"destroy": true,
			        "columns": [
			            {"data": "id"},
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
			
	 function protectionObjectClick(clickType){
     console.log(clickType);
  
				$('#protectionObjectTable').dataTable( {
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
				  	"destroy": true,
			        "columns": [
			            {"data": "id"},
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
<div class="portlet light bordered">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="icon-bubble font-green-sharp"></i>
                                            <span class="caption-subject font-green-sharp bold uppercase">Default Pills</span>
                                        </div>
                                        <div class="actions">
                                            <div class="btn-group">
                                                <a class="btn green-haze btn-outline btn-circle btn-sm" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> Actions
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <ul class="dropdown-menu pull-right">
                                                    <li>
                                                        <a href="javascript:;"> Option 1</a>
                                                    </li>
                                                    <li class="divider"> </li>
                                                    <li>
                                                        <a href="javascript:;">Option 2</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:;">Option 3</a>
                                                    </li>
                                                    <li>
                                                        <a href="javascript:;">Option 4</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <ul class="nav nav-pills">
                                            <li class="active">
                                                <a href="#tab_2_1" data-toggle="tab" > 资源 </a>
                                            </li>
                                            <li>
                                                <a href="#tab_2_2" data-toggle="tab" onclick="hazardClick('hazard')"> 危险源 </a>
                                            </li>
                                            <li>
                                                <a href="#tab_2_3" data-toggle="tab" onclick="emergencyResponseTeamClick('emergencyResponseTeam')"> 应急队伍 </a>
                                            </li>
                                            <li>
                                                <a href="#tab_2_4" data-toggle="tab" onclick="protectionObjectClick('protectionObject')"> 防护目标</a>
                                            </li>
                                            <li class="dropdown">
                                                <a href="javascript:;" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown"> Dropdown
                                                    <i class="fa fa-angle-down"></i>
                                                </a>
                                                <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                                                    <li>
                                                        <a href="#tab_2_3" tabindex="-1" data-toggle="tab"> Option 1 </a>
                                                    </li>
                                                    <li>
                                                        <a href="#tab_2_4" tabindex="-1" data-toggle="tab"> Option 2 </a>
                                                    </li>
                                                    <li>
                                                        <a href="#tab_2_3" tabindex="-1" data-toggle="tab"> Option 3 </a>
                                                    </li>
                                                    <li>
                                                        <a href="#tab_2_4" tabindex="-1" data-toggle="tab"> Option 4 </a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane fade active in" id="tab_2_1">
                                                <div class="portlet box green" id="inventoryDiv">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-globe"></i>资源信息
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
								    <th>id</th>
									<th>资源点编号</th>
									<th>资源点名称</th>
									<th>负责人</th>
									<th>负责人联系方式</th>
									<th>操作</th>
								</tr>
							</thead>

						</table>
					</div>

				</div>  
                                            </div>
                                            <div class="tab-pane fade" id="tab_2_2">
                                                <div class="portlet box green" id="hazardDiv">
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
								<th>id</th>
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
                                            </div>
                                            <div class="tab-pane fade" id="tab_2_3">
                                               	<div class="portlet box green" id="emergencyResponseTeamDiv">
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
						<table id="emergencyResponseTeamTable" class="display" cellspacing="0"
							width="100%">
							<thead>
								<tr>
								<th>id</th>
									<th>应急队伍编号</th>
									<th>应急队伍名称</th>
									<th>应急队伍经度</th>
									<th>应急队伍纬度</th>
									<th>操作</th>
								</tr>
							</thead>

						</table>
					</div>

				</div>  	
                                            </div>
                                            <div class="tab-pane fade" id="tab_2_4">
                                               <div class="portlet box green" id="protectionObjectDiv">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-globe"></i>防护目标信息
						</div>
						<div class="actions">
							<a href="${pageContext.request.contextPath}/plan/preplan/"
								class="btn btn-default btn-sm btn-circle"> <i
								class="fa fa-plus"></i> 新增
							</a>
						</div>
					</div>

					<div class="portlet-body" id="">
						<table id="protectionObjectTable" class="display" cellspacing="0"
							width="100%">
							<thead>
								<tr>
								<th>id</th>
									<th>防护目标编号</th>
									<th>防护目标名称</th>
									<th>防护目标经度</th>
									<th>防护目标纬度</th>
									<th>操作</th>
								</tr>
							</thead>

						</table>
					</div>

				</div>  			
                                            </div>
                                        </div>
                                    </div>
                                </div>

  
	
</body>
</html>