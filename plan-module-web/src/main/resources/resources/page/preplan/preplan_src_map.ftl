<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no"> 
		<style type="text/css">
		      #container{
		        height: 500px;
		        width:1000px;
		        margin: 0px;
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
    
    
    </head>

<body>
   
	<div id="container" tabindex="0"></div>
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=您申请的key值"></script>
    <script type="text/javascript">
       //新建地图
        var map = new AMap.Map('container',{
            resizeEnable: true,
            zoom: 5,
            center: [116.480983, 40.0958]
        });
        //引入基础控件
        AMap.plugin(['AMap.ToolBar','AMap.Scale','AMap.OverView'],
    function(){
        map.addControl(new AMap.ToolBar());

        map.addControl(new AMap.Scale());

        map.addControl(new AMap.OverView({isOpen:true}));
});
          //生成maker
        var marker = new AMap.Marker({
		    position: [116.480983, 39.989628],//marker所在的位置
		    map:map//创建时直接赋予map属性
		});
		
		
		marker.setMap(map);
    </script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>