$(function(){
	$('#switch_qlogin').click(function(){
		$('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_bottom').animate({left:'0px',width:'70px'});
		$('#qlogin').css('display','none');
		$('#web_qr_login').css('display','block');
		
		});
	$('#switch_login').click(function(){
		
		$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_bottom').animate({left:'154px',width:'70px'});
		
		$('#qlogin').css('display','block');
		$('#web_qr_login').css('display','none');
		});
		if(getParam("a")=='0')
		{
			$('#switch_login').trigger('click');
		}
		
		$('#login').click(function() {
			//console.log($('#email'))
			var vpwd=$('#password')[0].validity.valid;
			var email=$('#email').val()
			var password=$('#password').val()
			$('#error').html('<div class="panel-heading"></div>').hide();
			if(email==null || email.length<=0){
				$("#error div").append("用户名不能为空！");				
				$('#error').fadeIn('slow');
			}else if(!vpwd){
				if(password!=null && password.length>0){
					$("#error div").append("请输入正确的密码格式！");
				}else{
					$("#error div").append("密码不能为空！");
				}
				$('#error').fadeIn('slow');
			}else{
				if(vpwd){
					$.ajax({
						url:'/plan/preplan/preplan_person_login.action',
						method:'POST',
						dataType:'json',
						data:{
							username:$('#email').val(),
							password:$('#password').val()
						},
						success:function(data){
							if(data=="ok"){
					        	location.href ="/plan/preplan/index.action";   
					        }else{
					        	$("#error div").append("用户名或密码错误！");
					        	$('#error').fadeIn('slow');
					        }
						}
					})
				}
			}
			setTimeout(function(){
				$('#error').fadeOut('slow');
			},2000)
		});
		$('#register').click(function(){
			location.href ="register";
			$('#tip').css('display','none');
		})
	});
	
function logintab(){
	scrollTo(0);
	$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
	$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
	$('#switch_bottom').animate({left:'154px',width:'96px'});
	$('#qlogin').css('display','none');
	$('#web_qr_login').css('display','block');
	
}


//根据参数名获得该参数 pname等于想要的参数名 
function getParam(pname) { 
    var params = location.search.substr(1); // 获取参数 平且去掉？ 
    var ArrParam = params.split('&'); 
    if (ArrParam.length == 1) { 
        //只有一个参数的情况 
        return params.split('=')[1]; 
    } 
    else { 
         //多个参数参数的情况 
        for (var i = 0; i < ArrParam.length; i++) { 
            if (ArrParam[i].split('=')[0] == pname) { 
                return ArrParam[i].split('=')[1]; 
            } 
        } 
    } 
}  