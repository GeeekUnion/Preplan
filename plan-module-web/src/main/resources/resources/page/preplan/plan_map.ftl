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
				
				<div style=" width:100%; height:500px;   border: #ccc solid 1px;"
					id="dituContent"></div>
					
            
                              
                              
				<#include "/decorators/plan_map_content.ftl">




				<!-- END MAP CONTENT-->
				
			</div>
			<!-- END CONTENT BODY -->
		</div>
		<!-- END CONTENT -->
	</div>
	<!-- END CONTAINER -->
	<!--Modals-->
	<div>
               <div id="staticA" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" >
                                             <div id="1">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                        <h4 class="modal-title">新增点</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                    
                                                    <!-- BEGIN FORM-->
	                                        <form action="#" id="addRe" class="form-horizontal">
	                                            <div class="form-body">
                                                <div class="alert alert-danger display-hide">
                                                    <button class="close" data-close="alert"></button> You have some form errors. Please check below. </div>
                                                <div class="alert alert-success display-hide">
                                                    <button class="close" data-close="alert"></button> Your form validation is successful! </div>
                                                    
                                               
                                                   <div class="form-group">
                                                    <label class="control-label col-md-3">资源点经度
                                                        <span class="longitude"> * </span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input id="longitude" name="longitude" type="text" class="form-control" value=""/> </div>
                                                </div>
                                                
                                                 <div class="form-group">
                                                    <label class="control-label col-md-3">资源点纬度
                                                        <span class="required"> * </span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input id ="latitude" name="latitude" type="text" class="form-control" value="" /> </div>
                                                </div>    
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">资源点名称
                                                        <span class="required"> * </span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input id="inventoryName" name="inventoryName" type="text" class="form-control" value=""/> </div>
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
                                             <input id="idType" type="text" style="display:none" value="">
                                        </form>
                                        <!-- END FORM-->
                                                    
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" data-dismiss="modal" class="btn dark btn-outline">取消</button>
                                                        <button type="button" data-dismiss="modal" class="btn green" onclick="saveInventory()"> 提交</button>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                        </div>
                              <!--End Modals-->   
                                   <!--Modals-->
                                   <div>
               <div id="staticEventAdd" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" >
                                         <div id="eventADdd">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                                        <h4 class="modal-title">查看内容</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                       <!-- BEGIN FORM-->
	                                        <form action="#" id="form_sample_eventAdd" class="form-horizontal">
	                                            <div class="form-body">
                                                <div class="alert alert-danger display-hide">
                                                    <button class="close" data-close="alert"></button> You have some form errors. Please check below. </div>
                                                <div class="alert alert-success display-hide">
                                                    <button class="close" data-close="alert"></button> Your form validation is successful! </div>
                                                    
                                                
                                                   <div class="form-group">
                                                    <label class="control-label col-md-3">经度
                                                        <span class="longitude"> * </span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input id="longitude" name="longitude" type="text" class="form-control" value=""/> </div>
                                                </div>
                                                
                                                 <div class="form-group">
                                                    <label class="control-label col-md-3">纬度
                                                        <span class="required"> * </span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input id ="latitude" name="latitude" type="text" class="form-control" value="" /> </div>
                                                </div>    
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">事件名称
                                                        <span class="required"> * </span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input id="eventName" name="eventName" type="text" class="form-control" value=""/> </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">发生地点
                                                        <span class="required"> * </span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input id="eventOccurPlace" name="eventOccurPlace" type="text" class="form-control" value="" /> </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">上报人
                                                        <span class="required"> * </span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input id="personName" name="personName" type="text" class="form-control" value=""/> </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">事件说明
                                                        <span class="required"> * </span>
                                                    </label>
                                                    <div class="col-md-6">
                                                        <input id="eventDescription" name="eventDescription" type="textarea" class="form-control" value=""/> </div>
                                                </div>
               
                                        </form>
                                        <!-- END FORM-->
                                                   
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" data-dismiss="modal" class="btn dark btn-outline">取消</button>
                                                        <button type="button" data-dismiss="modal" class="btn green" onclick="saveEvent()"> 提交</button>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                        </div>
                              <!--End Modals-->     
             
             
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
	<script type="text/javascript" src="${getMC ("")}/js/jquery.validate.min.js"></script>
	
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
   <!--验证框-->
   <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>

</body>
<script type="text/javascript">
        var lo=116.404844;
        var la=39.916706;
		var points = new Array();
		var markers = new Array();
	    var s;//经度
	    var w;//纬度
	    var longitude, latitude;  
	    var type= "";   //判断传过来的点类型
	    //用来决定table内容的
	    var highLight={	
			'background-color':'#0099FF',
			'color':'white'
		}
		//默认亮度
		var faultLight={
			'color':'#000',
		    'background-color':'#FFF'
		}
		//默认不显示
		var defaultDisplay={
		   'display':'none'
		}
		var blockDisplay={
		   'display':'block'
		}
		
	    var clickType="inventory";
	    
	var eventIcon = new BMap.Icon("${getMC ("")}/theme/img/icon/事件.png", new BMap.Size(20,20));
	var inventoryIcon = new BMap.Icon("${getMC ("")}/theme/img/icon/inventory.png", new BMap.Size(20,20));
	var protectionObjectIcon = new BMap.Icon("${getMC ("")}/theme/img/icon/防护目标.png", new BMap.Size(20,20));
	var emergencyResponseTeamIcon = new BMap.Icon("${getMC ("")}/theme/img/icon/应急队伍.png", new BMap.Size(20,20));
	var hazardIcon = new BMap.Icon("${getMC ("")}/theme/img/icon/危险源.png", new BMap.Size(20,20));
	
	
	var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
	var point = new BMap.Point(116.331398,39.897445);
	map.centerAndZoom(point,12);
     getLocationHtml5()
  

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
		    //初始化的时候 
		    lo=r.point.lng;
		    la=r.point.lat;
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
		 
          }
    	//右键单击map出现右键菜单事件
    	function RightClickMap(s,w){
    	var createMarker = function(map){
    	var idType="inventory";
    	AddRe(s,w,idType);
    	};
    	var hazardMarker = function(map){
    	var idType="hazard";
    	AddRe(s,w,idType);
    	};
    	var emergencyResponseTeamMarker = function(map){
    	var idType="emergencyResponseTeam";
    	AddRe(s,w,idType);
    	};
    	var protectionObjectMarker = function(map){
    	var idType="protectionObject";
    	AddRe(s,w,idType);
    	};
    	var EventMarker =function(map){
    	addEventF(s,w);
    	};
    	var markerMenu=new BMap.ContextMenu();
    	markerMenu.addItem(new BMap.MenuItem('添加资源点',createMarker.bind(map)));
    	markerMenu.addItem(new BMap.MenuItem('添加危险源',hazardMarker.bind(map)));
    	markerMenu.addItem(new BMap.MenuItem('添加应急队伍',emergencyResponseTeamMarker.bind(map)));
    	markerMenu.addItem(new BMap.MenuItem('添加防护目标',protectionObjectMarker.bind(map)));
    	markerMenu.addItem(new BMap.MenuItem('生成事件',EventMarker.bind(map)));
    	map.addContextMenu(markerMenu);//给标记添加右键菜单
    	} 
    	
    	//右键单击Maker出现右键菜单事件
    	function RightClickMaker(marker,point){  	
    	var watchMarker = function(e,ee,marker){//右键查看附近
    	map.clearOverlays();
    	//重新定位的各种操作
	    lo=point.lng;
	    la=point.lat;
	    initResource();
	    hazardClick("hazard");
	    emergencyResponseTeamClick("emergencyResponseTeam");
        protectionObjectClick("protectionObject");
    	
    	
    	
     
    	}
    	
	
		
 
    	var markerMenu=new BMap.ContextMenu();
    	markerMenu.addItem(new BMap.MenuItem('查看附近资源',watchMarker.bind(marker)));
		marker.addContextMenu(markerMenu);//给标记添加右键菜单
    	} 
    //初始化所有资源，目标点
   function initResource(){
    loadTable();
    opts = {  
                    width : 200,     // 信息窗口宽度  
                    height: 80,     // 信息窗口高度  
                    title : "站点信息" , // 信息窗口标题  
                    enableMessage:true//设置允许信息窗发送短息  
        };  
        
         $.ajax({
 			url:'preplan_inventory_queryVicinity.action',
 			type:'POST',
 			data:{
 			lo:lo,
			la:la
 			},
 			success:function(res){    
 		     var data=eval('('+res+')');
 		    console.log(data);
 		    if(null!=data||data.length>0){
      for (var i = 0; i < data.length; i += 1) {
		type=data[i].type
		//根据type类型，执行不同方法
		switch(type){
		case "inventory":
		inventoryType(type,data,i,opts);
		break;
		
		case "hazard":
	    hazardType(type,data,i,opts);
		break;
		
		case "emergencyResponseTeam":
		emergencyResponseTeamType(type,data,i,opts);
		break;
		
		case "protectionObject":
		protectionObjectType(type,data,i,opts);
		break;
		}
	}  
      }else{
          
      }
      
        }         
 		});	//ajax end
    }
    //初始化各种点的图标，点击出现栏目功能
    function inventoryType(type,data,i,opts){
    var point = new BMap.Point(data[i].longitude, data[i].latitude);
    var marker = new BMap.Marker(point,{icon:inventoryIcon});	
		 var content = "站点名称:  " + data[i].name +"<br /> "  
                            + "经度:     " + data[i].longitude  +"<br /> "  
                            + "纬度: " +  data[i].latitude  +"<br /> ";  
        addClickHandler(content,marker); 
	    map.addOverlay(marker);
   
    }
    function hazardType(type,data,i,opts){
    var point = new BMap.Point(data[i].longitude, data[i].latitude);
    	var marker = new BMap.Marker(point,{icon:hazardIcon});	
		  var content = "站点名称:  " + data[i].name +"<br /> "  
                            + "经度:     " + data[i].longitude  +"<br /> "  
                            + "纬度: " +  data[i].latitude  +"<br /> ";  
        addClickHandler(content,marker); 
	    map.addOverlay(marker);
    	
    }
    function protectionObjectType(type,data,i,opts){
    var point = new BMap.Point(data[i].longitude, data[i].latitude);
    var marker = new BMap.Marker(point,{icon:protectionObjectIcon});
    
		  var content = "站点名称:  " + data[i].name +"<br /> "  
                            + "经度:     " + data[i].longitude  +"<br /> "  
                            + "纬度: " +  data[i].latitude  +"<br /> ";  
        addClickHandler(content,marker); 
	    map.addOverlay(marker);	
    
    }
    function emergencyResponseTeamType(type,data,i,opts){
    var point = new BMap.Point(data[i].longitude, data[i].latitude);
    var marker = new BMap.Marker(point,{icon:emergencyResponseTeamIcon});
	 var content = "站点名称:  " + data[i].name +"<br /> "  
                            + "经度:     " + data[i].longitude  +"<br /> "  
                            + "纬度: " +  data[i].latitude  +"<br /> ";  
        addClickHandler(content,marker); 
	    map.addOverlay(marker);
    }
    
    
    
    //++  
    function addClickHandler(content,marker){  
        marker.addEventListener("click",function(e){  
        openInfo(" "+content,e)});  
    }  
    //++  
    function openInfo(content,e){  
        var p = e.target;  
        var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);  
        var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象   
        map.openInfoWindow(infoWindow,point);                //开启信息窗口  
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
    

    
    opts = {  
                    width : 200,     // 信息窗口宽度  
                    height: 80,     // 信息窗口高度  
                    title : "事件信息" , // 信息窗口标题  
                    enableMessage:true//设置允许信息窗发送短息  
        }; 
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
		
		var content = "事件名称:  " + data[i].eventName +"<br /> "  
		                    + "上报人:     " + data[i].personName  +"<br /> " 
                            + "经度:     " + data[i].longitude  +"<br /> "  
                            + "纬度: " +  data[i].latitude  +"<br /> ";  
        addClickHandler(content,marker); 
	  
		
		
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
 
	
	 //新建Inventory站点
    function AddRe(s,w,idType){
    
     $("#addRe  #longitude").val(s);
     $("#addRe  #latitude").val(w);
     $("#addRe  #idType").val(idType);
     console.log(s+'----'+w);
     
     $('#staticA').modal('show');
    }
    

 //新建Event事件
    function addEventF(s,w){
    
     $("#staticEventAdd #longitude").val(s);
     $("#staticEventAdd #latitude").val(w);
     console.log(s+'----'+w);
     $('#staticEventAdd').modal('show');
    }
  

	//保存addRe方法
	function saveInventory(){
	 
	var longitude= $("#addRe #longitude").val();
	var latitude=$("#addRe  #latitude").val();
	var inventoryName=$("#addRe  #inventoryName").val();
	var inventoryPrincipal=$("#addRe  #inventoryPrincipal").val();
	var inventoryPrincipalPhone=$("#addRe #inventoryPrincipalPhone").val();
	var idType= $("#addRe #idType").val();
	
	
	$.ajax({    
	url:'${pageContext.request.contextPath}/plan/preplan/preplan_inventory_save.action',
	dataType:"json",
	data:{
	longitude:longitude,
	latitude:latitude,
	inventoryName:inventoryName,
	inventoryPrincipal:inventoryPrincipal,
	inventoryPrincipalPhone:inventoryPrincipalPhone,
	idType:idType
	     },	  
	success:function(data){    
	if(data.status=="ok"){
	swal("提交成功");
	$("#addRe input").val("");
	switch(idType){
	case"inventory":
	loadTable();
	     var point = new BMap.Point(longitude, latitude);
 		 var marker = new BMap.Marker(point,{icon:inventoryIcon});	
		 var content = "站点名称:  " + inventoryName +"<br /> "  
                            + "经度:     " + longitude  +"<br /> "  
                            + "纬度: " +  latitude  +"<br /> ";  
         addClickHandler(content,marker); 
	     map.addOverlay(marker);
	 break;
	 case"hazard":
	 hazardClick("hazard");
		 var point = new BMap.Point(longitude, latitude);
 		 var marker = new BMap.Marker(point,{icon:hazardIcon});	
		 var content = "站点名称:  " + inventoryName +"<br /> "  
                            + "经度:     " + longitude  +"<br /> "  
                            + "纬度: " +  latitude  +"<br /> ";  
         addClickHandler(content,marker); 
	     map.addOverlay(marker);
	 break;
	 case "emergencyResponseTeam":
	emergencyResponseTeamClick("emergencyResponseTeam");
	      var point = new BMap.Point(longitude, latitude);
 		 var marker = new BMap.Marker(point,{icon:emergencyResponseTeamIcon});	
		 var content = "站点名称:  " + inventoryName +"<br /> "  
                            + "经度:     " + longitude  +"<br /> "  
                            + "纬度: " +  latitude  +"<br /> ";  
         addClickHandler(content,marker); 
	     map.addOverlay(marker);
	 break;
	 case"protectionObject":
	 protectionObjectClick("protectionObject");
	      var point = new BMap.Point(longitude, latitude);
 		 var marker = new BMap.Marker(point,{icon:protectionObjectIcon});	
		 var content = "站点名称:  " + inventoryName +"<br /> "  
                            + "经度:     " + longitude  +"<br /> "  
                            + "纬度: " +  latitude  +"<br /> ";  
         addClickHandler(content,marker); 
	     map.addOverlay(marker);
	
	
    }
    
    
    
    
    
    
	}else{
	swal("提交失败");
	}
		                 }
	   })
	}
//  保存Event方法
	function saveEvent(){
	var longitude=$("#staticEventAdd #longitude").val();
	var latitude=$("#staticEventAdd #latitude").val();
	
	$.ajax({    
	url:'${pageContext.request.contextPath}/plan/preplan/preplan_event_save.action',
	dataType:"json",
	data:{
	longitude:$("#staticEventAdd #longitude").val(),
	latitude:$("#staticEventAdd #latitude").val(),
	personName:$("#staticEventAdd #personName").val(),
	eventOccurPlace:$("#staticEventAdd #eventOccurPlace").val(),
	eventName:$("#staticEventAdd #eventName").val(),
	eventDescription:$("#staticEventAdd #eventDescription").val()
	     },	  
	success:function(data){    
	if(data.status=="ok"){
	swal("提交成功");
	//表格显示
    eventClick();
   
   
    //右键功能
    var point = new BMap.Point(longitude, latitude);
		var marker = new BMap.Marker(point,
		{
		icon:eventIcon,
		enableMassClear:false     //防止被大规模清除
		});
		points.push(point);
	    map.addOverlay(marker);
		RightClickMaker(marker,point);//右键单击marker出现右键菜单事件
     //提交后清空表值
    $("#form_sample_eventAdd input").val("");
    
	}else{
	swal("提交失败");
	}
		                 }
	   })
	}



</script>
</html>