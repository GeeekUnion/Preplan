<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript">
        
       //删除inventory,hazard等等的方法
    	function deleteRe(iType){
    	var iTypeChar =iType.substr(0,1);
    	console.log(iTypeChar);
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
									"idType" : iType
							},
							success : function() {
							
							  switch(iTypeChar){
							    case 'a':
								         loadTable();
								break;
								case 'b':
								         hazardClick("hazard");
								 break;
								 case 'c':
								         emergencyResponseTeamClick("emergencyResponseTeam");
								  break;
								 case 'd': 
								         protectionObjectClick("protectionObject")
								default:
								         loadTable();
							  }
		 						
		 						
		 						
		 						
		 						swal.close();				
							},
							error: function(){
								swal.close();									
							}
						});	   
				    }
				);
				
			}
    //修改Inventory
    function alterInventory(id){
 
    $.ajax({
	url:'${pageContext.request.contextPath}/plan/preplan/preplan_inventory_queryInventoryById.action',
	dataType:"json",	
	data:{
	id:id
	},  
	method:'POST',
	success:function(data){    
        console.log(data);
         $("#longitude").val(data.longitude);
          $("#latitude").val(data.latitude);
           $("#inventorySn").val(data.inventorySn);
            $("#inventoryName").val(data.inventoryName);
             $("#inventoryPrincipal").val(data.inventoryPrincipal);
              $("#inventoryPrincipalPhone").val(data.inventoryPrincipalPhone);
              $("#id").val(id);
		}
	})
    $('#static').modal('show')
    }
    
    //提交修改Inventory!!!!!!!!!!!!!!
    function commitAlter(){
    console.log($("#id").val());
    var id=$("#id").val();
    var longitude= $("#longitude").val();
	var latitude=$("#latitude").val();
	var inventoryName=$("#inventoryName").val();
	var inventorySn=$("#inventorySn").val();
	var inventoryPrincipal=$("#inventoryPrincipal").val();
	var inventoryPrincipalPhone=$("#inventoryPrincipalPhone").val();
	$.ajax({    
	url:'${pageContext.request.contextPath}/plan/preplan/preplan_inventory_update.action',
	dataType:"json",
	method:"post",
	data:{
	id:id,
	longitude:longitude,
	latitude:latitude,
	inventoryName:inventoryName,
	inventorySn:inventorySn,
	inventoryPrincipal:inventoryPrincipal,
	inventoryPrincipalPhone:inventoryPrincipalPhone
	     },	  
	success:function(data){    
	if(data.status=="ok"){
	swal("提交成功");
    loadTable();
	}else{
	swal("提交失败");
	}
		                 }
	   })
    }
    
   
    
    
    	//显示列表
	$(document).ready(function() {
	     loadTable();
			} );
        function loadTable(){
				$('#inventoryTable').dataTable( {
					"ajax": {
					    "url": "${pageContext.request.contextPath}/plan/preplan/preplan_inventory_queryByPage.action",
					    "type": "POST",
					     "data": {
				          lo:lo,
				          la:la
					    }
					},
				  	"deferRender": true,
				  	"searching": true,
				  	"processing": true,
				  	"destroy": true,//如果需要重新加载的时候请加上这个
			        "columns": [
			            {"data": "id",
			              "visible":false
			            },
			            {"data":"iType",
			            "visible":false
			            },
	                    { "data": "sn", align:"center" },
	                    { "data": "name" },
	                    { "data": "longitude" },
	                    { "data": "latitude" },
	                    { "data": "inventoryPrincipal" },
	                    { "data": "inventoryPrincipalPhone" },
	                    { "formatNumber": "preplanTime" }
	                ],
	                "columnDefs": [ {
			            "targets": -1,//最后一列
			            "data": null,
			            render: function(data, type, row, meta) {
				            return '<a href="javascript:;" class="btn blue" onclick="alterInventory(\''+row.id+'\')">'
	                                      +          	'<i class="fa fa-edit">编制 </i>'
	                                      +      '</a>'
	                                      +  	'<a href="javascript:;" class="btn red"onclick="deleteRe(\''+row.iType+'\')">'
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
   
   
   
   
   function hazardClick(clickType){
   console.log(clickType);
  
				$('#hazardTable').dataTable( {
					"ajax": {
					    "url": "${pageContext.request.contextPath}/plan/preplan/preplan_inventory_queryByPage.action",
					    "type": "POST",
					    "data":{
				          lo:lo,
				          la:la,
				          "clickType":clickType
					             }
					},
				  	"deferRender": true,
				  	"searching": true,
				  	"processing": true,
				  	"destroy": true,
			        "columns": [
			           {"data": "id",
			              "visible":false
			            },
			            {"data":"iType",
			            "visible":false
			            },
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
	                                      +  	'<a href="javascript:;" class="btn red"onclick="deleteRe(\''+row.iType+'\')">'
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
					    "data":{
				          lo:lo,
				          la:la,
				          "clickType":clickType
					             }
					},
				  	"deferRender": true,
				  	"searching": true,
				  	"processing": true,
				  	"destroy": true,
			        "columns": [
			           {"data": "id",
			              "visible":false
			            },
			            {"data":"iType",
			            "visible":false
			            },
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
	                                      +  	'<a href="javascript:;" class="btn red"onclick="deleteRe(\''+row.iType+'\')">'
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
					    "data":{
				          lo:lo,
				          la:la,
				          "clickType":clickType
					             }
					},
				  	"deferRender": true,
				  	"searching": true,
				  	"processing": true,
				  	"destroy": true,
			        "columns": [
			            {"data": "id",
			              "visible":false
			            },
			            {"data":"iType",
			            "visible":false
			            },
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
	                                      +  	'<a href="javascript:;" class="btn red"onclick="deleteRe(\''+row.iType+'\')">'
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
                                        
                                        <div class="actions">
                                            <div class="btn-group">
                                               
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
								    <th>类型</th>
									<th>资源点编号</th>
									<th>资源点名称</th>
									<th>经度</th>
									<th>纬度</th>
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
								 <th>类型</th>
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
								 <th>类型</th>
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
								<th>类型</th>
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
<!--Modals-->
               <div id="static" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" >
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                        <h4 class="modal-title">Confirmation</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                            <!-- BEGIN FORM-->
	                                        <form action="#" id="form_sample_1" class="form-horizontal">
	                                            <div class="form-body">
                                                <div class="alert alert-danger display-hide">
                                                    <button class="close" data-close="alert"></button> You have some form errors. Please check below. </div>
                                                <div class="alert alert-success display-hide">
                                                    <button class="close" data-close="alert"></button> Your form validation is successful! </div>
                                                    
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">资源点编号
                                                        <span class="required"> * </span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input id="inventorySn" name="inventorySn" type="text" data-required="1" class="form-control" /> </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">资源点名称
                                                        <span class="required"> * </span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input id="inventoryName" name="inventoryName" type="text" class="form-control" /> </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">资源点经度
                                                        <span class="longitude"> * </span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input id="longitude" name="text" type="text" class="form-control" /> </div>
                                                </div>
                                                 <div class="form-group">
                                                    <label class="control-label col-md-3">资源点纬度
                                                        <span class="required"> * </span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input id ="latitude" name="latitude" type="text" class="form-control" /> </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">负责人
                                                        <span class="required"> * </span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input id="inventoryPrincipal" name="inventoryPrincipal" type="text" class="form-control" value="" /> </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">负责人联系方式
                                                        <span class="required"> * </span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input id="inventoryPrincipalPhone" name="inventoryPrincipalPhone" type="text" class="form-control" value=""/> </div>
                                                </div>
                                                <input id="id" type="text" style="display:none" value="">
                                      
                                        </form>
                                        <!-- END FORM-->
                                                    
                                                    
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" data-dismiss="modal" class="btn dark btn-outline">取消</button>
                                                        <button type="button" data-dismiss="modal" class="btn green" onclick="commitAlter()"> 提交</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                              <!--End Modals-->      
	                          
	
</body>
</html>