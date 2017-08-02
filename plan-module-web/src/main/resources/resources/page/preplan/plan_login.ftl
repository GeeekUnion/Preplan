<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>预案管理系统</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <#include "/decorators/plan_public_sources.ftl">       
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link rel="stylesheet" type="text/css" href="${getTheme('default','')}assets/global/plugins/select2/css/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="${getTheme('default','')}assets/global/plugins/select2/css/select2-bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="${getTheme('default','')}assets/pages/css/login-4.min.css"/>
        <!-- END PAGE LEVEL PLUGINS -->
        
         </head>
    <body class=" login">
    	<div id="control-heigh">
	        <!-- BEGIN LOGO -->
	        <div class="logo" id="logo-area">
	            <a href="${pageContext.request.contextPath}/plan/preplan/plan_index.action" style="color:#FFFFFF">
	              <i class="icon-home fa-2x" ></i> </a>
	        </div>
	        <!-- END LOGO -->
	        <!-- BEGIN LOGIN -->
	        <div class="content" id="content-area">
	            <!-- BEGIN LOGIN FORM -->
	            <form class="login-form">
	                <h3 class="form-title"><center>预案管理系统登录</center></h3>
	                <div id="error" style="display:none;color:#FF0000;margin:10px 0;">	
					</div>
	                <div class="alert alert-danger display-hide">
	                    <button class="close" data-close="alert"></button>
	                    <span> 请输入用户名和密码！ </span>
	                </div>
	                <div class="form-group">
	                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
	                    <label class="control-label visible-ie8 visible-ie9">Username</label>
	                    <div class="input-icon">
	                        <i class="fa fa-user"></i>
	                        <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="username" id="username"/> </div>
	                </div>
	                <div class="form-group">
	                    <label class="control-label visible-ie8 visible-ie9">Password</label>
	                    <div class="input-icon">
	                        <i class="fa fa-lock"></i>
	                        <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password" id="password" /> </div>
	                </div>
	                <div class="form-actions">
	                    <button type="submit" id="loginBtn" class="btn green pull-right"> 登录 </button>
	                </div>
	
	            </form>
	            <!-- END LOGIN FORM -->
	
	        </div>
	        <!-- END LOGIN -->
	        <!-- BEGIN COPYRIGHT -->
	        <div class="copyright" id="copur-area"> 2016 &copy; CUMT </div>
	        <!-- END COPYRIGHT -->
		<div>
        
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/jquery-validation/js/additional-methods.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/select2/js/select2.full.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/backstretch/jquery.backstretch.min.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript" src="${getTheme('default','')}assets/pages/scripts/login-4.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
      
        <script>
			$(function(){
				var h=document.documentElement.clientHeight ;
				var logoH=$("#logo-area").outerHeight(true); 
				var contentH=$("#content-area").outerHeight(true); 
				var copurH=$("#copur-area").outerHeight(true); 
				var getM=(h-logoH-contentH-copurH)/2;
				$('#control-heigh').css("margin-top",getM);				
			})
        </script>
    </body>
         
         
</html>         