<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-type" content="text/html;charset=utf-8">
<script src="${pageContext.request.contextPath}/cfw/js/jQuery/jquery-1.8.2.js"></script>
<script src="${pageContext.request.contextPath}/cfw/js/jQuery/jquery.i18n.properties.js"></script>
<script src="${pageContext.request.contextPath}/cfw/js/jQuery/jquery-loading.js"></script>
<script>
$(function(){
	// 如果存在则取消
	$.loading.hide();
	$.i18n.properties({
		name:'jsi18n',
		path:'${pageContext.request.contextPath}/i18n/',
		mode:'both',
		callback:function(){
			$("#404 p").html('<b class="icon-Result listEmpty-ico"></b>'+$.i18n.prop('ex404'));
		}
	});
});
</script>
<style>
@import url(${pageContext.request.contextPath}/skin/global/font/iconportal.css);/*iconå­ä½*/
.listEmpty{ padding:30px 0; text-align:center; color:#b08900}
.listEmpty-ico{ font-size:222px;color:#cb9e00; vertical-align:middle; margin-right:15px}
</style>
<!--iconfont-->
    <!--[if lt IE 8]><!-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/skin/global/font/ie7/ie7.css">
    <!--<![endif]-->
<!--iconfont end-->

</head>
<body>
<div id="404"  > 
	 <p class="listEmpty" align="center" valign="center"><b class="icon-Result listEmpty-ico"></b></p>
</div>


</body>