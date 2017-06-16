<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">   
        <!-- BEGIN HEADER -->
        <div class="page-header navbar navbar-fixed-top">
            <!-- BEGIN HEADER INNER -->
            <div class="page-header-inner ">
                <!-- BEGIN LOGO -->
                <div class="page-logo">
                    <a href="${pageContext.request.contextPath}/plan/preplan/plan_index.action">
                        <i class="icon-home fa-2x logo-default"></i>  </a>
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
                  			<li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <i class="icon-bell"></i>
                                    <span class="badge badge-default" id="myMsgSize"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="external">
                                        <h3>
                                            	共<span class="bold" id="myMsgSizeTitle"></span>条消息</h3>
                                    </li>
                                    <li>
                                        <ul class="dropdown-menu-list scroller" style="height: 250px;" data-handle-color="#637283" id="myMsgList">                                           

                                        </ul>
                                    </li>
                                </ul>
                            </li>
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
	
	$(function(){
		$.ajax({
			url:'/plan/preplan/preplan_preplan_queryReviewsMsg.action',
			method:'POST',
			dataType:'json',
			data:{
			},
			success:function(data){
				var msgSize=data.size;
				var msgList=data.preplanList;
				$('#myMsgSize').html(msgSize);
				$('#myMsgSizeTitle').html(msgSize);	
				var html='';
				if(msgSize>0){
					for(var i=0;i<msgSize;i++){
						var myStatus=msgList[i].preplanStatus;
						if(myStatus=="申请编制"){
							html=html+'<li>'
			                     +       '<a href="${pageContext.request.contextPath}/plan/preplan/plan_review_do.action">'
			                     +           '<span class="details">'
			                     +               '<span class="label label-sm label-icon label-info">'
			                     +                   '<i class="fa fa-bell-o"></i>'
			                     +               '</span> 《'+ msgList[i].preplanName+ '》'+myStatus+'</span>'
			                     +       '</a>'
			                     +   '</li>';
						}else if(myStatus=="待审核"){
							html=html+'<li>'
			                     +       '<a href="javascript:;" onclick="getPlanDetailByHead(\''+msgList[i].preplanSn+'\')">'
			                     +           '<span class="details">'
			                     +               '<span class="label label-sm label-icon label-info">'
			                     +                   '<i class="fa fa-bell-o"></i>'
			                     +               '</span> 《'+ msgList[i].preplanName+ '》'+myStatus+'</span>'
			                     +       '</a>'
			                     +   '</li>';	
						}else{
						
						}
								
					}						
				}else{
					html=html+'<li><center class="bg-info">暂无消息</center></li>'
				}
				$('#myMsgList').append(html);
							
				
			},
			error:function(data){
				swal({
					title: "请先登录!",
					text: '您还未登录!<a href="${pageContext.request.contextPath}/plan" style="color:#F8BB86">请点击此处登录</a>',
					type: "error",
					html:true,
					confirmButtonText: "确认"  
				});				
		    }
		})	
	})
	
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
					swal({
						title: "请先登录!",
						text: '未知错误，请确定您已经登录!<a href="${pageContext.request.contextPath}/plan" style="color:#F8BB86">请点击此处登录</a>',
						type: "error",
						html:true,
						confirmButtonText: "确认"  
					});				
		        }
			}
		})
	}
	
	
	function getPlanDetailByHead(ppSn){
		var urlMsg='review';
		//去掉单引号  取得要提交的参数
		var planSn=ppSn.replace(/'/g,"");
		var url='${pageContext.request.contextPath}/plan/preplan/plan_'+urlMsg+'_detail.action';
		// 创建Form  
	    var form = $('<form></form>');  
	    // 设置属性  
	    form.attr('action', url);  
	    form.attr('method', 'post');
	    form.attr('target', '_blank'); //空白打开  
	    // 创建Input  
		var set_input = $('<input type="text" name="ppSn" />');
		set_input.attr('value', planSn); 
		// 附加到Form  
		form.append(set_input);  
		$(document.body).append(form);
		// 提交表单  
	    form.submit();  
	    //return false自动刷新
	    return false;         
	}
	
	</script>   
