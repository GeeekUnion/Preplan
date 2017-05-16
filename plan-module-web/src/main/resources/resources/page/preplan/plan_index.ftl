<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
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
        <link rel="stylesheet" type="text/css" href="${getTheme('default','')}assets/global/plugins/morris/morris.css"/>
        <!-- END PAGE LEVEL PLUGINS -->
        
         </head>
    <!-- END HEAD -->		  	
    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white"> 
    	<#include "/decorators/plan_head.ftl">     	
        <!-- BEGIN HEADER & CONTENT DIVIDER -->
        <div class="clearfix"> </div>
        <!-- END HEADER & CONTENT DIVIDER -->
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <#include "/decorators/plan_left_menu.ftl"> 
		   	<!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content">
                    <!-- BEGIN PAGE HEADER-->                  
                    <!-- BEGIN PAGE TITLE-->
                    <h3 class="page-title"> 
                        <center>欢迎来到预案管理系统</center>   
                    </h3>
                    <!-- END PAGE TITLE-->
                    <!-- END PAGE HEADER-->


                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END CONTAINER -->
        <#include "/decorators/plan_footer.ftl">    
        <!--[if lt IE 9]>
<script src="../assets/global/plugins/respond.min.js"></script>
<script src="../assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->

        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/morris/morris.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/morris/raphael-min.js"></script>      
        <!-- END PAGE LEVEL PLUGINS -->

    </body>

</html>