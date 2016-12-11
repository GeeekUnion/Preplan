$(function() {
    $('#managerLogin').dialog({
        title:'登录后台',
        width:300,
        height:180,
        modal:true,    
    });   
    
    $('#manager').validatebox({
        required:true,
        missingMessage:'请输入管理员账号'    
    }); 
});
