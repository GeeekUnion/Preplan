<div class="portlet-body" id="">
	<table id="planListTable" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>预案编号</th>
                <th>预案名称 </th>
                <th>类别 </th>
                <th>负责部门</th>
                <th>日期 </th>
                <th>操作</th>
            </tr>
        </thead>

    </table>
</div>
       	<script>         
			$(document).ready(function() {
				$('#planListTable').dataTable( {
					"ajax": {
					    "url": "${pageContext.request.contextPath}/plan/preplan/preplan_preplan_queryPreplanList.action",
					    "type": "POST",
					    "data": function ( d ) {
					    	d.ppDept = '110'

					    }
					},
				  	"deferRender": true,
				  	"searching": true,
				  	"processing": true,
			        "columns": [
	                    { "data": "preplanUid", align:"center" },
	                    { "data": "preplanName" },
	                    { "data": "preplanType" },
	                    { "data": "responDept" },
	                    { "data": "preplanTime" },
	                    { "formatNumber": "preplanTime" }
	                ],
	                "columnDefs": [ {
			            "targets": -1,//最后一列
			            "data": "id",
			            "defaultContent": '<a href="javascript:;" class="btn blue" onclick="alterPlan()">'
	                                      +          	'<i class="fa fa-edit">编制 </i>'
	                                      +      '</a>'
	                                      +  	'<a href="javascript:;" class="btn red"onclick="deletePlan()">'
	                                      +  			'<i class="fa fa-times">删除</i>'
	                                      +      '</a>'
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