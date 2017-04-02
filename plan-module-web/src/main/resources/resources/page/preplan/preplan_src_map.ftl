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
	<div id="container" tabindex="0"></div>
    <script type="text/javascript">
       //新建地图
        var map = new AMap.Map('container',{
            resizeEnable: true,
            zoom: 5,
            center: [116.480983, 40.0958]
        });
        addMarker();
        //ajax引用
         $.ajax({
 			url:'preplan_supply_querySupply.action',
 			type:'POST',
 			data:{
 			},
 			success:function(res){    
 				var data=eval('('+res+')');
 				 var markers = []; 
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
    				AMap.event.addListener(marker, 'click', function() {
            			infoWindow.open(map, marker.getPosition());
        			});
    			    //实例化信息窗体
				    var title =data[i].supplyName+ '<span style="font-size:11px;color:#F00;">' + data[i].supplyNumber+ '</span>'+data[i].supplyUnit,
				    content = [];
				    content.push("地址");
				    content.push("负责人:"+data[i].supplyPrincipal);
				    content.push("电话："+data[i].supplyPrincipalPhone);
				    content.push("<a href='#'>详细信息</a>");
				    var infoWindow = new AMap.InfoWindow({
				        isCustom: true,  //使用自定义窗体
				        content: createInfoWindow(title, content.join("<br/>")),
				        offset: new AMap.Pixel(16, -45)
				    });
    			    //
           markers.push(marker);
        }
           map.setFitView();
 				
 			},
 			error:function(){
 				
 			},
 		});	
 		//
       
        
        
        
        
        
        
        
        
        
        
        
         //添加marker标记
       function addMarker() {
        map.clearMap();
        var marker = new AMap.Marker({
            title:"PEKING",
            map: map,
            position: [116.481181, 39.989792]
        });
       
    }
       
    
     //构建自定义信息窗体
    function createInfoWindow(title, content) {
        var info = document.createElement("div");
        info.className = "info";

        //可以通过下面的方式修改自定义窗体的宽高
        //info.style.width = "400px";
        // 定义顶部标题
        var top = document.createElement("div");
        var titleD = document.createElement("div");
        var closeX = document.createElement("img");
        top.className = "info-top";
        titleD.innerHTML = title;
        closeX.src = "http://webapi.amap.com/images/close2.gif";
        closeX.onclick = closeInfoWindow;

        top.appendChild(titleD);
        top.appendChild(closeX);
        info.appendChild(top);

        // 定义中部内容
        var middle = document.createElement("div");
        middle.className = "info-middle";
        middle.style.backgroundColor = 'white';
        middle.innerHTML = content;
        info.appendChild(middle);

        // 定义底部内容
        var bottom = document.createElement("div");
        bottom.className = "info-bottom";
        bottom.style.position = 'relative';
        bottom.style.top = '0px';
        bottom.style.margin = '0 auto';
        var sharp = document.createElement("img");
        sharp.src = "http://webapi.amap.com/images/sharp.png";
        bottom.appendChild(sharp);
        info.appendChild(bottom);
        return info;
    }

    //关闭信息窗体
    function closeInfoWindow() {
        map.clearInfoWindow();
    }
    
    
        
        
        
        
        //引入基础控件
        AMap.plugin(['AMap.ToolBar','AMap.Scale','AMap.OverView'],
    function(){
        map.addControl(new AMap.ToolBar());

        map.addControl(new AMap.Scale());

        map.addControl(new AMap.OverView({isOpen:true}));
});
         
    </script>
	<script type='text/javascript'>
	$(function(){
	
	
	
	})
	
	var mock = {
		log: function(result) {
			window.parent.setIFrameResult('log', result);
		}
	}
	console = mock;
	window.Konsole = {
		exec: function(code) {
			code = code || '';
			try {
				var result = window.eval(code);
				window.parent.setIFrameResult('result', result);
			} catch (e) {
				window.parent.setIFrameResult('error', e);
			}
		}
	}
</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>