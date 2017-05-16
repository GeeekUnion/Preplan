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
        <link rel="stylesheet" type="text/css" href="${getTheme('default','')}assets/global/plugins/datatables/datatables.min.css"/>
		<link rel="stylesheet" type="text/css" href="${getTheme('default','')}assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css"/>
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
            <!-- BEGIN CONTENT 内容-->
            <div class="page-content-wrapper">
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content">
                    <!-- BEGIN PAGE HEADER-->
                    <!-- BEGIN PAGE BAR -->
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <a href="${pageContext.request.contextPath}/plan/preplan/planIndex.action">主页</a>
                                <i class="fa fa-circle"></i>
                            </li>
                            <li>
                                <span>预案编制</span>
                            </li>
                        </ul>
                        <div class="page-toolbar">
                            <div class="btn-group pull-right">
                                <button type="button" class="btn green btn-sm btn-outline dropdown-toggle" data-toggle="dropdown"> Actions
                                    <i class="fa fa-angle-down"></i>
                                </button>
                                <ul class="dropdown-menu pull-right" role="menu">
                                    <li>
                                        <a href="#">
                                            <i class="icon-bell"></i> Action</a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="icon-shield"></i> Another action</a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="icon-user"></i> Something else here</a>
                                    </li>
                                    <li class="divider"> </li>
                                    <li>
                                        <a href="#">
                                            <i class="icon-bag"></i> Separated link</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- END PAGE BAR -->    
                    <!-- BEGIN PAGE TITLE-->
                    <h3 class="page-title"> 预案编制
                    </h3>
                    <!-- END PAGE TITLE-->
                    <!-- END PAGE HEADER-->
                    <!-- BEGIN EXAMPLE TABLE PORTLET-->
                    <div class="portlet box green">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-globe"></i>Header & Footer Fixed </div>
                            <div class="actions">
                                <a href="javascript:;" class="btn btn-default btn-sm btn-circle">
                                    <i class="fa fa-plus"></i> Add </a>
                                <a href="javascript:;" class="btn btn-default btn-sm btn-circle">
                                    <i class="fa fa-print"></i> Print </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <table class="table table-striped table-bordered table-hover table-header-fixed" id="sample_2">
                                <thead>
                                    <tr>
                                        <th> Rendering engine </th>
                                        <th> Browser </th>
                                        <th> Platform(s) </th>
                                        <th> Engine version </th>
                                        <th> CSS grade </th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th> Rendering engine </th>
                                        <th> Browser </th>
                                        <th> Platform(s) </th>
                                        <th> Engine version </th>
                                        <th> CSS grade </th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <tr>
                                        <td> Trident </td>
                                        <td> Internet Explorer 4.0 </td>
                                        <td> Win 95+ </td>
                                        <td> 4 </td>
                                        <td> X </td>
                                    </tr>
                                    <tr>
                                        <td> Trident </td>
                                        <td> Internet Explorer 5.0 </td>
                                        <td> Win 95+ </td>
                                        <td> 5 </td>
                                        <td> C </td>
                                    </tr>
                                    <tr>
                                        <td> Trident </td>
                                        <td> Internet Explorer 5.5 </td>
                                        <td> Win 95+ </td>
                                        <td> 5.5 </td>
                                        <td> A </td>
                                    </tr>
                                    <tr>
                                        <td> Trident </td>
                                        <td> Internet Explorer 6 </td>
                                        <td> Win 98+ </td>
                                        <td> 6 </td>
                                        <td> A </td>
                                    </tr>
                                    <tr>
                                        <td> Trident </td>
                                        <td> Internet Explorer 7 </td>
                                        <td> Win XP SP2+ </td>
                                        <td> 7 </td>
                                        <td> A </td>
                                    </tr>
                                    <tr>
                                        <td> Trident </td>
                                        <td> AOL browser (AOL desktop) </td>
                                        <td> Win XP </td>
                                        <td> 6 </td>
                                        <td> A </td>
                                    </tr>
                                    <tr>
                                        <td> Gecko </td>
                                        <td> Firefox 1.0 </td>
                                        <td> Win 98+ / OSX.2+ </td>
                                        <td> 1.7 </td>
                                        <td> A </td>
                                    </tr>
                                    <tr>
                                        <td> Gecko </td>
                                        <td> Firefox 1.5 </td>
                                        <td> Win 98+ / OSX.2+ </td>
                                        <td> 1.8 </td>
                                        <td> A </td>
                                    </tr>
                                    <tr>
                                        <td> Gecko </td>
                                        <td> Firefox 2.0 </td>
                                        <td> Win 98+ / OSX.2+ </td>
                                        <td> 1.8 </td>
                                        <td> A </td>
                                    </tr>
                                    <tr>
                                        <td> Gecko </td>
                                        <td> Firefox 3.0 </td>
                                        <td> Win 2k+ / OSX.3+ </td>
                                        <td> 1.9 </td>
                                        <td> A </td>
                                    </tr>
                                    <tr>
                                        <td> Gecko </td>
                                        <td> Camino 1.0 </td>
                                        <td> OSX.2+ </td>
                                        <td> 1.8 </td>
                                        <td> A </td>
                                    </tr>
                                    <tr>
                                        <td> Gecko </td>
                                        <td> Camino 1.5 </td>
                                        <td> OSX.3+ </td>
                                        <td> 1.8 </td>
                                        <td> A </td>
                                    </tr>
                                    <tr>
                                        <td> Gecko </td>
                                        <td> Netscape 7.2 </td>
                                        <td> Win 95+ / Mac OS 8.6-9.2 </td>
                                        <td> 1.7 </td>
                                        <td> A </td>
                                    </tr>
                                    <tr>
                                        <td> Gecko </td>
                                        <td> Netscape Browser 8 </td>
                                        <td> Win 98SE+ </td>
                                        <td> 1.7 </td>
                                        <td> A </td>
                                    </tr>
                                    <tr>
                                        <td> Gecko </td>
                                        <td> Netscape Navigator 9 </td>
                                        <td> Win 98+ / OSX.2+ </td>
                                        <td> 1.8 </td>
                                        <td> A </td>
                                    </tr>
                                    <tr>
                                        <td> Gecko </td>
                                        <td> Mozilla 1.0 </td>
                                        <td> Win 95+ / OSX.1+ </td>
                                        <td> 1 </td>
                                        <td> A </td>
                                    </tr>
                                    <tr>
                                        <td> Gecko </td>
                                        <td> Mozilla 1.1 </td>
                                        <td> Win 95+ / OSX.1+ </td>
                                        <td> 1.1 </td>
                                        <td> A </td>
                                    </tr>
                                    <tr>
                                        <td> Gecko </td>
                                        <td> Mozilla 1.2 </td>
                                        <td> Win 95+ / OSX.1+ </td>
                                        <td> 1.2 </td>
                                        <td> A </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END EXAMPLE TABLE PORTLET-->                    
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
        <script type="text/javascript" src="${getTheme('default','')}assets/global/scripts/datatable.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/datatables/datatables.min.js"></script>
        <script type="text/javascript" src="${getTheme('default','')}assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js"></script>        
        <!-- END PAGE LEVEL PLUGINS -->
        
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script type="text/javascript" src="${getTheme('default','')}assets/pages/scripts/table-datatables-fixedheader.min.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
       
    </body>

</html>