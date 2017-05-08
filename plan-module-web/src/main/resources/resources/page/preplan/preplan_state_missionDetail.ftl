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
	<script type="text/javascript" src="${getMC ("")}/js/easyui-lang-zh_CN.js"></script>
	
    <script type="text/javascript">
       $(function (){
       var queryParams = parent.$('#win').window('options').queryParams;
       var status =queryParams.status;
       var id =queryParams.id;
 		//console.log(status+"666"+id);
 		
 			$.ajax({
        		url:'preplan_mission_queryBymissionSn.action',
        		data:{
        		id:id
        		},
    			dataType:'json',
    			method:'POST',
    			success:function(data){
    		    console.log(data[0].missionMethod);
    		        var  s="";
    				var html="";
    				var html2="";
    				var html3="";
    				if(data[0].missionStatus==2){
    				  s="已完成";
    				}else if(data[0].missionStatus==1){
    				  s="正在进行";
    				}else{
    				  s="尚未开始";
    				}
    				
    				html=html+data[0].missionName;
    				html2=html2+s;
    				html3=html3+data[0].missionMethod;

    				
    				$('#missionName').html(html);
    				$('#missionStatus').html(html2);
    				$('#missionMethod').html(html3);
    				
    				
    				
    			}
        	})
 		
 		
 		
 		
 		
 		
 		
 		
 		
 		});
    </script>
    </head>

<body>
   
   <table id="dg"></table>  
    <div class="btm-area" id="missionDetail">
    	<div id="ppe_preplan" class="pp_preplan">   
		    <div class="border">   
		       <span class="label_box"><label for="missionName" ><strong>任务名称:</strong></label></span>  
		        <span> 
		        	<div id="missionName" name="missionName" value="${data[0].missionName}">   </div>
		        </span>
		    </div>
		    <div class="border">   
		       <span class="label_box"><label for="missionStatus" ><strong>任务状态:</strong></label></span>  
		        <span> 
		        	<div id="missionStatus" name="missionStatus" value="${data[0].missionStatus}">   </div>   
		        </span>
		    </div>
		  
		    
		    <div class="border">   
		        <span class="label_box"><label for="ppe_preplan_desc" id="contentTip"><strong>任务完成情况:</strong></label></span>		            
		        <span>
		        	<textarea id="missionMethod" name="missionMethod" style="width:600px;height:300px;visibility:hidden;display: block;">${data[0].missionMethod}</textarea>		        
		        </span>
		    </div>        
		</div>
		
</div>	
		
    
	
</body>
</html>