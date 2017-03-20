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

    <script type="text/javascript">
    	
	$(function(){
		$('#ff').form('disableValidation');
		$('#submit').click(function(){
			$('#ff').form('enableValidation');
			if($('#ff').form('validate')){
				$('#ff').form('submit', {    
				    url:'${pageContext.request.contextPath}/, 
				    queryParams:{password:MD5($("#password").val())},      
				    success:function(data){    
				    	var data = eval('(' + data + ')');  // change the JSON string to javascript object    
				        if (data.status=='ok'){   
				        	$.messager.alert('警告','用户名密码不正确！');   
				        }else{
				        	$.messager.alert('警告','用户名密码不正确！');
					    }   
				    }    
				}); 
			}
		})
	})


    </script>
    </head>
<!--1. 在整个页面创建布局面板-->
<body>
    <body>
<form id="ff" method="post">
	<div class="tit"><img src="${pageContext.request.contextPath}/images/tit.png" alt="" /></div>
		<div class="login-wrap">
		  <table width="300px" border="0" cellspacing="0" cellpadding="0">		    
		    <tr height="80px">
		    	<td style="width:65px"><span>用户名：</span></td>
		      	<td><input name="personSn" class="easyui-textbox" data-options="iconCls:'icon-man',required:true" style="width:180px"></td>
		    </tr>
		    <tr>
		    	<td><span>密  码：</span></td>
		      	<td><input id="password" class="easyui-passwordbox" prompt="密码" required="true" iconWidth="24" style="width:180px;height:24px;padding:10px"></td>
		    </tr>
		    <tr height="80px">
		    	<td colspan="2" style="text-align: center"><a href="#" id="submit" class="easyui-linkbutton">&nbsp;登 &nbsp;录&nbsp;</a></td>
		    </tr>
		  </table>
		</div>	
	<div class="copyright">建议使用IE8以上版本或谷歌浏览器</div>
</form>
	
</body>
</html>