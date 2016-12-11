<#if "${Session.session_bean}" != null>
  <div class="header">
  	<div class="logo">
  		<a href="#"><span class="logoinnr"></span></a>
  	</div>
  	<div class="headerinner">
  		<div class="userloggedinfo">
		    <div class="userinfo" id="userMes">
		    	<a href="javascript:void(0);" class="signin" onclick="userInfo(event)"><span><@cfw.m code="sitemesh.hello"/>${Session.session_bean.user.name}</span></a>
		    	<a href="javascript:void(0);" onclick="logoutSys('${base}')"><@cfw.m code="sitemesh.exit"/></a>
		    </div>
		    <div class="userinfoInner" id="userMesCon" onmouseup="return false;">
				    <p><@cfw.m code="sitemesh.belongSite"/>${Session.session_bean.org.orgName}</p>
				    <#--不是内嵌用户，则可以修改密码-->
				    <#if '${Session.session_bean.user.saveType}' != '1'>
				    	<a href="javascript:void(0);" onclick="changePWD('${base}', '${Session.session_bean.user.id}');"><@cfw.m code="sitemesh.changePwd"/></a>
				    </#if>
			 </div>
		 </div>
  	</div>
  	<@cfw.nav value=Session.session_bean.menu />
  </div>
</#if>