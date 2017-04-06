<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no"> 
		<style type="text/css">
		      #container{
		        position: absolute;
		        height: 500px;
		        width:1000px;
		        margin: 0px;
		      }
			  .info {
	            border: solid 1px silver;
	        }
	        div.info-top {
	            position: relative;
	            background: none repeat scroll 0 0 #F9F9F9;
	            border-bottom: 1px solid #CCC;
	            border-radius: 5px 5px 0 0;
	        }
	        div.info-top div {
	            display: inline-block;
	            color: #333333;
	            font-size: 14px;
	            font-weight: bold;
	            line-height: 31px;
	            padding: 0 10px;
	        }
	        div.info-top img {
	            position: absolute;
	            top: 10px;
	            right: 10px;
	            transition-duration: 0.25s;
	        }
	        div.info-top img:hover {
	            box-shadow: 0px 0px 5px #000;
	        }
	        div.info-middle {
	            font-size: 12px;
	            padding: 6px;
	            line-height: 20px;
	        }
	        div.info-bottom {
	            height: 0px;
	            width: 100%;
	            clear: both;
	            text-align: center;
	        }
	        div.info-bottom img {
	            position: relative;
	            z-index: 104;
	        }
	        span {
	            margin-left: 5px;
	            font-size: 11px;
	        }
	        .info-middle img {
	            float: left;
	            margin-right: 6px;
	        }
	        
	        
	        
	        
	        
	    .map-panel {
	    z-index:100;
        color: #333;
        padding: 6px;
        border: 1px solid silver;
        box-shadow: 3px 4px 3px 0px silver;
        position: absolute;
        background-color: #eee;
        top: 10px;
        right: 10px;
        border-radius: 5px;
        overflow: hidden;
        line-height: 20px;
      }
      #input{
        width: 250px;
        height: 25px;
      }
	        
	        
	        
	        
	        
    </style>
    <link rel = "stylesheet" href="${getTheme('default','')}default/easyui.css" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="${getTheme('default','')}/icon.css"/>
    <link rel="stylesheet" type="text/css" href="${getTheme('default','')}/esui.css"/>
	<script type="text/javascript" src="${getMC ("")}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${getMC ("")}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${getMC ("")}/js/esui.js"></script>
    <script type="text/javascript" src="${getMC ("")}/js/easyui-lang-zh_CN.js"></script>
    <!--高德地图api-->
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=7c8b33d77321b79ab3ec833abfe8ff00"></script> 
    
    <script type="text/javascript">
         
    
    	$(function (){
 			
 		 $('#dg').datagrid({    
  		 url:'preplan_supply_querySupply.action',    
  		 singleSelect:true,
  		 loadmsg:'请等待',
	     rownumbers:true,
  		 pagination:true,
		 pageNumber:1,
		 pageSize:15,
		 pageList:[15,30,50,100],
		 
    	 columns:[[    
        {field:'supplyName',title:'资源名称',width:100,align:'center'},    
        {field:'supplyNumber',title:'资源数量',width:100,align:'center'},    
        {field:'supplyUnit',title:'资源单位',width:100,align:'center'},    
        {field:'supplyLatitude',title:'经度',width:100,align:'center'},
        {field:'supplyLongitude',title:'纬度',width:150,align:'center'}, 
        {field:'supplyPrincipal',title:'资源负责人',width:100,align:'center'}, 
        {field:'supplyPrincipalPhone',title:'负责人电话',width:150,align:'center'},  
       
   						 ]],
   		 toolbar: [{
  			   	id:'add',
		    	text:'添加',
				iconCls: 'icon-add',
				handler: function(){
					$('#win').window({
						width:380,
		 				height:330,
		 				title:'添加资源地',
		 				cache:false,
		 				content:'<iframe src="preplan_src_map_add.action" frameborder="0" width="100%" height="100%"/>'
					});
				
				}
			}]
  
						});  
 		});
 		
    </script>
    </head>

<body>
	<table id="dg"></table>    
    <div id="win" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div> 
	<div id="container" tabindex="0" style="position:absolute">
	<div class ='map-panel'>
     输入地址显示位置:</br>
     <input id = 'input' value = '阜通东大街8号'> </input>
     <div id = 'message'></div>
     <div id='geocodes'> </div>
   </div>
	</div>
	
	<!--根据地址查询经纬度(地理编码)-->
	
 
   
    <script type="text/javascript">
       //新建地图
        var map = new AMap.Map('container',{
            resizeEnable: true,
            zoom: 5,
            center: [116.480983, 40.0958]
        });
        
        //ajax引用
         $.ajax({
 			url:'preplan_supply_querySupply.action',
 			type:'POST',
 			data:{
 			},
 			success:function(res){    
 				var data=eval('('+res+')');
 				 var markers = []; 
 				   var infoWindow = new AMap.InfoWindow({offset: new AMap.Pixel(0, -30)});
        for (var i = 0; i < data.length; i += 1) {
    			    var marker;
    				var icon = new AMap.Icon({
    					image: 'http://vdata.amap.com/icons/b18/1/2.png',
    					size: new AMap.Size(24, 24)
    				});
    				marker = new AMap.Marker({
    					icon: icon,
    					position: [data[i].supplyLatitude,data[i].supplyLongitude],
    					offset: new AMap.Pixel(-12,-12),
    					zIndex: 101,
    					title: data[i].supplyName,
    					map: map
    				});
    			
    			     marker.content = data[i].supplyName+ '<span style="font-size:11px;color:#F00;">' + data[i].supplyNumber+ '</span>'+data[i].supplyUnit  +   "<hr>负责人:"+data[i].supplyPrincipal     +"<hr>电话："+data[i].supplyPrincipalPhone;
                     marker.on('click', markerClick);
                     marker.emit('click', {target: marker});
    			    
           markers.push(marker);
        }         //循环结束
        
        
        function markerClick(e) {
        infoWindow.setContent(e.target.content);
        infoWindow.open(map, e.target.getPosition());
    }
           map.setFitView();
 				
 			},
 			error:function(){
 				
 			},
 		});	
 		
 		//根据地址查询经纬度(地理编码)
 		    AMap.plugin('AMap.Geocoder',function(){
        var geocoder = new AMap.Geocoder({
            city: "010"//城市，默认：“全国”
        });
        var marker = new AMap.Marker({
            map:map,
            bubble:true
        })
        var input = document.getElementById('input');
        input.onchange = function(e){
            var address = input.value;
            geocoder.getLocation(address,function(status,result){
              if(status=='complete'&&result.geocodes.length){
                marker.setPosition(result.geocodes[0].location);
                console.log(result.geocodes[0].location);
                $('#geocodes')[0].innerHTML='经纬度:('+result.geocodes[0].location.I+','+result.geocodes[0].location.M+')';
                map.setCenter(marker.getPosition())
                document.getElementById('message').innerHTML = ''
              }else{
                document.getElementById('message').innerHTML = '获取位置失败'
              }
            })
        }
        input.onchange();

    });
  
       
        
        
        
        
        
        
        
        
        
        
        
      
    
  
    
    
        
        
        
        
        //引入基础控件
        AMap.plugin(['AMap.ToolBar','AMap.Scale','AMap.OverView'],
    function(){
        map.addControl(new AMap.ToolBar());

        map.addControl(new AMap.Scale());

        map.addControl(new AMap.OverView({isOpen:true}));
});
         
    </script>
	<script type='text/javascript'>
	
</script>
	 <script type="text/javascript" src="http://webapi.amap.com/demos/js/liteToolbar.js"></script>
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>