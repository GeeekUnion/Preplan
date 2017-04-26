function addTab(title, url,pri){
  if(pri===true){
		if ($('#ttab').tabs('exists', title)){
			$('#ttab').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0" id="'+url+'" src="'+url+'" style="width:100%;height:100%;"></iframe>';
		    $('#ttab').tabs('add',{
					title:title,
					content:content,
		            closable:true,
		            pill:true
					});
		}
  }else{
	  $.messager.alert('提示','您没有权限','info');	
  }	
}

function closeTab(title){
	if ($('#ttab').tabs('exists',title)){
		$('#ttab').tabs('close',title)
	} 
	
}
