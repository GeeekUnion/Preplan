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
     //api主文件
     <script type="text/javascript" src="${getMC ("")}/js/apiv1.3.min.js"></script>
     <link rel="stylesheet" type="text/css" href="bmap.css"/>
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
						<li><span>离线地图</span></li>
					</ul>
				</div>
				<!-- END PAGE BAR -->
				<!-- BEGIN PAGE TITLE-->
				<h3 class="page-title">离线地图</h3>
				<!-- END PAGE TITLE-->
				<!-- END PAGE HEADER-->
				<!--BEGIN MAP CONTENT-->
				<!--Content container-->
				<div style="width:80%;height:80%;border:1px solid gray;position:absolute;" id="container"></div>
<div id="position" style="width:80%;height:10%;border:1px solid gray;position:absolute;background-color:#cacfd2; margin-top:517px;">



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
	     
		
</script>
</body>
<script type="text/javascript">
	var mapOptions = {
		//minZoom: 12, 地图最小层级
		mapType: BMAP_NORMAL_MAP
	}
	var map = new BMap.Map("container", mapOptions);      //设置卫星图为底图BMAP_PERSPECTIVE_MAP
	var initPoint = new BMap.Point(116.404, 39.915);    // 创建点坐标
	
	map.centerAndZoom(initPoint,5);                    // 初始化地图,设置中心点坐标和地图级别。
	map.enableScrollWheelZoom();                  // 启用滚轮放大缩小。
	map.enableKeyboard();                         // 启用键盘操作。  
	map.enableContinuousZoom();										//启用连续缩放效果
	
	// ----- control -----
	map.addControl(new BMap.NavigationControl()); //地图平移缩放控件
	map.addControl(new BMap.ScaleControl()); //显示比例尺在右下角
	map.addControl(new BMap.OverviewMapControl({anchor: BMAP_ANCHOR_TOP_RIGHT, isOpen: true})); //缩略图控件

	// ----- menu -----
	var contextMenu = new BMap.ContextMenu();
	var txtMenuItem = [
		{
			text:'在此处添加模拟器',
			callback:function(p){
				addSimulatorMarker(p);
			}
		},
		{
			text:'在此处添加训练仓',
			callback:function(p){
				addCabinMarker(p);
		 	}
		}
	];
  for(var i=0; i < txtMenuItem.length; i++){
	  contextMenu.addItem(new BMap.MenuItem(txtMenuItem[i].text,txtMenuItem[i].callback,100));
	  if(i==0) {
	   contextMenu.addSeparator();
	  }
 	}
 	map.addContextMenu(contextMenu);
	
	// ----- maker -----
	addCabinMarker(initPoint);
	
	var simulatorContent = "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>信号模拟器</h4>" + 
		"<img style='float:right;margin:4px' id='simulatorImg' src='images/simulator.jpg' width='139' height='104' title='天安门'/>" + 
		"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>针对基本型和授时型用户设备的测试需求,该类型模拟器面向全球卫星导航系统提供单星座导航信号仿真,可以仿真的卫星星座包括GPS、[2]、GALILEO、GLONASS等,可以应用在基本型和授时型用户设备的研制、开发、生产和测试过程的各个环节.</p>" + 
		"</div>";
 	var simulatorInfoWindow = new BMap.InfoWindow(simulatorContent);
	
	var simulatorIndex = 1;
	var cabinIndex = 1;
	
	function addSimulatorMarker(point) {
		var simulatorIcon = new BMap.Icon("images/simulator.png", new BMap.Size(32, 37));      
		// 创建标注对象并添加到地图
		var simulatorMarkerOptions = {
			icon: simulatorIcon,
			enableDragging: true,
			//raiseOnDrag: true,       跳动的效果
			draggingCursor: "move",
			title: "模拟器"
		}
 		var simulatorMarker = new BMap.Marker(point, simulatorMarkerOptions);
 		simulatorMarker.setAnimation(BMAP_ANIMATION_DROP);
 		var simulatorLabel = new BMap.Label("模拟器-" + simulatorIndex, {offset: new BMap.Size(-7,-18)});
 		simulatorMarker.setLabel(simulatorLabel);
 		simulatorIndex ++;
 		map.addOverlay(simulatorMarker);  
 		//为标注添加点击事件——弹出信息窗口
 		simulatorMarker.addEventListener("dblclick", function(){          
			this.openInfoWindow(simulatorInfoWindow);
			//图片加载完毕重绘infowindow
			document.getElementById('simulatorImg').onload = function (){
			   infoWindow.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
			}
		});
		simulatorMarker.addEventListener("dragging", function(e) {
			document.getElementById("position").innerHTML = "坐标像素——x :" + e.pixel.x + " y :" + e.pixel.y + "<br>坐标经纬度——经度: " + e.point.lng + " 纬度: " + e.point.lat;
		});
	}
	
	function addCabinMarker(point) { 
		var cabinIcon = new BMap.Icon("images/cabin.png", new BMap.Size(32, 37));    
		var cabinMarkerOptions = {
			icon: cabinIcon,
			enableDragging: true,
			draggingCursor: "move",
			title: "训练仓"
		}
 		var cabinMarker = new BMap.Marker(point, cabinMarkerOptions);  
 		cabinMarker.setAnimation(BMAP_ANIMATION_DROP);
 		
 		map.addOverlay(cabinMarker);
 		cabinMarker.addEventListener("dragging", function(e) {
			document.getElementById("position").innerHTML = "坐标像素——x :" + e.pixel.x + " y :" + e.pixel.y + "<br>坐标经纬度——经度: " + e.point.lng + " 纬度: " + e.point.lat;
		}); 
	}
	
	

 	
</script>

</html>