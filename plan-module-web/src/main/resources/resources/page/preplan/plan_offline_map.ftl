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
     <script type="text/javascript" src="${getMC ("")}/js/apiv2.0.min.js"></script>

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
				<div style=" width:100%; height:500px;   border: #ccc solid 1px;"
					id="container"></div>
		
		           2333333333333333333333333333



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

    var outputPath = '${getMC ("")}/tiles';    //地图瓦片所在的文件夹
    var fromat = ".jpg";    //格式

    var tileLayer = new BMap.TileLayer();
    tileLayer.getTilesUrl = function (tileCoord, zoom) {
        var x = tileCoord.x;
        var y = tileCoord.y;
        var url = outputPath + zoom + '/' + x + '/' + y + fromat;
        return url;
    }
    var tileMapType = new BMap.MapType('tileMapType', tileLayer);

    var map = new BMap.Map("container", { mapType: tileMapType })

    var point = new BMap.Point(120.302491,31.926535);  // 创建点坐标  
    map.centerAndZoom(point, 5);                 // 初始化地图，设置中心点坐标和地图级别  
	 //map.addControl(new BMap.MapTypeControl());
	map.addControl(new BMap.NavigationControl());
	map.enableScrollWheelZoom();                  // 启用滚轮放大缩小。
	map.enableKeyboard();                         // 启用键盘操作。  
	
	//map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
</script>  

</html>