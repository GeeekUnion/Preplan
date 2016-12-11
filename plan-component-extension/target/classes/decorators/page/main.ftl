<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<!-- 框架强制指定ie8解析模式 -->
	<meta http-equiv="X-UA-Compatible" content="IE=8" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>CloudFramework后台管理</title>
	<#include "/decorators/public_sources.ftl">
	${head} 
	<@cfw.res name="dialog"/>
	<script type="text/javascript">
		jQuery.resInit(function() {
			$(document).mouseup(function(e) {
				if($(e.target).parent("a.signin").length==0) {
					$(".signin").removeClass("menu-open");
					$("div#userMesCon").hide();
				}
			});
	    });
	    
		//显示用户信息
		function userInfo(e){
			//e.preventDefault();
		    $("div#userMesCon").toggle();
			$(".signin").toggleClass("menu-open");
		}
		
		/**
		 * 修改密码
		 * @param basePath 上下文路径
		 * @param userId 用户ID
		 */
		function changePWD(basePath, userId){
			var url = basePath + "/sys/user/emsUser_noDecorator!changePass.do?SID=" + userId;
			CFW.dialog.pageDialog("changePWD_Dialog", $.i18n.prop("cloud.common.changePwd"), url, 510, 230);
		}	
		
		
		/**
		 * 退出系统
		 * @param basePath 上下文路径
		 */
		function logoutSys(basePath) {
			CFW.dialog.confirmDialog("<@cfw.m code="sitemesh.exist.system"/>",function() {
				//清空系统session
				jQuery.ajax({
					url: basePath+"/sys/login/login!toLogout.do",
					type: 'POST',
					async: false, //一定要设置为同步的！
					success: function(data){
						//转向登录页面
						location.href = basePath+"/sys/login/login!login_noDecorator.do";
					}
				});
			});
		}
		
	</script>
</head>
<body>
	<div class="mainwrapper">
		<#include "/decorators/head.ftl">  
		${body}
		<#if '${skin_standard}' == 'true'> 
			<#include "/decorators/foot.ftl">
		</#if>
	</div>
</body>

</html>