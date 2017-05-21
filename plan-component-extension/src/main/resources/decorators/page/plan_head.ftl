<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">   
        <!-- BEGIN HEADER -->
        <div class="page-header navbar navbar-fixed-top">
            <!-- BEGIN HEADER INNER -->
            <div class="page-header-inner ">
                <!-- BEGIN LOGO -->
                <div class="page-logo">
                    <a href="${pageContext.request.contextPath}/plan/preplan/index.action">
                        <img src="../static/module/plan-module/resources/theme/assets/layouts/layout/img/logo.png" alt="logo" class="logo-default" /> </a>
                    <div class="menu-toggler sidebar-toggler"> </div>
                </div>
                <!-- END LOGO -->
				<!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
                        <span></span>
                </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN TOP NAVIGATION MENU -->
               <div class="top-menu">
                  <ul class="nav navbar-nav pull-right">
                  	<#if null != preplanUsername>
							<li class="dropdown dropdown-user">
	                            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
	                                <i class="icon-user"></i> 
	                                <span class="username username-hide-on-mobile">${preplanUsername}</span>
	                                <i class="fa fa-angle-down"></i>
	                            </a>
	                            <ul class="dropdown-menu dropdown-menu-default">
	                                <li>
	                                    <a href="javascript:;">
	                                        <i class="icon-user"></i> ${Session.session_bean.org.orgName}
	                                    </a>
	                                </li>
	                                <li>
	                                    <a href="javascript:;" onclick="loginOut()">
	                                        <i class="icon-key"></i>退出系统 
	                                    </a>
	                                </li>
	                            </ul>
	                        </li>
						</#if>  
				 	</ul>
                </div>
                <!-- END TOP NAVIGATION MENU -->		
            </div>
            <!-- END HEADER INNER -->
        </div>
        <!-- END HEADER -->   
        
	<script type="text/javascript">

	
	function loginOut(){
		$.ajax({
			url:'/plan/preplan/preplan_person_loginOut.action',
			method:'POST',
			dataType:'json',
			data:{
			},
			success:function(data){
				if(data=="ok"){
		        	location.href ="/plan/preplan/plan_login.action";   
		        }else{
					$.messager.alert('提示','未知错误，请重试！','error');	
		        }
			}
		})
	}
	
</script>    