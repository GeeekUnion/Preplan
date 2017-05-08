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
	
    	$(function (){
    	
    	
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
		$("#ff").form("reset");
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
 			
 			
 			
 		 $('#dg').datagrid({    
  		 url:'preplan_inventory_queryByPage.action',    
  		 singleSelect:true,
  		 loadmsg:'请等待',
	     rownumbers:true,
  		 pagination:true,
		 pageNumber:1,
		 pageSize:15,
		 pageList:[15,30,50,100],
		 
    	 columns:[[    
    	{field:'id',title:'id',width:100,align:'center',hidden:'true'},
    	{field:'inventorySn',title:'Sn',width:100,align:'center',hidden:'true'},    
        {field:'inventoryName',title:'仓库名称',width:100,align:'center'},     
        {field:'inventoryLongitude',title:'经度',width:150,align:'center'}, 
        {field:'inventoryLatitude',title:'纬度',width:100,align:'center'},
        {field:'inventoryPrincipal',title:'负责人',width:100,align:'center'}, 
        {field:'inventoryPrincipalPhone',title:'负责人电话',width:150,align:'center'},  
        {field:'tt',title:'操作',width:150,align:'center',
 								 formatter:function(value,row,index){
 								 			var i = row.id;
		        		  					return "<a  href='#' onclick='detailView(" +i+ ")'  class='detail_view' >"+"查看该资源地资源"+"</a>";				        		
		        	}},
   						 ]],
   		 toolbar: [{
  			   	id:'add',
		    	text:'添加',
				iconCls: 'icon-add',
				handler: function(){
					$('#winAdd').window('open');
				
				}
			},{
				id:'delete',
				iconCls:'icon-remove',
				text:'删除',
				handler:function(){
						var row=$("#dg").datagrid("getSelected");
				
						if(row){
								$.messager.confirm('确认对话框', '您想要删除所选数据吗？', function(r){
									if (r){
										$.ajax({
											url:'preplan_inventory_delete.action',
											method:'POST',
											dataType:'json',
											data:{'id':row.id},
											success:function(data){
												if(data.status=="ok"){
													$.messager.alert('我的提示','删除成功！','info');
													$("#dg").datagrid("reload");						
													
												}else{
													$.messager.alert('我的提示','删除失败！','error');
												
												}
											}
										})
									}
								});		
										
						}else{
							$.messager.show({
								title:'我的提示',
								msg:'请先选择一条记录！',
								timeout:1000,
								showType:'show',
								style:{
									right:'',
									top:document.body.scrollTop+document.documentElement.scrollTop+200,
									bottom:''
								}
							})
						}
					
				
					
				}
			},{
				id:'update',
				iconCls:'icon-edit',
				text:'修改',
				handler:function(){
					var row=$("#dg").datagrid("getSelected");
					if(row){
					 //数据回显
						$('#ffUpdate').form('load',{
						    id:row.id,
							inventoryName:row.inventoryName,
						    inventoryLatitude:row.inventoryLatitude,
						    inventoryLongitude:row.inventoryLongitude,
						    inventoryPrincipal:row.inventoryPrincipal,
						    inventoryPrincipalPhone:row.inventoryPrincipalPhone,
						    
						})
						$('#winUpdate').window('open');
					}else{
						$.messager.show({
							title:'我的提示',
							msg:'请先选择一条记录！',
							timeout:1000,
							showType:'show',
							style:{
								right:'',
								top:document.body.scrollTop+document.documentElement.scrollTop+200,
								bottom:''
							}
						});
					} 

				
				}
			}],
			//成功加载出发
 			    onLoadSuccess:function(){
	 			    	$('.detail_view').linkbutton({    
						    iconCls: 'icon-search',
						    height:24   
						});
						
	 			    }
 		
 		
 		
  
						});  
 		});
 		
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
	    	<a id="reset" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'">重置</a>  
	    </div>      
	</form> 
	</div>  
	
	
	<table id="dg">
	<input type="hidden" id="hiddenId">
	</table>    
    <div id="src_detail" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true" ></div> 
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
            zoom: 20,
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
                    var code=data[i].inventorySn;
    			    var marker;
    				var icon = new AMap.Icon({
    					image: 'http://vdata.amap.com/icons/b18/1/2.png',
    					size: new AMap.Size(24, 24)
    				});
    				marker = new AMap.Marker({
    					icon: icon,
    					position: [data[i].inventoryLongitude,data[i].inventoryLatitude],
    					offset: new AMap.Pixel(-12,-12),
    					zIndex: 101,
    					title: data[i].inventoryName,
    					map: map
    				});
    			
    			     marker.content = data[i].inventoryName+ '<span style="font-size:11px;color:#F00;">' +"" + '</span>'+ "" +   "<hr>负责人:"+data[i].inventoryPrincipal     +"<hr>电话："+data[i].inventoryPrincipalPhone+
    			     "<a  href='#' onclick='detailView(" +code+ ")'  class='detail_view' >"+"查看该资源地资源"+"</a>";
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