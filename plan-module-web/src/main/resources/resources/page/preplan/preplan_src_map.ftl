<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no"> 
		<style type="text/css">
	 html,body{margin:0;padding:0;}
    #dituContent{
    height:100%;
    z-index:100
    }  
	        
	        
	        
	        
    </style>
    <link rel = "stylesheet" href="${getTheme('default','')}default/easyui.css" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="${getTheme('default','')}/icon.css"/>
    <link rel="stylesheet" type="text/css" href="${getTheme('default','')}/esui.css"/>
	<script type="text/javascript" src="${getMC ("")}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${getMC ("")}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${getMC ("")}/js/esui.js"></script>
    <script type="text/javascript" src="${getMC ("")}/js/easyui-lang-zh_CN.js"></script>
    
    <script type="text/javascript" src="http://api.map.baidu.com/library/GeoUtils/1.2/src/GeoUtils.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Kpjp7jddqVUhWK5VkrfNt3YNezY89NtR">
    
    <script type="text/javascript">
     
	
 			
     //查看某地点具体资源
 		function detailView(i){
 		    
 		    $('#hiddenId').val(i);
 			$('#src_detail').window({
			  
				loadingMessage:'正在加载，请稍后...',
				width: 800,    
                height: 400,    
				minimizable:false,
				collapsible:false,
				title:'当前资源地情况',
				cache:false,				
				content:'<iframe src="preplan_src_map_detail.action" frameborder="0" width="100%" height="100%" />'
			});
 		}
	
    	
 		
    </script>
    </head>

<body>

	<div id="winAdd" class="easyui-window" title="新加资源点" style="width:300px;height:350px"   closed="true"
	        data-options="iconCls:'icon-save',modal:true">   
	    <form id="ffAdd" method="post">   
	    <div style="margin: 15px;">   
	        <label for="inventoryName">地点名称:&nbsp;</label>   
	        <input id="inventoryName" class="easyui-validatebox" type="text" name="inventoryName" data-options="required:true" />   
	    </div>   
	    <div style="margin: 15px;">   
	        <label for="inventoryLongitude">经度:&nbsp;&nbsp;</label>   
	        <input class="easyui-numberbox" type="text" name="inventoryLongitude" required="true"  min="0" max="180" missingMessage="经度必须位于0到180之间"/>   
	    </div>
	    <div style="margin: 15px;">   
	        <label for="inventoryLatitude">纬度:&nbsp;&nbsp;&nbsp;</label>   
	        <input class="easyui-numberbox" type="text" name="inventoryLatitude" data-options="required:true" min="0" max="90"  missingMessage="经度必须位于0到90之间"/>   
	    </div>
	    <div style="margin: 15px;">   
	        <label for="inventoryPrincipal">负责人:&nbsp;&nbsp;&nbsp;</label>   
	        <input class="easyui-validatebox" type="text" name="inventoryPrincipal" data-options="required:true" />   
	    </div>
	    <div style="margin: 15px;">   
	        <label for="inventoryPrincipalPhone">负责人电话:</label>   
	        <input class="easyui-validatebox" type="text" name="inventoryPrincipalPhone" required="true" validType="length[11,11]"  />   
	    </div>
	    
	     
	      
	    <div style="margin-top: 25px;text-align:center">
	    	<a id="submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
	    	<a id="reset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a>  
	    </div>      
	</form> 
	</div>  
	
	<div id="winUpdate" class="easyui-window" title="修改资源点" style="width:300px;height:350px"  closed="true"  
	        data-options="iconCls:'icon-save',modal:true">   
	     <form id="ffUpdate" method="post">   
	      <div style="margin: 15px;">   
	        <input id="id" class="easyui-textbox" type="hidden" name="id"  />   
	    </div>   
	    <div style="margin: 15px;">   
	        <label for="inventoryName">地点名称:&nbsp;</label>   
	        <input id="inventoryName" class="easyui-textbox" type="text" name="inventoryName" data-options="required:true" />   
	    </div>   
	    <div style="margin: 15px;">   
	        <label for="inventoryLongitude">经度:&nbsp;&nbsp;</label>   
	        <input class="easyui-textbox" type="text" name="inventoryLongitude" data-options="required:true" />   
	    </div>
	    <div style="margin: 15px;">   
	        <label for="inventoryLatitude">纬度:&nbsp;&nbsp;&nbsp;</label>   
	        <input class="easyui-textbox" type="text" name="inventoryLatitude" data-options="required:true" />   
	    </div>
	    <div style="margin: 15px;">   
	        <label for="inventoryPrincipal">负责人:&nbsp;&nbsp;&nbsp;</label>   
	        <input class="easyui-textbox" type="text" name="inventoryPrincipal" data-options="required:true" />   
	    </div>
	    <div style="margin: 15px;">   
	        <label for="inventoryPrincipalPhone">负责人电话:</label>   
	        <input class="easyui-textbox" type="text" name="inventoryPrincipalPhone" data-options="required:true" />   
	    </div>
	      
	    <div style="margin-top: 25px;text-align:center">
	    	<a id="submit2" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">修改</a>  
	    	<a id="reset2" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a>  
	    </div>      
	</form> 
	</div>  
	
	
	<table id="dg">
	<input type="hidden" id="hiddenId">
	</table>    
   
   <!--百度地图容器-->
  <div style="width:697px;height:550px;border:#ccc solid 1px;" id="dituContent"></div>
   

	
</body>
<script type="text/javascript">
	    var s;//经度
	    var w;//纬度
	var eventIcon = new BMap.Icon("${getMC ("")}/theme/icons/map/事件 (1).png", new BMap.Size(20,20));
	var inventoryIcon = new BMap.Icon("${getMC ("")}/theme/icons/map/inventory.png", new BMap.Size(20,20));
	
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
    	function RightClickMaker(marker){  	
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
		markerMenu.addItem(new BMap.MenuItem('删除站点',removeMarker.bind(marker)));
		markerMenu.addItem(new BMap.MenuItem('修改站名',updateMarker.bind(marker)));
		marker.addContextMenu(markerMenu);//给标记添加右键菜单
    	} 
    	
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
    }
    
    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(116.404, 39.915);//定义一个中心点坐标
        map.centerAndZoom(point,15);//设定地图的中心点和坐标并将地图显示在地图容器中
        
        var circle = new BMap.Circle(point,1000,{fillColor:"blue", strokeWeight: 1 ,fillOpacity: 0.3, strokeOpacity: 0.3});
    	map.addOverlay(circle);
    	
    	var myPoint = new BMap.Point(116.404, 39.90) ;
    	var yourPoint = new BMap.Point(116.404, 39.9152) ;
    	var marker2 = new BMap.Marker(myPoint,{icon:inventoryIcon});
    	var marker3 = new BMap.Marker(yourPoint,{icon:inventoryIcon});
	    map.addOverlay(marker2);
	    map.addOverlay(marker3);
	    
      if(BMapLib.GeoUtils.isPointInCircle(myPoint,circle)){
      console.log("1 true");
     }else{
     console.log("1 false");
     }
     
     if(BMapLib.GeoUtils.isPointInCircle(yourPoint,circle)){
      console.log("2 true");
     }else{
     console.log("2 false");
     }
     
     
     
    	
    	
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
    //ajax显示Maker
         $.ajax({
 			url:'preplan_event_queryAll.action',
 			type:'POST',
 			data:{
 			},
 			success:function(res){    
 		     var data=eval('('+res+')');
             console.log(data);
            
	 for (var i = 0; i < data.length; i += 1) {
		var point = new BMap.Point(data[i].longitude, data[i].latitude);
		var marker = new BMap.Marker(point,{icon:eventIcon});
	    map.addOverlay(marker);
		RightClickMaker(marker);//右键单击marker出现右键菜单事件
		
	}      
        }         //循环结束
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
</script>
</html>