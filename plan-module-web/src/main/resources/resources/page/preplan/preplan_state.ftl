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
	<script type="text/javascript" src="${getMC ("")}/js/raphael-min.js"></script>
	<script type="text/javascript" src="${getMC ("")}/js/flowchart.min.js"></script>
    <script type="text/javascript" src="${getMC ("")}/js/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript">
    	function addMis(i){
    	  /*
			$('#win').window({
				width:780,
				height:550,
				title:'当前任务',
				cache:false,
				content:'<iframe src="preplan_state_add.action" frameborder="0" width="100%" height="100%"/>'
			});	
		*/	
			$.ajax({
				url:'preplan_mission_queryMissionByPpsn.action',
				method:'POST',
				dataType:'json',
				data:{
					  preplanSn:i
				},
				success:function(str){
					$('#canvas').html('');
					//console.log(str)
					//流程图代码
					var code="st=>start: 事件名称"+"\n"
							 +"e=>end: 完成:>http://www.baidu.com"+"\n";
							 
					var count=0;//计数器
					//定义元素
					for(var j = 0;j<str.length;j++){
						count=count+1;
						code=code+"op"+count+"=>operation: "+str[j].missionName
						if(str[j].missionStatus=="0"){
						  code=code+"|past"+"\n"	
						}else if(str[j].missionStatus=="1"){
						  code=code+"|current"+"\n"	
						}else{
					  	  code=code+"|future"+"\n"	
						}
						
						
											
					}
					//连接
					for(var k=1;k<count+1;k++){
						var k2=k+1;//下一跳
						if(k==1){//如果是开始
							code=code+"st->op"+k+"(right)->op"+k2+"\n";
						}else if(k===count){//如果是结束
							code=code+"op"+k+"->e"+"\n";
						}else{
							code=code+"op"+k+"(right)->op"+k2+"\n";
						}
						
					}
					var chart;
					if (chart) {
                      chart.clean();
                    }
					//console.log("code1:"+code) 		
					chart = flowchart.parse(code);		
					chart.drawSVG('canvas', {
                      // 'x': 30,
                      // 'y': 50,
                      'line-width': 3,
                      'maxWidth': 3,//ensures the flowcharts fits within a certian width
                      'line-length': 50,
                      'text-margin': 10,
                      'font-size': 14,
                      'font': 'normal',
                      'font-family': 'Helvetica',
                      'font-weight': 'normal',
                      'font-color': 'black',
                      'line-color': 'black',
                      'element-color': 'black',
                      'fill': 'white',
                      'yes-text': 'yes',
                      'no-text': 'no',
                      'arrow-end': 'block',
                      'scale': 1,
                      'symbols': {
                        'start': {
                          'font-color': 'red',
                          'element-color': 'green',
                          'fill': 'yellow'
                        },
                        'end':{
                          'class': 'end-element',
                          'font-color': 'green'
                        }
                      },
                      'flowstate' : {
                        'past' : { 'fill' : '#CCCCCC', 'font-size' : 12},
                        'current' : {'fill' : 'yellow', 'font-color' : 'red', 'font-weight' : 'bold'},
                        'future' : { 'fill' : '#FFFF99'},
                        'request' : { 'fill' : 'blue'},
                        'invalid': {'fill' : '#444444'},
                        'approved' : { 'fill' : '#58C4A3', 'font-size' : 12, 'yes-text' : 'APPROVED', 'no-text' : 'n/a' },
                        'rejected' : { 'fill' : '#C45879', 'font-size' : 12, 'yes-text' : 'n/a', 'no-text' : 'REJECTED' }
                      }
                    });
						
				}
			})
		}		 
    	
    	
    	$(function (){
 			
 		 $('#dg').datagrid({    
  		 url:'preplan_mission_queryByPage.action',    
  		 singleSelect:true,
  		 loadmsg:'请等待',
	     rownumbers:true,
  		 pagination:true,
		 pageNumber:1,
		 pageSize:15,
		 pageList:[15,30,50,100],
		 
    	 columns:[[    
    	 {field:'eventName',title:'事件名称',width:100,align:'center'},   
        {field:'preplanSn',title:'预案编号',width:100,align:'center'},    
        {field:'preplanName',title:'预案名称',width:100,align:'center'},    
        {field:'responDept',title:'负责部门',width:100,align:'center'},
        {field:'act',title:'操作',width:'100',align:'center',formatter:function(value,row,index){
		        		  return "<a  href='#' onclick='addMis(\"" + row.preplanSn + "\")' data-options='iconCls:'icon-edit'' class='easyui-linkbutton' style='text-decoration:none'>查看任务</a>";				        		
		        	}}
        
   			 ]],
   		
	    
						});  
                        });
    	
    	
    	
    	

    	
    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
   
   <div id="win" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div> 
   
   <table id="dg"></table>  
   
           	


        
        <div id="canvas"></div>
   
   
</body>
</html>