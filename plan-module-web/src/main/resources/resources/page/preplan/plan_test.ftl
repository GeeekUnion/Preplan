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
        
        <!-- END PAGE LEVEL PLUGINS -->
        </head>
        
    <!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
       	 <textarea name="editor1" class="xheditor" style="width:100%;min-height: 450px; " id="xheditor"></textarea>
       	 var xhedit=$('#xheditor').xheditor({
       	 	upImgUrl:"${pageContext.request.contextPath}/plan/preplan/",
       	 	upImgExt:"jpg,jpeg,gif,png"
       	 });
		<#include "/decorators/plan_footer.ftl"> 
        <!--[if lt IE 9]>
<script src="../assets/global/plugins/respond.min.js"></script>
<script src="../assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->

        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/select2/js/select2.full.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/jquery-validation/js/additional-methods.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/pages/scripts/form-validation.min.js"></script>                
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript" src="${getTheme('default','')}xhedit/xheditor-1.2.2.min.js"></script>   
        <script type="text/javascript" src="${getTheme('default','')}xhedit/xheditor_lang/zh-cn.js"></script>              
        <!-- END PAGE LEVEL SCRIPTS -->
        <script type="text/javascript">
        	
        </script>
        
    </body>

</html>