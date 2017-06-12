<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>预案管理系统登录</title>
	<link rel = "stylesheet" href="${getTheme('default','')}default/easyui.css" type="text/css"/>
	<link rel = "stylesheet" href="${getTheme('default','')}/login.css" type="text/css"/>
	<script type="text/javascript" src="${getMC ("")}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${getMC ("")}/js/login.js"></script>
<style type="text/css">
.test {
	width: 100%;
	height: 550px;
	background-image:
		url(http://easyread.ph.126.net/8Waej0dBknEXp3MJyobMIA==/7916635452593658889.jpg);
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	overflow: hidden;
	padding: 77px 0 107px;
	left: 0;
	margin-bottom: 0;
}
</style>
<script type="text/javascript">

</script>
</head>
<body style="padding-top: 50px;">
	<center style="font-family: '黑体'; color: black; font-size:32px;">预案管理系统登录</center>

	<div class="container-fluid test">
		<div class="col-md-4 col-md-offset-7 col-lg-4 col-lg-offset-7"
			style="backgroud-color: red; padding: 20px 50px;">
			<div class="login">
				<div class="header">
					<div class="switch" id="switch">
						<a class="switch_btn_focus" id="switch_qlogin" style="text-decoration:none;"
							href="javascript:void(0);" tabindex="8">快速登录</a> <a
							class="switch_btn" id="switch_login" href="javascript:void(0);" style="text-decoration:none;"
							tabindex="7">账号登录</a>
						<div class="switch_bottom" id="switch_bottom"
							style="position: absolute; width: 64px; left: 0px;"></div>
					</div>
				</div>
				<div class="web_qr_login" id="web_qr_login" style="min-height: 300px;">
					<div class="web_login">
						<ul class="reg_form">
							<div id="wxlogin">
							
								<center><h3>其他登录</h3></center>
								
							</div>
						</ul>
					</div>
					
				</div>

				<!--登录-->
				<div class="qlogin" id="qlogin" style="display: none; height: 230px;padding-top:15px">
					<!--账号登录-->
					<div class="web_login" id="web_login">
						<div class="login-box">
							<div class="login_form">
								<form id="form">
									<div id="error" style="display:none;color:#FF0000;margin:10px 0;">	
										<div></div>
									</div>
									<div class="form-group">
									    <input type="email" name="email" class="form-control" id="email" placeholder="请输入用户名" required style="padding:10px;width:252px">
									</div>
									<hr>
									<div class="form-group">
									    <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码" required style="padding:10px;width:252px">
									</div>
									<div class="form-group" style="margin-top:10px;">
									    <button id="login" type="button" style="width:100%;padding:10px;">登录</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!--登录end-->
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid jianyi">
		Copyright © 2017 预案管理系统 (支持最新版的360浏览器极速模式、Chrome浏览器、Firefox浏览器)
	</div>
</body>
</html>