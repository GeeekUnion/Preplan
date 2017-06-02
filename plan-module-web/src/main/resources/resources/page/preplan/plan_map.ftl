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
						<li><span>地图</span></li>
					</ul>
				</div>
				<!-- END PAGE BAR -->
				<!-- BEGIN PAGE TITLE-->
				<h3 class="page-title">地图</h3>
				<!-- END PAGE TITLE-->
				<!-- END PAGE HEADER-->
				<!--BEGIN MAP CONTENT-->
				<!--MAP container-->
				<div style="width: 697px; height: 550px; border: #ccc solid 1px;"
					id="dituContent"></div>

				<div class="portlet box green">
					<div class="portlet-title">
						<div class="caption">
							<i class="fa fa-globe"></i>防控信息
						</div>
						<div class="actions">
							<a href="${pageContext.request.contextPath}/plan/preplan/"
								class="btn btn-default btn-sm btn-circle"> <i
								class="fa fa-plus"></i> 新增
							</a>
						</div>
					</div>

					<div class="portlet-body" id="">
						<table id="planListTable" class="display" cellspacing="0"
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
	<!--计算经纬度的api-->
	<script type="text/javascript"
		src="http://api.map.baidu.com/library/GeoUtils/1.2/src/GeoUtils.js"></script>
	<script type="text/javascript"
		src="http://api.map.baidu.com/getscript?v=2.0&ak=Kpjp7jddqVUhWK5VkrfNt3YNezY89NtR&services=&t=20170517145936"></script>

</body>
<script type="text/javascript">
		var points = new Array();
		var markers = new Array();
	    var s;//经度
	    var w;//纬度
	    var longitude, latitude;  
	var eventIcon = new BMap.Icon("${getMC ("")}/theme/img/icon/事件.png", new BMap.Size(20,20));
	var inventoryIcon = new BMap.Icon("${getMC ("")}/theme/img/icon/inventory.png", new BMap.Size(20,20));
	var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
	var point = new BMap.Point(116.331398,39.897445);
	map.centerAndZoom(point,12);

  

    //html5定位方法
    function getLocationHtml5(){
    var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			//alert('您的位置：'+r.point.lng+','+r.point.lat);
			//console.log(r.point.lng+"MMMMM"+r.point.lat);
		var circleLocation = new BMap.Circle(r.point,10000,{fillColor:"blue", strokeWeight: 1 ,fillOpacity: 0.3, strokeOpacity: 0.3});
    	map.addOverlay(circleLocation);
			initResource();
		}
		else {
			alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true})
	}
	
	//chrome定位方法
	function getLocationGoogle(){
		var geolocation = new BMap.Geolocation();
		geolocation.getCurrentPosition(function(r){
			if(this.getStatus() == BMAP_STATUS_SUCCESS){
				var mk = new BMap.Marker(r.point);
				map.addOverlay(mk);
				map.panTo(r.point);
				alert('您的位置：'+r.point.lng+','+r.point.lat);
				//生产圆圈
		var circleLocation = new BMap.Circle(r.point,10000,{fillColor:"blue", strokeWeight: 1 ,fillOpacity: 0.3, strokeOpacity: 0.3});
    	map.addOverlay(circleLocation);
				
		setTimeout(function(){
	    var convertor = new BMap.Convertor();
	    var pointArr = [];
	    pointArr.push(r.point);
	        convertor.translate(pointArr, 3, 5, translateCallback)
	    }, 1000);
	    
			}
			else {
				alert('failed'+this.getStatus());
			}        
		},{enableHighAccuracy: true})
	    
	
	translateCallback = function (data){
	      if(data.status === 0) {
	        var marker = new BMap.Marker(data.points[0]);
	        map.addOverlay(marker);
	      
	        map.setCenter(data.points[0]);
	      }
	    }
	}
	
	   
		 
		//单击maker事件
		function showInfo(marker,point){  
		 console.log(point);
          }
    	//右键单击map出现右键菜单事件
    	function RightClickMap(s,w){
    	var createMarker = function(map){
    	$('#winAdd').window('open');
    	};
    	var markerMenu=new BMap.ContextMenu();
    	markerMenu.addItem(new BMap.MenuItem('新建站点',createMarker.bind(map)));
    	map.addContextMenu(markerMenu);//给标记添加右键菜单
    	} 
    	
    	//右键单击Maker出现右键菜单事件
    	function RightClickMaker(marker,point){  	
    	var watchMarker = function(e,ee,marker){//右键查看附近
    	
    	
    	map.clearOverlays(); 
    	var circle2 = new BMap.Circle(point,5000,{fillColor:"blue", strokeWeight: 1 ,fillOpacity: 0.3, strokeOpacity: 0.3});
    	map.addOverlay(circle2);
    	
    	 //ajax显示Maker(Inventory)
         $.ajax({
 			url:'preplan_inventory_queryAllInventory.action',
 			type:'POST',
 			data:{
 			},
 			success:function(res){    
 		     var data=eval('('+res+')');
        for (var i = 0; i < data.length; i += 1) {
		var pointInventory = new BMap.Point(data[i].inventoryLongitude, data[i].inventoryLatitude);
		//如果资源点在圈内，就让他生产marker并显示出来
		if(BMapLib.GeoUtils.isPointInCircle(pointInventory,circle2)){
        var markerInventory = new BMap.Marker(pointInventory);
	    map.addOverlay(markerInventory);
     }else{
     console.log(" this is't in circle");
     }		
	}      
        }         
 		});	//ajax end

    	}
    	var removeMarker = function(e,ee,marker){//右键删除站点
    	console.log(marker);
    	}
	    var updateMarker = function(e,ee,marker){//右键更新站点
		if (confirm("要修改站点"+""+"的站名吗？")){
		if(true){
    	console.log(marker);
		}
		} 
		};
	
		
 
    	var markerMenu=new BMap.ContextMenu();
    	markerMenu.addItem(new BMap.MenuItem('查看附近资源',watchMarker.bind(marker)));
		markerMenu.addItem(new BMap.MenuItem('删除站点',removeMarker.bind(marker)));
		markerMenu.addItem(new BMap.MenuItem('修改站名',updateMarker.bind(marker)));
		marker.addContextMenu(markerMenu);//给标记添加右键菜单
    	} 
    //初始化所有资源，目标点
    function initResource(){
         $.ajax({
 			url:'preplan_inventory_queryVicinity.action',
 			type:'POST',
 			data:{
 			},
 			success:function(res){    
 		     var data=eval('('+res+')');
 		    console.log(data);
      for (var i = 0; i < data.length; i += 1) {
		var point = new BMap.Point(data[i].longitude, data[i].latitude);
       var marker = new BMap.Marker(point,
		{icon:inventoryIcon});
	    map.addOverlay(marker);

	}  
      
      
        }         
 		});	//ajax end
    }
    	
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
    }
	
    //创建地图函数：
    function createMap(){
        
        
       
    	map.addEventListener("rightclick",function(e){
    	    s = e.point.lng;//经度
        	w = e.point.lat;//维度
        	if(e.overlay){//判断右键单击的是否是marker	
            
        	}else{
        	RightClickMap(s,w);//右键单击map出现右键菜单事件
        	}
        	});
       

        window.map = map;//将map变量存储在全局
    }
    

    
    
    //ajax显示Maker(EVENT)
         $.ajax({
 			url:'preplan_event_queryAll.action',
 			type:'POST',
 			data:{
 			},
 			success:function(res){    
 		     var data=eval('('+res+')');
       
            
	 for (var i = 0; i < data.length; i++) {
		var point = new BMap.Point(data[i].longitude, data[i].latitude);
		var marker = new BMap.Marker(point,
		{
		icon:eventIcon,
		enableMassClear:false     //防止被大规模清除
		});
		points.push(point);
	    map.addOverlay(marker);
		RightClickMaker(marker,point);//右键单击marker出现右键菜单事件
		//给标注点添加点击事件。使用立即执行函数和闭包  
        (function() {  
            var thePoint = points[i];  
            marker.addEventListener("click",function(){  
                showInfo(this,thePoint);  
            });  
        })();  
		
		
	}       //循环结束
        }        
 		});	
 		
 		
 	
 		
 		
    
	
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    
    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
	map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
	var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
	map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
	var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
	map.addControl(ctrl_sca);
    }
    
    
    initMap();//创建和初始化地图
    
    
    
    
    
    
     $(function(){
      //update的相关方法↓
	//提交 
	$('#submit2').click(function(){
			$('#ffUpdate').form('submit', {    
			  
			    url:'preplan_inventory_update.action',           
			    success:function(data){
			    	var result = eval('(' + data + ')');
			    	if(result.status=='ok'){
			    		$.messager.alert("提示信息","修改成功！");
						$("#ffUpdate").form("reset");
						//关闭窗体
						$("#winUpdate").window("close");
						//刷新dg
						$("#dg").datagrid("reload");
				   	}else{
				   		$.messager.alert("提示信息","修改失败！",'error');
					}
			    }    
			});
		
	})
    	//Add的相关方法↓
 	      //重置
	$("#reset").click(function(){
		$("#ffAdd").form("reset");
	});
	
	
	//提交 
	$('#submit').click(function(){

			$('#ffAdd').form('submit', {    
			    url:'preplan_inventory_save.action',       
			    success:function(data){
			    	var result = eval('(' + data + ')');
			    	if(result.status=='ok'){
			    		$.messager.alert("提示信息","添加成功！");
						$("#ffAdd").form("reset");
						//关闭窗体
						$("#winAdd").window("close");
						//刷新dg
						$("#dg").datagrid("reload");
				   	}else{
				   		$.messager.alert("提示信息","添加失败！",'error');
					}
			    }    
			});
		
	})
	
	})
	//显示列表
	$(document).ready(function() {
				$('#planListTable').dataTable( {
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
	                    { "data": "inventorySn", align:"center" },
	                    { "data": "inventoryName" },
	                    { "data": "inventoryPrincipal" },
	                    { "data": "inventoryPrincipalPhone" },
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
			
			//浏览器判断
		
(function($, window, document,undefined){
    if(!window.browser){
         
        var userAgent = navigator.userAgent.toLowerCase(),uaMatch;
        window.browser = {}
         
        /**
         * 判断是否为ie
         */
        function isIE(){
            return ("ActiveXObject" in window);
             getLocationHtml5();
        }
        /**
         * 判断是否为谷歌浏览器
         */
        if(!uaMatch){
            uaMatch = userAgent.match(/chrome\/([\d.]+)/);
            if(uaMatch!=null){
                window.browser['name'] = 'chrome';
                window.browser['version'] = uaMatch[1];
                getLocationHtml5();          //本应该是google
            }
        }
        /**
         * 判断是否为火狐浏览器
         */
        if(!uaMatch){
            uaMatch = userAgent.match(/firefox\/([\d.]+)/);
            if(uaMatch!=null){
                window.browser['name'] = 'firefox';
                window.browser['version'] = uaMatch[1];
            }
        }
        /**
         * 判断是否为opera浏览器
         */
        if(!uaMatch){
            uaMatch = userAgent.match(/opera.([\d.]+)/);
            if(uaMatch!=null){
                window.browser['name'] = 'opera';
                window.browser['version'] = uaMatch[1];
            }
        }
        /**
         * 判断是否为Safari浏览器
         */
        if(!uaMatch){
            uaMatch = userAgent.match(/safari\/([\d.]+)/);
            if(uaMatch!=null){
                window.browser['name'] = 'safari';
                window.browser['version'] = uaMatch[1];
            }
        }
        /**
         * 最后判断是否为IE
         */
        if(!uaMatch){
            if(userAgent.match(/msie ([\d.]+)/)!=null){
                uaMatch = userAgent.match(/msie ([\d.]+)/);
                window.browser['name'] = 'ie';
                window.browser['version'] = uaMatch[1];
            }else{
                /**
                 * IE10
                 */
                if(isIE() && !!document.attachEvent && (function(){"use strict";return !this;}())){
                    window.browser['name'] = 'ie';
                    window.browser['version'] = '10';
                }
                /**
                 * IE11
                 */
                if(isIE() && !document.attachEvent){
                    window.browser['name'] = 'ie';
                    window.browser['version'] = '11';
                }
            }
        }
 
        /**
         * 注册判断方法
         */
        if(!$.isIE){
            $.extend({
                isIE:function(){
                    return (window.browser.name == 'ie');
                   
                }
            });
        }
        if(!$.isChrome){
            $.extend({
                isChrome:function(){
                    return (window.browser.name == 'chrome');
                    
                }
            });
        }
        if(!$.isFirefox){
            $.extend({
                isFirefox:function(){
                    return (window.browser.name == 'firefox');
                }
            });
        }
        if(!$.isOpera){
            $.extend({
                isOpera:function(){
                    return (window.browser.name == 'opera');
                }
            });
        }
        if(!$.isSafari){
            $.extend({
                isSafari:function(){
                    return (window.browser.name == 'safari');
                }
            });
        }
    }
})(jQuery, window, document);

console.log(window.browser);
console.log($.isIE());
console.log($.isChrome());
</script>
</html>