<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel = "stylesheet" href="${getTheme('default','')}default/easyui.css" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="${getTheme('default','')}/icon.css"/>
    <link rel="stylesheet" type="text/css" href="${getTheme('default','')}/esui.css"/>
	<script type="text/javascript" src="${getMC ("")}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${getMC ("")}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${getMC ("")}/js/esui.js"></script>

    <script type="text/javascript">
    	//查询所有权限
 		$(function (){
 			//数据表格
 			$('#ppltt').datagrid({
 			    url:'preplan_preplan_queryPreplanList.action',			   	
 			   	pagination:true,
				pageNumber:1,
				pageSize:20,
				pageList:[20,40,80,100],
				rownumbers:true,
 			   	striped:true,
 			   	singleSelect:true, 			    
 			    columns:[[    
 					{field:'preplanName',title:'预案名字',width:300,align:'center'},
 					{field:'responDept',title:'负责单位',width:300,align:'center'},
 					{field:'id',title:'操作',width:'200',align:'center',
 								 formatter:function(value,row,index){
 								 			var i = row.id;
		        		  					return "<a  href='#' onclick='detailView(" +i+ ")'  class='detail_view' >"+"查看预案详情"+"</a>";				        		
		        	}}
 			    ]],
 			    //成功加载出发
 			    onLoadSuccess:function(){
	 			    	$('.detail_view').linkbutton({    
						    iconCls: 'icon-search'   
						});  
	 			    }
 			});
 		});
 		//下拉搜索
		$(function (){
			$('#ppl_search').combobox({    
			    url:'preplan_domain_queryAllDomain.action',    
			    valueField:'domain_sn',    
			    textField:'domain_name'   
			});
			$('#ppl_search_btn').linkbutton({    
			    iconCls: 'icon-search'   
			});   
		})
 		
 		//下拉搜索预案列表
 		function searchPreplanList(){
 			//获得搜索值
 			var searchCode = $('#ppl_search').combobox('getValue');
 			console.log(searchCode);
 			jQuery.ajax({
					url: 'preplan_preplan_queryPreplanList.action',
					type: 'post',
					data: {
							ppType:searchCode,
							page:1,
							rows:20,
							},
					success: function() {
						
					}
				});
 			
 		}
 		
 		//查看预案详情
 		function detailView(i){
 			$('#ppl_detail').window({
				width:700,
				height:550,
				title:'当前预案详情',
				cache:false,
				content:'<iframe src="preplan_detail_view.action?code=' +i+ '" frameborder="0" width="100%" height="100%"/>'
			});
 		}
 		
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
    <!--表格-->
        
    <div class="top-area">
    	<p class="title"><strong>预案列表</strong></p>
    	<div class="title">
    		<input id="ppl_search" name="dept" value="选择预案类型">
    		<a id="ppl_search_btn" href="#" onclick="searchPreplanList()">搜索</a>
    	</div> 	
    	<table id="ppltt"></table>  
    </div>   
    <div class="btm-area">

    </div>
	<div id="ppl_detail" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div> 
</body>
</html>